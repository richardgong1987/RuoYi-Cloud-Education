/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : file

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 01/01/2022 23:40:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of file
-- ----------------------------
BEGIN;
INSERT INTO `file` VALUES (1, '2021-12-31 21:05:06', 1, 6906, NULL, 'upload/20211231/6d346dfac20006c286154d8b23e16dc7.md', '6d346dfac20006c286154d8b23e16dc7', NULL, NULL, 2, 0);
INSERT INTO `file` VALUES (2, '2021-12-31 21:05:49', 1, 0, NULL, 'upload/20211231/e1d7b755-5676-4b8b-8ea2-8b9e3140c96e.docx', 'e35972d1271045f9956e2a73bf054af8', NULL, NULL, 1, 0);
INSERT INTO `file` VALUES (3, '2021-12-31 23:07:33', 1, 9597, NULL, 'upload/20211231/9aa4f4d963756a598c3ea027d6e38289.md', '9aa4f4d963756a598c3ea027d6e38289', NULL, NULL, 1, 0);
INSERT INTO `file` VALUES (4, '2021-12-31 23:07:56', 1, 11677, NULL, 'upload/20211231/606aa1aa017fcbd41e06572dab9e27e6.md', '606aa1aa017fcbd41e06572dab9e27e6', NULL, NULL, 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `imageId` bigint NOT NULL AUTO_INCREMENT,
  `fileId` bigint DEFAULT NULL,
  `imageHeight` int DEFAULT NULL,
  `imageWidth` int DEFAULT NULL,
  PRIMARY KEY (`imageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of image
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for operationlog
-- ----------------------------
DROP TABLE IF EXISTS `operationlog`;
CREATE TABLE `operationlog` (
  `operationLogId` bigint NOT NULL AUTO_INCREMENT,
  `detail` varchar(255) DEFAULT NULL,
  `logLevel` varchar(255) DEFAULT NULL,
  `operation` varchar(255) DEFAULT NULL,
  `operationObj` varchar(255) DEFAULT NULL,
  `platform` int DEFAULT NULL,
  `result` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `terminal` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `userId` bigint NOT NULL,
  PRIMARY KEY (`operationLogId`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of operationlog
-- ----------------------------
BEGIN;
INSERT INTO `operationlog` VALUES (1, '手机号或密码错误！', NULL, '用户登录', NULL, NULL, '失败', '用户管理', '127.0.0.1', '2021-12-31 21:01:53', 1);
INSERT INTO `operationlog` VALUES (2, '操作成功', NULL, '用户登录', NULL, NULL, '成功', '用户管理', '127.0.0.1', '2021-12-31 21:04:52', 1);
INSERT INTO `operationlog` VALUES (3, '操作成功', NULL, '极速上传', NULL, NULL, '成功', '文件传输接口', '127.0.0.1', '2021-12-31 21:05:06', 1);
INSERT INTO `operationlog` VALUES (4, '操作成功', NULL, '上传文件', NULL, NULL, '成功', '文件传输接口', '127.0.0.1', '2021-12-31 21:05:06', 1);
INSERT INTO `operationlog` VALUES (5, '操作成功', NULL, '创建文件', NULL, NULL, '成功', '文件接口', '127.0.0.1', '2021-12-31 21:05:19', 1);
INSERT INTO `operationlog` VALUES (6, '操作成功', NULL, '创建文件', NULL, NULL, '成功', '文件接口', '127.0.0.1', '2021-12-31 21:05:32', 1);
INSERT INTO `operationlog` VALUES (7, '操作成功', NULL, '用户登录', NULL, NULL, '成功', '用户管理', '127.0.0.1', '2021-12-31 22:38:33', 1);
INSERT INTO `operationlog` VALUES (8, '操作成功', NULL, '用户登录', NULL, NULL, '成功', '用户管理', '127.0.0.1', '2021-12-31 23:02:13', 1);
INSERT INTO `operationlog` VALUES (9, '操作成功', NULL, '极速上传', NULL, NULL, '成功', '文件传输接口', '127.0.0.1', '2021-12-31 23:04:55', 1);
INSERT INTO `operationlog` VALUES (10, '操作成功', NULL, '极速上传', NULL, NULL, '成功', '文件传输接口', '127.0.0.1', '2021-12-31 23:05:19', 1);
INSERT INTO `operationlog` VALUES (11, '操作成功', NULL, '批量删除文件', NULL, NULL, '成功', '文件接口', '127.0.0.1', '2021-12-31 23:06:52', 1);
INSERT INTO `operationlog` VALUES (12, '操作成功', NULL, '极速上传', NULL, NULL, '成功', '文件传输接口', '127.0.0.1', '2021-12-31 23:06:58', 1);
INSERT INTO `operationlog` VALUES (13, '操作成功', NULL, '批量删除文件', NULL, NULL, '成功', '文件接口', '127.0.0.1', '2021-12-31 23:07:25', 1);
INSERT INTO `operationlog` VALUES (14, '操作成功', NULL, '极速上传', NULL, NULL, '成功', '文件传输接口', '127.0.0.1', '2021-12-31 23:07:33', 1);
INSERT INTO `operationlog` VALUES (15, '操作成功', NULL, '上传文件', NULL, NULL, '成功', '文件传输接口', '127.0.0.1', '2021-12-31 23:07:33', 1);
INSERT INTO `operationlog` VALUES (16, '操作成功', NULL, '批量删除文件', NULL, NULL, '成功', '文件接口', '127.0.0.1', '2021-12-31 23:07:48', 1);
INSERT INTO `operationlog` VALUES (17, '操作成功', NULL, '极速上传', NULL, NULL, '成功', '文件传输接口', '127.0.0.1', '2021-12-31 23:07:56', 1);
INSERT INTO `operationlog` VALUES (18, '操作成功', NULL, '上传文件', NULL, NULL, '成功', '文件传输接口', '127.0.0.1', '2021-12-31 23:07:56', 1);
INSERT INTO `operationlog` VALUES (19, '操作成功', NULL, '极速上传', NULL, NULL, '成功', '文件传输接口', '127.0.0.1', '2021-12-31 23:10:33', 1);
INSERT INTO `operationlog` VALUES (20, '操作成功', NULL, '批量删除文件', NULL, NULL, '成功', '文件接口', '127.0.0.1', '2021-12-31 23:14:31', 1);
INSERT INTO `operationlog` VALUES (21, '操作成功', NULL, '极速上传', NULL, NULL, '成功', '文件传输接口', '127.0.0.1', '2021-12-31 23:14:40', 1);
INSERT INTO `operationlog` VALUES (22, '操作成功', NULL, '批量删除回收文件', NULL, NULL, '成功', '回收站文件接口', '127.0.0.1', '2021-12-31 23:16:34', 1);
INSERT INTO `operationlog` VALUES (23, '操作成功', NULL, '批量删除文件', NULL, NULL, '成功', '文件接口', '127.0.0.1', '2021-12-31 23:16:51', 1);
INSERT INTO `operationlog` VALUES (24, '操作成功', NULL, '极速上传', NULL, NULL, '成功', '文件传输接口', '127.0.0.1', '2021-12-31 23:29:55', 1);
INSERT INTO `operationlog` VALUES (25, '操作成功', NULL, '用户登录', NULL, NULL, '成功', '用户管理', '127.0.0.1', '2021-12-31 23:40:41', 1);
INSERT INTO `operationlog` VALUES (26, '操作成功', NULL, '用户登录', NULL, NULL, '成功', '用户管理', '127.0.0.1', '2021-12-31 23:41:45', 1);
INSERT INTO `operationlog` VALUES (27, '操作成功', NULL, '用户登录', NULL, NULL, '成功', '用户管理', '127.0.0.1', '2021-12-31 23:45:38', 1);
INSERT INTO `operationlog` VALUES (28, '操作成功', NULL, '用户登录', NULL, NULL, '成功', '用户管理', '127.0.0.1', '2021-12-31 23:45:53', 1);
INSERT INTO `operationlog` VALUES (29, '操作成功', NULL, '用户登录', NULL, NULL, '成功', '用户管理', '127.0.0.1', '2021-12-31 23:55:05', 1);
INSERT INTO `operationlog` VALUES (30, '操作成功', NULL, '用户登录', NULL, NULL, '成功', '用户管理', '127.0.0.1', '2021-12-31 23:56:23', 1);
INSERT INTO `operationlog` VALUES (31, '操作成功', NULL, '用户登录', NULL, NULL, '成功', '用户管理', '127.0.0.1', '2021-12-31 23:57:05', 1);
INSERT INTO `operationlog` VALUES (32, '操作成功', NULL, '用户登录', NULL, NULL, '成功', '用户管理', '127.0.0.1', '2021-12-31 23:59:20', 1);
INSERT INTO `operationlog` VALUES (33, '操作成功', NULL, '用户登录', NULL, NULL, '成功', '用户管理', '127.0.0.1', '2022-01-01 17:28:54', 1);
COMMIT;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `permissionId` bigint NOT NULL AUTO_INCREMENT,
  `createTime` varchar(255) DEFAULT NULL,
  `createUserId` bigint DEFAULT NULL,
  `modifyTime` varchar(255) DEFAULT NULL,
  `modifyUserId` bigint DEFAULT NULL,
  `orderNum` int DEFAULT NULL,
  `parentId` bigint DEFAULT NULL,
  `permissionCode` varchar(255) DEFAULT NULL,
  `permissionName` varchar(255) DEFAULT NULL,
  `resourceType` int DEFAULT NULL,
  PRIMARY KEY (`permissionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of permission
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for recoveryfile
-- ----------------------------
DROP TABLE IF EXISTS `recoveryfile`;
CREATE TABLE `recoveryfile` (
  `recoveryFileId` bigint NOT NULL AUTO_INCREMENT,
  `deleteBatchNum` varchar(50) DEFAULT NULL,
  `deleteTime` varchar(25) DEFAULT NULL,
  `userFileId` bigint DEFAULT NULL,
  PRIMARY KEY (`recoveryFileId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of recoveryfile
-- ----------------------------
BEGIN;
INSERT INTO `recoveryfile` VALUES (5, 'fea4e3bc-18c0-4c90-804a-991ac25decdf', '2021-12-31 23:16:51', 10);
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `roleId` bigint NOT NULL AUTO_INCREMENT,
  `available` int DEFAULT NULL,
  `createTime` varchar(255) DEFAULT NULL,
  `createUserId` bigint DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `modifyTime` varchar(255) DEFAULT NULL,
  `modifyUserId` bigint DEFAULT NULL,
  `roleName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO `role` VALUES (1, 1, NULL, NULL, '超级管理员', '2021-11-10 20:46:06', NULL, '超级管理员');
INSERT INTO `role` VALUES (2, 1, NULL, NULL, '普通用户', NULL, NULL, '普通用户');
COMMIT;

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `roleid` bigint NOT NULL,
  `permissionid` bigint NOT NULL,
  KEY `FK9vqqf9ycmck1ky2ltg74cgvnk` (`permissionid`),
  KEY `FKppv6whyg3nm3h21k62fwuepjg` (`roleid`),
  CONSTRAINT `FK9vqqf9ycmck1ky2ltg74cgvnk` FOREIGN KEY (`permissionid`) REFERENCES `permission` (`permissionId`),
  CONSTRAINT `FKppv6whyg3nm3h21k62fwuepjg` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for share
-- ----------------------------
DROP TABLE IF EXISTS `share`;
CREATE TABLE `share` (
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

-- ----------------------------
-- Records of share
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sharefile
-- ----------------------------
DROP TABLE IF EXISTS `sharefile`;
CREATE TABLE `sharefile` (
  `shareFileId` bigint NOT NULL AUTO_INCREMENT,
  `shareBatchNum` varchar(255) DEFAULT NULL,
  `shareFilePath` varchar(255) DEFAULT NULL,
  `userFileId` bigint DEFAULT NULL,
  PRIMARY KEY (`shareFileId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sharefile
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for storage
-- ----------------------------
DROP TABLE IF EXISTS `storage`;
CREATE TABLE `storage` (
  `storageId` bigint NOT NULL AUTO_INCREMENT,
  `modifyTime` varchar(25) DEFAULT NULL COMMENT '修改时间',
  `modifyUserId` bigint DEFAULT NULL COMMENT '修改用户id',
  `storageSize` bigint DEFAULT NULL,
  `totalStorageSize` bigint DEFAULT NULL,
  `userId` bigint DEFAULT NULL,
  PRIMARY KEY (`storageId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of storage
-- ----------------------------
BEGIN;
INSERT INTO `storage` VALUES (1, NULL, NULL, NULL, 1024, 1);
COMMIT;

-- ----------------------------
-- Table structure for sysparam
-- ----------------------------
DROP TABLE IF EXISTS `sysparam`;
CREATE TABLE `sysparam` (
  `sysParamId` bigint NOT NULL AUTO_INCREMENT,
  `sysParamDesc` varchar(50) DEFAULT NULL,
  `sysParamKey` varchar(50) DEFAULT NULL,
  `sysParamValue` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sysParamId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sysparam
-- ----------------------------
BEGIN;
INSERT INTO `sysparam` VALUES (1, '总存储大小（单位M）', 'totalStorageSize', '1024');
COMMIT;

-- ----------------------------
-- Table structure for uploadtask
-- ----------------------------
DROP TABLE IF EXISTS `uploadtask`;
CREATE TABLE `uploadtask` (
  `uploadTaskId` bigint NOT NULL AUTO_INCREMENT,
  `extendName` varchar(100) DEFAULT NULL,
  `fileName` varchar(100) DEFAULT NULL,
  `filePath` varchar(500) DEFAULT NULL,
  `identifier` varchar(32) DEFAULT NULL,
  `uploadStatus` int DEFAULT NULL,
  `uploadTime` varchar(25) DEFAULT NULL,
  `userId` bigint DEFAULT NULL,
  PRIMARY KEY (`uploadTaskId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of uploadtask
-- ----------------------------
BEGIN;
INSERT INTO `uploadtask` VALUES (1, NULL, 'chinese.resume.md', '/', '6d346dfac20006c286154d8b23e16dc7', 1, '2021-12-31 21:05:05', 1);
INSERT INTO `uploadtask` VALUES (2, NULL, 'english.resume.md', '/test\n/test/', '9aa4f4d963756a598c3ea027d6e38289', 1, '2021-12-31 23:07:33', 1);
INSERT INTO `uploadtask` VALUES (3, NULL, 'japanese.resume.md', '/', '606aa1aa017fcbd41e06572dab9e27e6', 1, '2021-12-31 23:07:56', 1);
COMMIT;

-- ----------------------------
-- Table structure for uploadtaskdetail
-- ----------------------------
DROP TABLE IF EXISTS `uploadtaskdetail`;
CREATE TABLE `uploadtaskdetail` (
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

-- ----------------------------
-- Records of uploadtaskdetail
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` bigint NOT NULL AUTO_INCREMENT,
  `addrArea` varchar(10) DEFAULT NULL,
  `addrCity` varchar(10) DEFAULT NULL,
  `addrProvince` varchar(10) DEFAULT NULL,
  `available` int DEFAULT NULL,
  `birthday` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `imageUrl` varchar(100) DEFAULT NULL,
  `industry` varchar(50) DEFAULT NULL,
  `intro` varchar(5000) DEFAULT NULL,
  `lastLoginTime` varchar(255) DEFAULT NULL,
  `modifyTime` varchar(255) DEFAULT NULL,
  `modifyUserId` bigint DEFAULT NULL,
  `openId` varchar(30) DEFAULT NULL,
  `password` varchar(35) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `qqPassword` varchar(35) DEFAULT NULL,
  `realname` varchar(30) DEFAULT NULL,
  `registerTime` varchar(30) DEFAULT NULL,
  `salt` varchar(20) DEFAULT NULL,
  `sex` varchar(3) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `openIdIndex` (`openId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'df655ad8d3229f3269fad2a8bab59b6c', NULL, NULL, NULL, NULL, 'admin', NULL, 'admin', 'admin');
COMMIT;

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `userId` bigint NOT NULL,
  `roleid` bigint NOT NULL,
  KEY `FKbo5ik0bthje7hum554xb17ry6` (`roleid`),
  KEY `FKj5g46wgmq1wmqfhv78g7cxaqe` (`userId`),
  CONSTRAINT `FKbo5ik0bthje7hum554xb17ry6` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleId`),
  CONSTRAINT `FKj5g46wgmq1wmqfhv78g7cxaqe` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_role
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for userfile
-- ----------------------------
DROP TABLE IF EXISTS `userfile`;
CREATE TABLE `userfile` (
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of userfile
-- ----------------------------
BEGIN;
INSERT INTO `userfile` VALUES (2, NULL, 0, NULL, NULL, NULL, 'test\n', '/', 1, '2021-12-31 21:05:19', 1);
INSERT INTO `userfile` VALUES (3, NULL, 0, NULL, NULL, NULL, 'test', '/test\n/', 1, '2021-12-31 21:05:32', 1);
INSERT INTO `userfile` VALUES (4, NULL, 0, NULL, 'docx', 2, 'test', '/test\n/test/', 0, '2021-12-31 21:05:49', 1);
INSERT INTO `userfile` VALUES (7, NULL, 0, NULL, 'md', 3, 'english.resume', '/test\n/test/', 0, '2021-12-31 23:07:33', 1);
INSERT INTO `userfile` VALUES (8, NULL, 0, NULL, 'md', 4, 'japanese.resume', '/', 0, '2021-12-31 23:07:56', 1);
INSERT INTO `userfile` VALUES (10, 'fea4e3bc-18c0-4c90-804a-991ac25decdf', 545008, '2021-12-31 23:16:51', 'md', 1, 'chinese.resume', '/', 0, '2021-12-31 23:14:40', 1);
INSERT INTO `userfile` VALUES (11, NULL, 0, NULL, 'md', 1, 'chinese.resume', '/', 0, '2021-12-31 23:29:55', 1);
COMMIT;

-- ----------------------------
-- Table structure for userlogininfo
-- ----------------------------
DROP TABLE IF EXISTS `userlogininfo`;
CREATE TABLE `userlogininfo` (
  `userLoginId` bigint NOT NULL AUTO_INCREMENT,
  `userId` bigint DEFAULT NULL,
  `userloginDate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userLoginId`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of userlogininfo
-- ----------------------------
BEGIN;
INSERT INTO `userlogininfo` VALUES (104, 1, '2021-12-31 23:59:20');
INSERT INTO `userlogininfo` VALUES (105, 1, '2022-01-01 17:28:54');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
