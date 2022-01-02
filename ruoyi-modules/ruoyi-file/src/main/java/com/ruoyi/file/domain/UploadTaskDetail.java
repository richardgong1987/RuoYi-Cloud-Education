package com.ruoyi.file.domain;

import javax.persistence.*;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@Table(name = "file_uploadtaskdetail")
@Entity
@TableName("file_uploadtaskdetail")
public class UploadTaskDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @TableId(type = IdType.AUTO)
    @Column(columnDefinition = "bigint(20)")
    private Long uploadTaskDetailId;

    @Column(columnDefinition = "varchar(500)")
    private String filePath;

    @Column(columnDefinition = "varchar(100)")
    private String filename;

    @Column(columnDefinition = "int(5)")
    private int chunkNumber;

    @Column(columnDefinition = "bigint(10)")
    private Integer chunkSize;
    @Column(columnDefinition = "varchar(500)")
    private String relativePath;

    @Column(columnDefinition = "int(5)")
    private Integer totalChunks;
    @Column(columnDefinition = "bigint(10)")
    private Integer totalSize;

    @Column(columnDefinition = "varchar(32)")
    private String identifier;
}
