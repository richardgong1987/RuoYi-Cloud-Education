package com.ruoyi.file.service;

import java.util.List;

import javax.annotation.Resource;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.file.api.IUploadTaskDetailService;
import com.ruoyi.file.domain.UploadTaskDetail;
import com.ruoyi.file.mapper.UploadTaskDetailMapper;
import org.springframework.stereotype.Service;

@Service
public class UploadTaskDetailService extends ServiceImpl<UploadTaskDetailMapper, UploadTaskDetail> implements IUploadTaskDetailService {

    @Resource
    UploadTaskDetailMapper uploadTaskDetailMapper;

    @Override
    public List<Integer> getUploadedChunkNumList(String identifier) {
        return uploadTaskDetailMapper.selectUploadedChunkNumList(identifier);
    }
}
