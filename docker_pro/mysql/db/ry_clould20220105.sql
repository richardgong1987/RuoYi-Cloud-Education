-- MySQL dump 10.13  Distrib 8.0.26, for macos11 (x86_64)
--
-- Host: 127.0.0.1    Database: ry-cloud
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `edu_members_manageclasses`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `edu_members_manageclasses` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '班级名称',
  `school_id` bigint NOT NULL DEFAULT '0' COMMENT '所属学校',
  `students_num` int NOT NULL DEFAULT '0' COMMENT '学生数量',
  `headteacher` bigint NOT NULL DEFAULT '0' COMMENT '班主任',
  `phone` varchar(16) NOT NULL DEFAULT '' COMMENT '电话',
  `committee` varchar(500) NOT NULL DEFAULT '' COMMENT '班委成员',
  `class_representative` varchar(500) NOT NULL DEFAULT '' COMMENT '课代表',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='班级管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_members_manageclasses`
--

INSERT INTO `edu_members_manageclasses` VALUES (1,'三年级',1,1,927134165961281500,'','','','2022-01-04 02:17:33','2022-01-04 02:17:33','','');
INSERT INTO `edu_members_manageclasses` VALUES (2,'三',1,0,927134165961281500,'','1,2','','2022-01-04 02:32:28','2022-01-04 02:32:27','','');

--
-- Table structure for table `edu_members_managemembers`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `edu_members_managemembers` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '会员姓名',
  `phone` varchar(20) NOT NULL DEFAULT '' COMMENT '电话',
  `type` int NOT NULL DEFAULT '0' COMMENT '注册类型',
  `school_id` bigint NOT NULL DEFAULT '0' COMMENT '所属学校',
  `class_id` bigint NOT NULL DEFAULT '0' COMMENT '所属班级',
  `vip_time` datetime DEFAULT NULL COMMENT 'VIP时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='会员管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_members_managemembers`
--

INSERT INTO `edu_members_managemembers` VALUES (1,'龚汉金','',1,1,1,NULL,'2021-12-31 18:19:03','2021-12-31 18:23:31','','');
INSERT INTO `edu_members_managemembers` VALUES (2,'龚汉金3','',0,1,1,NULL,'2021-12-31 18:51:09','2021-12-31 18:51:08','','');

--
-- Table structure for table `edu_members_manageschools`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `edu_members_manageschools` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '学校名称',
  `type` int NOT NULL DEFAULT '0' COMMENT '学校类型',
  `all_classes_num` int NOT NULL DEFAULT '0' COMMENT '班级数量',
  `principal_name` varchar(50) NOT NULL DEFAULT '' COMMENT '校长姓名',
  `phone` varchar(20) NOT NULL DEFAULT '' COMMENT '电话',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='学校管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_members_manageschools`
--

INSERT INTO `edu_members_manageschools` VALUES (1,'北京大学',0,1,'要呀','','2021-12-30 15:35:51','2021-12-30 15:35:50','','');
INSERT INTO `edu_members_manageschools` VALUES (2,'清华大学',0,3,'龙的何去何从','','2022-01-03 22:37:23','2022-01-03 22:37:23','','');

--
-- Table structure for table `edu_members_managestudents`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `edu_members_managestudents` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '学生姓名',
  `school_id` bigint NOT NULL DEFAULT '0' COMMENT '所属学校',
  `class_id` bigint NOT NULL DEFAULT '0' COMMENT '所属班级',
  `is_vip` char(1) NOT NULL DEFAULT 'N' COMMENT '是否vip(Y是 N否)',
  `phone` varchar(20) NOT NULL DEFAULT '' COMMENT '电话',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='学生管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_members_managestudents`
--

INSERT INTO `edu_members_managestudents` VALUES (1,'龚汉金',1,1,'Y','','2021-12-31 17:51:38','2021-12-31 17:51:38','','');
INSERT INTO `edu_members_managestudents` VALUES (2,'龚汉金2',1,1,'Y','','2022-01-04 02:18:09','2022-01-04 02:18:09','','');

--
-- Table structure for table `edu_teacher_infos`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `edu_teacher_infos` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '姓名',
  `type` int NOT NULL DEFAULT '0' COMMENT '类型',
  `school_id` bigint NOT NULL DEFAULT '0' COMMENT '所属学校',
  `class_id` bigint NOT NULL DEFAULT '0' COMMENT '所属班级',
  `classes_nums` int NOT NULL DEFAULT '0' COMMENT '班级数量',
  `phone` varchar(20) NOT NULL DEFAULT '' COMMENT '电话',
  `birthday` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '生日',
  `entry_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '入职时间',
  `education` int NOT NULL DEFAULT '0' COMMENT '学历',
  `graduate_school` varchar(100) NOT NULL DEFAULT '' COMMENT '毕业院校',
  `certificate_botained` varchar(500) NOT NULL DEFAULT '' COMMENT '所获证书',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=927481884374470657 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='老师信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_teacher_infos`
--

INSERT INTO `edu_teacher_infos` VALUES (927134165961281536,'龚汉金2',0,1,1,1,'','2021-12-27 00:00:00','2022-01-03 00:00:00',2,'清华大学','','2022-01-02 17:40:10','2022-01-02 17:40:10','','');
INSERT INTO `edu_teacher_infos` VALUES (927481884374470656,'龚汉鑫',0,1,1,3,'','2022-01-18 00:00:00','2022-01-19 00:00:00',4,'清华大学','','2022-01-03 16:41:53','2022-01-03 16:41:53','','');

--
-- Table structure for table `file_file`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_file` (
  `fileId` bigint NOT NULL AUTO_INCREMENT,
  `createTime` varchar(25) DEFAULT NULL,
  `createUserId` bigint DEFAULT NULL,
  `fileSize` bigint DEFAULT NULL,
  `fileStatus` int DEFAULT NULL,
  `fileUrl` varchar(500) DEFAULT NULL,
  `identifier` varchar(32) DEFAULT NULL,
  `modifyTime` varchar(25) DEFAULT NULL,
  `modifyUserId` bigint DEFAULT NULL,
  `pointCount` int DEFAULT NULL,
  `storageType` int DEFAULT NULL,
  PRIMARY KEY (`fileId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_file`
--

INSERT INTO `file_file` VALUES (1,'2022-01-05 18:28:06',1,0,NULL,'upload/20220105/78715e64-deaf-418b-9996-7c59c83b1ede.docx','3cc8aa75cf40454dbff78c11dc663bc2',NULL,NULL,1,3);
INSERT INTO `file_file` VALUES (2,'2022-01-05 18:30:31',1,0,NULL,'upload/20220105/a4ced079-c69b-465e-9d5e-b08a42764cd9.xlsx','0aeee70cb9cb4c918e0188366ba9fd09',NULL,NULL,1,3);

--
-- Table structure for table `file_image`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_image` (
  `imageId` bigint NOT NULL AUTO_INCREMENT,
  `fileId` bigint DEFAULT NULL,
  `imageHeight` int DEFAULT NULL,
  `imageWidth` int DEFAULT NULL,
  PRIMARY KEY (`imageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_image`
--


--
-- Table structure for table `file_recoveryfile`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_recoveryfile` (
  `recoveryFileId` bigint NOT NULL AUTO_INCREMENT,
  `deleteBatchNum` varchar(50) DEFAULT NULL,
  `deleteTime` varchar(25) DEFAULT NULL,
  `userFileId` bigint DEFAULT NULL,
  PRIMARY KEY (`recoveryFileId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_recoveryfile`
--


--
-- Table structure for table `file_share`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_share` (
  `shareId` bigint NOT NULL AUTO_INCREMENT,
  `endTime` varchar(255) DEFAULT NULL,
  `extractionCode` varchar(255) DEFAULT NULL,
  `shareBatchNum` varchar(255) DEFAULT NULL,
  `shareStatus` int DEFAULT NULL,
  `shareTime` varchar(255) DEFAULT NULL,
  `shareType` int DEFAULT NULL,
  `userId` bigint DEFAULT NULL,
  PRIMARY KEY (`shareId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_share`
--


--
-- Table structure for table `file_sharefile`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_sharefile` (
  `shareFileId` bigint NOT NULL AUTO_INCREMENT,
  `shareBatchNum` varchar(255) DEFAULT NULL,
  `shareFilePath` varchar(255) DEFAULT NULL,
  `userFileId` bigint DEFAULT NULL,
  PRIMARY KEY (`shareFileId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_sharefile`
--


--
-- Table structure for table `file_storage`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_storage` (
  `storageId` bigint NOT NULL AUTO_INCREMENT,
  `modifyTime` varchar(25) DEFAULT NULL COMMENT '修改时间',
  `modifyUserId` bigint DEFAULT NULL COMMENT '修改用户id',
  `storageSize` bigint DEFAULT NULL,
  `totalStorageSize` bigint DEFAULT NULL,
  `userId` bigint DEFAULT NULL,
  PRIMARY KEY (`storageId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_storage`
--

INSERT INTO `file_storage` VALUES (1,NULL,NULL,NULL,1024,1);
INSERT INTO `file_storage` VALUES (2,NULL,NULL,NULL,1024,927134165961281536);

--
-- Table structure for table `file_sysparam`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_sysparam` (
  `sysParamId` bigint NOT NULL AUTO_INCREMENT,
  `sysParamDesc` varchar(50) DEFAULT NULL,
  `sysParamKey` varchar(50) DEFAULT NULL,
  `sysParamValue` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sysParamId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_sysparam`
--

INSERT INTO `file_sysparam` VALUES (1,'总存储大小（单位M）','totalStorageSize','1024');

--
-- Table structure for table `file_uploadtask`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_uploadtask` (
  `uploadTaskId` bigint NOT NULL AUTO_INCREMENT,
  `extendName` varchar(100) DEFAULT NULL,
  `fileName` varchar(100) DEFAULT NULL,
  `filePath` varchar(500) DEFAULT NULL,
  `identifier` varchar(32) DEFAULT NULL,
  `uploadStatus` int DEFAULT NULL,
  `uploadTime` varchar(25) DEFAULT NULL,
  `userId` bigint DEFAULT NULL,
  PRIMARY KEY (`uploadTaskId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_uploadtask`
--


--
-- Table structure for table `file_uploadtaskdetail`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_uploadtaskdetail` (
  `uploadTaskDetailId` bigint NOT NULL AUTO_INCREMENT,
  `chunkNumber` int DEFAULT NULL,
  `chunkSize` bigint DEFAULT NULL,
  `filePath` varchar(500) DEFAULT NULL,
  `filename` varchar(100) DEFAULT NULL,
  `identifier` varchar(32) DEFAULT NULL,
  `relativePath` varchar(500) DEFAULT NULL,
  `totalChunks` int DEFAULT NULL,
  `totalSize` bigint DEFAULT NULL,
  PRIMARY KEY (`uploadTaskDetailId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_uploadtaskdetail`
--


--
-- Table structure for table `file_userfile`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_userfile` (
  `userFileId` bigint NOT NULL AUTO_INCREMENT,
  `deleteBatchNum` varchar(50) DEFAULT NULL,
  `deleteFlag` int DEFAULT NULL,
  `deleteTime` varchar(25) DEFAULT NULL,
  `extendName` varchar(100) DEFAULT NULL,
  `fileId` bigint DEFAULT NULL,
  `fileName` varchar(100) DEFAULT NULL,
  `filePath` varchar(500) DEFAULT NULL,
  `isDir` int DEFAULT NULL,
  `uploadTime` varchar(25) DEFAULT NULL,
  `userId` bigint DEFAULT NULL,
  PRIMARY KEY (`userFileId`),
  UNIQUE KEY `fileindex` (`fileName`,`filePath`,`extendName`,`deleteFlag`,`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_userfile`
--

INSERT INTO `file_userfile` VALUES (1,NULL,0,NULL,'docx',1,'doc\n','/',0,'2022-01-05 18:28:06',1);
INSERT INTO `file_userfile` VALUES (2,NULL,0,NULL,NULL,NULL,'test','/',1,'2022-01-05 18:29:41',1);
INSERT INTO `file_userfile` VALUES (3,NULL,0,NULL,NULL,NULL,'oswald\n','/test/',1,'2022-01-05 18:30:24',1);
INSERT INTO `file_userfile` VALUES (4,NULL,0,NULL,'xlsx',2,'ex','/test/oswald\n/',0,'2022-01-05 18:30:31',1);

--
-- Table structure for table `gen_table`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

INSERT INTO `gen_table` VALUES (4,'edu_members_manageclasses','班级管理',NULL,NULL,'EduMembersManageclasses','crud','com.ruoyi.education.admin','teachers','teacherClasses','班级管理','richard','0','/','{}','admin','2021-12-29 22:38:55','','2022-01-04 02:37:14',NULL);
INSERT INTO `gen_table` VALUES (6,'edu_members_manageschools','学校管理',NULL,NULL,'EduMembersManageschools','crud','com.ruoyi.education.admin','peoples','managementSchools','学校管理','richard','0','/','{}','admin','2021-12-30 15:14:40','','2021-12-30 15:29:39',NULL);
INSERT INTO `gen_table` VALUES (7,'edu_members_managestudents','学生管理',NULL,NULL,'EduMembersManagestudents','crud','com.ruoyi.education.admin','peoples','managementStudents','学生管理','richard','0','/','{}','admin','2021-12-31 17:28:26','','2021-12-31 17:49:22',NULL);
INSERT INTO `gen_table` VALUES (8,'edu_members_managemembers','会员管理',NULL,NULL,'EduMembersManagemembers','crud','com.ruoyi.education.admin','peoples','managementMemberships','会员管理','richard','0','/','{}','admin','2021-12-31 18:09:06','','2021-12-31 18:16:36',NULL);
INSERT INTO `gen_table` VALUES (9,'edu_teacher_infos','老师信息',NULL,NULL,'EduTeacherInfos','crud','com.ruoyi.education.admin','teachers','teacherInfos','老师信息','richard','0','/','{}','admin','2021-12-31 18:58:19','','2021-12-31 19:19:54',NULL);

--
-- Table structure for table `gen_table_column`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

INSERT INTO `gen_table_column` VALUES (36,'4','id','id','bigint','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2021-12-29 22:38:55','','2022-01-04 02:37:14');
INSERT INTO `gen_table_column` VALUES (37,'4','name','班级名称','varchar(255)','String','name','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2021-12-29 22:38:55','','2022-01-04 02:37:14');
INSERT INTO `gen_table_column` VALUES (38,'4','school_id','所属学校','bigint','Long','schoolId','0','0','1','1','1','1','1','EQ','select','school_type',3,'admin','2021-12-29 22:38:55','','2022-01-04 02:37:14');
INSERT INTO `gen_table_column` VALUES (39,'4','students_num','学生数量','int','Long','studentsNum','0','0','1','1','1','1','1','EQ','input','',4,'admin','2021-12-29 22:38:55','','2022-01-04 02:37:14');
INSERT INTO `gen_table_column` VALUES (40,'4','headteacher','班主任','bigint','Long','headteacher','0','0','1','1','1','1','1','EQ','select','sys_notice_status',5,'admin','2021-12-29 22:38:55','','2022-01-04 02:37:14');
INSERT INTO `gen_table_column` VALUES (41,'4','phone','电话','varchar(16)','String','phone','0','0','1','1','1','1','1','EQ','input','',6,'admin','2021-12-29 22:38:55','','2022-01-04 02:37:14');
INSERT INTO `gen_table_column` VALUES (42,'4','create_time','创建时间','datetime','Date','createTime','0','0','1','1',NULL,NULL,NULL,'EQ','datetime','',7,'admin','2021-12-29 22:38:55','','2022-01-04 02:37:14');
INSERT INTO `gen_table_column` VALUES (43,'4','update_time','更新时间','datetime','Date','updateTime','0','0','1','1',NULL,NULL,NULL,'EQ','datetime','',8,'admin','2021-12-29 22:38:55','','2022-01-04 02:37:14');
INSERT INTO `gen_table_column` VALUES (44,'4','update_by','更新者','varchar(64)','String','updateBy','0','0','1','1',NULL,NULL,NULL,'EQ','input','',9,'admin','2021-12-29 22:38:55','','2022-01-04 02:37:14');
INSERT INTO `gen_table_column` VALUES (45,'4','create_by','创建者','varchar(64)','String','createBy','0','0','1','1',NULL,NULL,NULL,'EQ','input','',10,'admin','2021-12-29 22:38:55','','2022-01-04 02:37:14');
INSERT INTO `gen_table_column` VALUES (56,'6','id','id','bigint','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2021-12-30 15:14:40','','2021-12-30 15:29:39');
INSERT INTO `gen_table_column` VALUES (57,'6','name','学校名称','varchar(255)','String','name','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2021-12-30 15:14:40','','2021-12-30 15:29:39');
INSERT INTO `gen_table_column` VALUES (58,'6','type','学校类型','int','Long','type','0','0','1','1','1','1','1','EQ','select','school_type',3,'admin','2021-12-30 15:14:40','','2021-12-30 15:29:39');
INSERT INTO `gen_table_column` VALUES (59,'6','all_classes_num','班级数量','int','Long','allClassesNum','0','0','1','1','1','1','1','EQ','input','',4,'admin','2021-12-30 15:14:40','','2021-12-30 15:29:39');
INSERT INTO `gen_table_column` VALUES (60,'6','principal_name','校长姓名','varchar(50)','String','principalName','0','0','1','1','1','1','1','LIKE','input','',5,'admin','2021-12-30 15:14:40','','2021-12-30 15:29:39');
INSERT INTO `gen_table_column` VALUES (61,'6','phone','电话','varchar(20)','String','phone','0','0','1','1','1','1','1','LIKE','input','',6,'admin','2021-12-30 15:14:40','','2021-12-30 15:29:39');
INSERT INTO `gen_table_column` VALUES (62,'6','create_time','创建时间','datetime','Date','createTime','0','0','1','1',NULL,NULL,NULL,'EQ','datetime','',7,'admin','2021-12-30 15:14:40','','2021-12-30 15:29:39');
INSERT INTO `gen_table_column` VALUES (63,'6','update_time','更新时间','datetime','Date','updateTime','0','0','1','1',NULL,NULL,NULL,'EQ','datetime','',8,'admin','2021-12-30 15:14:40','','2021-12-30 15:29:39');
INSERT INTO `gen_table_column` VALUES (64,'6','update_by','更新者','varchar(64)','String','updateBy','0','0','1','1',NULL,NULL,NULL,'EQ','input','',9,'admin','2021-12-30 15:14:40','','2021-12-30 15:29:39');
INSERT INTO `gen_table_column` VALUES (65,'6','create_by','创建者','varchar(64)','String','createBy','0','0','1','1',NULL,NULL,NULL,'EQ','input','',10,'admin','2021-12-30 15:14:40','','2021-12-30 15:29:39');
INSERT INTO `gen_table_column` VALUES (66,'7','id','id','bigint','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2021-12-31 17:28:26','','2021-12-31 17:49:22');
INSERT INTO `gen_table_column` VALUES (67,'7','name','学生姓名','varchar(50)','String','name','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2021-12-31 17:28:26','','2021-12-31 17:49:22');
INSERT INTO `gen_table_column` VALUES (68,'7','school_id','所属学校','bigint','Long','schoolId','0','0','1','1','1','1','1','EQ','select','sys_common_status',3,'admin','2021-12-31 17:28:26','','2021-12-31 17:49:22');
INSERT INTO `gen_table_column` VALUES (69,'7','class_id','所属班级','bigint','Long','classId','0','0','1','1','1','1','1','EQ','select','school_type',4,'admin','2021-12-31 17:28:26','','2021-12-31 17:49:22');
INSERT INTO `gen_table_column` VALUES (70,'7','is_vip','是否vip','char(1)','String','isVip','0','0','1','1','1','1','1','EQ','select','is_vip',5,'admin','2021-12-31 17:28:26','','2021-12-31 17:49:22');
INSERT INTO `gen_table_column` VALUES (71,'7','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',6,'admin','2021-12-31 17:28:26','','2021-12-31 17:49:22');
INSERT INTO `gen_table_column` VALUES (72,'7','update_time','更新时间','datetime','Date','updateTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',7,'admin','2021-12-31 17:28:26','','2021-12-31 17:49:22');
INSERT INTO `gen_table_column` VALUES (73,'7','update_by','更新者','varchar(64)','String','updateBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',8,'admin','2021-12-31 17:28:26','','2021-12-31 17:49:22');
INSERT INTO `gen_table_column` VALUES (74,'7','create_by','创建者','varchar(64)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',9,'admin','2021-12-31 17:28:26','','2021-12-31 17:49:22');
INSERT INTO `gen_table_column` VALUES (75,'7','phone','电话','varchar(20)','String','phone','0','0',NULL,'1','1','1','1','LIKE','input','',6,'','2021-12-31 17:48:25','','2021-12-31 17:49:22');
INSERT INTO `gen_table_column` VALUES (76,'8','id','id','bigint','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2021-12-31 18:09:06','','2021-12-31 18:16:36');
INSERT INTO `gen_table_column` VALUES (77,'8','name','会员姓名','varchar(50)','String','name','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2021-12-31 18:09:06','','2021-12-31 18:16:36');
INSERT INTO `gen_table_column` VALUES (78,'8','type','注册类型','int','Long','type','0','0','1','1','1','1','1','EQ','select','edu_register_type',3,'admin','2021-12-31 18:09:06','','2021-12-31 18:16:36');
INSERT INTO `gen_table_column` VALUES (79,'8','school_id','所属学校','bigint','Long','schoolId','0','0','1','1','1','1','1','EQ','select','is_vip',4,'admin','2021-12-31 18:09:06','','2021-12-31 18:16:36');
INSERT INTO `gen_table_column` VALUES (80,'8','class_id','所属班级','bigint','Long','classId','0','0','1','1','1','1','1','EQ','select','school_type',5,'admin','2021-12-31 18:09:06','','2021-12-31 18:16:36');
INSERT INTO `gen_table_column` VALUES (81,'8','vip_time','VIP时间','datetime','Date','vipTime','0','0',NULL,'1','1','1','1','EQ','datetime','',6,'admin','2021-12-31 18:09:06','','2021-12-31 18:16:36');
INSERT INTO `gen_table_column` VALUES (82,'8','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',7,'admin','2021-12-31 18:09:06','','2021-12-31 18:16:36');
INSERT INTO `gen_table_column` VALUES (83,'8','update_time','更新时间','datetime','Date','updateTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',8,'admin','2021-12-31 18:09:06','','2021-12-31 18:16:36');
INSERT INTO `gen_table_column` VALUES (84,'8','update_by','更新者','varchar(64)','String','updateBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',9,'admin','2021-12-31 18:09:06','','2021-12-31 18:16:36');
INSERT INTO `gen_table_column` VALUES (85,'8','create_by','创建者','varchar(64)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',10,'admin','2021-12-31 18:09:06','','2021-12-31 18:16:36');
INSERT INTO `gen_table_column` VALUES (86,'8','phone','电话','varchar(20)','String','phone','0','0',NULL,'1','1','1','1','LIKE','input','',3,'','2021-12-31 18:14:39','','2021-12-31 18:16:36');
INSERT INTO `gen_table_column` VALUES (87,'9','id','id','bigint','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2021-12-31 18:58:19','','2021-12-31 19:19:54');
INSERT INTO `gen_table_column` VALUES (88,'9','name','姓名','varchar(50)','String','name','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2021-12-31 18:58:19','','2021-12-31 19:19:54');
INSERT INTO `gen_table_column` VALUES (89,'9','type','类型','int','Long','type','0','0',NULL,'1',NULL,NULL,NULL,'EQ','select','',3,'admin','2021-12-31 18:58:19','','2021-12-31 19:19:54');
INSERT INTO `gen_table_column` VALUES (90,'9','school_id','所属学校','bigint','Long','schoolId','0','0','1','1','1','1','1','EQ','select','school_dict',4,'admin','2021-12-31 18:58:19','','2021-12-31 19:19:54');
INSERT INTO `gen_table_column` VALUES (91,'9','class_id','所属班级','bigint','Long','classId','0','0','1','1','1','1','1','EQ','select','classes_dict',5,'admin','2021-12-31 18:58:19','','2021-12-31 19:19:54');
INSERT INTO `gen_table_column` VALUES (92,'9','classes_nums','班级数量','int','Long','classesNums','0','0','1','1','1','1','1','EQ','input','',6,'admin','2021-12-31 18:58:19','','2021-12-31 19:19:54');
INSERT INTO `gen_table_column` VALUES (93,'9','phone','电话','varchar(20)','String','phone','0','0','1','1','1','1','1','LIKE','input','',7,'admin','2021-12-31 18:58:19','','2021-12-31 19:19:54');
INSERT INTO `gen_table_column` VALUES (94,'9','birthday','生日','datetime','Date','birthday','0','0','1','1','1','1','1','EQ','datetime','',8,'admin','2021-12-31 18:58:19','','2021-12-31 19:19:54');
INSERT INTO `gen_table_column` VALUES (95,'9','entry_time','入职时间','datetime','Date','entryTime','0','0','1','1','1','1','1','EQ','datetime','',9,'admin','2021-12-31 18:58:19','','2021-12-31 19:19:54');
INSERT INTO `gen_table_column` VALUES (96,'9','education','学历','int','Long','education','0','0','1','1','1','1','1','EQ','select','education',10,'admin','2021-12-31 18:58:19','','2021-12-31 19:19:54');
INSERT INTO `gen_table_column` VALUES (97,'9','graduate_school','毕业院校','varchar(100)','String','graduateSchool','0','0','1','1','1','1','1','EQ','input','',11,'admin','2021-12-31 18:58:19','','2021-12-31 19:19:54');
INSERT INTO `gen_table_column` VALUES (98,'9','certificate_botained','所获证书','varchar(500)','String','certificateBotained','0','0',NULL,'1','1','1',NULL,'EQ','textarea','',12,'admin','2021-12-31 18:58:19','','2021-12-31 19:19:54');
INSERT INTO `gen_table_column` VALUES (99,'9','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',13,'admin','2021-12-31 18:58:19','','2021-12-31 19:19:54');
INSERT INTO `gen_table_column` VALUES (100,'9','update_time','更新时间','datetime','Date','updateTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',14,'admin','2021-12-31 18:58:19','','2021-12-31 19:19:54');
INSERT INTO `gen_table_column` VALUES (101,'9','update_by','更新者','varchar(64)','String','updateBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',15,'admin','2021-12-31 18:58:19','','2021-12-31 19:19:54');
INSERT INTO `gen_table_column` VALUES (102,'9','create_by','创建者','varchar(64)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',16,'admin','2021-12-31 18:58:19','','2021-12-31 19:19:54');
INSERT INTO `gen_table_column` VALUES (103,'4','committee','班委成员','varchar(500)','String','committee','0','0','1','1','1','1','1','EQ','textarea','',7,'','2022-01-04 00:54:17','','2022-01-04 02:37:14');
INSERT INTO `gen_table_column` VALUES (104,'4','class_representative','课代表','varchar(500)','String','classRepresentative','0','0','1','1','1','1','1','EQ','textarea','',8,'','2022-01-04 00:54:17','','2022-01-04 02:37:14');

--
-- Table structure for table `sys_config`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2021-12-28 22:27:07','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2021-12-28 22:27:07','',NULL,'初始化密码 123456');
INSERT INTO `sys_config` VALUES (3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2021-12-28 22:27:07','',NULL,'深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2021-12-28 22:27:07','',NULL,'是否开启注册用户功能（true开启，false关闭）');

--
-- Table structure for table `sys_dept`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

INSERT INTO `sys_dept` VALUES (100,0,'0','若依科技',0,'若依','15888888888','ry@qq.com','0','0','admin','2021-12-28 22:27:06','',NULL);
INSERT INTO `sys_dept` VALUES (101,100,'0,100','深圳总公司',1,'若依','15888888888','ry@qq.com','0','0','admin','2021-12-28 22:27:06','',NULL);
INSERT INTO `sys_dept` VALUES (102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','0','admin','2021-12-28 22:27:06','',NULL);
INSERT INTO `sys_dept` VALUES (103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2021-12-28 22:27:06','',NULL);
INSERT INTO `sys_dept` VALUES (104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2021-12-28 22:27:06','',NULL);
INSERT INTO `sys_dept` VALUES (105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','0','admin','2021-12-28 22:27:06','',NULL);
INSERT INTO `sys_dept` VALUES (106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','0','admin','2021-12-28 22:27:06','',NULL);
INSERT INTO `sys_dept` VALUES (107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','0','admin','2021-12-28 22:27:06','',NULL);
INSERT INTO `sys_dept` VALUES (108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2021-12-28 22:27:06','',NULL);
INSERT INTO `sys_dept` VALUES (109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2021-12-28 22:27:06','',NULL);

--
-- Table structure for table `sys_dict_data`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2021-12-28 22:27:07','',NULL,'性别男');
INSERT INTO `sys_dict_data` VALUES (2,2,'女','1','sys_user_sex','','','N','0','admin','2021-12-28 22:27:07','',NULL,'性别女');
INSERT INTO `sys_dict_data` VALUES (3,3,'未知','2','sys_user_sex','','','N','0','admin','2021-12-28 22:27:07','',NULL,'性别未知');
INSERT INTO `sys_dict_data` VALUES (4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2021-12-28 22:27:07','',NULL,'显示菜单');
INSERT INTO `sys_dict_data` VALUES (5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2021-12-28 22:27:07','',NULL,'隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2021-12-28 22:27:07','',NULL,'正常状态');
INSERT INTO `sys_dict_data` VALUES (7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2021-12-28 22:27:07','',NULL,'停用状态');
INSERT INTO `sys_dict_data` VALUES (8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2021-12-28 22:27:07','',NULL,'正常状态');
INSERT INTO `sys_dict_data` VALUES (9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2021-12-28 22:27:07','',NULL,'停用状态');
INSERT INTO `sys_dict_data` VALUES (10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2021-12-28 22:27:07','',NULL,'默认分组');
INSERT INTO `sys_dict_data` VALUES (11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2021-12-28 22:27:07','',NULL,'系统分组');
INSERT INTO `sys_dict_data` VALUES (12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2021-12-28 22:27:07','',NULL,'系统默认是');
INSERT INTO `sys_dict_data` VALUES (13,2,'否','N','sys_yes_no','','danger','N','0','admin','2021-12-28 22:27:07','',NULL,'系统默认否');
INSERT INTO `sys_dict_data` VALUES (14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2021-12-28 22:27:07','',NULL,'通知');
INSERT INTO `sys_dict_data` VALUES (15,2,'公告','2','sys_notice_type','','success','N','0','admin','2021-12-28 22:27:07','',NULL,'公告');
INSERT INTO `sys_dict_data` VALUES (16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2021-12-28 22:27:07','',NULL,'正常状态');
INSERT INTO `sys_dict_data` VALUES (17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2021-12-28 22:27:07','',NULL,'关闭状态');
INSERT INTO `sys_dict_data` VALUES (18,1,'新增','1','sys_oper_type','','info','N','0','admin','2021-12-28 22:27:07','',NULL,'新增操作');
INSERT INTO `sys_dict_data` VALUES (19,2,'修改','2','sys_oper_type','','info','N','0','admin','2021-12-28 22:27:07','',NULL,'修改操作');
INSERT INTO `sys_dict_data` VALUES (20,3,'删除','3','sys_oper_type','','danger','N','0','admin','2021-12-28 22:27:07','',NULL,'删除操作');
INSERT INTO `sys_dict_data` VALUES (21,4,'授权','4','sys_oper_type','','primary','N','0','admin','2021-12-28 22:27:07','',NULL,'授权操作');
INSERT INTO `sys_dict_data` VALUES (22,5,'导出','5','sys_oper_type','','warning','N','0','admin','2021-12-28 22:27:07','',NULL,'导出操作');
INSERT INTO `sys_dict_data` VALUES (23,6,'导入','6','sys_oper_type','','warning','N','0','admin','2021-12-28 22:27:07','',NULL,'导入操作');
INSERT INTO `sys_dict_data` VALUES (24,7,'强退','7','sys_oper_type','','danger','N','0','admin','2021-12-28 22:27:07','',NULL,'强退操作');
INSERT INTO `sys_dict_data` VALUES (25,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2021-12-28 22:27:07','',NULL,'生成操作');
INSERT INTO `sys_dict_data` VALUES (26,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2021-12-28 22:27:07','',NULL,'清空操作');
INSERT INTO `sys_dict_data` VALUES (27,1,'成功','0','sys_common_status','','primary','N','0','admin','2021-12-28 22:27:07','',NULL,'正常状态');
INSERT INTO `sys_dict_data` VALUES (28,2,'失败','1','sys_common_status','','danger','N','0','admin','2021-12-28 22:27:07','',NULL,'停用状态');
INSERT INTO `sys_dict_data` VALUES (100,0,'公立学校','0','school_type',NULL,'primary','N','0','admin','2021-12-30 15:27:56','admin','2021-12-31 18:22:47',NULL);
INSERT INTO `sys_dict_data` VALUES (101,1,'私立学校','1','school_type',NULL,'success','N','0','admin','2021-12-30 15:28:03','admin','2021-12-31 18:22:52',NULL);
INSERT INTO `sys_dict_data` VALUES (102,2,'培训机构','2','school_type',NULL,'warning','N','0','admin','2021-12-30 15:28:13','admin','2021-12-31 18:22:58',NULL);
INSERT INTO `sys_dict_data` VALUES (103,0,'是','Y','is_vip',NULL,'primary','N','0','admin','2021-12-31 17:35:33','admin','2021-12-31 18:21:27',NULL);
INSERT INTO `sys_dict_data` VALUES (104,1,'否','N','is_vip',NULL,'info','N','0','admin','2021-12-31 17:35:43','admin','2021-12-31 18:21:38',NULL);
INSERT INTO `sys_dict_data` VALUES (105,0,'老师','0','edu_register_type',NULL,'primary','N','0','admin','2021-12-31 18:11:54','admin','2021-12-31 18:21:59',NULL);
INSERT INTO `sys_dict_data` VALUES (106,1,'学生','1','edu_register_type',NULL,'success','N','0','admin','2021-12-31 18:12:08','admin','2021-12-31 18:22:04',NULL);
INSERT INTO `sys_dict_data` VALUES (107,2,'其它','2','edu_register_type',NULL,'info','N','0','admin','2021-12-31 18:12:34','admin','2021-12-31 18:22:09',NULL);
INSERT INTO `sys_dict_data` VALUES (108,0,'博士','0','education',NULL,'primary','N','0','admin','2021-12-31 19:04:40','admin','2021-12-31 19:07:02',NULL);
INSERT INTO `sys_dict_data` VALUES (109,1,'硕士','1','education',NULL,'success','N','0','admin','2021-12-31 19:04:58','admin','2021-12-31 19:07:08',NULL);
INSERT INTO `sys_dict_data` VALUES (110,3,'本科','3','education',NULL,'warning','N','0','admin','2021-12-31 19:05:31','admin','2021-12-31 19:07:18',NULL);
INSERT INTO `sys_dict_data` VALUES (111,2,'研究生','2','education',NULL,'info','N','0','admin','2021-12-31 19:06:16','admin','2021-12-31 19:07:13',NULL);
INSERT INTO `sys_dict_data` VALUES (112,4,'专科','4','education',NULL,'primary','N','0','admin','2021-12-31 19:06:46','admin','2021-12-31 19:07:25',NULL);
INSERT INTO `sys_dict_data` VALUES (113,5,'高中','5','education',NULL,'success','N','0','admin','2021-12-31 19:07:43','admin','2021-12-31 19:07:49',NULL);
INSERT INTO `sys_dict_data` VALUES (114,6,'初中','6','education',NULL,'info','N','0','admin','2021-12-31 19:08:07','',NULL,NULL);
INSERT INTO `sys_dict_data` VALUES (115,7,'小学','7','education',NULL,'danger','N','0','admin','2021-12-31 19:08:22','',NULL,NULL);

--
-- Table structure for table `sys_dict_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2021-12-28 22:27:07','',NULL,'用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2,'菜单状态','sys_show_hide','0','admin','2021-12-28 22:27:07','',NULL,'菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3,'系统开关','sys_normal_disable','0','admin','2021-12-28 22:27:07','',NULL,'系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4,'任务状态','sys_job_status','0','admin','2021-12-28 22:27:07','',NULL,'任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5,'任务分组','sys_job_group','0','admin','2021-12-28 22:27:07','',NULL,'任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6,'系统是否','sys_yes_no','0','admin','2021-12-28 22:27:07','',NULL,'系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7,'通知类型','sys_notice_type','0','admin','2021-12-28 22:27:07','',NULL,'通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8,'通知状态','sys_notice_status','0','admin','2021-12-28 22:27:07','',NULL,'通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9,'操作类型','sys_oper_type','0','admin','2021-12-28 22:27:07','',NULL,'操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10,'系统状态','sys_common_status','0','admin','2021-12-28 22:27:07','',NULL,'登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100,'学校类型','school_type','0','admin','2021-12-30 15:27:23','',NULL,NULL);
INSERT INTO `sys_dict_type` VALUES (101,'是否vip','is_vip','0','admin','2021-12-31 17:35:11','',NULL,NULL);
INSERT INTO `sys_dict_type` VALUES (102,'注册类型','edu_register_type','0','admin','2021-12-31 18:10:49','admin','2021-12-31 18:11:25',NULL);
INSERT INTO `sys_dict_type` VALUES (103,'学校列表','school_dict','0','admin','2021-12-31 18:59:36','',NULL,NULL);
INSERT INTO `sys_dict_type` VALUES (104,'班级列表','classes_dict','0','admin','2021-12-31 18:59:55','',NULL,NULL);
INSERT INTO `sys_dict_type` VALUES (105,'学历','education','0','admin','2021-12-31 19:04:26','',NULL,NULL);

--
-- Table structure for table `sys_job`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_job` VALUES (2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_job` VALUES (3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2021-12-28 22:27:07','',NULL,'');

--
-- Table structure for table `sys_job_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--


--
-- Table structure for table `sys_logininfor`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示信息',
  `access_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

INSERT INTO `sys_logininfor` VALUES (100,'admin','127.0.0.1','0','退出成功','2021-12-29 22:30:31');
INSERT INTO `sys_logininfor` VALUES (101,'admin','127.0.0.1','0','登录成功','2021-12-29 22:30:41');
INSERT INTO `sys_logininfor` VALUES (102,'admin','127.0.0.1','0','登录成功','2021-12-29 23:34:04');
INSERT INTO `sys_logininfor` VALUES (103,'admin','127.0.0.1','0','登录成功','2021-12-30 00:37:17');
INSERT INTO `sys_logininfor` VALUES (104,'admin','127.0.0.1','0','退出成功','2021-12-30 15:11:45');
INSERT INTO `sys_logininfor` VALUES (105,'admin','127.0.0.1','0','登录成功','2021-12-30 15:11:55');
INSERT INTO `sys_logininfor` VALUES (106,'admin','127.0.0.1','0','退出成功','2021-12-31 10:28:24');
INSERT INTO `sys_logininfor` VALUES (107,'admin','127.0.0.1','0','登录成功','2021-12-31 10:28:30');
INSERT INTO `sys_logininfor` VALUES (108,'admin','127.0.0.1','0','退出成功','2021-12-31 10:30:40');
INSERT INTO `sys_logininfor` VALUES (109,'admin','127.0.0.1','0','登录成功','2021-12-31 10:30:44');
INSERT INTO `sys_logininfor` VALUES (110,'admin','127.0.0.1','0','登录成功','2022-01-01 12:43:16');
INSERT INTO `sys_logininfor` VALUES (111,'admin','127.0.0.1','0','退出成功','2022-01-01 13:58:15');
INSERT INTO `sys_logininfor` VALUES (112,'admin','127.0.0.1','0','登录成功','2022-01-01 17:17:00');
INSERT INTO `sys_logininfor` VALUES (113,'admin','127.0.0.1','0','退出成功','2022-01-02 09:01:38');
INSERT INTO `sys_logininfor` VALUES (114,'admin','127.0.0.1','0','登录成功','2022-01-02 09:01:44');
INSERT INTO `sys_logininfor` VALUES (115,'admin','127.0.0.1','0','退出成功','2022-01-02 09:30:24');
INSERT INTO `sys_logininfor` VALUES (116,'admin','127.0.0.1','0','退出成功','2022-01-02 09:30:36');
INSERT INTO `sys_logininfor` VALUES (117,'admin','127.0.0.1','0','登录成功','2022-01-02 09:30:48');
INSERT INTO `sys_logininfor` VALUES (118,'admin','127.0.0.1','0','退出成功','2022-01-02 11:14:08');
INSERT INTO `sys_logininfor` VALUES (119,'admin','127.0.0.1','0','登录成功','2022-01-02 11:14:14');
INSERT INTO `sys_logininfor` VALUES (120,'admin','127.0.0.1','0','登录成功','2022-01-02 16:15:42');
INSERT INTO `sys_logininfor` VALUES (121,'admin','127.0.0.1','0','登录成功','2022-01-02 16:58:22');
INSERT INTO `sys_logininfor` VALUES (122,'admin','127.0.0.1','0','登录成功','2022-01-02 18:08:03');
INSERT INTO `sys_logininfor` VALUES (123,'admin','127.0.0.1','0','退出成功','2022-01-03 10:21:47');
INSERT INTO `sys_logininfor` VALUES (124,'admin','127.0.0.1','0','登录成功','2022-01-03 10:21:51');
INSERT INTO `sys_logininfor` VALUES (125,'admin','127.0.0.1','0','登录成功','2022-01-03 16:37:46');
INSERT INTO `sys_logininfor` VALUES (126,'admin','127.0.0.1','0','退出成功','2022-01-03 16:47:47');
INSERT INTO `sys_logininfor` VALUES (127,'ry','127.0.0.1','0','登录成功','2022-01-03 16:47:54');
INSERT INTO `sys_logininfor` VALUES (128,'ry','127.0.0.1','0','退出成功','2022-01-03 16:48:19');
INSERT INTO `sys_logininfor` VALUES (129,'admin','127.0.0.1','0','登录成功','2022-01-03 16:48:21');
INSERT INTO `sys_logininfor` VALUES (130,'admin','127.0.0.1','0','退出成功','2022-01-03 16:49:45');
INSERT INTO `sys_logininfor` VALUES (131,'teacher','127.0.0.1','0','登录成功','2022-01-03 16:49:53');
INSERT INTO `sys_logininfor` VALUES (132,'teacher','127.0.0.1','0','退出成功','2022-01-03 16:50:00');
INSERT INTO `sys_logininfor` VALUES (133,'admin','127.0.0.1','0','登录成功','2022-01-03 16:50:03');
INSERT INTO `sys_logininfor` VALUES (134,'admin','127.0.0.1','0','退出成功','2022-01-03 16:50:49');
INSERT INTO `sys_logininfor` VALUES (135,'teacher','127.0.0.1','0','登录成功','2022-01-03 16:50:53');
INSERT INTO `sys_logininfor` VALUES (136,'teacher','127.0.0.1','0','退出成功','2022-01-03 16:51:24');
INSERT INTO `sys_logininfor` VALUES (137,'admin','127.0.0.1','0','登录成功','2022-01-03 16:51:27');
INSERT INTO `sys_logininfor` VALUES (138,'admin','127.0.0.1','0','退出成功','2022-01-03 22:34:23');
INSERT INTO `sys_logininfor` VALUES (139,'admin','127.0.0.1','0','登录成功','2022-01-03 22:34:28');
INSERT INTO `sys_logininfor` VALUES (140,'admin','127.0.0.1','0','登录成功','2022-01-04 02:57:45');
INSERT INTO `sys_logininfor` VALUES (141,'admin','127.0.0.1','0','登录成功','2022-01-04 02:57:51');
INSERT INTO `sys_logininfor` VALUES (142,'admin','127.0.0.1','0','登录成功','2022-01-05 18:27:19');

--
-- Table structure for table `sys_menu`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3073 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'system',NULL,'',1,0,'M','0','0','','system','admin','2021-12-28 22:27:06','',NULL,'系统管理目录');
INSERT INTO `sys_menu` VALUES (2,'系统监控',0,2,'monitor',NULL,'',1,0,'M','0','0','','monitor','admin','2021-12-28 22:27:06','',NULL,'系统监控目录');
INSERT INTO `sys_menu` VALUES (3,'系统工具',0,3,'tool',NULL,'',1,0,'M','0','0','','tool','admin','2021-12-28 22:27:06','',NULL,'系统工具目录');
INSERT INTO `sys_menu` VALUES (100,'用户管理',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user','admin','2021-12-28 22:27:06','',NULL,'用户管理菜单');
INSERT INTO `sys_menu` VALUES (101,'角色管理',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples','admin','2021-12-28 22:27:06','',NULL,'角色管理菜单');
INSERT INTO `sys_menu` VALUES (102,'菜单管理',1,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table','admin','2021-12-28 22:27:06','',NULL,'菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103,'部门管理',1,4,'dept','system/dept/index','',1,0,'C','0','0','system:dept:list','tree','admin','2021-12-28 22:27:06','',NULL,'部门管理菜单');
INSERT INTO `sys_menu` VALUES (104,'岗位管理',1,5,'post','system/post/index','',1,0,'C','0','0','system:post:list','post','admin','2021-12-28 22:27:06','',NULL,'岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105,'字典管理',1,6,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list','dict','admin','2021-12-28 22:27:06','',NULL,'字典管理菜单');
INSERT INTO `sys_menu` VALUES (106,'参数设置',1,7,'config','system/config/index','',1,0,'C','0','0','system:config:list','edit','admin','2021-12-28 22:27:06','',NULL,'参数设置菜单');
INSERT INTO `sys_menu` VALUES (107,'通知公告',1,8,'notice','system/notice/index','',1,0,'C','0','0','system:notice:list','message','admin','2021-12-28 22:27:06','',NULL,'通知公告菜单');
INSERT INTO `sys_menu` VALUES (108,'日志管理',1,9,'log','','',1,0,'M','0','0','','log','admin','2021-12-28 22:27:07','',NULL,'日志管理菜单');
INSERT INTO `sys_menu` VALUES (109,'在线用户',2,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online','admin','2021-12-28 22:27:07','',NULL,'在线用户菜单');
INSERT INTO `sys_menu` VALUES (110,'定时任务',2,2,'job','monitor/job/index','',1,0,'C','0','0','monitor:job:list','job','admin','2021-12-28 22:27:07','',NULL,'定时任务菜单');
INSERT INTO `sys_menu` VALUES (111,'Sentinel控制台',2,3,'http://localhost:8718','','',0,0,'C','0','0','monitor:sentinel:list','sentinel','admin','2021-12-28 22:27:07','',NULL,'流量控制菜单');
INSERT INTO `sys_menu` VALUES (112,'Nacos控制台',2,4,'http://localhost:8848/nacos','','',0,0,'C','0','0','monitor:nacos:list','nacos','admin','2021-12-28 22:27:07','',NULL,'服务治理菜单');
INSERT INTO `sys_menu` VALUES (113,'Admin控制台',2,5,'http://localhost:9100/login','','',0,0,'C','0','0','monitor:server:list','server','admin','2021-12-28 22:27:07','',NULL,'服务监控菜单');
INSERT INTO `sys_menu` VALUES (114,'表单构建',3,1,'build','tool/build/index','',1,0,'C','0','0','tool:build:list','build','admin','2021-12-28 22:27:07','',NULL,'表单构建菜单');
INSERT INTO `sys_menu` VALUES (115,'代码生成',3,2,'gen','tool/gen/index','',1,0,'C','0','0','tool:gen:list','code','admin','2021-12-28 22:27:07','',NULL,'代码生成菜单');
INSERT INTO `sys_menu` VALUES (116,'系统接口',3,3,'http://localhost:8080/swagger-ui/index.html','','',0,0,'C','0','0','tool:swagger:list','swagger','admin','2021-12-28 22:27:07','',NULL,'系统接口菜单');
INSERT INTO `sys_menu` VALUES (500,'操作日志',108,1,'operlog','system/operlog/index','',1,0,'C','0','0','system:operlog:list','form','admin','2021-12-28 22:27:07','',NULL,'操作日志菜单');
INSERT INTO `sys_menu` VALUES (501,'登录日志',108,2,'logininfor','system/logininfor/index','',1,0,'C','0','0','system:logininfor:list','logininfor','admin','2021-12-28 22:27:07','',NULL,'登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001,'用户查询',100,1,'','','',1,0,'F','0','0','system:user:query','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1002,'用户新增',100,2,'','','',1,0,'F','0','0','system:user:add','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1003,'用户修改',100,3,'','','',1,0,'F','0','0','system:user:edit','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1004,'用户删除',100,4,'','','',1,0,'F','0','0','system:user:remove','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1005,'用户导出',100,5,'','','',1,0,'F','0','0','system:user:export','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1006,'用户导入',100,6,'','','',1,0,'F','0','0','system:user:import','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1007,'重置密码',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1008,'角色查询',101,1,'','','',1,0,'F','0','0','system:role:query','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1009,'角色新增',101,2,'','','',1,0,'F','0','0','system:role:add','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1010,'角色修改',101,3,'','','',1,0,'F','0','0','system:role:edit','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1011,'角色删除',101,4,'','','',1,0,'F','0','0','system:role:remove','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1012,'角色导出',101,5,'','','',1,0,'F','0','0','system:role:export','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1013,'菜单查询',102,1,'','','',1,0,'F','0','0','system:menu:query','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1014,'菜单新增',102,2,'','','',1,0,'F','0','0','system:menu:add','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1015,'菜单修改',102,3,'','','',1,0,'F','0','0','system:menu:edit','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1016,'菜单删除',102,4,'','','',1,0,'F','0','0','system:menu:remove','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1017,'部门查询',103,1,'','','',1,0,'F','0','0','system:dept:query','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1018,'部门新增',103,2,'','','',1,0,'F','0','0','system:dept:add','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1019,'部门修改',103,3,'','','',1,0,'F','0','0','system:dept:edit','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1020,'部门删除',103,4,'','','',1,0,'F','0','0','system:dept:remove','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1021,'岗位查询',104,1,'','','',1,0,'F','0','0','system:post:query','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1022,'岗位新增',104,2,'','','',1,0,'F','0','0','system:post:add','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1023,'岗位修改',104,3,'','','',1,0,'F','0','0','system:post:edit','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1024,'岗位删除',104,4,'','','',1,0,'F','0','0','system:post:remove','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1025,'岗位导出',104,5,'','','',1,0,'F','0','0','system:post:export','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1026,'字典查询',105,1,'#','','',1,0,'F','0','0','system:dict:query','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1027,'字典新增',105,2,'#','','',1,0,'F','0','0','system:dict:add','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1028,'字典修改',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1029,'字典删除',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1030,'字典导出',105,5,'#','','',1,0,'F','0','0','system:dict:export','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1031,'参数查询',106,1,'#','','',1,0,'F','0','0','system:config:query','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1032,'参数新增',106,2,'#','','',1,0,'F','0','0','system:config:add','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1033,'参数修改',106,3,'#','','',1,0,'F','0','0','system:config:edit','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1034,'参数删除',106,4,'#','','',1,0,'F','0','0','system:config:remove','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1035,'参数导出',106,5,'#','','',1,0,'F','0','0','system:config:export','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1036,'公告查询',107,1,'#','','',1,0,'F','0','0','system:notice:query','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1037,'公告新增',107,2,'#','','',1,0,'F','0','0','system:notice:add','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1038,'公告修改',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1039,'公告删除',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1040,'操作查询',500,1,'#','','',1,0,'F','0','0','system:operlog:query','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1041,'操作删除',500,2,'#','','',1,0,'F','0','0','system:operlog:remove','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1042,'日志导出',500,4,'#','','',1,0,'F','0','0','system:operlog:export','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1043,'登录查询',501,1,'#','','',1,0,'F','0','0','system:logininfor:query','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1044,'登录删除',501,2,'#','','',1,0,'F','0','0','system:logininfor:remove','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1045,'日志导出',501,3,'#','','',1,0,'F','0','0','system:logininfor:export','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1046,'在线查询',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1047,'批量强退',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1048,'单条强退',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1049,'任务查询',110,1,'#','','',1,0,'F','0','0','monitor:job:query','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1050,'任务新增',110,2,'#','','',1,0,'F','0','0','monitor:job:add','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1051,'任务修改',110,3,'#','','',1,0,'F','0','0','monitor:job:edit','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1052,'任务删除',110,4,'#','','',1,0,'F','0','0','monitor:job:remove','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1053,'状态修改',110,5,'#','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1054,'任务导出',110,7,'#','','',1,0,'F','0','0','monitor:job:export','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1055,'生成查询',115,1,'#','','',1,0,'F','0','0','tool:gen:query','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1056,'生成修改',115,2,'#','','',1,0,'F','0','0','tool:gen:edit','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1057,'生成删除',115,3,'#','','',1,0,'F','0','0','tool:gen:remove','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1058,'导入代码',115,2,'#','','',1,0,'F','0','0','tool:gen:import','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1059,'预览代码',115,4,'#','','',1,0,'F','0','0','tool:gen:preview','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (1060,'生成代码',115,5,'#','','',1,0,'F','0','0','tool:gen:code','#','admin','2021-12-28 22:27:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (3000,'会员管理',0,10,'peoples','',NULL,1,0,'M','0','0','','product','admin','2022-01-04 02:50:01','',NULL,'会员管理-目录');
INSERT INTO `sys_menu` VALUES (3001,'学校管理',3000,1,'managementSchools','peoples/managementSchools/index','',1,0,'C','0','0','peoples:managementSchools:list','product-list','admin','2022-01-04 02:50:01','',NULL,'学校管理-菜单');
INSERT INTO `sys_menu` VALUES (3002,'查询',3001,1,'','','',1,0,'F','0','0','peoples:managementSchools:query','#','admin','2022-01-04 02:50:01','',NULL,'学校管理-查询-按钮');
INSERT INTO `sys_menu` VALUES (3003,'添加',3001,2,'','','',1,0,'F','0','0','peoples:managementSchools:add','#','admin','2022-01-04 02:50:01','',NULL,'学校管理-添加-按钮');
INSERT INTO `sys_menu` VALUES (3004,'编辑',3001,3,'','','',1,0,'F','0','0','peoples:managementSchools:edit','#','admin','2022-01-04 02:50:01','',NULL,'学校管理-编辑-按钮');
INSERT INTO `sys_menu` VALUES (3005,'删除',3001,4,'','','',1,0,'F','0','0','peoples:managementSchools:remove','#','admin','2022-01-04 02:50:01','',NULL,'学校管理-删除-按钮');
INSERT INTO `sys_menu` VALUES (3006,'导入',3001,5,'','','',1,0,'F','0','0','peoples:managementSchools:import','#','admin','2022-01-04 02:50:01','',NULL,'学校管理-导入-按钮');
INSERT INTO `sys_menu` VALUES (3007,'导出',3001,6,'','','',1,0,'F','0','0','peoples:managementSchools:export','#','admin','2022-01-04 02:50:01','',NULL,'学校管理-导出-按钮');
INSERT INTO `sys_menu` VALUES (3008,'班级管理',3000,2,'managementClasses','peoples/managementClasses/index','',1,0,'C','0','0','peoples:managementClasses:list','product-list','admin','2022-01-04 02:50:01','',NULL,'班级管理-菜单');
INSERT INTO `sys_menu` VALUES (3009,'查询',3008,1,'','','',1,0,'F','0','0','peoples:managementClasses:query','#','admin','2022-01-04 02:50:01','',NULL,'班级管理-查询-按钮');
INSERT INTO `sys_menu` VALUES (3010,'添加',3008,2,'','','',1,0,'F','0','0','peoples:managementClasses:add','#','admin','2022-01-04 02:50:01','',NULL,'班级管理-添加-按钮');
INSERT INTO `sys_menu` VALUES (3011,'编辑',3008,3,'','','',1,0,'F','0','0','peoples:managementClasses:edit','#','admin','2022-01-04 02:50:01','',NULL,'班级管理-编辑-按钮');
INSERT INTO `sys_menu` VALUES (3012,'删除',3008,4,'','','',1,0,'F','0','0','peoples:managementClasses:remove','#','admin','2022-01-04 02:50:01','',NULL,'班级管理-删除-按钮');
INSERT INTO `sys_menu` VALUES (3013,'导入',3008,5,'','','',1,0,'F','0','0','peoples:managementClasses:import','#','admin','2022-01-04 02:50:01','',NULL,'班级管理-导入-按钮');
INSERT INTO `sys_menu` VALUES (3014,'导出',3008,6,'','','',1,0,'F','0','0','peoples:managementClasses:export','#','admin','2022-01-04 02:50:01','',NULL,'班级管理-导出-按钮');
INSERT INTO `sys_menu` VALUES (3015,'学生管理',3000,3,'managementStudents','peoples/managementStudents/index','',1,0,'C','0','0','peoples:managementStudents:list','product-list','admin','2022-01-04 02:50:01','',NULL,'学生管理-菜单');
INSERT INTO `sys_menu` VALUES (3016,'查询',3015,1,'','','',1,0,'F','0','0','peoples:managementStudents:query','#','admin','2022-01-04 02:50:01','',NULL,'学生管理-查询-按钮');
INSERT INTO `sys_menu` VALUES (3017,'添加',3015,2,'','','',1,0,'F','0','0','peoples:managementStudents:add','#','admin','2022-01-04 02:50:01','',NULL,'学生管理-添加-按钮');
INSERT INTO `sys_menu` VALUES (3018,'编辑',3015,3,'','','',1,0,'F','0','0','peoples:managementStudents:edit','#','admin','2022-01-04 02:50:01','',NULL,'学生管理-编辑-按钮');
INSERT INTO `sys_menu` VALUES (3019,'删除',3015,4,'','','',1,0,'F','0','0','peoples:managementStudents:remove','#','admin','2022-01-04 02:50:01','',NULL,'学生管理-删除-按钮');
INSERT INTO `sys_menu` VALUES (3020,'导入',3015,5,'','','',1,0,'F','0','0','peoples:managementStudents:import','#','admin','2022-01-04 02:50:01','',NULL,'学生管理-导入-按钮');
INSERT INTO `sys_menu` VALUES (3021,'导出',3015,6,'','','',1,0,'F','0','0','peoples:managementStudents:export','#','admin','2022-01-04 02:50:01','',NULL,'学生管理-导出-按钮');
INSERT INTO `sys_menu` VALUES (3022,'会员管理',3000,4,'managementMemberships','peoples/managementMemberships/index','',1,0,'C','0','0','peoples:managementMemberships:list','product-list','admin','2022-01-04 02:50:01','',NULL,'会员管理-菜单');
INSERT INTO `sys_menu` VALUES (3023,'查询',3022,1,'','','',1,0,'F','0','0','peoples:managementMemberships:query','#','admin','2022-01-04 02:50:01','',NULL,'会员管理-查询-按钮');
INSERT INTO `sys_menu` VALUES (3024,'添加',3022,2,'','','',1,0,'F','0','0','peoples:managementMemberships:add','#','admin','2022-01-04 02:50:01','',NULL,'会员管理-添加-按钮');
INSERT INTO `sys_menu` VALUES (3025,'编辑',3022,3,'','','',1,0,'F','0','0','peoples:managementMemberships:edit','#','admin','2022-01-04 02:50:01','',NULL,'会员管理-编辑-按钮');
INSERT INTO `sys_menu` VALUES (3026,'删除',3022,4,'','','',1,0,'F','0','0','peoples:managementMemberships:remove','#','admin','2022-01-04 02:50:01','',NULL,'会员管理-删除-按钮');
INSERT INTO `sys_menu` VALUES (3027,'导入',3022,5,'','','',1,0,'F','0','0','peoples:managementMemberships:import','#','admin','2022-01-04 02:50:01','',NULL,'会员管理-导入-按钮');
INSERT INTO `sys_menu` VALUES (3028,'导出',3022,6,'','','',1,0,'F','0','0','peoples:managementMemberships:export','#','admin','2022-01-04 02:50:01','',NULL,'会员管理-导出-按钮');
INSERT INTO `sys_menu` VALUES (3029,'资料管理',0,20,'material','',NULL,1,0,'M','0','0','','upload','admin','2022-01-04 02:50:01','',NULL,'资料管理-目录');
INSERT INTO `sys_menu` VALUES (3030,'文件网盘',3029,1,'fileDrive','material/fileDrive/index','',1,0,'C','0','0','material:fileDrive:list','dengji','admin','2022-01-04 02:50:01','',NULL,'文件网盘-菜单');
INSERT INTO `sys_menu` VALUES (3031,'查询',3030,1,'','','',1,0,'F','0','0','material:fileDrive:query','#','admin','2022-01-04 02:50:01','',NULL,'文件网盘-查询-按钮');
INSERT INTO `sys_menu` VALUES (3032,'添加',3030,2,'','','',1,0,'F','0','0','material:fileDrive:add','#','admin','2022-01-04 02:50:01','',NULL,'文件网盘-添加-按钮');
INSERT INTO `sys_menu` VALUES (3033,'编辑',3030,3,'','','',1,0,'F','0','0','material:fileDrive:edit','#','admin','2022-01-04 02:50:01','',NULL,'文件网盘-编辑-按钮');
INSERT INTO `sys_menu` VALUES (3034,'删除',3030,4,'','','',1,0,'F','0','0','material:fileDrive:remove','#','admin','2022-01-04 02:50:01','',NULL,'文件网盘-删除-按钮');
INSERT INTO `sys_menu` VALUES (3035,'导入',3030,5,'','','',1,0,'F','0','0','material:fileDrive:import','#','admin','2022-01-04 02:50:01','',NULL,'文件网盘-导入-按钮');
INSERT INTO `sys_menu` VALUES (3036,'导出',3030,6,'','','',1,0,'F','0','0','material:fileDrive:export','#','admin','2022-01-04 02:50:01','',NULL,'文件网盘-导出-按钮');
INSERT INTO `sys_menu` VALUES (3037,'老师管理',0,30,'teachers','',NULL,1,0,'M','0','0','','example','admin','2022-01-04 02:50:01','',NULL,'老师管理-目录');
INSERT INTO `sys_menu` VALUES (3038,'老师信息',3037,1,'teacherInfos','teachers/teacherInfos/index','',1,0,'C','0','0','teachers:teacherInfos:list','article','admin','2022-01-04 02:50:01','',NULL,'老师信息-菜单');
INSERT INTO `sys_menu` VALUES (3039,'查询',3038,1,'','','',1,0,'F','0','0','teachers:teacherInfos:query','#','admin','2022-01-04 02:50:01','',NULL,'老师信息-查询-按钮');
INSERT INTO `sys_menu` VALUES (3040,'添加',3038,2,'','','',1,0,'F','0','0','teachers:teacherInfos:add','#','admin','2022-01-04 02:50:01','',NULL,'老师信息-添加-按钮');
INSERT INTO `sys_menu` VALUES (3041,'编辑',3038,3,'','','',1,0,'F','0','0','teachers:teacherInfos:edit','#','admin','2022-01-04 02:50:01','',NULL,'老师信息-编辑-按钮');
INSERT INTO `sys_menu` VALUES (3042,'删除',3038,4,'','','',1,0,'F','0','0','teachers:teacherInfos:remove','#','admin','2022-01-04 02:50:01','',NULL,'老师信息-删除-按钮');
INSERT INTO `sys_menu` VALUES (3043,'导入',3038,5,'','','',1,0,'F','0','0','teachers:teacherInfos:import','#','admin','2022-01-04 02:50:01','',NULL,'老师信息-导入-按钮');
INSERT INTO `sys_menu` VALUES (3044,'导出',3038,6,'','','',1,0,'F','0','0','teachers:teacherInfos:export','#','admin','2022-01-04 02:50:01','',NULL,'老师信息-导出-按钮');

--
-- Table structure for table `sys_notice`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

INSERT INTO `sys_notice` VALUES (1,'温馨提醒：2018-07-01 若依新版本发布啦','2',_binary '新版本内容','0','admin','2021-12-28 22:27:07','',NULL,'管理员');
INSERT INTO `sys_notice` VALUES (2,'维护通知：2018-07-01 若依系统凌晨维护','1',_binary '维护内容','0','admin','2021-12-28 22:27:07','',NULL,'管理员');

--
-- Table structure for table `sys_oper_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

INSERT INTO `sys_oper_log` VALUES (100,'代码生成',6,'com.ruoyi.gen.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/gen/importTable','127.0.0.1','','edu_members_managestudents','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-28 23:09:54');
INSERT INTO `sys_oper_log` VALUES (101,'代码生成',8,'com.ruoyi.gen.controller.GenController.genCode()','GET',1,'admin',NULL,'/gen/genCode/edu_members_managestudents','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-28 23:10:46');
INSERT INTO `sys_oper_log` VALUES (102,'代码生成',6,'com.ruoyi.gen.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/gen/importTable','127.0.0.1','','edu_teacher_infos','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-28 23:12:29');
INSERT INTO `sys_oper_log` VALUES (103,'代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/gen/batchGenCode','127.0.0.1','',NULL,NULL,0,NULL,'2021-12-28 23:12:45');
INSERT INTO `sys_oper_log` VALUES (104,'代码生成',8,'com.ruoyi.gen.controller.GenController.genCode()','GET',1,'admin',NULL,'/gen/genCode/edu_members_managestudents','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-28 23:13:03');
INSERT INTO `sys_oper_log` VALUES (105,'代码生成',8,'com.ruoyi.gen.controller.GenController.genCode()','GET',1,'admin',NULL,'/gen/genCode/edu_members_managestudents','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-28 23:21:47');
INSERT INTO `sys_oper_log` VALUES (106,'代码生成',8,'com.ruoyi.gen.controller.GenController.genCode()','GET',1,'admin',NULL,'/gen/genCode/edu_members_managestudents','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-28 23:23:40');
INSERT INTO `sys_oper_log` VALUES (107,'代码生成',8,'com.ruoyi.gen.controller.GenController.genCode()','GET',1,'admin',NULL,'/gen/genCode/edu_members_managestudents','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 00:09:33');
INSERT INTO `sys_oper_log` VALUES (108,'代码生成',8,'com.ruoyi.gen.controller.GenController.genCode()','GET',1,'admin',NULL,'/gen/genCode/edu_members_managestudents','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 00:11:01');
INSERT INTO `sys_oper_log` VALUES (109,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 00:18:16');
INSERT INTO `sys_oper_log` VALUES (110,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 00:25:12');
INSERT INTO `sys_oper_log` VALUES (111,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 00:29:53');
INSERT INTO `sys_oper_log` VALUES (112,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 00:30:54');
INSERT INTO `sys_oper_log` VALUES (113,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 00:31:02');
INSERT INTO `sys_oper_log` VALUES (114,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 00:34:37');
INSERT INTO `sys_oper_log` VALUES (115,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 00:38:13');
INSERT INTO `sys_oper_log` VALUES (116,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 00:40:57');
INSERT INTO `sys_oper_log` VALUES (117,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 00:42:02');
INSERT INTO `sys_oper_log` VALUES (118,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 00:46:10');
INSERT INTO `sys_oper_log` VALUES (119,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 00:47:07');
INSERT INTO `sys_oper_log` VALUES (120,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 00:48:26');
INSERT INTO `sys_oper_log` VALUES (121,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 00:49:21');
INSERT INTO `sys_oper_log` VALUES (122,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 00:50:39');
INSERT INTO `sys_oper_log` VALUES (123,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 00:51:19');
INSERT INTO `sys_oper_log` VALUES (124,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 00:56:11');
INSERT INTO `sys_oper_log` VALUES (125,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,NULL,1,'Parameter \'file\' is not a file: /Users/richard/IdeaProjects/RuoYi-Cloud-Education/ruoyi-modules-eduction/main/java/com/ruoyi/system/domain/EduMembersManagestudents.java','2021-12-29 00:58:48');
INSERT INTO `sys_oper_log` VALUES (126,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,NULL,1,'Parameter \'file\' is not a file: /Users/richard/IdeaProjects/RuoYi-Cloud-Education/ruoyi-modules-eduction/main/java/com/ruoyi/system/domain/EduMembersManagestudents.java','2021-12-29 00:59:26');
INSERT INTO `sys_oper_log` VALUES (127,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,NULL,1,'Parameter \'file\' is not a file: /Users/richard/IdeaProjects/RuoYi-Cloud-Education/ruoyi-ui/src/api/system/managestudents.js','2021-12-29 01:01:05');
INSERT INTO `sys_oper_log` VALUES (128,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,NULL,1,'渲染模板失败，表名：edu_members_managestudents','2021-12-29 01:05:56');
INSERT INTO `sys_oper_log` VALUES (129,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 01:08:22');
INSERT INTO `sys_oper_log` VALUES (130,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 01:10:38');
INSERT INTO `sys_oper_log` VALUES (131,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 01:11:39');
INSERT INTO `sys_oper_log` VALUES (132,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 01:14:12');
INSERT INTO `sys_oper_log` VALUES (133,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,NULL,1,'Parameter \'file\' is not a file: /Users/richard/IdeaProjects/RuoYi-Cloud-Education/ruoyi-ui/src/api/system/managestudents.js','2021-12-29 01:15:46');
INSERT INTO `sys_oper_log` VALUES (134,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,NULL,1,'Parameter \'file\' is not a file: /Users/richard/IdeaProjects/RuoYi-Cloud-Education/ruoyi-ui/src/api/system/managestudents.js','2021-12-29 01:16:49');
INSERT INTO `sys_oper_log` VALUES (135,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,NULL,1,'Parameter \'file\' is not a file: /Users/richard/IdeaProjects/RuoYi-Cloud-Education/ruoyi-ui/src/api/system/managestudents.js','2021-12-29 01:17:16');
INSERT INTO `sys_oper_log` VALUES (136,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,NULL,1,'Parameter \'file\' is not a file: /Users/richard/IdeaProjects/RuoYi-Cloud-Education/ruoyi-ui/src/api/system/managestudents.js','2021-12-29 01:22:48');
INSERT INTO `sys_oper_log` VALUES (137,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,NULL,1,'Parameter \'file\' is not a file: /Users/richard/IdeaProjects/RuoYi-Cloud-Education/ruoyi-ui/src/api/system/managestudents.js','2021-12-29 01:24:42');
INSERT INTO `sys_oper_log` VALUES (138,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,NULL,1,'Parameter \'file\' is not a file: /Users/richard/IdeaProjects/RuoYi-Cloud-Education/ruoyi-ui/src/api/system/managestudents.js','2021-12-29 01:25:36');
INSERT INTO `sys_oper_log` VALUES (139,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 01:27:09');
INSERT INTO `sys_oper_log` VALUES (140,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,NULL,1,'Parameter \'file\' is not a file: /Users/richard/IdeaProjects/RuoYi-Cloud-Education/ruoyi-ui/src/api/system/managestudents.js','2021-12-29 01:30:47');
INSERT INTO `sys_oper_log` VALUES (141,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,NULL,1,'Parameter \'file\' is not a file: /Users/richard/IdeaProjects/RuoYi-Cloud-Education/ruoyi-ui/src/api/system/managestudents.js','2021-12-29 01:32:40');
INSERT INTO `sys_oper_log` VALUES (142,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,NULL,1,'Parameter \'file\' is not a file: /Users/richard/IdeaProjects/RuoYi-Cloud-Education/ruoyi-ui/src/api/system/managestudents.js','2021-12-29 01:33:03');
INSERT INTO `sys_oper_log` VALUES (143,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,NULL,1,'Parameter \'file\' is not a file: /Users/richard/IdeaProjects/RuoYi-Cloud-Education/ruoyi-ui/src/api/system/managestudents.js','2021-12-29 01:34:08');
INSERT INTO `sys_oper_log` VALUES (144,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 01:48:18');
INSERT INTO `sys_oper_log` VALUES (145,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 01:49:24');
INSERT INTO `sys_oper_log` VALUES (146,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 01:51:34');
INSERT INTO `sys_oper_log` VALUES (147,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 01:53:48');
INSERT INTO `sys_oper_log` VALUES (148,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,NULL,1,'渲染模板失败，表名：edu_members_managestudents','2021-12-29 01:55:40');
INSERT INTO `sys_oper_log` VALUES (149,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,NULL,1,'渲染模板失败，表名：edu_members_managestudents','2021-12-29 01:55:59');
INSERT INTO `sys_oper_log` VALUES (150,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,NULL,1,'渲染模板失败，表名：edu_members_managestudents','2021-12-29 01:57:05');
INSERT INTO `sys_oper_log` VALUES (151,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,NULL,1,'渲染模板失败，表名：edu_members_managestudents','2021-12-29 01:58:56');
INSERT INTO `sys_oper_log` VALUES (152,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,NULL,1,'渲染模板失败，表名：edu_members_managestudents','2021-12-29 02:01:10');
INSERT INTO `sys_oper_log` VALUES (153,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,NULL,1,'渲染模板失败，表名：edu_members_managestudents','2021-12-29 02:01:54');
INSERT INTO `sys_oper_log` VALUES (154,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,NULL,1,'渲染模板失败，表名：edu_members_managestudents','2021-12-29 02:03:25');
INSERT INTO `sys_oper_log` VALUES (155,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 02:04:09');
INSERT INTO `sys_oper_log` VALUES (156,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 02:04:14');
INSERT INTO `sys_oper_log` VALUES (157,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,NULL,1,'渲染模板失败，表名：edu_members_managestudents','2021-12-29 02:06:59');
INSERT INTO `sys_oper_log` VALUES (158,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,NULL,1,'渲染模板失败，表名：edu_members_managestudents','2021-12-29 02:09:46');
INSERT INTO `sys_oper_log` VALUES (159,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 02:11:43');
INSERT INTO `sys_oper_log` VALUES (160,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,NULL,1,'渲染模板失败，表名：edu_members_managestudents','2021-12-29 02:13:53');
INSERT INTO `sys_oper_log` VALUES (161,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,NULL,1,'渲染模板失败，表名：edu_members_managestudents','2021-12-29 02:15:34');
INSERT INTO `sys_oper_log` VALUES (162,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,NULL,1,'渲染模板失败，表名：edu_members_managestudents','2021-12-29 02:18:20');
INSERT INTO `sys_oper_log` VALUES (163,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 02:18:58');
INSERT INTO `sys_oper_log` VALUES (164,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 02:20:08');
INSERT INTO `sys_oper_log` VALUES (165,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 02:22:04');
INSERT INTO `sys_oper_log` VALUES (166,'代码生成',3,'com.ruoyi.gen.controller.GenController.remove()','DELETE',1,'admin',NULL,'/gen/1','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 22:31:51');
INSERT INTO `sys_oper_log` VALUES (167,'代码生成',3,'com.ruoyi.gen.controller.GenController.remove()','DELETE',1,'admin',NULL,'/gen/2','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 22:31:53');
INSERT INTO `sys_oper_log` VALUES (168,'代码生成',6,'com.ruoyi.gen.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/gen/importTable','127.0.0.1','','edu_members_manageclasses','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 22:32:21');
INSERT INTO `sys_oper_log` VALUES (169,'代码生成',3,'com.ruoyi.gen.controller.GenController.remove()','DELETE',1,'admin',NULL,'/gen/3','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 22:37:45');
INSERT INTO `sys_oper_log` VALUES (170,'代码生成',6,'com.ruoyi.gen.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/gen/importTable','127.0.0.1','','edu_members_manageclasses','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 22:38:55');
INSERT INTO `sys_oper_log` VALUES (171,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 22:49:26');
INSERT INTO `sys_oper_log` VALUES (172,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 22:54:34');
INSERT INTO `sys_oper_log` VALUES (173,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 22:55:18');
INSERT INTO `sys_oper_log` VALUES (174,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 23:03:29');
INSERT INTO `sys_oper_log` VALUES (175,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 00:37:27');
INSERT INTO `sys_oper_log` VALUES (176,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 00:38:16');
INSERT INTO `sys_oper_log` VALUES (177,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 00:55:44');
INSERT INTO `sys_oper_log` VALUES (178,'代码生成',6,'com.ruoyi.gen.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/gen/importTable','127.0.0.1','','edu_members_manageschools','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 15:12:51');
INSERT INTO `sys_oper_log` VALUES (179,'代码生成',3,'com.ruoyi.gen.controller.GenController.remove()','DELETE',1,'admin',NULL,'/gen/5','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 15:14:29');
INSERT INTO `sys_oper_log` VALUES (180,'代码生成',6,'com.ruoyi.gen.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/gen/importTable','127.0.0.1','','edu_members_manageschools','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 15:14:40');
INSERT INTO `sys_oper_log` VALUES (181,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 15:16:38');
INSERT INTO `sys_oper_log` VALUES (182,'字典类型',1,'com.ruoyi.system.controller.SysDictTypeController.add()','POST',1,'admin',NULL,'/dict/type','127.0.0.1','','{\"createBy\":\"admin\",\"dictName\":\"学校类型\",\"params\":{},\"dictType\":\"school_type\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 15:27:23');
INSERT INTO `sys_oper_log` VALUES (183,'字典数据',1,'com.ruoyi.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/dict/data','127.0.0.1','','{\"dictValue\":\"0\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"school_type\",\"dictLabel\":\"公立学校\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 15:27:56');
INSERT INTO `sys_oper_log` VALUES (184,'字典数据',1,'com.ruoyi.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/dict/data','127.0.0.1','','{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"school_type\",\"dictLabel\":\"私立学校\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 15:28:03');
INSERT INTO `sys_oper_log` VALUES (185,'字典数据',1,'com.ruoyi.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/dict/data','127.0.0.1','','{\"dictValue\":\"2\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"school_type\",\"dictLabel\":\"培训机构\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 15:28:13');
INSERT INTO `sys_oper_log` VALUES (186,'字典数据',2,'com.ruoyi.system.controller.SysDictDataController.edit()','PUT',1,'admin',NULL,'/dict/data','127.0.0.1','','{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":1,\"params\":{},\"dictType\":\"school_type\",\"dictLabel\":\"私立学校\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1640849283000,\"dictCode\":101,\"updateBy\":\"admin\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 15:28:24');
INSERT INTO `sys_oper_log` VALUES (187,'字典数据',2,'com.ruoyi.system.controller.SysDictDataController.edit()','PUT',1,'admin',NULL,'/dict/data','127.0.0.1','','{\"dictValue\":\"2\",\"listClass\":\"default\",\"dictSort\":2,\"params\":{},\"dictType\":\"school_type\",\"dictLabel\":\"培训机构\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1640849293000,\"dictCode\":102,\"updateBy\":\"admin\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 15:28:36');
INSERT INTO `sys_oper_log` VALUES (188,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 15:29:44');
INSERT INTO `sys_oper_log` VALUES (189,'学校管理',1,'com.ruoyi.education.admin.controller.EduMembersManageschoolsController.add()','POST',1,'admin',NULL,'/peoples/managementSchools','127.0.0.1','','{\"principalName\":\"要呀\",\"allClassesNum\":1,\"params\":{},\"type\":0,\"createTime\":1640849750803,\"name\":\"北京大学\",\"id\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 15:35:50');
INSERT INTO `sys_oper_log` VALUES (190,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 23:02:49');
INSERT INTO `sys_oper_log` VALUES (191,'班级管理',1,'com.ruoyi.education.admin.controller.EduMembersManageclassesController.add()','POST',1,'admin',NULL,'/peoples/managementClasses','127.0.0.1','','{\"params\":{},\"studentsNum\":3,\"createTime\":1640935028927,\"phone\":\"18588871362\",\"schoolId\":1,\"name\":\"123\",\"id\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 15:17:09');
INSERT INTO `sys_oper_log` VALUES (192,'班级管理',1,'com.ruoyi.education.admin.controller.EduMembersManageclassesController.add()','POST',1,'admin',NULL,'/peoples/managementClasses','127.0.0.1','','{\"params\":{},\"studentsNum\":4,\"createTime\":1640935089483,\"phone\":\"\",\"schoolId\":1,\"name\":\"二年级01\",\"id\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 15:18:09');
INSERT INTO `sys_oper_log` VALUES (193,'班级管理',2,'com.ruoyi.education.admin.controller.EduMembersManageclassesController.edit()','PUT',1,'admin',NULL,'/peoples/managementClasses','127.0.0.1','','{\"updateTime\":1640935192619,\"params\":{},\"studentsNum\":4,\"createBy\":\"\",\"createTime\":1640935089000,\"headteacher\":0,\"phone\":\"\",\"updateBy\":\"\",\"schoolId\":1,\"name\":\"二年级01\",\"id\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 15:19:52');
INSERT INTO `sys_oper_log` VALUES (194,'班级管理',2,'com.ruoyi.education.admin.controller.EduMembersManageclassesController.edit()','PUT',1,'admin',NULL,'/peoples/managementClasses','127.0.0.1','','{\"updateTime\":1640935234084,\"params\":{},\"studentsNum\":4,\"createBy\":\"\",\"createTime\":1640935089000,\"headteacher\":0,\"phone\":\"\",\"updateBy\":\"\",\"schoolId\":1,\"name\":\"二年级01\",\"id\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 15:20:34');
INSERT INTO `sys_oper_log` VALUES (195,'班级管理',2,'com.ruoyi.education.admin.controller.EduMembersManageclassesController.edit()','PUT',1,'admin',NULL,'/peoples/managementClasses','127.0.0.1','','{\"updateTime\":1640935273916,\"params\":{},\"studentsNum\":3,\"createBy\":\"\",\"createTime\":1640935029000,\"headteacher\":0,\"phone\":\"18588871362\",\"updateBy\":\"\",\"schoolId\":1,\"name\":\"一年级\",\"id\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 15:21:13');
INSERT INTO `sys_oper_log` VALUES (196,'代码生成',6,'com.ruoyi.gen.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/gen/importTable','127.0.0.1','','edu_members_managestudents','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 17:28:26');
INSERT INTO `sys_oper_log` VALUES (197,'字典类型',1,'com.ruoyi.system.controller.SysDictTypeController.add()','POST',1,'admin',NULL,'/dict/type','127.0.0.1','','{\"createBy\":\"admin\",\"dictName\":\"是否vip\",\"params\":{},\"dictType\":\"is_vip\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 17:35:11');
INSERT INTO `sys_oper_log` VALUES (198,'字典数据',1,'com.ruoyi.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/dict/data','127.0.0.1','','{\"dictValue\":\"Y\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"is_vip\",\"dictLabel\":\"是\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 17:35:33');
INSERT INTO `sys_oper_log` VALUES (199,'字典数据',1,'com.ruoyi.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/dict/data','127.0.0.1','','{\"dictValue\":\"N\",\"listClass\":\"default\",\"dictSort\":1,\"params\":{},\"dictType\":\"is_vip\",\"dictLabel\":\"否\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 17:35:43');
INSERT INTO `sys_oper_log` VALUES (200,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 17:37:26');
INSERT INTO `sys_oper_log` VALUES (201,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 17:41:17');
INSERT INTO `sys_oper_log` VALUES (202,'学生管理',1,'com.ruoyi.education.admin.controller.EduMembersManagestudentsController.add()','POST',1,'admin',NULL,'/peoples/managementStudents','127.0.0.1','','{\"classId\":1,\"createTime\":1640943941843,\"schoolId\":1,\"name\":\"龚汉鑫\",\"id\":1,\"params\":{},\"isVip\":\"Y\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 17:45:41');
INSERT INTO `sys_oper_log` VALUES (203,'代码生成',2,'com.ruoyi.gen.controller.GenController.synchDb()','GET',1,'admin',NULL,'/gen/synchDb/edu_members_managestudents','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 17:48:25');
INSERT INTO `sys_oper_log` VALUES (204,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 17:49:55');
INSERT INTO `sys_oper_log` VALUES (205,'学生管理',1,'com.ruoyi.education.admin.controller.EduMembersManagestudentsController.add()','POST',1,'admin',NULL,'/peoples/managementStudents','127.0.0.1','','{\"params\":{},\"isVip\":\"Y\",\"classId\":1,\"createTime\":1640944298304,\"schoolId\":1,\"name\":\"龚汉金\",\"id\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 17:51:38');
INSERT INTO `sys_oper_log` VALUES (206,'代码生成',6,'com.ruoyi.gen.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/gen/importTable','127.0.0.1','','edu_members_managemembers','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 18:09:06');
INSERT INTO `sys_oper_log` VALUES (207,'字典类型',1,'com.ruoyi.system.controller.SysDictTypeController.add()','POST',1,'admin',NULL,'/dict/type','127.0.0.1','','{\"createBy\":\"admin\",\"dictName\":\"register_type\",\"params\":{},\"dictType\":\"注册类型\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 18:10:49');
INSERT INTO `sys_oper_log` VALUES (208,'字典类型',2,'com.ruoyi.system.controller.SysDictTypeController.edit()','PUT',1,'admin',NULL,'/dict/type','127.0.0.1','','{\"createBy\":\"admin\",\"createTime\":1640945449000,\"updateBy\":\"admin\",\"dictName\":\"注册类型\",\"dictId\":102,\"params\":{},\"dictType\":\"register_type\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 18:11:17');
INSERT INTO `sys_oper_log` VALUES (209,'字典类型',2,'com.ruoyi.system.controller.SysDictTypeController.edit()','PUT',1,'admin',NULL,'/dict/type','127.0.0.1','','{\"createBy\":\"admin\",\"createTime\":1640945449000,\"updateBy\":\"admin\",\"dictName\":\"注册类型\",\"dictId\":102,\"params\":{},\"dictType\":\"edu_register_type\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 18:11:25');
INSERT INTO `sys_oper_log` VALUES (210,'字典数据',1,'com.ruoyi.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/dict/data','127.0.0.1','','{\"dictValue\":\"0\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"edu_register_type\",\"dictLabel\":\"老师\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 18:11:54');
INSERT INTO `sys_oper_log` VALUES (211,'字典数据',1,'com.ruoyi.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/dict/data','127.0.0.1','','{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":1,\"params\":{},\"dictType\":\"edu_register_type\",\"dictLabel\":\"学生\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 18:12:08');
INSERT INTO `sys_oper_log` VALUES (212,'字典数据',1,'com.ruoyi.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/dict/data','127.0.0.1','','{\"dictValue\":\"2\",\"listClass\":\"default\",\"dictSort\":2,\"params\":{},\"dictType\":\"edu_register_type\",\"dictLabel\":\"其它\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 18:12:34');
INSERT INTO `sys_oper_log` VALUES (213,'代码生成',2,'com.ruoyi.gen.controller.GenController.synchDb()','GET',1,'admin',NULL,'/gen/synchDb/edu_members_managemembers','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 18:14:39');
INSERT INTO `sys_oper_log` VALUES (214,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 18:16:39');
INSERT INTO `sys_oper_log` VALUES (215,'会员管理',1,'com.ruoyi.education.admin.controller.EduMembersManagemembersController.add()','POST',1,'admin',NULL,'/peoples/managementMemberships','127.0.0.1','','{\"params\":{},\"type\":0,\"classId\":1,\"createTime\":1640945943290,\"schoolId\":1,\"name\":\"龚汉金\",\"id\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 18:19:03');
INSERT INTO `sys_oper_log` VALUES (216,'字典数据',2,'com.ruoyi.system.controller.SysDictDataController.edit()','PUT',1,'admin',NULL,'/dict/data','127.0.0.1','','{\"dictValue\":\"Y\",\"listClass\":\"primary\",\"dictSort\":0,\"params\":{},\"dictType\":\"is_vip\",\"dictLabel\":\"是\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1640943333000,\"dictCode\":103,\"updateBy\":\"admin\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 18:21:27');
INSERT INTO `sys_oper_log` VALUES (217,'字典数据',2,'com.ruoyi.system.controller.SysDictDataController.edit()','PUT',1,'admin',NULL,'/dict/data','127.0.0.1','','{\"dictValue\":\"N\",\"listClass\":\"info\",\"dictSort\":1,\"params\":{},\"dictType\":\"is_vip\",\"dictLabel\":\"否\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1640943343000,\"dictCode\":104,\"updateBy\":\"admin\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 18:21:38');
INSERT INTO `sys_oper_log` VALUES (218,'字典数据',2,'com.ruoyi.system.controller.SysDictDataController.edit()','PUT',1,'admin',NULL,'/dict/data','127.0.0.1','','{\"dictValue\":\"0\",\"listClass\":\"primary\",\"dictSort\":0,\"params\":{},\"dictType\":\"edu_register_type\",\"dictLabel\":\"老师\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1640945514000,\"dictCode\":105,\"updateBy\":\"admin\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 18:21:59');
INSERT INTO `sys_oper_log` VALUES (219,'字典数据',2,'com.ruoyi.system.controller.SysDictDataController.edit()','PUT',1,'admin',NULL,'/dict/data','127.0.0.1','','{\"dictValue\":\"1\",\"listClass\":\"success\",\"dictSort\":1,\"params\":{},\"dictType\":\"edu_register_type\",\"dictLabel\":\"学生\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1640945528000,\"dictCode\":106,\"updateBy\":\"admin\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 18:22:04');
INSERT INTO `sys_oper_log` VALUES (220,'字典数据',2,'com.ruoyi.system.controller.SysDictDataController.edit()','PUT',1,'admin',NULL,'/dict/data','127.0.0.1','','{\"dictValue\":\"2\",\"listClass\":\"info\",\"dictSort\":2,\"params\":{},\"dictType\":\"edu_register_type\",\"dictLabel\":\"其它\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1640945554000,\"dictCode\":107,\"updateBy\":\"admin\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 18:22:09');
INSERT INTO `sys_oper_log` VALUES (221,'字典数据',2,'com.ruoyi.system.controller.SysDictDataController.edit()','PUT',1,'admin',NULL,'/dict/data','127.0.0.1','','{\"dictValue\":\"0\",\"listClass\":\"info\",\"dictSort\":0,\"params\":{},\"dictType\":\"school_type\",\"dictLabel\":\"公立学校\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1640849276000,\"dictCode\":100,\"updateBy\":\"admin\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 18:22:41');
INSERT INTO `sys_oper_log` VALUES (222,'字典数据',2,'com.ruoyi.system.controller.SysDictDataController.edit()','PUT',1,'admin',NULL,'/dict/data','127.0.0.1','','{\"dictValue\":\"0\",\"listClass\":\"primary\",\"dictSort\":0,\"params\":{},\"dictType\":\"school_type\",\"dictLabel\":\"公立学校\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1640849276000,\"dictCode\":100,\"updateBy\":\"admin\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 18:22:47');
INSERT INTO `sys_oper_log` VALUES (223,'字典数据',2,'com.ruoyi.system.controller.SysDictDataController.edit()','PUT',1,'admin',NULL,'/dict/data','127.0.0.1','','{\"dictValue\":\"1\",\"listClass\":\"success\",\"dictSort\":1,\"params\":{},\"dictType\":\"school_type\",\"dictLabel\":\"私立学校\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1640849283000,\"dictCode\":101,\"updateBy\":\"admin\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 18:22:52');
INSERT INTO `sys_oper_log` VALUES (224,'字典数据',2,'com.ruoyi.system.controller.SysDictDataController.edit()','PUT',1,'admin',NULL,'/dict/data','127.0.0.1','','{\"dictValue\":\"2\",\"listClass\":\"warning\",\"dictSort\":2,\"params\":{},\"dictType\":\"school_type\",\"dictLabel\":\"培训机构\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1640849293000,\"dictCode\":102,\"updateBy\":\"admin\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 18:22:58');
INSERT INTO `sys_oper_log` VALUES (225,'会员管理',2,'com.ruoyi.education.admin.controller.EduMembersManagemembersController.edit()','PUT',1,'admin',NULL,'/peoples/managementMemberships','127.0.0.1','','{\"updateTime\":1640946211162,\"params\":{},\"type\":1,\"classId\":1,\"createBy\":\"\",\"createTime\":1640945943000,\"phone\":\"\",\"updateBy\":\"\",\"schoolId\":1,\"name\":\"龚汉金\",\"id\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 18:23:31');
INSERT INTO `sys_oper_log` VALUES (226,'会员管理',1,'com.ruoyi.education.admin.controller.EduMembersManagemembersController.add()','POST',1,'admin',NULL,'/peoples/managementMemberships','127.0.0.1','','{\"params\":{},\"type\":0,\"classId\":1,\"createTime\":1640947868843,\"schoolId\":1,\"name\":\"龚汉金3\",\"id\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 18:51:08');
INSERT INTO `sys_oper_log` VALUES (227,'代码生成',6,'com.ruoyi.gen.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/gen/importTable','127.0.0.1','','edu_teacher_infos','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 18:58:19');
INSERT INTO `sys_oper_log` VALUES (228,'字典类型',1,'com.ruoyi.system.controller.SysDictTypeController.add()','POST',1,'admin',NULL,'/dict/type','127.0.0.1','','{\"createBy\":\"admin\",\"dictName\":\"学校列表\",\"params\":{},\"dictType\":\"school_dict\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 18:59:36');
INSERT INTO `sys_oper_log` VALUES (229,'字典类型',1,'com.ruoyi.system.controller.SysDictTypeController.add()','POST',1,'admin',NULL,'/dict/type','127.0.0.1','','{\"createBy\":\"admin\",\"dictName\":\"班级列表\",\"params\":{},\"dictType\":\"classes_dict\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 18:59:55');
INSERT INTO `sys_oper_log` VALUES (230,'字典类型',1,'com.ruoyi.system.controller.SysDictTypeController.add()','POST',1,'admin',NULL,'/dict/type','127.0.0.1','','{\"createBy\":\"admin\",\"dictName\":\"学历\",\"params\":{},\"dictType\":\"education\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 19:04:26');
INSERT INTO `sys_oper_log` VALUES (231,'字典数据',1,'com.ruoyi.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/dict/data','127.0.0.1','','{\"dictValue\":\"0\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"education\",\"dictLabel\":\"博士\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 19:04:40');
INSERT INTO `sys_oper_log` VALUES (232,'字典数据',1,'com.ruoyi.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/dict/data','127.0.0.1','','{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":1,\"params\":{},\"dictType\":\"education\",\"dictLabel\":\"硕士\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 19:04:58');
INSERT INTO `sys_oper_log` VALUES (233,'字典数据',1,'com.ruoyi.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/dict/data','127.0.0.1','','{\"dictValue\":\"2\",\"listClass\":\"default\",\"dictSort\":2,\"params\":{},\"dictType\":\"education\",\"dictLabel\":\"本科\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 19:05:31');
INSERT INTO `sys_oper_log` VALUES (234,'字典数据',2,'com.ruoyi.system.controller.SysDictDataController.edit()','PUT',1,'admin',NULL,'/dict/data','127.0.0.1','','{\"dictValue\":\"2\",\"listClass\":\"default\",\"dictSort\":3,\"params\":{},\"dictType\":\"education\",\"dictLabel\":\"本科\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1640948731000,\"dictCode\":110,\"updateBy\":\"admin\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 19:06:01');
INSERT INTO `sys_oper_log` VALUES (235,'字典数据',1,'com.ruoyi.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/dict/data','127.0.0.1','','{\"dictValue\":\"2\",\"listClass\":\"default\",\"dictSort\":2,\"params\":{},\"dictType\":\"education\",\"dictLabel\":\"研究生\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 19:06:16');
INSERT INTO `sys_oper_log` VALUES (236,'字典数据',2,'com.ruoyi.system.controller.SysDictDataController.edit()','PUT',1,'admin',NULL,'/dict/data','127.0.0.1','','{\"dictValue\":\"3\",\"listClass\":\"default\",\"dictSort\":3,\"params\":{},\"dictType\":\"education\",\"dictLabel\":\"本科\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1640948731000,\"dictCode\":110,\"updateBy\":\"admin\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 19:06:24');
INSERT INTO `sys_oper_log` VALUES (237,'字典数据',1,'com.ruoyi.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/dict/data','127.0.0.1','','{\"dictValue\":\"4\",\"listClass\":\"default\",\"dictSort\":4,\"params\":{},\"dictType\":\"education\",\"dictLabel\":\"专科\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 19:06:46');
INSERT INTO `sys_oper_log` VALUES (238,'字典数据',2,'com.ruoyi.system.controller.SysDictDataController.edit()','PUT',1,'admin',NULL,'/dict/data','127.0.0.1','','{\"dictValue\":\"0\",\"listClass\":\"primary\",\"dictSort\":0,\"params\":{},\"dictType\":\"education\",\"dictLabel\":\"博士\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1640948680000,\"dictCode\":108,\"updateBy\":\"admin\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 19:07:02');
INSERT INTO `sys_oper_log` VALUES (239,'字典数据',2,'com.ruoyi.system.controller.SysDictDataController.edit()','PUT',1,'admin',NULL,'/dict/data','127.0.0.1','','{\"dictValue\":\"1\",\"listClass\":\"success\",\"dictSort\":1,\"params\":{},\"dictType\":\"education\",\"dictLabel\":\"硕士\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1640948698000,\"dictCode\":109,\"updateBy\":\"admin\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 19:07:08');
INSERT INTO `sys_oper_log` VALUES (240,'字典数据',2,'com.ruoyi.system.controller.SysDictDataController.edit()','PUT',1,'admin',NULL,'/dict/data','127.0.0.1','','{\"dictValue\":\"2\",\"listClass\":\"info\",\"dictSort\":2,\"params\":{},\"dictType\":\"education\",\"dictLabel\":\"研究生\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1640948776000,\"dictCode\":111,\"updateBy\":\"admin\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 19:07:13');
INSERT INTO `sys_oper_log` VALUES (241,'字典数据',2,'com.ruoyi.system.controller.SysDictDataController.edit()','PUT',1,'admin',NULL,'/dict/data','127.0.0.1','','{\"dictValue\":\"3\",\"listClass\":\"warning\",\"dictSort\":3,\"params\":{},\"dictType\":\"education\",\"dictLabel\":\"本科\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1640948731000,\"dictCode\":110,\"updateBy\":\"admin\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 19:07:18');
INSERT INTO `sys_oper_log` VALUES (242,'字典数据',2,'com.ruoyi.system.controller.SysDictDataController.edit()','PUT',1,'admin',NULL,'/dict/data','127.0.0.1','','{\"dictValue\":\"4\",\"listClass\":\"primary\",\"dictSort\":4,\"params\":{},\"dictType\":\"education\",\"dictLabel\":\"专科\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1640948806000,\"dictCode\":112,\"updateBy\":\"admin\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 19:07:25');
INSERT INTO `sys_oper_log` VALUES (243,'字典数据',1,'com.ruoyi.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/dict/data','127.0.0.1','','{\"dictValue\":\"5\",\"listClass\":\"default\",\"dictSort\":5,\"params\":{},\"dictType\":\"education\",\"dictLabel\":\"高中\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 19:07:43');
INSERT INTO `sys_oper_log` VALUES (244,'字典数据',2,'com.ruoyi.system.controller.SysDictDataController.edit()','PUT',1,'admin',NULL,'/dict/data','127.0.0.1','','{\"dictValue\":\"5\",\"listClass\":\"success\",\"dictSort\":5,\"params\":{},\"dictType\":\"education\",\"dictLabel\":\"高中\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1640948863000,\"dictCode\":113,\"updateBy\":\"admin\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 19:07:49');
INSERT INTO `sys_oper_log` VALUES (245,'字典数据',1,'com.ruoyi.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/dict/data','127.0.0.1','','{\"dictValue\":\"6\",\"listClass\":\"info\",\"dictSort\":6,\"params\":{},\"dictType\":\"education\",\"dictLabel\":\"初中\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 19:08:07');
INSERT INTO `sys_oper_log` VALUES (246,'字典数据',1,'com.ruoyi.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/dict/data','127.0.0.1','','{\"dictValue\":\"7\",\"listClass\":\"danger\",\"dictSort\":7,\"params\":{},\"dictType\":\"education\",\"dictLabel\":\"小学\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 19:08:22');
INSERT INTO `sys_oper_log` VALUES (247,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 19:10:06');
INSERT INTO `sys_oper_log` VALUES (248,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 19:19:57');
INSERT INTO `sys_oper_log` VALUES (249,'老师信息',1,'com.ruoyi.education.admin.controller.EduTeacherInfosController.add()','POST',1,'admin',NULL,'/teachers/teacherInfos','127.0.0.1','','{\"birthday\":1638720000000,\"graduateSchool\":\"顺工工\",\"education\":2,\"params\":{},\"classId\":1,\"classesNums\":12,\"entryTime\":1639324800000,\"createTime\":1640949767523,\"schoolId\":1,\"name\":\"龚汉金\",\"id\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-31 19:22:47');
INSERT INTO `sys_oper_log` VALUES (250,'用户头像',2,'com.ruoyi.system.controller.SysProfileController.avatar()','POST',1,'admin',NULL,'/user/profile/avatar','127.0.0.1','','','{\"msg\":\"文件服务异常，请联系管理员\",\"code\":500}',0,NULL,'2022-01-02 09:18:20');
INSERT INTO `sys_oper_log` VALUES (251,'用户管理',1,'com.ruoyi.system.controller.SysUserController.add()','POST',1,'admin',NULL,'/user','127.0.0.1','','{\"admin\":false,\"password\":\"$2a$10$DhnrxjAe2fMxlt.QCRW4Ie2ekpxWmwAPKJrRAgQY9DSyQcxw/RMnO\",\"postIds\":[],\"nickName\":\"龚汉金\",\"params\":{},\"userName\":\"gong.hanjin\",\"userId\":927133909219545088,\"createBy\":\"admin\",\"roleIds\":[],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-01-02 17:39:09');
INSERT INTO `sys_oper_log` VALUES (252,'老师信息',1,'com.ruoyi.education.admin.controller.EduTeacherInfosController.add()','POST',1,'admin',NULL,'/teachers/teacherInfos','127.0.0.1','','{\"birthday\":1640534400000,\"graduateSchool\":\"清华大学\",\"education\":2,\"params\":{},\"classId\":1,\"classesNums\":1,\"entryTime\":1641139200000,\"createTime\":1641116410486,\"schoolId\":1,\"name\":\"龚汉金2\",\"id\":927134165961281536}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-01-02 17:40:10');
INSERT INTO `sys_oper_log` VALUES (253,'老师信息',3,'com.ruoyi.education.admin.controller.EduTeacherInfosController.remove()','DELETE',1,'admin',NULL,'/teachers/teacherInfos/1','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-01-02 23:25:35');
INSERT INTO `sys_oper_log` VALUES (254,'老师信息',1,'com.ruoyi.education.admin.controller.EduTeacherInfosController.add()','POST',1,'admin',NULL,'/teachers/teacherInfos','127.0.0.1','','{\"birthday\":1642435200000,\"graduateSchool\":\"清华大学\",\"education\":4,\"params\":{},\"classId\":1,\"classesNums\":3,\"entryTime\":1642521600000,\"createTime\":1641199313017,\"schoolId\":1,\"name\":\"龚汉鑫\",\"id\":927481884374470656}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-01-03 16:41:53');
INSERT INTO `sys_oper_log` VALUES (255,'用户管理',2,'com.ruoyi.system.controller.SysUserController.resetPwd()','PUT',1,'admin',NULL,'/user/resetPwd','127.0.0.1','','{\"admin\":false,\"password\":\"$2a$10$PU8nb47yPVigGkMT0gUGe.KHOajqSgLSJeBTg2MmjRab/gBC3xJM.\",\"updateBy\":\"admin\",\"params\":{},\"userId\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-01-03 16:47:37');
INSERT INTO `sys_oper_log` VALUES (256,'角色管理',1,'com.ruoyi.system.controller.SysRoleController.add()','POST',1,'admin',NULL,'/role','127.0.0.1','','{\"flag\":false,\"roleId\":100,\"admin\":false,\"params\":{},\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"teacher\",\"roleName\":\"老师角色\",\"deptIds\":[],\"menuIds\":[3037,3038,3039,3040,3041,3042,3043,3044,3045,3046,3047,3048,3049,3050,3051],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-01-03 16:49:09');
INSERT INTO `sys_oper_log` VALUES (257,'用户管理',1,'com.ruoyi.system.controller.SysUserController.add()','POST',1,'admin',NULL,'/user','127.0.0.1','','{\"admin\":false,\"password\":\"$2a$10$ZHLorTOuvQ5aq6ClmpypQuyCalkbvKgFmOeIeqAngKdCbYsXvexyS\",\"postIds\":[],\"nickName\":\"teacher\",\"params\":{},\"userName\":\"teacher\",\"userId\":927483846335664128,\"createBy\":\"admin\",\"roleIds\":[],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-01-03 16:49:40');
INSERT INTO `sys_oper_log` VALUES (258,'角色管理',2,'com.ruoyi.system.controller.SysRoleController.edit()','PUT',1,'admin',NULL,'/role','127.0.0.1','','{\"flag\":false,\"roleId\":100,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createTime\":1641199749000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"teacher\",\"roleName\":\"老师角色\",\"menuIds\":[3037,3038,3039,3040,3041,3042,3043,3044,3045,3046,3047,3048,3049,3050,3051],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-01-03 16:50:28');
INSERT INTO `sys_oper_log` VALUES (259,'角色管理',4,'com.ruoyi.system.controller.SysRoleController.selectAuthUserAll()','PUT',1,'admin',NULL,'/role/authUser/selectAll','127.0.0.1','','100 [927483846335664128]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-01-03 16:50:41');
INSERT INTO `sys_oper_log` VALUES (260,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-01-03 21:21:16');
INSERT INTO `sys_oper_log` VALUES (261,'学校管理',1,'com.ruoyi.education.admin.controller.EduMembersManageschoolsController.add()','POST',1,'admin',NULL,'/peoples/managementSchools','127.0.0.1','','{\"principalName\":\"龙的何去何从\",\"allClassesNum\":3,\"params\":{},\"type\":0,\"createTime\":1641220643483,\"name\":\"清华大学\",\"id\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-01-03 22:37:23');
INSERT INTO `sys_oper_log` VALUES (262,'代码生成',2,'com.ruoyi.gen.controller.GenController.synchDb()','GET',1,'admin',NULL,'/gen/synchDb/edu_members_manageclasses','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-01-04 00:54:17');
INSERT INTO `sys_oper_log` VALUES (263,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-01-04 01:00:50');
INSERT INTO `sys_oper_log` VALUES (264,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-01-04 01:03:01');
INSERT INTO `sys_oper_log` VALUES (265,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-01-04 01:35:26');
INSERT INTO `sys_oper_log` VALUES (266,'班级管理',1,'com.ruoyi.education.admin.controller.EduMembersManageclassesController.add()','POST',1,'admin',NULL,'/peoples/managementClasses','127.0.0.1','','{\"params\":{},\"studentsNum\":1,\"createTime\":1641233853177,\"headteacher\":927134165961281500,\"schoolId\":1,\"name\":\"三年级\",\"id\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-01-04 02:17:33');
INSERT INTO `sys_oper_log` VALUES (267,'学生管理',1,'com.ruoyi.education.admin.controller.EduMembersManagestudentsController.add()','POST',1,'admin',NULL,'/peoples/managementStudents','127.0.0.1','','{\"params\":{},\"isVip\":\"Y\",\"classId\":1,\"createTime\":1641233889070,\"schoolId\":1,\"name\":\"龚汉金2\",\"id\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-01-04 02:18:09');
INSERT INTO `sys_oper_log` VALUES (268,'班级管理',1,'com.ruoyi.education.admin.controller.EduMembersManageclassesController.add()','POST',1,'admin',NULL,'/peoples/managementClasses','127.0.0.1','','{\"committee\":\"1,2\",\"params\":{},\"studentsNum\":0,\"createTime\":1641234747678,\"headteacher\":927134165961281500,\"schoolId\":1,\"name\":\"三\",\"id\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-01-04 02:32:27');
INSERT INTO `sys_oper_log` VALUES (269,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-01-04 02:35:57');
INSERT INTO `sys_oper_log` VALUES (270,'直接插入项目代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCodewrite()','GET',1,'admin',NULL,'/gen/batchGenCodewrite','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-01-04 02:37:16');

--
-- Table structure for table `sys_post`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'0','admin','2021-12-28 22:27:06','',NULL,'');
INSERT INTO `sys_post` VALUES (2,'se','项目经理',2,'0','admin','2021-12-28 22:27:06','',NULL,'');
INSERT INTO `sys_post` VALUES (3,'hr','人力资源',3,'0','admin','2021-12-28 22:27:06','',NULL,'');
INSERT INTO `sys_post` VALUES (4,'user','普通员工',4,'0','admin','2021-12-28 22:27:06','',NULL,'');

--
-- Table structure for table `sys_role`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2021-12-28 22:27:06','',NULL,'超级管理员');
INSERT INTO `sys_role` VALUES (2,'普通角色','common',2,'2',1,1,'0','0','admin','2021-12-28 22:27:06','',NULL,'普通角色');
INSERT INTO `sys_role` VALUES (100,'老师角色','teacher',0,'1',1,1,'0','0','admin','2022-01-03 16:49:09','admin','2022-01-03 16:50:28',NULL);

--
-- Table structure for table `sys_role_dept`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

INSERT INTO `sys_role_dept` VALUES (2,100);
INSERT INTO `sys_role_dept` VALUES (2,101);
INSERT INTO `sys_role_dept` VALUES (2,105);

--
-- Table structure for table `sys_role_menu`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

INSERT INTO `sys_role_menu` VALUES (2,1);
INSERT INTO `sys_role_menu` VALUES (2,2);
INSERT INTO `sys_role_menu` VALUES (2,3);
INSERT INTO `sys_role_menu` VALUES (2,4);
INSERT INTO `sys_role_menu` VALUES (2,100);
INSERT INTO `sys_role_menu` VALUES (2,101);
INSERT INTO `sys_role_menu` VALUES (2,102);
INSERT INTO `sys_role_menu` VALUES (2,103);
INSERT INTO `sys_role_menu` VALUES (2,104);
INSERT INTO `sys_role_menu` VALUES (2,105);
INSERT INTO `sys_role_menu` VALUES (2,106);
INSERT INTO `sys_role_menu` VALUES (2,107);
INSERT INTO `sys_role_menu` VALUES (2,108);
INSERT INTO `sys_role_menu` VALUES (2,109);
INSERT INTO `sys_role_menu` VALUES (2,110);
INSERT INTO `sys_role_menu` VALUES (2,111);
INSERT INTO `sys_role_menu` VALUES (2,112);
INSERT INTO `sys_role_menu` VALUES (2,113);
INSERT INTO `sys_role_menu` VALUES (2,114);
INSERT INTO `sys_role_menu` VALUES (2,115);
INSERT INTO `sys_role_menu` VALUES (2,116);
INSERT INTO `sys_role_menu` VALUES (2,500);
INSERT INTO `sys_role_menu` VALUES (2,501);
INSERT INTO `sys_role_menu` VALUES (2,1000);
INSERT INTO `sys_role_menu` VALUES (2,1001);
INSERT INTO `sys_role_menu` VALUES (2,1002);
INSERT INTO `sys_role_menu` VALUES (2,1003);
INSERT INTO `sys_role_menu` VALUES (2,1004);
INSERT INTO `sys_role_menu` VALUES (2,1005);
INSERT INTO `sys_role_menu` VALUES (2,1006);
INSERT INTO `sys_role_menu` VALUES (2,1007);
INSERT INTO `sys_role_menu` VALUES (2,1008);
INSERT INTO `sys_role_menu` VALUES (2,1009);
INSERT INTO `sys_role_menu` VALUES (2,1010);
INSERT INTO `sys_role_menu` VALUES (2,1011);
INSERT INTO `sys_role_menu` VALUES (2,1012);
INSERT INTO `sys_role_menu` VALUES (2,1013);
INSERT INTO `sys_role_menu` VALUES (2,1014);
INSERT INTO `sys_role_menu` VALUES (2,1015);
INSERT INTO `sys_role_menu` VALUES (2,1016);
INSERT INTO `sys_role_menu` VALUES (2,1017);
INSERT INTO `sys_role_menu` VALUES (2,1018);
INSERT INTO `sys_role_menu` VALUES (2,1019);
INSERT INTO `sys_role_menu` VALUES (2,1020);
INSERT INTO `sys_role_menu` VALUES (2,1021);
INSERT INTO `sys_role_menu` VALUES (2,1022);
INSERT INTO `sys_role_menu` VALUES (2,1023);
INSERT INTO `sys_role_menu` VALUES (2,1024);
INSERT INTO `sys_role_menu` VALUES (2,1025);
INSERT INTO `sys_role_menu` VALUES (2,1026);
INSERT INTO `sys_role_menu` VALUES (2,1027);
INSERT INTO `sys_role_menu` VALUES (2,1028);
INSERT INTO `sys_role_menu` VALUES (2,1029);
INSERT INTO `sys_role_menu` VALUES (2,1030);
INSERT INTO `sys_role_menu` VALUES (2,1031);
INSERT INTO `sys_role_menu` VALUES (2,1032);
INSERT INTO `sys_role_menu` VALUES (2,1033);
INSERT INTO `sys_role_menu` VALUES (2,1034);
INSERT INTO `sys_role_menu` VALUES (2,1035);
INSERT INTO `sys_role_menu` VALUES (2,1036);
INSERT INTO `sys_role_menu` VALUES (2,1037);
INSERT INTO `sys_role_menu` VALUES (2,1038);
INSERT INTO `sys_role_menu` VALUES (2,1039);
INSERT INTO `sys_role_menu` VALUES (2,1040);
INSERT INTO `sys_role_menu` VALUES (2,1041);
INSERT INTO `sys_role_menu` VALUES (2,1042);
INSERT INTO `sys_role_menu` VALUES (2,1043);
INSERT INTO `sys_role_menu` VALUES (2,1044);
INSERT INTO `sys_role_menu` VALUES (2,1045);
INSERT INTO `sys_role_menu` VALUES (2,1046);
INSERT INTO `sys_role_menu` VALUES (2,1047);
INSERT INTO `sys_role_menu` VALUES (2,1048);
INSERT INTO `sys_role_menu` VALUES (2,1049);
INSERT INTO `sys_role_menu` VALUES (2,1050);
INSERT INTO `sys_role_menu` VALUES (2,1051);
INSERT INTO `sys_role_menu` VALUES (2,1052);
INSERT INTO `sys_role_menu` VALUES (2,1053);
INSERT INTO `sys_role_menu` VALUES (2,1054);
INSERT INTO `sys_role_menu` VALUES (2,1055);
INSERT INTO `sys_role_menu` VALUES (2,1056);
INSERT INTO `sys_role_menu` VALUES (2,1057);
INSERT INTO `sys_role_menu` VALUES (2,1058);
INSERT INTO `sys_role_menu` VALUES (2,1059);
INSERT INTO `sys_role_menu` VALUES (2,1060);
INSERT INTO `sys_role_menu` VALUES (100,3037);
INSERT INTO `sys_role_menu` VALUES (100,3038);
INSERT INTO `sys_role_menu` VALUES (100,3039);
INSERT INTO `sys_role_menu` VALUES (100,3040);
INSERT INTO `sys_role_menu` VALUES (100,3041);
INSERT INTO `sys_role_menu` VALUES (100,3042);
INSERT INTO `sys_role_menu` VALUES (100,3043);
INSERT INTO `sys_role_menu` VALUES (100,3044);
INSERT INTO `sys_role_menu` VALUES (100,3045);
INSERT INTO `sys_role_menu` VALUES (100,3046);
INSERT INTO `sys_role_menu` VALUES (100,3047);
INSERT INTO `sys_role_menu` VALUES (100,3048);
INSERT INTO `sys_role_menu` VALUES (100,3049);
INSERT INTO `sys_role_menu` VALUES (100,3050);
INSERT INTO `sys_role_menu` VALUES (100,3051);

--
-- Table structure for table `sys_user`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=927483846335664129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

INSERT INTO `sys_user` VALUES (1,103,'admin','若依','00','ry@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2021-12-28 22:27:06','admin','2021-12-28 22:27:06','',NULL,'管理员');
INSERT INTO `sys_user` VALUES (2,105,'ry','若依','00','ry@qq.com','15666666666','1','','$2a$10$PU8nb47yPVigGkMT0gUGe.KHOajqSgLSJeBTg2MmjRab/gBC3xJM.','0','0','127.0.0.1','2021-12-28 22:27:06','admin','2021-12-28 22:27:06','admin','2022-01-03 16:47:37','测试员');
INSERT INTO `sys_user` VALUES (927133909219545088,NULL,'gong.hanjin','龚汉金','00','','','0','','$2a$10$DhnrxjAe2fMxlt.QCRW4Ie2ekpxWmwAPKJrRAgQY9DSyQcxw/RMnO','0','0','',NULL,'admin','2022-01-02 17:39:09','',NULL,NULL);
INSERT INTO `sys_user` VALUES (927483846335664128,NULL,'teacher','teacher','00','','','0','','$2a$10$ZHLorTOuvQ5aq6ClmpypQuyCalkbvKgFmOeIeqAngKdCbYsXvexyS','0','0','',NULL,'admin','2022-01-03 16:49:40','',NULL,NULL);

--
-- Table structure for table `sys_user_post`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

INSERT INTO `sys_user_post` VALUES (1,1);
INSERT INTO `sys_user_post` VALUES (2,2);

--
-- Table structure for table `sys_user_role`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

INSERT INTO `sys_user_role` VALUES (1,1);
INSERT INTO `sys_user_role` VALUES (2,2);
INSERT INTO `sys_user_role` VALUES (927483846335664128,100);
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-05 21:23:06
