package com.ruoyi.file.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Scanner;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.ClassUtils;
import com.qiwenshare.common.exception.NotLoginException;
import com.qiwenshare.common.result.RestResult;
import com.qiwenshare.common.util.DateUtil;
import com.qiwenshare.ufop.factory.UFOPFactory;
import com.qiwenshare.ufop.operation.copy.Copier;
import com.qiwenshare.ufop.operation.copy.domain.CopyFile;
import com.qiwenshare.ufop.operation.download.domain.DownloadFile;
import com.qiwenshare.ufop.operation.write.Writer;
import com.qiwenshare.ufop.operation.write.domain.WriteFile;
import com.ruoyi.file.api.IFileService;
import com.ruoyi.file.api.IUserFileService;
import com.ruoyi.file.domain.FileBean;
import com.ruoyi.file.domain.FileModel;
import com.ruoyi.file.domain.UserBean;
import com.ruoyi.file.domain.UserFile;
import com.ruoyi.file.dto.file.CreateOfficeFileDTO;
import com.ruoyi.file.dto.file.EditOfficeFileDTO;
import com.ruoyi.file.dto.file.PreviewOfficeFileDTO;
import com.ruoyi.file.helper.ConfigManager;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

@Tag(name = "office", description = "该接口为Onlyoffice文件操作接口，主要用来做一些文档的编辑，浏览等。")
@RestController
@Slf4j
@RequestMapping({"/office"})
public class OfficeController {
    public static final String CURRENT_MODULE = "Onlyoffice文件操作接口";
    @Resource
    UFOPFactory ufopFactory;
    @Resource
    IFileService fileService;
    @Resource
    IUserFileService userFileService;
    @Value("${deployment.host}")
    private String deploymentHost;
    @Value("${server.port}")
    private String port;
    @Value("${ufop.storage-type}")
    private Integer storageType;

    @Operation(summary = "创建office文件", description = "创建office文件", tags = {"office"})
    @ResponseBody
    @RequestMapping(value = "/createofficefile", method = RequestMethod.POST)
    public RestResult<Object> createOfficeFile(@RequestBody CreateOfficeFileDTO createOfficeFileDTO, @RequestHeader("token") String token) {
        RestResult<Object> result = new RestResult<>();
        try {
            var userId = 0L;
            String fileName = createOfficeFileDTO.getFileName();
            String filePath = createOfficeFileDTO.getFilePath();
            String extendName = createOfficeFileDTO.getExtendName();
            List<UserFile> userFiles = userFileService.selectSameUserFile(fileName, filePath, extendName, userId);
            if (userFiles != null && !userFiles.isEmpty()) {
                return RestResult.fail().message("同名文件已存在");
            }
            String uuid = UUID.randomUUID().toString().replaceAll("-", "");

            String templateFilePath = "";
            if ("docx".equals(extendName)) {
                templateFilePath = "template/Word.docx";
            } else if ("xlsx".equals(extendName)) {
                templateFilePath = "template/Excel.xlsx";
            } else if ("pptx".equals(extendName)) {
                templateFilePath = "template/PowerPoint.pptx";
            }
            String url2 = ClassUtils.getDefaultClassLoader().getResource("static/" + templateFilePath).getPath();
            FileInputStream fileInputStream = new FileInputStream(url2);
            Copier copier = ufopFactory.getCopier();
            CopyFile copyFile = new CopyFile();
            copyFile.setExtendName(extendName);
            String fileUrl = copier.copy(fileInputStream, copyFile);

            FileBean fileBean = new FileBean();
            fileBean.setFileSize(0L);
            fileBean.setFileUrl(fileUrl);
            fileBean.setStorageType(storageType);
            fileBean.setPointCount(1);
            fileBean.setIdentifier(uuid);
            fileBean.setCreateTime(DateUtil.getCurrentTime());
            fileBean.setCreateUserId(userId);
            boolean saveFlag = fileService.save(fileBean);
            UserFile userFile = new UserFile();
            if (saveFlag) {
                userFile.setUserId(userId);
                userFile.setFileName(fileName);
                userFile.setFilePath(filePath);
                userFile.setDeleteFlag(0);
                userFile.setIsDir(0);
                userFile.setExtendName(extendName);
                userFile.setUploadTime(DateUtil.getCurrentTime());
                userFile.setFileId(fileBean.getFileId());
                userFileService.save(userFile);
            }

            result.success();
            result.setMessage("文件创建成功！");
        } catch (Exception e) {
            log.error(e.getMessage());
            result.setCode(500);
            result.setMessage("服务器错误！");
        }
        return result;
    }

    @Operation(summary = "预览office文件", description = "预览office文件", tags = {"office"})
    @RequestMapping(value = "/previewofficefile", method = RequestMethod.POST)
    @ResponseBody
    public RestResult<Object> previewOfficeFile(HttpServletRequest request, @RequestBody PreviewOfficeFileDTO previewOfficeFileDTO, @RequestHeader("token") String token) {
        RestResult<Object> result = new RestResult<>();
        var userId = 0L;
        try {

            UserFile userFile = userFileService.getById(previewOfficeFileDTO.getUserFileId());

            String baseUrl = request.getScheme() + "://" + deploymentHost + ":" + port + request.getContextPath();

            FileModel file = new FileModel(userFile.getFileName() + "." + userFile.getExtendName(),
                    previewOfficeFileDTO.getPreviewUrl(),
                    userFile.getUploadTime(),
                    String.valueOf(userId),
                    "admin",
                    "view");

            String query = "?type=show&token=" + token;
            file.editorConfig.callbackUrl = baseUrl + "/office/IndexServlet" + query;
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("file", file);
            jsonObject.put("docserviceApiUrl", ConfigManager.GetProperty("files.docservice.url.site") + ConfigManager.GetProperty("files.docservice.url.api"));
            jsonObject.put("reportName", userFile.getFileName());
            result.setData(jsonObject);
            result.setCode(200);
            result.setMessage("获取报告成功！");
        } catch (Exception e) {
            log.error(e.getMessage());
            result.setCode(500);
            result.setMessage("服务器错误！");
        }
        return result;
    }

    @Operation(summary = "编辑office文件", description = "编辑office文件", tags = {"office"})
    @ResponseBody
    @RequestMapping(value = "/editofficefile", method = RequestMethod.POST)
    public RestResult<Object> editOfficeFile(HttpServletRequest request, @RequestBody EditOfficeFileDTO editOfficeFileDTO, @RequestHeader("token") String token) {
        RestResult<Object> result = new RestResult<>();
        log.info("editOfficeFile");
        var userId = 0L;
        try {

            UserFile userFile = userFileService.getById(editOfficeFileDTO.getUserFileId());

            String baseUrl = request.getScheme() + "://" + deploymentHost + ":" + port + request.getContextPath();

            log.info("回调地址baseUrl：" + baseUrl);

            FileModel file = new FileModel(userFile.getFileName() + "." + userFile.getExtendName(),
                    editOfficeFileDTO.getPreviewUrl(),
                    userFile.getUploadTime(),
                    String.valueOf(userId),
                    "admin",
                    "edit");
            file.changeType(request.getParameter("mode"), "edit");

            String query = "?type=edit&userFileId=" + userFile.getUserFileId() + "&token=" + token;
            file.editorConfig.callbackUrl = baseUrl + "/office/IndexServlet" + query;

            JSONObject jsonObject = new JSONObject();
            jsonObject.put("file", file);
            jsonObject.put("docserviceApiUrl", ConfigManager.GetProperty("files.docservice.url.site") + ConfigManager.GetProperty("files.docservice.url.api"));
            jsonObject.put("reportName", userFile.getFileName());
            result.setData(jsonObject);
            result.setCode(200);
            result.setMessage("编辑报告成功！");
        } catch (Exception e) {
            log.error(e.getMessage());
            result.setCode(500);
            result.setMessage("服务器错误！");
        }
        return result;
    }


    @RequestMapping(value = "/IndexServlet", method = RequestMethod.POST)
    @ResponseBody
    public void IndexServlet(HttpServletResponse response, HttpServletRequest request) throws IOException {
        var userId = 0L;
        String token = request.getParameter("token");

        PrintWriter writer = response.getWriter();
        Scanner scanner = new Scanner(request.getInputStream()).useDelimiter("\\A");
        String body = scanner.hasNext() ? scanner.next() : "";

        JSONObject jsonObj = JSON.parseObject(body);
        log.info("===saveeditedfile:" + jsonObj.get("status"));
        String status = jsonObj != null ? jsonObj.get("status").toString() : "";
        if ("2".equals(status) || "6".equals(status)) {
            String type = request.getParameter("type");
            String downloadUri = (String) jsonObj.get("url");

            if ("edit".equals(type)) {//修改报告
                String userFileId = request.getParameter("userFileId");
                UserFile userFile = userFileService.getById(userFileId);
                FileBean fileBean = fileService.getById(userFile.getFileId());
                if (fileBean.getPointCount() > 1) {
                    //该场景，暂不支持编辑修改
                    writer.write("{\"error\":1}");
                    return;
                }

                URL url = new URL(downloadUri);
                HttpURLConnection connection = (HttpURLConnection) url.openConnection();

                int fileLength = 0;
                try {
                    InputStream stream = connection.getInputStream();

                    Writer writer1 = ufopFactory.getWriter(fileBean.getStorageType());
                    WriteFile writeFile = new WriteFile();
                    writeFile.setFileUrl(fileBean.getFileUrl());

                    writeFile.setFileSize(connection.getContentLength());
                    writer1.write(stream, writeFile);
                } catch (Exception e) {
                    log.error(e.getMessage());
                } finally {
                    if ("2".equals(status)) {
                        LambdaUpdateWrapper<UserFile> userFileUpdateWrapper = new LambdaUpdateWrapper<>();
                        userFileUpdateWrapper
                                .set(UserFile::getUploadTime, DateUtil.getCurrentTime())
                                .eq(UserFile::getUserFileId, userFileId);
                        userFileService.update(userFileUpdateWrapper);
                    }
                    LambdaUpdateWrapper<FileBean> lambdaUpdateWrapper = new LambdaUpdateWrapper<>();
                    fileLength = connection.getContentLength();
                    log.info("当前修改文件大小为：" + Long.valueOf(fileLength));

                    DownloadFile downloadFile = new DownloadFile();
                    downloadFile.setFileUrl(fileBean.getFileUrl());
                    InputStream inputStream = ufopFactory.getDownloader(fileBean.getStorageType()).getInputStream(downloadFile);
                    String md5Str = DigestUtils.md5Hex(inputStream);
                    lambdaUpdateWrapper
                            .set(FileBean::getIdentifier, md5Str)
                            .set(FileBean::getFileSize, Long.valueOf(fileLength))
                            .set(FileBean::getModifyTime, DateUtil.getCurrentTime())
                            .set(FileBean::getModifyUserId, userId)
                            .eq(FileBean::getFileId, fileBean.getFileId());
                    fileService.update(lambdaUpdateWrapper);

                    connection.disconnect();
                }
            }
        }

        if ("3".equals(status) || "7".equals(status)) {//不强制手动保存时为6,"6".equals(status)
            log.debug("====保存失败:");
            writer.write("{\"error\":1}");
        } else {
            log.debug("状态为：0");
            writer.write("{\"error\":" + "0" + "}");
        }
    }

}
