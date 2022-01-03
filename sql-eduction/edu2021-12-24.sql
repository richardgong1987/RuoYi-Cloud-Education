DROP TABLE IF EXISTS edu_members_manageclasses;
CREATE TABLE edu_members_manageclasses
(
    id                   BIGINT(20)                             NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'id',
    name                 VARCHAR(255) DEFAULT ''                NOT NULL COMMENT '班级名称',
    school_id            BIGINT(20)   DEFAULT 0                 NOT NULL COMMENT '所属学校',
    students_num         INT          DEFAULT 0                 NOT NULL COMMENT '学生数量',
    headteacher          BIGINT       DEFAULT 0                 NOT NULL COMMENT '班主任',
    phone                VARCHAR(16)  DEFAULT ''                NOT NULL COMMENT '电话',
    committee            VARCHAR(500) DEFAULT ''                NOT NULL COMMENT '班委成员',
    class_representative VARCHAR(500) DEFAULT ''                NOT NULL COMMENT '课代表',
    create_time          DATETIME     DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '创建时间',
    update_time          DATETIME     DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '更新时间',
    update_by            VARCHAR(64)  DEFAULT ''                NOT NULL COMMENT '更新者',
    create_by            VARCHAR(64)  DEFAULT ''                NOT NULL COMMENT '创建者'
)
    COMMENT '班级管理';

DROP TABLE IF EXISTS edu_members_manageschools;
CREATE TABLE edu_members_manageschools
(
    id              BIGINT(20)                             NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'id',
    name            VARCHAR(255) DEFAULT ''                NOT NULL COMMENT '学校名称',
    type            INT          DEFAULT 0                 NOT NULL COMMENT '学校类型',
    all_classes_num INT          DEFAULT 0                 NOT NULL COMMENT '班级数量',
    principal_name  VARCHAR(50)  DEFAULT ''                NOT NULL COMMENT '校长姓名',
    phone           VARCHAR(20)  DEFAULT ''                NOT NULL COMMENT '电话',

    create_time     DATETIME     DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '创建时间',
    update_time     DATETIME     DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '更新时间',
    update_by       VARCHAR(64)  DEFAULT ''                NOT NULL COMMENT '更新者',
    create_by       VARCHAR(64)  DEFAULT ''                NOT NULL COMMENT '创建者'
)
    COMMENT '学校管理';


DROP TABLE IF EXISTS edu_members_managestudents;
CREATE TABLE edu_members_managestudents
(
    id          BIGINT(20)                            NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'id',
    name        VARCHAR(50) DEFAULT ''                NOT NULL COMMENT '学生姓名',
    school_id   BIGINT(20)  DEFAULT 0                 NOT NULL COMMENT '所属学校',
    class_id    BIGINT(20)  DEFAULT 0                 NOT NULL COMMENT '所属班级',
    is_vip      CHAR        DEFAULT 'N'               NOT NULL COMMENT '是否vip(Y是 N否)',
    phone       VARCHAR(20) DEFAULT ''                NOT NULL COMMENT '电话',

    create_time DATETIME    DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '创建时间',
    update_time DATETIME    DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '更新时间',
    update_by   VARCHAR(64) DEFAULT ''                NOT NULL COMMENT '更新者',
    create_by   VARCHAR(64) DEFAULT ''                NOT NULL COMMENT '创建者'

)
    COMMENT '学生管理';



DROP TABLE IF EXISTS edu_members_managemembers;
CREATE TABLE edu_members_managemembers
(
    id          BIGINT(20)                            NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'id',
    name        VARCHAR(50) DEFAULT ''                NOT NULL COMMENT '会员姓名',
    phone       VARCHAR(20) DEFAULT ''                NOT NULL COMMENT '电话',
    type        INT         DEFAULT 0                 NOT NULL COMMENT '注册类型',
    school_id   BIGINT(20)  DEFAULT 0                 NOT NULL COMMENT '所属学校',
    class_id    BIGINT(20)  DEFAULT 0                 NOT NULL COMMENT '所属班级',
    vip_time    DATETIME                              NULL COMMENT 'VIP时间',

    create_time DATETIME    DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '创建时间',
    update_time DATETIME    DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '更新时间',
    update_by   VARCHAR(64) DEFAULT ''                NOT NULL COMMENT '更新者',
    create_by   VARCHAR(64) DEFAULT ''                NOT NULL COMMENT '创建者'

)
    COMMENT '会员管理';



DROP TABLE IF EXISTS edu_teacher_infos;
CREATE TABLE edu_teacher_infos
(
    id                   BIGINT(20)                             NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'id',
    name                 VARCHAR(50)  DEFAULT ''                NOT NULL COMMENT '姓名',
    type                 INT          DEFAULT 0                 NOT NULL COMMENT '类型',
    school_id            BIGINT(20)   DEFAULT 0                 NOT NULL COMMENT '所属学校',
    class_id             BIGINT(20)   DEFAULT 0                 NOT NULL COMMENT '所属班级',

    classes_nums         INT          DEFAULT 0                 NOT NULL COMMENT '班级数量',

    phone                VARCHAR(20)  DEFAULT ''                NOT NULL COMMENT '电话',

    birthday             DATETIME     DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '生日',
    entry_time           DATETIME     DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '入职时间',
    education            INT          DEFAULT 0                 NOT NULL COMMENT '学历',
    graduate_school      VARCHAR(100) DEFAULT ''                NOT NULL COMMENT '毕业院校',
    certificate_botained VARCHAR(500) DEFAULT ''                NOT NULL COMMENT '所获证书',

    create_time          DATETIME     DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '创建时间',
    update_time          DATETIME     DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '更新时间',
    update_by            VARCHAR(64)  DEFAULT ''                NOT NULL COMMENT '更新者',
    create_by            VARCHAR(64)  DEFAULT ''                NOT NULL COMMENT '创建者'

)
    COMMENT '老师信息';


