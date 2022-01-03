package com.ruoyi.education.admin.domain;

import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.annotation.Excel;
import com.ruoyi.common.core.web.domain.BaseEntity;

/**
 * 班级管理对象 edu_members_manageclasses
 *
 * @author richard
 * @date 2022-01-04
 */
@Data
public class EduMembersManageclasses extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 班级名称 */
    @Excel(name = "班级名称")
    private String name;

    /** 所属学校 */
    @Excel(name = "所属学校")
    private Long schoolId;

    /** 学生数量 */
    @Excel(name = "学生数量")
    private Long studentsNum;

    /** 班主任 */
    @Excel(name = "班主任")
    private Long headteacher;

    /** 电话 */
    @Excel(name = "电话")
    private String phone;

    /** 班委成员 */
    @Excel(name = "班委成员")
    private String committee;

    /** 课代表 */
    @Excel(name = "课代表")
    private String classRepresentative;

}
