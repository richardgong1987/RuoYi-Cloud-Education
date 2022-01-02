package com.ruoyi.file.domain;

import javax.persistence.*;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@Table(name = "file_uploadtask")
@Entity
@TableName("file_uploadtask")
public class UploadTask {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @TableId(type = IdType.AUTO)
    @Column(columnDefinition = "bigint(20)")
    private Long uploadTaskId;

    @Column(columnDefinition = "bigint(20)")
    private Long userId;

    @Column(columnDefinition = "varchar(32)")
    private String identifier;

    @Column(columnDefinition = "varchar(100)")
    private String fileName;

    @Column(columnDefinition = "varchar(500)")
    private String filePath;

    @Column(columnDefinition = "varchar(100)")
    private String extendName;

    @Column(columnDefinition = "varchar(25)")
    private String uploadTime;

    @Column(columnDefinition = "int(1)")
    private int uploadStatus;
}
