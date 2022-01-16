package com.ruoyi.file.api;

import com.ruoyi.file.domain.FileBean;
import com.ruoyi.file.domain.StorageBean;
import com.ruoyi.file.dto.file.DownloadFileDTO;
import com.ruoyi.file.dto.file.PreviewDTO;
import com.ruoyi.file.dto.file.UploadFileDTO;
import com.ruoyi.file.vo.file.UploadFileVo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public interface IFiletransferService {


    /**
     * 上传文件
     *
     * @param request       请求
     * @param UploadFileDto 文件信息
     */
    void uploadFile(HttpServletRequest request, UploadFileDTO UploadFileDto, Long userId);

    void downloadFile(HttpServletResponse httpServletResponse, DownloadFileDTO downloadFileDTO);

    void previewFile(HttpServletResponse httpServletResponse, PreviewDTO previewDTO);

    void deleteFile(FileBean fileBean);

    StorageBean selectStorageBean(StorageBean storageBean);

    void insertStorageBean(StorageBean storageBean);

    void updateStorageBean(StorageBean storageBean);

    StorageBean selectStorageByUser(StorageBean storageBean);

    Long selectStorageSizeByUserId(Long userId);

    UploadFileVo uploadFileSpeed(UploadFileDTO uploadFileDTO, Long userId);
}
