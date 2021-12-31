package com.ruoyi.education.admin.service.impl;

import java.util.List;
import com.ruoyi.common.core.utils.DateUtils;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.ruoyi.education.admin.mapper.EduMembersManagestudentsMapper;
import com.ruoyi.education.admin.domain.EduMembersManagestudents;
import com.ruoyi.education.admin.service.IEduMembersManagestudentsService;

/**
 * 学生管理Service业务层处理
 * 
 * @author richard
 * @date 2021-12-31
 */
@Service
public class EduMembersManagestudentsServiceImpl implements IEduMembersManagestudentsService 
{
    @Resource
    private EduMembersManagestudentsMapper eduMembersManagestudentsMapper;

    /**
     * 查询学生管理
     * 
     * @param id 学生管理主键
     * @return 学生管理
     */
    @Override
    public EduMembersManagestudents selectEduMembersManagestudentsById(Long id)
    {
        return eduMembersManagestudentsMapper.selectEduMembersManagestudentsById(id);
    }

    /**
     * 查询学生管理列表
     * 
     * @param eduMembersManagestudents 学生管理
     * @return 学生管理
     */
    @Override
    public List<EduMembersManagestudents> selectEduMembersManagestudentsList(EduMembersManagestudents eduMembersManagestudents)
    {
        return eduMembersManagestudentsMapper.selectEduMembersManagestudentsList(eduMembersManagestudents);
    }

    /**
     * 新增学生管理
     * 
     * @param eduMembersManagestudents 学生管理
     * @return 结果
     */
    @Override
    public int insertEduMembersManagestudents(EduMembersManagestudents eduMembersManagestudents)
    {
        eduMembersManagestudents.setCreateTime(DateUtils.getNowDate());
        return eduMembersManagestudentsMapper.insertEduMembersManagestudents(eduMembersManagestudents);
    }

    /**
     * 修改学生管理
     * 
     * @param eduMembersManagestudents 学生管理
     * @return 结果
     */
    @Override
    public int updateEduMembersManagestudents(EduMembersManagestudents eduMembersManagestudents)
    {
        eduMembersManagestudents.setUpdateTime(DateUtils.getNowDate());
        return eduMembersManagestudentsMapper.updateEduMembersManagestudents(eduMembersManagestudents);
    }

    /**
     * 批量删除学生管理
     * 
     * @param ids 需要删除的学生管理主键
     * @return 结果
     */
    @Override
    public int deleteEduMembersManagestudentsByIds(Long[] ids)
    {
        return eduMembersManagestudentsMapper.deleteEduMembersManagestudentsByIds(ids);
    }

    /**
     * 删除学生管理信息
     * 
     * @param id 学生管理主键
     * @return 结果
     */
    @Override
    public int deleteEduMembersManagestudentsById(Long id)
    {
        return eduMembersManagestudentsMapper.deleteEduMembersManagestudentsById(id);
    }
}
