package com.ruoyi.file.controller;

import java.util.List;

import javax.annotation.Resource;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.ruoyi.file.api.IElasticSearchService;
import com.ruoyi.file.component.FileDealComp;
import com.ruoyi.file.domain.FileBean;
import com.ruoyi.file.domain.UserFile;
import com.ruoyi.file.service.FileService;
import com.ruoyi.file.service.FiletransferService;
import com.ruoyi.file.service.UserFileService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

@Slf4j
@Controller
public class TaskController {

    @Resource
    FileService fileService;
    @Resource
    UserFileService userFileService;
    @Resource
    FiletransferService filetransferService;
    @Resource
    FileDealComp fileDealComp;
    @Autowired
    private IElasticSearchService elasticSearchService;

    @Scheduled(cron = "0 0/1 * * * ?")
    public void deleteFile() {

        LambdaQueryWrapper<FileBean> fileBeanLambdaQueryWrapper = new LambdaQueryWrapper<>();
        fileBeanLambdaQueryWrapper.eq(FileBean::getPointCount, 0);

        List<FileBean> fileBeanList = fileService.list(fileBeanLambdaQueryWrapper);
        for (int i = 0; i < fileBeanList.size(); i++) {
            FileBean fileBean = fileBeanList.get(i);
            log.info("删除本地文件：" + JSON.toJSONString(fileBean));
            try {
                filetransferService.deleteFile(fileBean);
                fileService.removeById(fileBean.getFileId());
            } catch (Exception e) {
                log.error("删除本地文件失败：" + JSON.toJSONString(fileBean));
            }
        }

    }

    @Scheduled(fixedRate = 1000 * 60 * 60 * 24)
    public void updateElasticSearch() {

        try {
            elasticSearchService.deleteAll();
        } catch (Exception e) {
            log.debug("删除ES失败:" + e);
        }

        List<UserFile> userfileList = userFileService.list();
        for (UserFile userFile : userfileList) {
            fileDealComp.uploadESByUserFileId(userFile.getUserFileId());
        }

    }
}
