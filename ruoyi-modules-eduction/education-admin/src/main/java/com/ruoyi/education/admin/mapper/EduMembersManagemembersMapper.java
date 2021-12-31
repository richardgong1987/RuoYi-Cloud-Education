package com.ruoyi.education.admin.mapper;

import java.util.List;
import com.ruoyi.education.admin.domain.EduMembersManagemembers;

/**
 * 会员管理Mapper接口
 *
 * @author richard
 * @date 2021-12-31
 */
public interface EduMembersManagemembersMapper
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
     * 删除会员管理
     *
     * @param id 会员管理主键
     * @return 结果
     */
     int deleteEduMembersManagemembersById(Long id);

    /**
     * 批量删除会员管理
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
     int deleteEduMembersManagemembersByIds(Long[] ids);
}
