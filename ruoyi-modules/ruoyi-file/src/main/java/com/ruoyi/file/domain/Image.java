package com.ruoyi.file.domain;

import javax.persistence.*;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * @author MAC
 * @version 1.0
 * @description: TODO
 * @date 2021/12/7 22:05
 */
@Data
@Table(name = "file_image")
@Entity
@TableName("file_image")
public class Image {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @TableId(type = IdType.AUTO)
    @Column(columnDefinition = "bigint(20)")
    private Long imageId;
    @Column(columnDefinition = "bigint(20)")
    private Long fileId;
    @Column(columnDefinition = "int(5)")
    private Integer imageWidth;
    @Column(columnDefinition = "int(5)")
    private Integer imageHeight;
}
