package com.ruoyi.file.mapper;

import java.util.List;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.file.domain.UserFile;
import com.ruoyi.file.vo.file.FileListVo;
import org.apache.ibatis.annotations.Param;

public interface UserFileMapper extends BaseMapper<UserFile> {
    void replaceFilePath(@Param("filePath") String filePath, @Param("oldFilePath") String oldFilePath, @Param("userId") Long userId);

    List<FileListVo> userFileList(@Param("userFile") UserFile userFile, @Param("beginCount") Long beginCount, @Param("pageCount") Long pageCount);

    void updateFilepathByPathAndName(String oldfilePath, String newfilePath, String fileName, String extendName, @Param("userId") long userId);

    void updateFilepathByFilepath(String oldfilePath, String newfilePath, @Param("userId") long userId);

    void batchInsertByPathAndName(@Param("oldFilePath") String oldFilePath,
                                  @Param("newFilePath") String newfilePath,
                                  @Param("fileName") String fileName,
                                  @Param("extendName") String extendName,
                                  @Param("userId") long userId);

    void batchInsertByFilepath(@Param("oldFilePath") String oldFilePath,
                               @Param("newFilePath") String newfilePath,
                               @Param("userId") long userId);

    List<FileListVo> selectFileByExtendName(@Param("fileNameList") List<String> fileNameList, @Param("beginCount") Long beginCount, @Param("pageCount") Long pageCount, @Param("userId") long userId);

    Long selectCountByExtendName(@Param("fileNameList") List<String> fileNameList, @Param("beginCount") Long beginCount, @Param("pageCount") Long pageCount, @Param("userId") long userId);

    List<FileListVo> selectFileNotInExtendNames(@Param("fileNameList") List<String> fileNameList, @Param("beginCount") Long beginCount, @Param("pageCount") Long pageCount, @Param("userId") long userId);

    Long selectCountNotInExtendNames(@Param("fileNameList") List<String> fileNameList, @Param("beginCount") Long beginCount, @Param("pageCount") Long pageCount, @Param("userId") long userId);

    Long selectStorageSizeByUserId(@Param("userId") Long userId);
}
