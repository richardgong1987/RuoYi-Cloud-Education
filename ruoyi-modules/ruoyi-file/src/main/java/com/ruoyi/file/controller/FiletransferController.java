package com.ruoyi.file.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.qiwenshare.common.anno.MyLog;
import com.qiwenshare.common.result.RestResult;
import com.qiwenshare.common.util.DateUtil;
import com.qiwenshare.common.util.MimeUtils;
import com.qiwenshare.ufop.constant.UploadFileStatusEnum;
import com.qiwenshare.ufop.factory.UFOPFactory;
import com.qiwenshare.ufop.operation.download.Downloader;
import com.qiwenshare.ufop.operation.download.domain.DownloadFile;
import com.qiwenshare.ufop.util.UFOPUtils;
import com.ruoyi.common.security.utils.SecurityUtils;
import com.ruoyi.file.api.*;
import com.ruoyi.file.component.FileDealComp;
import com.ruoyi.file.domain.*;
import com.ruoyi.file.dto.file.DownloadFileDTO;
import com.ruoyi.file.dto.file.PreviewDTO;
import com.ruoyi.file.dto.file.UploadFileDTO;
import com.ruoyi.file.mapper.ImageMapper;
import com.ruoyi.file.service.StorageService;
import com.ruoyi.file.vo.file.FileListVo;
import com.ruoyi.file.vo.file.UploadFileVo;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.*;

@Slf4j
@Tag(name = "filetransfer", description = "该接口为文件传输接口，主要用来做文件的上传和下载")
@RestController
@RequestMapping("/filetransfer")
public class FiletransferController {

    public static final String CURRENT_MODULE = "文件传输接口";
    @Resource
    IFiletransferService filetransferService;
    @Resource
    IFileService fileService;
    @Resource
    IUserFileService userFileService;
    @Resource
    FileDealComp fileDealComp;
    @Resource
    StorageService storageService;
    @Resource
    IUploadTaskService uploadTaskService;
    @Resource
    ImageMapper imageMapper;
    @Resource
    UFOPFactory ufopFactory;
    @Resource
    IUploadTaskDetailService uploadTaskDetailService;

    @Operation(summary = "极速上传", description = "校验文件MD5判断文件是否存在，如果存在直接上传成功并返回skipUpload=true，如果不存在返回skipUpload=false需要再次调用该接口的POST方法", tags = {"filetransfer"})
    @RequestMapping(value = "/uploadfile", method = RequestMethod.GET)
    @MyLog(operation = "极速上传", module = CURRENT_MODULE)
    @ResponseBody
    public RestResult<UploadFileVo> uploadFileSpeed(UploadFileDTO uploadFileDto,Long userId) {
        if (userId == null) {
            userId = SecurityUtils.getUserId();
        }

//        boolean isCheckSuccess = storageService.checkStorage(userId, uploadFileDto.getTotalSize());
//        if (!isCheckSuccess) {
//            return RestResult.fail().message("存储空间不足");
//        }

        UploadFileVo uploadFileVo = filetransferService.uploadFileSpeed(uploadFileDto,userId);
        return RestResult.success().data(uploadFileVo);

    }

    @Operation(summary = "上传文件", description = "真正的上传文件接口", tags = {"filetransfer"})
    @RequestMapping(value = "/uploadfile", method = RequestMethod.POST)
    @MyLog(operation = "上传文件", module = CURRENT_MODULE)
    @ResponseBody
    public RestResult<UploadFileVo> uploadFile(HttpServletRequest request, UploadFileDTO uploadFileDto, Long userId) {
        if (userId == null) {
            userId = SecurityUtils.getUserId();
        }
        filetransferService.uploadFile(request, uploadFileDto, userId);

        UploadFileVo uploadFileVo = new UploadFileVo();
        return RestResult.success().data(uploadFileVo);

    }


    @Operation(summary = "下载文件", description = "下载文件接口", tags = {"filetransfer"})
    @MyLog(operation = "下载文件", module = CURRENT_MODULE)
    @RequestMapping(value = "/downloadfile", method = RequestMethod.GET)
    public void downloadFile(HttpServletResponse httpServletResponse, DownloadFileDTO downloadFileDTO) {
        boolean authResult = fileDealComp.checkAuthDownloadAndPreview(downloadFileDTO.getShareBatchNum(),
                downloadFileDTO.getExtractionCode(),
                downloadFileDTO.getToken(),
                downloadFileDTO.getUserFileId());
        if (!authResult) {
            log.error("没有权限下载！！！");
            return;
        }
        httpServletResponse.setContentType("application/force-download");// 设置强制下载不打开
        UserFile userFile = userFileService.getById(downloadFileDTO.getUserFileId());
        String fileName = "";
        if (userFile.getIsDir() == 1) {
            fileName = userFile.getFileName() + ".zip";
        } else {
            fileName = userFile.getFileName() + "." + userFile.getExtendName();

        }
        try {
            fileName = new String(fileName.getBytes("utf-8"), "ISO-8859-1");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        httpServletResponse.addHeader("Content-Disposition", "attachment;fileName=" + fileName);// 设置文件名

        filetransferService.downloadFile(httpServletResponse, downloadFileDTO);
    }

    @Operation(summary = "预览文件", description = "用于文件预览", tags = {"filetransfer"})
    @GetMapping("/preview")
    public void preview(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, PreviewDTO previewDTO) {
        UserFile userFile = userFileService.getById(previewDTO.getUserFileId());
//        boolean authResult = fileDealComp.checkAuthDownloadAndPreview(previewDTO.getShareBatchNum(),
//                previewDTO.getExtractionCode(),
//                previewDTO.getToken(),
//                previewDTO.getUserFileId());
//
//        if (!authResult) {
//            log.error("没有权限预览！！！");
//            return;
//        }

        FileBean fileBean = fileService.getById(userFile.getFileId());
        /********************************** 图片预览适配 **************************************/
        LambdaQueryWrapper<Image> imageLambdaQueryWrapper = new LambdaQueryWrapper<>();
        imageLambdaQueryWrapper.eq(Image::getFileId, fileBean.getFileId());
        List<Image> result = imageMapper.selectList(imageLambdaQueryWrapper);
        if (result == null || result.isEmpty()) {
            if (UFOPUtils.isImageFile(userFile.getExtendName())) {
                Downloader downloader = ufopFactory.getDownloader(fileBean.getStorageType());
                DownloadFile downloadFile = new DownloadFile();
                downloadFile.setFileUrl(fileBean.getFileUrl());
                InputStream is = downloader.getInputStream(downloadFile);
                BufferedImage src = null;
                try {
                    src = ImageIO.read(is);
                } catch (IOException e) {
                    e.printStackTrace();
                }
                Image image = new Image();
                image.setImageWidth(src.getWidth());
                image.setImageHeight(src.getHeight());
                image.setFileId(fileBean.getFileId());
                imageMapper.insert(image);
            }
        }

        /***************************************************************************/

        String mime = MimeUtils.getMime(userFile.getExtendName());
        httpServletResponse.setHeader("Content-Type", mime);
        String rangeString = httpServletRequest.getHeader("Range");//如果是video标签发起的请求就不会为null
        if (StringUtils.isNotEmpty(rangeString)) {
            long range = Long.valueOf(rangeString.substring(rangeString.indexOf("=") + 1, rangeString.indexOf("-")));
            httpServletResponse.setContentLength(Math.toIntExact(fileBean.getFileSize()));
            httpServletResponse.setHeader("Content-Range", String.valueOf(range + (Math.toIntExact(fileBean.getFileSize()) - 1)));
        }
        httpServletResponse.setHeader("Accept-Ranges", "bytes");

        String fileName = userFile.getFileName() + "." + userFile.getExtendName();
        try {
            fileName = new String(fileName.getBytes("utf-8"), "ISO-8859-1");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        httpServletResponse.addHeader("Content-Disposition", "fileName=" + fileName);// 设置文件名

        filetransferService.previewFile(httpServletResponse, previewDTO);


    }

    @Operation(summary = "获取存储信息", description = "获取存储信息", tags = {"filetransfer"})
    @RequestMapping(value = "/getstorage", method = RequestMethod.GET)
    @ResponseBody
    public RestResult<StorageBean> getStorage(Long userId) {
        if (userId == null) {
            userId = SecurityUtils.getUserId();
        }

        StorageBean storageBean = new StorageBean();

        storageBean.setUserId(userId);

        Long storageSize = filetransferService.selectStorageSizeByUserId(userId);
        StorageBean storage = new StorageBean();
        storage.setUserId(userId);
        storage.setStorageSize(storageSize);
        Long totalStorageSize = storageService.getTotalStorageSize(userId);
        storage.setTotalStorageSize(totalStorageSize);
        return RestResult.success().data(storage);

    }


}
