/*
 Navicat MySQL Data Transfer

 Source Server         : libraryDB
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : lms

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 27/05/2020 12:51:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for announcement
-- ----------------------------
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_account` int(0) NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` datetime(0) NOT NULL,
  `end_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for book_type
-- ----------------------------
DROP TABLE IF EXISTS `book_type`;
CREATE TABLE `book_type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type_index` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `index` int(0) NOT NULL,
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ISBN` int(0) NOT NULL,
  `type_index` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `entry_time` datetime(0) NOT NULL,
  `status` int(0) NOT NULL,
  `publish` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `like` int(0) NOT NULL,
  `locate` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` int(0) NOT NULL,
  `ruin_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for borrow_card
-- ----------------------------
DROP TABLE IF EXISTS `borrow_card`;
CREATE TABLE `borrow_card`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `index` int(0) NOT NULL,
  `user_account` int(0) NOT NULL,
  `start_time` datetime(0) NOT NULL,
  `end_time` datetime(0) NOT NULL,
  `status` int(0) NOT NULL,
  `credit` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for borrow_history
-- ----------------------------
DROP TABLE IF EXISTS `borrow_history`;
CREATE TABLE `borrow_history`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_account` int(0) NOT NULL,
  `start_time` datetime(0) NOT NULL,
  `end_time` datetime(0) NOT NULL,
  `book_index` int(0) NOT NULL,
  `overtime` int(0) NOT NULL,
  `status` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hope
-- ----------------------------
DROP TABLE IF EXISTS `hope`;
CREATE TABLE `hope`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `publish` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_account` int(0) NOT NULL,
  `user_name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` datetime(0) NOT NULL,
  `advice` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for login_log
-- ----------------------------
DROP TABLE IF EXISTS `login_log`;
CREATE TABLE `login_log`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_account` int(0) NOT NULL,
  `ip` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for read_room
-- ----------------------------
DROP TABLE IF EXISTS `read_room`;
CREATE TABLE `read_room`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `index` int(0) NOT NULL,
  `locate` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for status
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `status_index` int(0) NOT NULL,
  `status_name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_account` int(0) NOT NULL,
  `password` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` int(0) NOT NULL,
  `favoicon` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone_number` int(0) NOT NULL,
  `email` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(0) NOT NULL,
  `register_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
