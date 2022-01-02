package com.ruoyi.file.mapper;

import java.util.List;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.file.domain.Share;
import com.ruoyi.file.vo.share.ShareListVO;
import org.apache.ibatis.annotations.Param;

public interface ShareMapper extends BaseMapper<Share> {

    List<ShareListVO> selectShareList(@Param("shareFilePath") String shareFilePath, @Param("shareBatchNum") String shareBatchNum, @Param("beginCount") Long beginCount, @Param("pageCount") Long pageCount, @Param("userId") long userId);

    int selectShareListTotalCount(@Param("shareFilePath") String shareFilePath, @Param("shareBatchNum") String shareBatchNum, @Param("userId") long userId);
}
