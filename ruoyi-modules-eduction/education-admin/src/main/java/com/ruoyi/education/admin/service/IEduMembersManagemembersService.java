package com.ruoyi.education.admin.service;

import java.util.List;
import com.ruoyi.education.admin.domain.EduMembersManagemembers;

/**
 * 会员管理Service接口
 * 
 * @author richard
 * @date 2021-12-31
 */
public interface IEduMembersManagemembersService 
{
    /**
     * 查询会员管理
     * 
     * @param id 会员管理主键
     * @return 会员管理
     */
     EduMembersManagemembers selectEduMembersManagemembersById(Long id);

    /**
     * 查询会员管理列表
     * 
     * @param eduMembersManagemembers 会员管理
     * @return 会员管理集合
     */
     List<EduMembersManagemembers> selectEduMembersManagemembersList(EduMembersManagemembers eduMembersManagemembers);

    /**
     * 新增会员管理
     * 
     * @param eduMembersManagemembers 会员管理
     * @return 结果
     */
     int insertEduMembersManagemembers(EduMembersManagemembers eduMembersManagemembers);

    /**
     * 修改会员管理
     * 
     * @param eduMembersManagemembers 会员管理
     * @return 结果
     */
     int updateEduMembersManagemembers(EduMembersManagemembers eduMembersManagemembers);

    /**
     * 批量删除会员管理
     * 
     * @param ids 需要删除的会员管理主键集合
     * @return 结果
     */
     int deleteEduMembersManagemembersByIds(Long[] ids);

    /**
     * 删除会员管理信息
     * 
     * @param id 会员管理主键
     * @return 结果
     */
     int deleteEduMembersManagemembersById(Long id);
}
