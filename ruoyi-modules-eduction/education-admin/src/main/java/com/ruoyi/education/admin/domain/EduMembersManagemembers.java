package com.ruoyi.education.admin.domain;

import lombok.Data;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.annotation.Excel;
import com.ruoyi.common.core.web.domain.BaseEntity;

/**
 * 会员管理对象 edu_members_managemembers
 *
 * @author richard
 * @date 2021-12-31
 */
@Data
public class EduMembersManagemembers extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 会员姓名 */
    @Excel(name = "会员姓名")
    private String name;

    /** 电话 */
    @Excel(name = "电话")
    private String phone;

    /** 注册类型 */
    @Excel(name = "注册类型")
    private Long type;

    /** 所属学校 */
    @Excel(name = "所属学校")
    private Long schoolId;

    /** 所属班级 */
    @Excel(name = "所属班级")
    private Long classId;

    /** VIP时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "VIP时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date vipTime;

}
