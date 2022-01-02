package com.ruoyi.education.admin.domain;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.annotation.Excel;
import com.ruoyi.common.core.web.domain.BaseEntity;

/**
 * 老师信息对象 edu_teacher_infos
 *
 * @author richard
 * @date 2021-12-31
 */
@Data
public class EduTeacherInfos extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    @JsonSerialize(using= ToStringSerializer.class)
    private Long id;

    /** 姓名 */
    @Excel(name = "姓名")
    private String name;

    /** 类型 */
    private Long type;

    /** 所属学校 */
    @Excel(name = "所属学校")
    private Long schoolId;

    /** 所属班级 */
    @Excel(name = "所属班级")
    private Long classId;

    /** 班级数量 */
    @Excel(name = "班级数量")
    private Long classesNums;

    /** 电话 */
    @Excel(name = "电话")
    private String phone;

    /** 生日 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "生日", width = 30, dateFormat = "yyyy-MM-dd")
    private Date birthday;

    /** 入职时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "入职时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date entryTime;

    /** 学历 */
    @Excel(name = "学历")
    private Long education;

    /** 毕业院校 */
    @Excel(name = "毕业院校")
    private String graduateSchool;

    /** 所获证书 */
    @Excel(name = "所获证书")
    private String certificateBotained;

}
