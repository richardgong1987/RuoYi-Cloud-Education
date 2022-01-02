package com.ruoyi.file.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

import javax.annotation.Resource;
import javax.validation.Valid;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.qiwenshare.common.anno.MyLog;
import com.qiwenshare.common.exception.NotLoginException;
import com.qiwenshare.common.result.RestResult;
import com.qiwenshare.common.util.DateUtil;
import com.qiwenshare.ufop.factory.UFOPFactory;
import com.qiwenshare.ufop.operation.download.domain.DownloadFile;
import com.qiwenshare.ufop.operation.write.Writer;
import com.qiwenshare.ufop.operation.write.domain.WriteFile;
import com.qiwenshare.ufop.util.UFOPUtils;
import com.ruoyi.common.security.utils.SecurityUtils;
import com.ruoyi.file.advice.QiwenException;
import com.ruoyi.file.api.IFileService;
import com.ruoyi.file.api.IUserFileService;
import com.ruoyi.file.component.FileDealComp;
import com.ruoyi.file.config.es.FileSearch;
import com.ruoyi.file.domain.FileBean;
import com.ruoyi.file.domain.TreeNode;
import com.ruoyi.file.domain.UserBean;
import com.ruoyi.file.domain.UserFile;
import com.ruoyi.file.dto.file.*;
import com.ruoyi.file.utils.SessionUtil;
import com.ruoyi.file.vo.file.FileListVo;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.codec.digest.DigestUtils;
import org.eclipse.jetty.util.StringUtil;
import org.elasticsearch.index.query.DisMaxQueryBuilder;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.fetch.subphase.highlight.HighlightBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.elasticsearch.core.ElasticsearchRestTemplate;
import org.springframework.data.elasticsearch.core.SearchHits;
import org.springframework.data.elasticsearch.core.query.NativeSearchQuery;
import org.springframework.data.elasticsearch.core.query.NativeSearchQueryBuilder;
import org.springframework.web.bind.annotation.*;

@Tag(name = "file", description = "该接口为文件接口，主要用来做一些文件的基本操作，如创建目录，删除，移动，复制等。")
@RestController
@Slf4j
@RequestMapping("/file")
public class FileController {

    public static final String CURRENT_MODULE = "文件接口";
    @Resource
    IFileService fileService;

    @Resource
    IUserFileService userFileService;
    @Resource
    FileDealComp fileDealComp;
    @Resource
    UFOPFactory ufopFactory;
    @Autowired
    private ElasticsearchRestTemplate elasticsearchRestTemplate;

    @Operation(summary = "创建文件", description = "目录(文件夹)的创建", tags = {"file"})
    @RequestMapping(value = "/createfile", method = RequestMethod.POST)
    @MyLog(operation = "创建文件", module = CURRENT_MODULE)
    @ResponseBody
    public RestResult<String> createFile(@Valid @RequestBody CreateFileDTO createFileDto) {

        UserBean sessionUserBean = (UserBean) SessionUtil.getSession();

        boolean isDirExist = userFileService.isDirExist(createFileDto.getFileName(), createFileDto.getFilePath(), SecurityUtils.getUserId());

        if (isDirExist) {
            return RestResult.fail().message("同名文件已存在");
        }

        UserFile userFile = new UserFile();
        userFile.setUserId(SecurityUtils.getUserId());
        userFile.setFileName(createFileDto.getFileName());
        userFile.setFilePath(createFileDto.getFilePath());
        userFile.setDeleteFlag(0);
        userFile.setIsDir(1);
        userFile.setUploadTime(DateUtil.getCurrentTime());

        userFileService.save(userFile);
        fileDealComp.uploadESByUserFileId(userFile.getUserFileId());
        return RestResult.success();
    }

    @Operation(summary = "文件搜索", description = "文件搜索", tags = {"file"})
    @GetMapping(value = "/search")
    @MyLog(operation = "文件搜索", module = CURRENT_MODULE)
    @ResponseBody
    public RestResult<SearchHits<FileSearch>> searchFile(SearchFileDTO searchFileDTO, Long userId) {
        if (userId == null) {
            userId = SecurityUtils.getUserId();
        }
        NativeSearchQueryBuilder queryBuilder = new NativeSearchQueryBuilder();
        HighlightBuilder.Field allHighLight = new HighlightBuilder.Field("*").preTags("<span class='keyword'>")
                .postTags("</span>");

        queryBuilder.withHighlightFields(allHighLight);

        //设置分页
        int currentPage = (int) searchFileDTO.getCurrentPage() - 1;
        int pageCount = (int) (searchFileDTO.getPageCount() == 0 ? 10 : searchFileDTO.getPageCount());
        String order = searchFileDTO.getOrder();
        Sort.Direction direction = null;
        if (searchFileDTO.getDirection() == null) {
            direction = Sort.Direction.DESC;
        } else if ("asc".equals(searchFileDTO.getDirection())) {
            direction = Sort.Direction.ASC;
        } else if ("desc".equals(searchFileDTO.getDirection())) {
            direction = Sort.Direction.DESC;
        } else {
            direction = Sort.Direction.DESC;
        }
        if (order == null) {
            queryBuilder.withPageable(PageRequest.of(currentPage, pageCount));
        } else {
            queryBuilder.withPageable(PageRequest.of(currentPage, pageCount, Sort.by(direction, order)));
        }
        DisMaxQueryBuilder disMaxQueryBuilder = QueryBuilders.disMaxQuery();

        QueryBuilder q1 = QueryBuilders.boolQuery()
                .must(QueryBuilders.multiMatchQuery(searchFileDTO.getFileName(), "fileName", "content"))
                .must(QueryBuilders.termQuery("userId", userId)).boost(1f);  //分词

        QueryBuilder q2 = QueryBuilders.boolQuery()
                .must(QueryBuilders.wildcardQuery("fileName", "*" + searchFileDTO.getFileName() + "*"))
                .must(QueryBuilders.termQuery("userId", userId)).boost(2f); //模糊匹配

        disMaxQueryBuilder.add(q1);
        disMaxQueryBuilder.add(q2);
        NativeSearchQuery searchQuery = new NativeSearchQueryBuilder()
                .withQuery(disMaxQueryBuilder).withHighlightFields(allHighLight).build();
//
//        queryBuilder.withQuery(QueryBuilders.boolQuery()
////                .must(QueryBuilders.matchQuery("fileName", searchFileDTO.getFileName()))
//                .must(QueryBuilders.multiMatchQuery(searchFileDTO.getFileName(),"fileName", "content"))
//                .must(QueryBuilders.termQuery("userId", SecurityUtils.getUserId()))
//                ).withQuery(QueryBuilders.wildcardQuery("fileName", "*" + searchFileDTO.getFileName() + "*"));
        SearchHits<FileSearch> search = elasticsearchRestTemplate.search(searchQuery, FileSearch.class);

        return RestResult.success().data(search);
    }

    @Operation(summary = "文件重命名", description = "文件重命名", tags = {"file"})
    @RequestMapping(value = "/renamefile", method = RequestMethod.POST)
    @MyLog(operation = "文件重命名", module = CURRENT_MODULE)
    @ResponseBody
    public RestResult<String> renameFile(@RequestBody RenameFileDTO renameFileDto) {

        UserBean sessionUserBean = (UserBean) SessionUtil.getSession();
        if (sessionUserBean == null) {
            throw new NotLoginException();
        }
        UserFile userFile = userFileService.getById(renameFileDto.getUserFileId());

        List<UserFile> userFiles = userFileService.selectUserFileByNameAndPath(renameFileDto.getFileName(), userFile.getFilePath(), SecurityUtils.getUserId());
        if (userFiles != null && !userFiles.isEmpty()) {
            return RestResult.fail().message("同名文件已存在");
        }

        LambdaUpdateWrapper<UserFile> lambdaUpdateWrapper = new LambdaUpdateWrapper<>();
        lambdaUpdateWrapper.set(UserFile::getFileName, renameFileDto.getFileName())
                .set(UserFile::getUploadTime, DateUtil.getCurrentTime())
                .eq(UserFile::getUserFileId, renameFileDto.getUserFileId());
        userFileService.update(lambdaUpdateWrapper);
        if (1 == userFile.getIsDir()) {
            userFileService.replaceUserFilePath(userFile.getFilePath() + renameFileDto.getFileName() + "/",
                    userFile.getFilePath() + userFile.getFileName() + "/", SecurityUtils.getUserId());
        }

        fileDealComp.uploadESByUserFileId(renameFileDto.getUserFileId());
        return RestResult.success();
    }


    @Operation(summary = "获取文件列表", description = "用来做前台列表展示", tags = {"file"})
    @RequestMapping(value = "/getfilelist", method = RequestMethod.GET)
    @ResponseBody
    public RestResult getFileList(
            @Parameter(description = "文件路径", required = true) String filePath,
            @Parameter(description = "当前页", required = true) long currentPage,
            @Parameter(description = "页面数量", required = true) long pageCount, Long userId) {

        if (userId == null) {
            userId = SecurityUtils.getUserId();
        }
        UserFile userFile = new UserFile();
        userFile.setUserId(userId);

        List<FileListVo> fileList = null;
        userFile.setFilePath(UFOPUtils.urlDecode(filePath));
        if (currentPage == 0 || pageCount == 0) {
            fileList = userFileService.userFileList(userFile, 0L, 10L);
        } else {
            long beginCount = (currentPage - 1) * pageCount;

            fileList = userFileService.userFileList(userFile, beginCount, pageCount);

        }

        LambdaQueryWrapper<UserFile> userFileLambdaQueryWrapper = new LambdaQueryWrapper<>();
        userFileLambdaQueryWrapper.eq(UserFile::getUserId, userFile.getUserId())
                .eq(UserFile::getFilePath, userFile.getFilePath())
                .eq(UserFile::getDeleteFlag, 0);
//        int total = userFileService.count(userFileLambdaQueryWrapper);

        Map<String, Object> map = new HashMap<>();
        map.put("total", fileList.size());
        map.put("list", fileList);


        return RestResult.success().data(map);

    }

    @Operation(summary = "批量删除文件", description = "批量删除文件", tags = {"file"})
    @RequestMapping(value = "/batchdeletefile", method = RequestMethod.POST)
    @MyLog(operation = "批量删除文件", module = CURRENT_MODULE)
    @ResponseBody
    public RestResult<String> deleteImageByIds(@RequestBody BatchDeleteFileDTO batchDeleteFileDto) {

        UserBean sessionUserBean = (UserBean) SessionUtil.getSession();
        if (sessionUserBean == null) {
            throw new NotLoginException();
        }
        List<UserFile> userFiles = JSON.parseArray(batchDeleteFileDto.getFiles(), UserFile.class);
        DigestUtils.md5Hex("data");
        for (UserFile userFile : userFiles) {

            userFileService.deleteUserFile(userFile.getUserFileId(), SecurityUtils.getUserId());
            fileDealComp.deleteESByUserFileId(userFile.getUserFileId());
        }

        return RestResult.success().message("批量删除文件成功");
    }

    @Operation(summary = "删除文件", description = "可以删除文件或者目录", tags = {"file"})
    @RequestMapping(value = "/deletefile", method = RequestMethod.POST)
    @MyLog(operation = "删除文件", module = CURRENT_MODULE)
    @ResponseBody
    public RestResult deleteFile(@RequestBody DeleteFileDTO deleteFileDto) {

        UserBean sessionUserBean = (UserBean) SessionUtil.getSession();
        if (sessionUserBean == null) {
            throw new NotLoginException();
        }
        userFileService.deleteUserFile(deleteFileDto.getUserFileId(), SecurityUtils.getUserId());
        fileDealComp.deleteESByUserFileId(deleteFileDto.getUserFileId());

        return RestResult.success();

    }

    @Operation(summary = "解压文件", description = "解压缩功能为体验功能，可以解压zip和rar格式的压缩文件，目前只支持本地存储文件解压，部分高版本rar格式不支持。", tags = {"file"})
    @RequestMapping(value = "/unzipfile", method = RequestMethod.POST)
    @MyLog(operation = "解压文件", module = CURRENT_MODULE)
    @ResponseBody
    public RestResult<String> unzipFile(@RequestBody UnzipFileDTO unzipFileDto) {

        UserBean sessionUserBean = (UserBean) SessionUtil.getSession();
        if (sessionUserBean == null) {
            throw new NotLoginException();
        }
        try {
            fileService.unzipFile(unzipFileDto.getUserFileId(), unzipFileDto.getUnzipMode(), unzipFileDto.getFilePath());
        } catch (QiwenException e) {
            return RestResult.fail().message(e.getMessage());
        }

        return RestResult.success();

    }

    @Operation(summary = "文件复制", description = "可以复制文件或者目录", tags = {"file"})
    @RequestMapping(value = "/copyfile", method = RequestMethod.POST)
    @MyLog(operation = "文件复制", module = CURRENT_MODULE)
    @ResponseBody
    public RestResult<String> copyFile(@RequestBody CopyFileDTO copyFileDTO) {

        UserBean sessionUserBean = (UserBean) SessionUtil.getSession();
        if (sessionUserBean == null) {
            throw new NotLoginException();
        }
        long userFileId = copyFileDTO.getUserFileId();
        UserFile userFile = userFileService.getById(userFileId);
        String oldfilePath = userFile.getFilePath();
        String newfilePath = copyFileDTO.getFilePath();
        String fileName = userFile.getFileName();
        String extendName = userFile.getExtendName();
        if (userFile.getIsDir() == 1) {
            String testFilePath = oldfilePath + fileName + "/";
            if (newfilePath.startsWith(testFilePath)) {
                return RestResult.fail().message("原路径与目标路径冲突，不能复制");
            }
        }

        userFileService.userFileCopy(oldfilePath, newfilePath, fileName, extendName, SecurityUtils.getUserId());
        return RestResult.success();

    }

    @Operation(summary = "文件移动", description = "可以移动文件或者目录", tags = {"file"})
    @RequestMapping(value = "/movefile", method = RequestMethod.POST)
    @MyLog(operation = "文件移动", module = CURRENT_MODULE)
    @ResponseBody
    public RestResult<String> moveFile(@RequestBody MoveFileDTO moveFileDto) {

        UserBean sessionUserBean = (UserBean) SessionUtil.getSession();
        if (sessionUserBean == null) {
            throw new NotLoginException();
        }
        String oldfilePath = moveFileDto.getOldFilePath();
        String newfilePath = moveFileDto.getFilePath();
        String fileName = moveFileDto.getFileName();
        String extendName = moveFileDto.getExtendName();
        if (StringUtil.isEmpty(extendName)) {
            String testFilePath = oldfilePath + fileName + "/";
            if (newfilePath.startsWith(testFilePath)) {
                return RestResult.fail().message("原路径与目标路径冲突，不能移动");
            }
        }

        userFileService.updateFilepathByFilepath(oldfilePath, newfilePath, fileName, extendName, SecurityUtils.getUserId());
        return RestResult.success();

    }

    @Operation(summary = "批量移动文件", description = "可以同时选择移动多个文件或者目录", tags = {"file"})
    @RequestMapping(value = "/batchmovefile", method = RequestMethod.POST)
    @MyLog(operation = "批量移动文件", module = CURRENT_MODULE)
    @ResponseBody
    public RestResult<String> batchMoveFile(@RequestBody BatchMoveFileDTO batchMoveFileDto) {

        UserBean sessionUserBean = (UserBean) SessionUtil.getSession();
        if (sessionUserBean == null) {
            throw new NotLoginException();
        }
        String files = batchMoveFileDto.getFiles();
        String newfilePath = batchMoveFileDto.getFilePath();

        List<UserFile> fileList = JSON.parseArray(files, UserFile.class);

        for (UserFile userFile : fileList) {

            if (StringUtil.isEmpty(userFile.getExtendName())) {
                String testFilePath = userFile.getFilePath() + userFile.getFileName() + "/";
                if (newfilePath.startsWith(testFilePath)) {
                    return RestResult.fail().message("原路径与目标路径冲突，不能移动");
                }
            }

            userFileService.updateFilepathByFilepath(userFile.getFilePath(), newfilePath, userFile.getFileName(), userFile.getExtendName(), SecurityUtils.getUserId());
        }

        return RestResult.success().data("批量移动文件成功");

    }


    @Operation(summary = "通过文件类型选择文件", description = "该接口可以实现文件格式分类查看", tags = {"file"})
    @RequestMapping(value = "/selectfilebyfiletype", method = RequestMethod.GET)
    @ResponseBody
    public RestResult<List<Map<String, Object>>> selectFileByFileType(@Parameter(description = "文件类型", required = true) int fileType,
                                                                      @Parameter(description = "当前页", required = true) long currentPage,
                                                                      @Parameter(description = "页面数量", required = true) long pageCount) {

        long userId = SecurityUtils.getUserId();

        List<FileListVo> fileList;
        Long beginCount = 0L;
        if (pageCount == 0 || currentPage == 0) {
            beginCount = 0L;
            pageCount = 10L;
        } else {
            beginCount = (currentPage - 1) * pageCount;
        }

        Long total = 0L;
        if (fileType == UFOPUtils.OTHER_TYPE) {

            List<String> arrList = new ArrayList<>();
            arrList.addAll(Arrays.asList(UFOPUtils.DOC_FILE));
            arrList.addAll(Arrays.asList(UFOPUtils.IMG_FILE));
            arrList.addAll(Arrays.asList(UFOPUtils.VIDEO_FILE));
            arrList.addAll(Arrays.asList(UFOPUtils.MUSIC_FILE));

            fileList = userFileService.selectFileNotInExtendNames(arrList, beginCount, pageCount, userId);
            total = userFileService.selectCountNotInExtendNames(arrList, beginCount, pageCount, userId);
        } else {
            fileList = userFileService.selectFileByExtendName(UFOPUtils.getFileExtendsByType(fileType), beginCount, pageCount, userId);
            total = userFileService.selectCountByExtendName(UFOPUtils.getFileExtendsByType(fileType), beginCount, pageCount, userId);
        }

        Map<String, Object> map = new HashMap<>();
        map.put("list", fileList);
        map.put("total", total);
        return RestResult.success().data(map);

    }

    @Operation(summary = "获取文件树", description = "文件移动的时候需要用到该接口，用来展示目录树", tags = {"file"})
    @RequestMapping(value = "/getfiletree", method = RequestMethod.GET)
    @ResponseBody
    public RestResult<TreeNode> getFileTree() {
        RestResult<TreeNode> result = new RestResult<TreeNode>();


        List<UserFile> userFileList = userFileService.selectFilePathTreeByUserId(SecurityUtils.getUserId());
        TreeNode resultTreeNode = new TreeNode();
        resultTreeNode.setLabel("/");
        resultTreeNode.setId(0L);
        long id = 1;
        for (int i = 0; i < userFileList.size(); i++) {
            UserFile userFile = userFileList.get(i);
            String filePath = userFile.getFilePath() + userFile.getFileName() + "/";

            Queue<String> queue = new LinkedList<>();

            String[] strArr = filePath.split("/");
            for (int j = 0; j < strArr.length; j++) {
                if (!"".equals(strArr[j]) && strArr[j] != null) {
                    queue.add(strArr[j]);
                }

            }
            if (queue.size() == 0) {
                continue;
            }

            resultTreeNode = fileDealComp.insertTreeNode(resultTreeNode, id++, "/", queue);


        }
        List<TreeNode> treeNodeList = resultTreeNode.getChildren();
        Collections.sort(treeNodeList, new Comparator<TreeNode>() {
            @Override
            public int compare(TreeNode o1, TreeNode o2) {
                long i = o1.getId() - o2.getId();
                return (int) i;
            }
        });
        result.setSuccess(true);
        result.setData(resultTreeNode);
        return result;

    }

    @Operation(summary = "修改文件", description = "支持普通文本类文件的修改", tags = {"file"})
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public RestResult<String> updateFile(@RequestBody UpdateFileDTO updateFileDTO) {
        UserFile userFile = userFileService.getById(updateFileDTO.getUserFileId());
        FileBean fileBean = fileService.getById(userFile.getFileId());
        if (fileBean.getPointCount() > 1) {
            return RestResult.fail().message("暂不支持修改");
        }
        String content = updateFileDTO.getFileContent();
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(content.getBytes());
        try {

            Writer writer1 = ufopFactory.getWriter(fileBean.getStorageType());
            WriteFile writeFile = new WriteFile();
            writeFile.setFileUrl(fileBean.getFileUrl());
            int fileSize = byteArrayInputStream.available();
            writeFile.setFileSize(fileSize);
            writer1.write(byteArrayInputStream, writeFile);
            DownloadFile downloadFile = new DownloadFile();
            downloadFile.setFileUrl(fileBean.getFileUrl());
            InputStream inputStream = ufopFactory.getDownloader(fileBean.getStorageType()).getInputStream(downloadFile);
            String md5Str = DigestUtils.md5Hex(inputStream);
            fileBean.setIdentifier(md5Str);
            fileBean.setModifyTime(DateUtil.getCurrentTime());
            fileBean.setModifyUserId(SecurityUtils.getUserId());
            fileBean.setFileSize((long) fileSize);
            fileService.updateById(fileBean);
        } catch (Exception e) {
            throw new QiwenException(999999, "修改文件异常");
//            log.error(e.getMessage());
        } finally {
            try {
                byteArrayInputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return RestResult.success().message("修改文件成功");
    }


}
