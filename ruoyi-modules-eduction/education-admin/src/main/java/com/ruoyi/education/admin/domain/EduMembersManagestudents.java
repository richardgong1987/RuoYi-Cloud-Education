package com.ruoyi.education.admin.domain;

import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.annotation.Excel;
import com.ruoyi.common.core.web.domain.BaseEntity;

/**
 * 学生管理对象 edu_members_managestudents
 *
 * @author richard
 * @date 2021-12-31
 */
@Data
public class EduMembersManagestudents extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 学生姓名 */
    @Excel(name = "学生姓名")
    private String name;

    /** 所属学校 */
    @Excel(name = "所属学校")
    private Long schoolId;

    /** 所属班级 */
    @Excel(name = "所属班级")
    private Long classId;

    /** 是否vip */
    @Excel(name = "是否vip")
    private String isVip;

    /** 电话 */
    @Excel(name = "电话")
    private String phone;

}
