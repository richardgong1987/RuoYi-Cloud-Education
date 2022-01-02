package com.ruoyi.file.domain;

import javax.persistence.*;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@Table(name = "file_recoveryfile")
@Entity
@TableName("file_recoveryfile")
public class RecoveryFile {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @TableId(type = IdType.AUTO)
    @Column(columnDefinition = "bigint(20)")
    private Long recoveryFileId;
    @Column(columnDefinition = "bigint(20)")
    private Long userFileId;
    @Column(columnDefinition = "varchar(25)")
    private String deleteTime;
    @Column(columnDefinition = "varchar(50)")
    private String deleteBatchNum;
}
