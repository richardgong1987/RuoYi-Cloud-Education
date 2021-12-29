package com.ruoyi.education.admin.service.impl;

import java.util.List;
import com.ruoyi.common.core.utils.DateUtils;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.ruoyi.education.admin.mapper.EduMembersManageclassesMapper;
import com.ruoyi.education.admin.domain.EduMembersManageclasses;
import com.ruoyi.education.admin.service.IEduMembersManageclassesService;

/**
 * 班级管理Service业务层处理
 * 
 * @author richard
 * @date 2021-12-30
 */
@Service
public class EduMembersManageclassesServiceImpl implements IEduMembersManageclassesService 
{
    @Resource
    private EduMembersManageclassesMapper eduMembersManageclassesMapper;

    /**
     * 查询班级管理
     * 
     * @param id 班级管理主键
     * @return 班级管理
     */
    @Override
    public EduMembersManageclasses selectEduMembersManageclassesById(Long id)
    {
        return eduMembersManageclassesMapper.selectEduMembersManageclassesById(id);
    }

    /**
     * 查询班级管理列表
     * 
     * @param eduMembersManageclasses 班级管理
     * @return 班级管理
     */
    @Override
    public List<EduMembersManageclasses> selectEduMembersManageclassesList(EduMembersManageclasses eduMembersManageclasses)
    {
        return eduMembersManageclassesMapper.selectEduMembersManageclassesList(eduMembersManageclasses);
    }

    /**
     * 新增班级管理
     * 
     * @param eduMembersManageclasses 班级管理
     * @return 结果
     */
    @Override
    public int insertEduMembersManageclasses(EduMembersManageclasses eduMembersManageclasses)
    {
        eduMembersManageclasses.setCreateTime(DateUtils.getNowDate());
        return eduMembersManageclassesMapper.insertEduMembersManageclasses(eduMembersManageclasses);
    }

    /**
     * 修改班级管理
     * 
     * @param eduMembersManageclasses 班级管理
     * @return 结果
     */
    @Override
    public int updateEduMembersManageclasses(EduMembersManageclasses eduMembersManageclasses)
    {
        eduMembersManageclasses.setUpdateTime(DateUtils.getNowDate());
        return eduMembersManageclassesMapper.updateEduMembersManageclasses(eduMembersManageclasses);
    }

    /**
     * 批量删除班级管理
     * 
     * @param ids 需要删除的班级管理主键
     * @return 结果
     */
    @Override
    public int deleteEduMembersManageclassesByIds(Long[] ids)
    {
        return eduMembersManageclassesMapper.deleteEduMembersManageclassesByIds(ids);
    }

    /**
     * 删除班级管理信息
     * 
     * @param id 班级管理主键
     * @return 结果
     */
    @Override
    public int deleteEduMembersManageclassesById(Long id)
    {
        return eduMembersManageclassesMapper.deleteEduMembersManageclassesById(id);
    }
}
