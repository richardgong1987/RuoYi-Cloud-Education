package com.ruoyi.education.admin.domain;

import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.annotation.Excel;
import com.ruoyi.common.core.web.domain.BaseEntity;

/**
 * 学校管理对象 edu_members_manageschools
 *
 * @author richard
 * @date 2021-12-30
 */
@Data
public class EduMembersManageschools extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 学校名称 */
    @Excel(name = "学校名称")
    private String name;

    /** 学校类型 */
    @Excel(name = "学校类型")
    private Long type;

    /** 班级数量 */
    @Excel(name = "班级数量")
    private Long allClassesNum;

    /** 校长姓名 */
    @Excel(name = "校长姓名")
    private String principalName;

    /** 电话 */
    @Excel(name = "电话")
    private String phone;

}
