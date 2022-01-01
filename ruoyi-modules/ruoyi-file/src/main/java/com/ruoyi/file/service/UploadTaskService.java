package com.ruoyi.file.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.file.api.IUploadTaskService;
import com.ruoyi.file.domain.UploadTask;
import com.ruoyi.file.mapper.UploadTaskMapper;
import org.springframework.stereotype.Service;

@Service
public class UploadTaskService extends ServiceImpl<UploadTaskMapper, UploadTask> implements IUploadTaskService {


}
