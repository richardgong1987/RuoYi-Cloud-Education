package com.ruoyi.education.admin.service.impl;

import java.util.List;
import com.ruoyi.common.core.utils.DateUtils;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.ruoyi.education.admin.mapper.EduTeacherInfosMapper;
import com.ruoyi.education.admin.domain.EduTeacherInfos;
import com.ruoyi.education.admin.service.IEduTeacherInfosService;

/**
 * 老师信息Service业务层处理
 * 
 * @author richard
 * @date 2021-12-31
 */
@Service
public class EduTeacherInfosServiceImpl implements IEduTeacherInfosService 
{
    @Resource
    private EduTeacherInfosMapper eduTeacherInfosMapper;

    /**
     * 查询老师信息
     * 
     * @param id 老师信息主键
     * @return 老师信息
     */
    @Override
    public EduTeacherInfos selectEduTeacherInfosById(Long id)
    {
        return eduTeacherInfosMapper.selectEduTeacherInfosById(id);
    }

    /**
     * 查询老师信息列表
     * 
     * @param eduTeacherInfos 老师信息
     * @return 老师信息
     */
    @Override
    public List<EduTeacherInfos> selectEduTeacherInfosList(EduTeacherInfos eduTeacherInfos)
    {
        return eduTeacherInfosMapper.selectEduTeacherInfosList(eduTeacherInfos);
    }

    /**
     * 新增老师信息
     * 
     * @param eduTeacherInfos 老师信息
     * @return 结果
     */
    @Override
    public int insertEduTeacherInfos(EduTeacherInfos eduTeacherInfos)
    {
        eduTeacherInfos.setCreateTime(DateUtils.getNowDate());
        return eduTeacherInfosMapper.insertEduTeacherInfos(eduTeacherInfos);
    }

    /**
     * 修改老师信息
     * 
     * @param eduTeacherInfos 老师信息
     * @return 结果
     */
    @Override
    public int updateEduTeacherInfos(EduTeacherInfos eduTeacherInfos)
    {
        eduTeacherInfos.setUpdateTime(DateUtils.getNowDate());
        return eduTeacherInfosMapper.updateEduTeacherInfos(eduTeacherInfos);
    }

    /**
     * 批量删除老师信息
     * 
     * @param ids 需要删除的老师信息主键
     * @return 结果
     */
    @Override
    public int deleteEduTeacherInfosByIds(Long[] ids)
    {
        return eduTeacherInfosMapper.deleteEduTeacherInfosByIds(ids);
    }

    /**
     * 删除老师信息信息
     * 
     * @param id 老师信息主键
     * @return 结果
     */
    @Override
    public int deleteEduTeacherInfosById(Long id)
    {
        return eduTeacherInfosMapper.deleteEduTeacherInfosById(id);
    }
}
