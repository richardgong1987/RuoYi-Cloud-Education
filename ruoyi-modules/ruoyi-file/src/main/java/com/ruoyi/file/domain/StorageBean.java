package com.ruoyi.file.domain;

import javax.persistence.*;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * 存储信息类
 */
@Data
@Table(name = "storage")
@Entity
@TableName("storage")
public class StorageBean {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(columnDefinition = "bigint(20)")
    @TableId(type = IdType.AUTO)
    private Long storageId;

    @Column(columnDefinition = "bigint(20)")
    private Long userId;

    @Column(columnDefinition = "bigint(20)")
    private Long storageSize;

    @Column(columnDefinition = "bigint(20)")
    private Long totalStorageSize;

    @Column(columnDefinition = "varchar(25) comment '修改时间'")
    private String modifyTime;
    @Column(columnDefinition = "bigint(20) comment '修改用户id'")
    private Long modifyUserId;

    public StorageBean() {

    }

    public StorageBean(long userId) {
        this.userId = userId;
    }

}
