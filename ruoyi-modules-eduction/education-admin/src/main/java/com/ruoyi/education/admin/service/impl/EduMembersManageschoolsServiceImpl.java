package com.ruoyi.education.admin.service.impl;

import java.util.List;
import com.ruoyi.common.core.utils.DateUtils;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.ruoyi.education.admin.mapper.EduMembersManageschoolsMapper;
import com.ruoyi.education.admin.domain.EduMembersManageschools;
import com.ruoyi.education.admin.service.IEduMembersManageschoolsService;

/**
 * 学校管理Service业务层处理
 * 
 * @author richard
 * @date 2021-12-30
 */
@Service
public class EduMembersManageschoolsServiceImpl implements IEduMembersManageschoolsService 
{
    @Resource
    private EduMembersManageschoolsMapper eduMembersManageschoolsMapper;

    /**
     * 查询学校管理
     * 
     * @param id 学校管理主键
     * @return 学校管理
     */
    @Override
    public EduMembersManageschools selectEduMembersManageschoolsById(Long id)
    {
        return eduMembersManageschoolsMapper.selectEduMembersManageschoolsById(id);
    }

    /**
     * 查询学校管理列表
     * 
     * @param eduMembersManageschools 学校管理
     * @return 学校管理
     */
    @Override
    public List<EduMembersManageschools> selectEduMembersManageschoolsList(EduMembersManageschools eduMembersManageschools)
    {
        return eduMembersManageschoolsMapper.selectEduMembersManageschoolsList(eduMembersManageschools);
    }

    /**
     * 新增学校管理
     * 
     * @param eduMembersManageschools 学校管理
     * @return 结果
     */
    @Override
    public int insertEduMembersManageschools(EduMembersManageschools eduMembersManageschools)
    {
        eduMembersManageschools.setCreateTime(DateUtils.getNowDate());
        return eduMembersManageschoolsMapper.insertEduMembersManageschools(eduMembersManageschools);
    }

    /**
     * 修改学校管理
     * 
     * @param eduMembersManageschools 学校管理
     * @return 结果
     */
    @Override
    public int updateEduMembersManageschools(EduMembersManageschools eduMembersManageschools)
    {
        eduMembersManageschools.setUpdateTime(DateUtils.getNowDate());
        return eduMembersManageschoolsMapper.updateEduMembersManageschools(eduMembersManageschools);
    }

    /**
     * 批量删除学校管理
     * 
     * @param ids 需要删除的学校管理主键
     * @return 结果
     */
    @Override
    public int deleteEduMembersManageschoolsByIds(Long[] ids)
    {
        return eduMembersManageschoolsMapper.deleteEduMembersManageschoolsByIds(ids);
    }

    /**
     * 删除学校管理信息
     * 
     * @param id 学校管理主键
     * @return 结果
     */
    @Override
    public int deleteEduMembersManageschoolsById(Long id)
    {
        return eduMembersManageschoolsMapper.deleteEduMembersManageschoolsById(id);
    }
}
