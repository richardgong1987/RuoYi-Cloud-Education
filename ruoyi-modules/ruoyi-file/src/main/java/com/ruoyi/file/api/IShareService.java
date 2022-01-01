package com.ruoyi.file.api;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.file.domain.Share;
import com.ruoyi.file.dto.sharefile.ShareListDTO;
import com.ruoyi.file.vo.share.ShareListVO;

public interface IShareService extends IService<Share> {
    List<ShareListVO> selectShareList(ShareListDTO shareListDTO, Long userId);

    int selectShareListTotalCount(ShareListDTO shareListDTO, Long userId);
}
