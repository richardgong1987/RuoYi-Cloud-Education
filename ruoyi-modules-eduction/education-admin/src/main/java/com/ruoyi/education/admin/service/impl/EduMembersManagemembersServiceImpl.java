package com.ruoyi.education.admin.service.impl;

import java.util.List;
import com.ruoyi.common.core.utils.DateUtils;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.ruoyi.education.admin.mapper.EduMembersManagemembersMapper;
import com.ruoyi.education.admin.domain.EduMembersManagemembers;
import com.ruoyi.education.admin.service.IEduMembersManagemembersService;

/**
 * 会员管理Service业务层处理
 * 
 * @author richard
 * @date 2021-12-31
 */
@Service
public class EduMembersManagemembersServiceImpl implements IEduMembersManagemembersService 
{
    @Resource
    private EduMembersManagemembersMapper eduMembersManagemembersMapper;

    /**
     * 查询会员管理
     * 
     * @param id 会员管理主键
     * @return 会员管理
     */
    @Override
    public EduMembersManagemembers selectEduMembersManagemembersById(Long id)
    {
        return eduMembersManagemembersMapper.selectEduMembersManagemembersById(id);
    }

    /**
     * 查询会员管理列表
     * 
     * @param eduMembersManagemembers 会员管理
     * @return 会员管理
     */
    @Override
    public List<EduMembersManagemembers> selectEduMembersManagemembersList(EduMembersManagemembers eduMembersManagemembers)
    {
        return eduMembersManagemembersMapper.selectEduMembersManagemembersList(eduMembersManagemembers);
    }

    /**
     * 新增会员管理
     * 
     * @param eduMembersManagemembers 会员管理
     * @return 结果
     */
    @Override
    public int insertEduMembersManagemembers(EduMembersManagemembers eduMembersManagemembers)
    {
        eduMembersManagemembers.setCreateTime(DateUtils.getNowDate());
        return eduMembersManagemembersMapper.insertEduMembersManagemembers(eduMembersManagemembers);
    }

    /**
     * 修改会员管理
     * 
     * @param eduMembersManagemembers 会员管理
     * @return 结果
     */
    @Override
    public int updateEduMembersManagemembers(EduMembersManagemembers eduMembersManagemembers)
    {
        eduMembersManagemembers.setUpdateTime(DateUtils.getNowDate());
        return eduMembersManagemembersMapper.updateEduMembersManagemembers(eduMembersManagemembers);
    }

    /**
     * 批量删除会员管理
     * 
     * @param ids 需要删除的会员管理主键
     * @return 结果
     */
    @Override
    public int deleteEduMembersManagemembersByIds(Long[] ids)
    {
        return eduMembersManagemembersMapper.deleteEduMembersManagemembersByIds(ids);
    }

    /**
     * 删除会员管理信息
     * 
     * @param id 会员管理主键
     * @return 结果
     */
    @Override
    public int deleteEduMembersManagemembersById(Long id)
    {
        return eduMembersManagemembersMapper.deleteEduMembersManagemembersById(id);
    }
}
