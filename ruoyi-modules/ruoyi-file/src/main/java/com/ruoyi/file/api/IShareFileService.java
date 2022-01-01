package com.ruoyi.file.api;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.file.domain.ShareFile;
import com.ruoyi.file.vo.share.ShareFileListVO;

public interface IShareFileService extends IService<ShareFile> {
    void batchInsertShareFile(List<ShareFile> shareFiles);

    List<ShareFileListVO> selectShareFileList(String shareBatchNum, String filePath);
}
