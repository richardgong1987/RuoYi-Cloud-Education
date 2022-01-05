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
CREATE TABLE `file_file`
(
    `fileId`       BIGINT NOT NULL AUTO_INCREMENT,
    `createTime`   VARCHAR(25)  DEFAULT NULL,
    `createUserId` BIGINT       DEFAULT NULL,
    `fileSize`     BIGINT       DEFAULT NULL,
    `fileStatus`   INT          DEFAULT NULL,
    `fileUrl`      VARCHAR(500) DEFAULT NULL,
    `identifier`   VARCHAR(32)  DEFAULT NULL,
    `modifyTime`   VARCHAR(25)  DEFAULT NULL,
    `modifyUserId` BIGINT       DEFAULT NULL,
    `pointCount`   INT          DEFAULT NULL,
    `storageType`  INT          DEFAULT NULL,
    PRIMARY KEY (`fileId`)
) ENGINE = InnoDB;

-- ----------------------------
-- Records of file_file
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for file_image
-- ----------------------------
DROP TABLE IF EXISTS `file_image`;
CREATE TABLE `file_image`
(
    `imageId`     BIGINT NOT NULL AUTO_INCREMENT,
    `fileId`      BIGINT DEFAULT NULL,
    `imageHeight` INT    DEFAULT NULL,
    `imageWidth`  INT    DEFAULT NULL,
    PRIMARY KEY (`imageId`)
) ENGINE = InnoDB;

-- ----------------------------
-- Records of file_image
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for file_recoveryfile
-- ----------------------------
DROP TABLE IF EXISTS `file_recoveryfile`;
CREATE TABLE `file_recoveryfile`
(
    `recoveryFileId` BIGINT NOT NULL AUTO_INCREMENT,
    `deleteBatchNum` VARCHAR(50) DEFAULT NULL,
    `deleteTime`     VARCHAR(25) DEFAULT NULL,
    `userFileId`     BIGINT      DEFAULT NULL,
    PRIMARY KEY (`recoveryFileId`)
) ENGINE = InnoDB;

-- ----------------------------
-- Records of file_recoveryfile
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for file_share
-- ----------------------------
DROP TABLE IF EXISTS `file_share`;
CREATE TABLE `file_share`
(
    `shareId`        BIGINT NOT NULL AUTO_INCREMENT,
    `endTime`        VARCHAR(255) DEFAULT NULL,
    `extractionCode` VARCHAR(255) DEFAULT NULL,
    `shareBatchNum`  VARCHAR(255) DEFAULT NULL,
    `shareStatus`    INT          DEFAULT NULL,
    `shareTime`      VARCHAR(255) DEFAULT NULL,
    `shareType`      INT          DEFAULT NULL,
    `userId`         BIGINT       DEFAULT NULL,
    PRIMARY KEY (`shareId`)
) ENGINE = InnoDB;

-- ----------------------------
-- Records of file_share
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for file_sharefile
-- ----------------------------
DROP TABLE IF EXISTS `file_sharefile`;
CREATE TABLE `file_sharefile`
(
    `shareFileId`   BIGINT NOT NULL AUTO_INCREMENT,
    `shareBatchNum` VARCHAR(255) DEFAULT NULL,
    `shareFilePath` VARCHAR(255) DEFAULT NULL,
    `userFileId`    BIGINT       DEFAULT NULL,
    PRIMARY KEY (`shareFileId`)
) ENGINE = InnoDB;

-- ----------------------------
-- Records of file_sharefile
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for file_storage
-- ----------------------------
DROP TABLE IF EXISTS `file_storage`;
CREATE TABLE `file_storage`
(
    `storageId`        BIGINT NOT NULL AUTO_INCREMENT,
    `modifyTime`       VARCHAR(25) DEFAULT NULL COMMENT '修改时间',
    `modifyUserId`     BIGINT      DEFAULT NULL COMMENT '修改用户id',
    `storageSize`      BIGINT      DEFAULT NULL,
    `totalStorageSize` BIGINT      DEFAULT NULL,
    `userId`           BIGINT      DEFAULT NULL,
    PRIMARY KEY (`storageId`)
) ENGINE = InnoDB;

-- ----------------------------
-- Records of file_storage
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for file_sysparam
-- ----------------------------
DROP TABLE IF EXISTS `file_sysparam`;
CREATE TABLE `file_sysparam`
(
    `sysParamId`    BIGINT NOT NULL AUTO_INCREMENT,
    `sysParamDesc`  VARCHAR(50) DEFAULT NULL,
    `sysParamKey`   VARCHAR(50) DEFAULT NULL,
    `sysParamValue` VARCHAR(50) DEFAULT NULL,
    PRIMARY KEY (`sysParamId`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 2;

-- ----------------------------
-- Records of file_sysparam
-- ----------------------------
BEGIN;
INSERT INTO `file_sysparam`
VALUES (1, '总存储大小（单位M）', 'totalStorageSize', '1024');
COMMIT;

-- ----------------------------
-- Table structure for file_uploadtask
-- ----------------------------
DROP TABLE IF EXISTS `file_uploadtask`;
CREATE TABLE `file_uploadtask`
(
    `uploadTaskId` BIGINT NOT NULL AUTO_INCREMENT,
    `extendName`   VARCHAR(100) DEFAULT NULL,
    `fileName`     VARCHAR(100) DEFAULT NULL,
    `filePath`     VARCHAR(500) DEFAULT NULL,
    `identifier`   VARCHAR(32)  DEFAULT NULL,
    `uploadStatus` INT          DEFAULT NULL,
    `uploadTime`   VARCHAR(25)  DEFAULT NULL,
    `userId`       BIGINT       DEFAULT NULL,
    PRIMARY KEY (`uploadTaskId`)
) ENGINE = InnoDB;

-- ----------------------------
-- Records of file_uploadtask
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for file_uploadtaskdetail
-- ----------------------------
DROP TABLE IF EXISTS `file_uploadtaskdetail`;
CREATE TABLE `file_uploadtaskdetail`
(
    `uploadTaskDetailId` BIGINT NOT NULL AUTO_INCREMENT,
    `chunkNumber`        INT          DEFAULT NULL,
    `chunkSize`          BIGINT       DEFAULT NULL,
    `filePath`           VARCHAR(500) DEFAULT NULL,
    `filename`           VARCHAR(100) DEFAULT NULL,
    `identifier`         VARCHAR(32)  DEFAULT NULL,
    `relativePath`       VARCHAR(500) DEFAULT NULL,
    `totalChunks`        INT          DEFAULT NULL,
    `totalSize`          BIGINT       DEFAULT NULL,
    PRIMARY KEY (`uploadTaskDetailId`)
) ENGINE = InnoDB;

-- ----------------------------
-- Records of file_uploadtaskdetail
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for file_userfile
-- ----------------------------
DROP TABLE IF EXISTS `file_userfile`;
CREATE TABLE `file_userfile`
(
    `userFileId`     BIGINT NOT NULL AUTO_INCREMENT,
    `deleteBatchNum` VARCHAR(50)  DEFAULT NULL,
    `deleteFlag`     INT          DEFAULT NULL,
    `deleteTime`     VARCHAR(25)  DEFAULT NULL,
    `extendName`     VARCHAR(100) DEFAULT NULL,
    `fileId`         BIGINT       DEFAULT NULL,
    `fileName`       VARCHAR(100) DEFAULT NULL,
    `filePath`       VARCHAR(500) DEFAULT NULL,
    `isDir`          INT          DEFAULT NULL,
    `uploadTime`     VARCHAR(25)  DEFAULT NULL,
    `userId`         BIGINT       DEFAULT NULL,
    PRIMARY KEY (`userFileId`),
    UNIQUE KEY `fileindex` (`fileName`, `filePath`, `extendName`, `deleteFlag`, `userId`)
) ENGINE = InnoDB;

-- ----------------------------
-- Records of file_userfile
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
