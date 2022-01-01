package com.ruoyi.file.api;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.file.domain.RecoveryFile;
import com.ruoyi.file.domain.UserFile;
import com.ruoyi.file.vo.file.RecoveryFileListVo;

public interface IRecoveryFileService extends IService<RecoveryFile> {
    void deleteRecoveryFile(UserFile userFile);

    void restorefile(String deleteBatchNum, String filePath, Long sessionUserId);

    List<RecoveryFileListVo> selectRecoveryFileList(Long userId);
}
