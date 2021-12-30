package com.ruoyi.education.admin.mapper;

import java.util.List;
import com.ruoyi.education.admin.domain.EduMembersManageschools;

/**
 * 学校管理Mapper接口
 *
 * @author richard
 * @date 2021-12-30
 */
public interface EduMembersManageschoolsMapper
{
    /**
     * 查询学校管理
     *
     * @param id 学校管理主键
     * @return 学校管理
     */
     EduMembersManageschools selectEduMembersManageschoolsById(Long id);

    /**
     * 查询学校管理列表
     *
     * @param eduMembersManageschools 学校管理
     * @return 学校管理集合
     */
     List<EduMembersManageschools> selectEduMembersManageschoolsList(EduMembersManageschools eduMembersManageschools);

    /**
     * 新增学校管理
     *
     * @param eduMembersManageschools 学校管理
     * @return 结果
     */
     int insertEduMembersManageschools(EduMembersManageschools eduMembersManageschools);

    /**
     * 修改学校管理
     *
     * @param eduMembersManageschools 学校管理
     * @return 结果
     */
     int updateEduMembersManageschools(EduMembersManageschools eduMembersManageschools);

    /**
     * 删除学校管理
     *
     * @param id 学校管理主键
     * @return 结果
     */
     int deleteEduMembersManageschoolsById(Long id);

    /**
     * 批量删除学校管理
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
     int deleteEduMembersManageschoolsByIds(Long[] ids);
}
