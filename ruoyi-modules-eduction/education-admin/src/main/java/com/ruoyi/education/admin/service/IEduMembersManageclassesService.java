package com.ruoyi.education.admin.service;

import java.util.List;
import com.ruoyi.education.admin.domain.EduMembersManageclasses;

/**
 * 班级管理Service接口
 * 
 * @author richard
 * @date 2021-12-30
 */
public interface IEduMembersManageclassesService 
{
    /**
     * 查询班级管理
     * 
     * @param id 班级管理主键
     * @return 班级管理
     */
     EduMembersManageclasses selectEduMembersManageclassesById(Long id);

    /**
     * 查询班级管理列表
     * 
     * @param eduMembersManageclasses 班级管理
     * @return 班级管理集合
     */
     List<EduMembersManageclasses> selectEduMembersManageclassesList(EduMembersManageclasses eduMembersManageclasses);

    /**
     * 新增班级管理
     * 
     * @param eduMembersManageclasses 班级管理
     * @return 结果
     */
     int insertEduMembersManageclasses(EduMembersManageclasses eduMembersManageclasses);

    /**
     * 修改班级管理
     * 
     * @param eduMembersManageclasses 班级管理
     * @return 结果
     */
     int updateEduMembersManageclasses(EduMembersManageclasses eduMembersManageclasses);

    /**
     * 批量删除班级管理
     * 
     * @param ids 需要删除的班级管理主键集合
     * @return 结果
     */
     int deleteEduMembersManageclassesByIds(Long[] ids);

    /**
     * 删除班级管理信息
     * 
     * @param id 班级管理主键
     * @return 结果
     */
     int deleteEduMembersManageclassesById(Long id);
}
