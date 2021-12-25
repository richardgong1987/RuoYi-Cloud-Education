create table edu_management_classes
(
    id           bigint(20)                             not null auto_increment primary key comment 'id',
    name         varchar(255) default ''                not null comment '班级名称',
    school_id    bigint(20)   default 0                 not null comment '所属学校',
    students_num int          default 0                 not null comment '学生数量',
    headteacher  bigint       default 0                 not null comment '班主任',
    phone        varchar(16)  default ''                not null comment '电话',

    create_time  datetime     default CURRENT_TIMESTAMP not null comment '创建时间',
    update_time  datetime     default CURRENT_TIMESTAMP not null comment '更新时间',
    update_by    varchar(64)  default ''                not null comment '更新者',
    create_by    varchar(64)  default ''                not null comment '创建者'
)
    comment '班级管理';


create table edu_management_schools
(
    id              bigint(20)                             not null auto_increment primary key comment 'id',
    name            varchar(255) default ''                not null comment '学校名称',
    type            int          default 0                 not null comment '学校类型',
    all_classes_num int          default 0                 not null comment '班级数量',
    principal_name  varchar(50)  default ''                not null comment '校长姓名',
    phone           varchar(20)  default ''                not null comment '电话',

    create_time     datetime     default CURRENT_TIMESTAMP not null comment '创建时间',
    update_time     datetime     default CURRENT_TIMESTAMP not null comment '更新时间',
    update_by       varchar(64)  default ''                not null comment '更新者',
    create_by       varchar(64)  default ''                not null comment '创建者'
)
    comment '学校管理';


create table edu_management_students
(
    id          bigint(20)                            not null auto_increment primary key comment 'id',
    name        varchar(50) default ''                not null comment '学生姓名',
    school_id   bigint(20)  default 0                 not null comment '所属学校',
    class_id    bigint(20)  default 0                 not null comment '所属班级',
    is_vip      char        default 'N'               not null comment '是否vip(Y是 N否)',

    create_time datetime    default CURRENT_TIMESTAMP not null comment '创建时间',
    update_time datetime    default CURRENT_TIMESTAMP not null comment '更新时间',
    update_by   varchar(64) default ''                not null comment '更新者',
    create_by   varchar(64) default ''                not null comment '创建者'

)
    comment '学生管理';
