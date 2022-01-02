package com.ruoyi.file.domain;

import javax.persistence.*;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@Table(name = "file_sharefile")
@Entity
@TableName("file_sharefile")
public class ShareFile {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @TableId(type = IdType.AUTO)
    private Long shareFileId;
    private String shareBatchNum;
    private Long userFileId;
    private String shareFilePath;

}
