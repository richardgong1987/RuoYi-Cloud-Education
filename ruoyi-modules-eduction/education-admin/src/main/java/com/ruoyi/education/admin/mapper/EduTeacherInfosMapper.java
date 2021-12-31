package com.ruoyi.education.admin.mapper;

import java.util.List;
import com.ruoyi.education.admin.domain.EduTeacherInfos;

/**
 * 老师信息Mapper接口
 *
 * @author richard
 * @date 2021-12-31
 */
public interface EduTeacherInfosMapper
{
    /**
     * 查询老师信息
     *
     * @param id 老师信息主键
     * @return 老师信息
     */
     EduTeacherInfos selectEduTeacherInfosById(Long id);

    /**
     * 查询老师信息列表
     *
     * @param eduTeacherInfos 老师信息
     * @return 老师信息集合
     */
     List<EduTeacherInfos> selectEduTeacherInfosList(EduTeacherInfos eduTeacherInfos);

    /**
     * 新增老师信息
     *
     * @param eduTeacherInfos 老师信息
     * @return 结果
     */
     int insertEduTeacherInfos(EduTeacherInfos eduTeacherInfos);

    /**
     * 修改老师信息
     *
     * @param eduTeacherInfos 老师信息
     * @return 结果
     */
     int updateEduTeacherInfos(EduTeacherInfos eduTeacherInfos);

    /**
     * 删除老师信息
     *
     * @param id 老师信息主键
     * @return 结果
     */
     int deleteEduTeacherInfosById(Long id);

    /**
     * 批量删除老师信息
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
     int deleteEduTeacherInfosByIds(Long[] ids);
}
