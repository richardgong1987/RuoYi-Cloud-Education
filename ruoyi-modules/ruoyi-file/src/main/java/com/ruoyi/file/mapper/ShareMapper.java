package com.ruoyi.file.mapper;

import java.util.List;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.file.domain.Share;
import com.ruoyi.file.vo.share.ShareListVO;

public interface ShareMapper extends BaseMapper<Share> {

    List<ShareListVO> selectShareList(String shareFilePath, String shareBatchNum, Long beginCount, Long pageCount, Long userId);

    int selectShareListTotalCount(String shareFilePath, String shareBatchNum, Long userId);
}
