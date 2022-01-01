package com.ruoyi.file.api;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.file.domain.UploadTaskDetail;

public interface IUploadTaskDetailService extends IService<UploadTaskDetail> {
    List<Integer> getUploadedChunkNumList(String identifier);
}
