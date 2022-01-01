package com.ruoyi.file.mapper;


import java.util.List;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.file.domain.FileBean;
import org.apache.ibatis.annotations.Param;

public interface FileMapper extends BaseMapper<FileBean> {


    void batchInsertFile(List<FileBean> fileBeanList);

    void incPointCountByPathAndName(@Param("oldFilePath") String oldFilePath,
                                    @Param("fileName") String fileName,
                                    @Param("extendName") String extendName,
                                    @Param("userId") long userId);

    void incPointCountByByFilepath(@Param("oldFilePath") String oldFilePath,
                                   @Param("userId") long userId);


}
