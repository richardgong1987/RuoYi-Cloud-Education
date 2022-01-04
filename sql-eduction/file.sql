/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : ry-cloud

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 04/01/2022 18:01:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for file_file
-- ----------------------------
DROP TABLE IF EXISTS `file_file`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of file_file
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for file_image
-- ----------------------------
DROP TABLE IF EXISTS `file_image`;
CREATE TABLE `file_image` (
  `imageId` bigint NOT NULL AUTO_INCREMENT,
  `fileId` bigint DEFAULT NULL,
  `imageHeight` int DEFAULT NULL,
  `imageWidth` int DEFAULT NULL,
  PRIMARY KEY (`imageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of file_image
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for file_recoveryfile
-- ----------------------------
DROP TABLE IF EXISTS `file_recoveryfile`;
CREATE TABLE `file_recoveryfile` (
  `recoveryFileId` bigint NOT NULL AUTO_INCREMENT,
  `deleteBatchNum` varchar(50) DEFAULT NULL,
  `deleteTime` varchar(25) DEFAULT NULL,
  `userFileId` bigint DEFAULT NULL,
  PRIMARY KEY (`recoveryFileId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of file_recoveryfile
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for file_share
-- ----------------------------
DROP TABLE IF EXISTS `file_share`;
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

-- ----------------------------
-- Records of file_share
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for file_sharefile
-- ----------------------------
DROP TABLE IF EXISTS `file_sharefile`;
CREATE TABLE `file_sharefile` (
  `shareFileId` bigint NOT NULL AUTO_INCREMENT,
  `shareBatchNum` varchar(255) DEFAULT NULL,
  `shareFilePath` varchar(255) DEFAULT NULL,
  `userFileId` bigint DEFAULT NULL,
  PRIMARY KEY (`shareFileId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of file_sharefile
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for file_storage
-- ----------------------------
DROP TABLE IF EXISTS `file_storage`;
CREATE TABLE `file_storage` (
  `storageId` bigint NOT NULL AUTO_INCREMENT,
  `modifyTime` varchar(25) DEFAULT NULL COMMENT '修改时间',
  `modifyUserId` bigint DEFAULT NULL COMMENT '修改用户id',
  `storageSize` bigint DEFAULT NULL,
  `totalStorageSize` bigint DEFAULT NULL,
  `userId` bigint DEFAULT NULL,
  PRIMARY KEY (`storageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of file_storage
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for file_sysparam
-- ----------------------------
DROP TABLE IF EXISTS `file_sysparam`;
CREATE TABLE `file_sysparam` (
  `sysParamId` bigint NOT NULL AUTO_INCREMENT,
  `sysParamDesc` varchar(50) DEFAULT NULL,
  `sysParamKey` varchar(50) DEFAULT NULL,
  `sysParamValue` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sysParamId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of file_sysparam
-- ----------------------------
BEGIN;
INSERT INTO `file_sysparam` VALUES (1, '总存储大小（单位M）', 'totalStorageSize', '1024');
COMMIT;

-- ----------------------------
-- Table structure for file_uploadtask
-- ----------------------------
DROP TABLE IF EXISTS `file_uploadtask`;
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

-- ----------------------------
-- Records of file_uploadtask
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for file_uploadtaskdetail
-- ----------------------------
DROP TABLE IF EXISTS `file_uploadtaskdetail`;
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

-- ----------------------------
-- Records of file_uploadtaskdetail
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for file_userfile
-- ----------------------------
DROP TABLE IF EXISTS `file_userfile`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of file_userfile
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
