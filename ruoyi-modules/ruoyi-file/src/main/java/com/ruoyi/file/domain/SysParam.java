package com.ruoyi.file.domain;

import javax.persistence.*;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@Table(name = "file_sysparam")
@Entity
@TableName("file_sysparam")
public class SysParam {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(columnDefinition = "bigint(20)")
    @TableId(type = IdType.AUTO)
    private Long sysParamId;
    @Column(columnDefinition = "varchar(50)")
    private String sysParamKey;
    @Column(columnDefinition = "varchar(50)")
    private String sysParamValue;
    @Column(columnDefinition = "varchar(50)")
    private String sysParamDesc;
}
