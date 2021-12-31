package com.ruoyi.education.admin.mapper;

import java.util.List;
import com.ruoyi.education.admin.domain.EduMembersManagestudents;

/**
 * 学生管理Mapper接口
 *
 * @author richard
 * @date 2021-12-31
 */
public interface EduMembersManagestudentsMapper
{
    /**
     * 查询学生管理
     *
     * @param id 学生管理主键
     * @return 学生管理
     */
     EduMembersManagestudents selectEduMembersManagestudentsById(Long id);

    /**
     * 查询学生管理列表
     *
     * @param eduMembersManagestudents 学生管理
     * @return 学生管理集合
     */
     List<EduMembersManagestudents> selectEduMembersManagestudentsList(EduMembersManagestudents eduMembersManagestudents);

    /**
     * 新增学生管理
     *
     * @param eduMembersManagestudents 学生管理
     * @return 结果
     */
     int insertEduMembersManagestudents(EduMembersManagestudents eduMembersManagestudents);

    /**
     * 修改学生管理
     *
     * @param eduMembersManagestudents 学生管理
     * @return 结果
     */
     int updateEduMembersManagestudents(EduMembersManagestudents eduMembersManagestudents);

    /**
     * 删除学生管理
     *
     * @param id 学生管理主键
     * @return 结果
     */
     int deleteEduMembersManagestudentsById(Long id);

    /**
     * 批量删除学生管理
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
     int deleteEduMembersManagestudentsByIds(Long[] ids);
}
