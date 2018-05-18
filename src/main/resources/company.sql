/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100300
 Source Host           : localhost:3306
 Source Schema         : company

 Target Server Type    : MySQL
 Target Server Version : 100300
 File Encoding         : 65001

 Date: 18/05/2018 18:17:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `zh` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pwd` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` int(4) NOT NULL,
  `email` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ipone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `adress` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `creat_time` datetime(0) NOT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, '12345@', '张三', '12345', 1, '18883156885m@sina.cn', '18883156885', '重庆', '2018-04-10 19:19:44', '2018-04-22 12:54:05');
INSERT INTO `admin` VALUES (8, '2131231321', '小猫', '123456', 0, '1111@qq.com', '16666666', '重庆', '2018-04-15 20:34:20', '2018-05-01 12:45:13');
INSERT INTO `admin` VALUES (7, 'taotao@buxiw', '保险', '123456', 0, '18883156885m@sina.cn', '18883156885', '重庆', '2018-04-14 15:56:12', '2018-05-02 12:45:18');
INSERT INTO `admin` VALUES (9, 'taotao11', 'ccdd', '12345', 0, '18883156885m@sina.cn', '18883156885', '重庆', '2018-04-15 20:39:27', '2018-05-01 12:45:31');

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `aid` bigint(20) NOT NULL COMMENT '用户id',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地点',
  `reason` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `begin_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for levea
-- ----------------------------
DROP TABLE IF EXISTS `levea`;
CREATE TABLE `levea`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL,
  `title` varchar(300) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `length` int(10) NOT NULL,
  `aid` bigint(20) DEFAULT NULL,
  `reason` varchar(300) CHARACTER SET gbk COLLATE gbk_chinese_ci DEFAULT NULL,
  `create_time` datetime(0) NOT NULL,
  `type` int(10) NOT NULL COMMENT '请假类型 0 已创建 1 以通过 2不通过',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of levea
-- ----------------------------
INSERT INTO `levea` VALUES (1, 10, '我要请假', 3, 1, '可以', '2018-05-21 00:00:00', 1);
INSERT INTO `levea` VALUES (2, 10, '我要请假', 3, 1, '不可以', '2018-05-21 00:00:00', 2);
INSERT INTO `levea` VALUES (3, 10, '我要请假', 3, NULL, NULL, '2018-05-21 00:00:00', 0);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `reason` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `creat_time` date NOT NULL,
  `aid` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (3, '关于绩效考核', '关于绩效考核关于绩效考核关于绩效考核关于绩效考核关于绩效考核关于绩效考核关于绩效考核关于绩效考核关于绩效考核关于绩效考核\r\n                  ', '2018-05-09', 1);
INSERT INTO `notice` VALUES (5, '关于五一放假', '关于五一放假关于五一放假关于五一放假关于五一放假关于五一放假', '2018-05-18', 1);

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `aid` bigint(20) NOT NULL,
  `uid` bigint(20) NOT NULL,
  `title` varchar(300) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `kpi` int(10) NOT NULL,
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for submit
-- ----------------------------
DROP TABLE IF EXISTS `submit`;
CREATE TABLE `submit`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL,
  `title` varchar(300) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `money` int(10) NOT NULL,
  `aid` bigint(20) DEFAULT NULL,
  `reason` varchar(300) CHARACTER SET gbk COLLATE gbk_chinese_ci DEFAULT NULL,
  `create_time` datetime(0) NOT NULL,
  `uplod_time` datetime(0) DEFAULT NULL,
  `type` int(10) NOT NULL COMMENT '报销类型 0 以创建 1 同意报销 2 不同意报销',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of submit
-- ----------------------------
INSERT INTO `submit` VALUES (1, 10, '昨天打车100', 100, 1, '可以', '2018-05-18 11:22:51', '2018-05-18 17:57:33', 1);

-- ----------------------------
-- Table structure for suggest
-- ----------------------------
DROP TABLE IF EXISTS `suggest`;
CREATE TABLE `suggest`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL,
  `title` varchar(300) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `aid` bigint(20) DEFAULT NULL,
  `reason` varchar(300) CHARACTER SET gbk COLLATE gbk_chinese_ci DEFAULT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `stuats` int(10) NOT NULL COMMENT '状态 0 以创建 1 回复',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of suggest
-- ----------------------------
INSERT INTO `suggest` VALUES (1, 10, '双休双休双休双休双休双休双休双休双休双休', 1, '不行', '2018-05-18 11:27:41', '2018-05-18 17:04:10', 1);
INSERT INTO `suggest` VALUES (2, 10, '双休双休双休双休双休双休双休双休双休双休', 1, '还是不行', '2018-05-18 11:38:47', '2018-05-18 17:06:06', 1);
INSERT INTO `suggest` VALUES (3, 10, '双休双休双休双休双休双休双休双休双休双休', NULL, NULL, '2018-05-18 11:39:02', NULL, 0);
INSERT INTO `suggest` VALUES (4, 10, '双休双休双休双休双休双休双休双休双休双休', NULL, NULL, '2018-05-18 11:39:21', NULL, 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `zh` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '签名',
  `pwd` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` int(4) DEFAULT NULL,
  `email` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ipone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `creat_time` datetime(0) NOT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `kpi` int(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '12345678', '吓唬', '哈哈哈哈哈哈哈哈哈哈哈哈哈哈', '123456', 0, '1234567@qq.com', '18883156885', '2018-04-12 22:54:49', '2018-05-04 23:28:00', NULL, 0);
INSERT INTO `user` VALUES (2, '12345678', '哈哈', NULL, '1234567', 0, '123456@qq.com', '18883156885', '2018-04-12 22:57:20', NULL, NULL, 0);
INSERT INTO `user` VALUES (6, '12345', '哈哈', NULL, '123456', 1, '12345@qq.com', '18883156885', '2018-05-06 16:21:51', NULL, NULL, 0);
INSERT INTO `user` VALUES (7, '123456789', '搜索', NULL, '12345678', 1, '12345678@qq.com', '18883156885', '2018-05-06 17:16:05', NULL, NULL, 0);
INSERT INTO `user` VALUES (5, 'tttt', '小混混', NULL, '123456', 1, '123456@qq.com', '18883166885', '2018-05-04 23:11:32', NULL, NULL, 0);
INSERT INTO `user` VALUES (8, 'zxcv12', 'hh', NULL, '123456', 1, '123456@qq.com', '18883156886', '2018-05-06 21:30:08', NULL, NULL, 0);
INSERT INTO `user` VALUES (9, 'tiantao11', 'fuck', NULL, '1234567', 0, '12344567@qq.com', '15696985992', '2018-05-13 19:19:28', NULL, NULL, 0);
INSERT INTO `user` VALUES (10, 'taotao123', '大明湖畔', NULL, '123456', 1, '123456@qq.com', '123456789', '2018-05-18 09:13:02', NULL, 'res/uimg/1526608384814.png', 0);

-- ----------------------------
-- Table structure for work
-- ----------------------------
DROP TABLE IF EXISTS `work`;
CREATE TABLE `work`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL,
  `content` varchar(300) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `aid` bigint(20) DEFAULT NULL,
  `reason` varchar(300) CHARACTER SET gbk COLLATE gbk_chinese_ci DEFAULT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `stuats` int(10) NOT NULL COMMENT '0 以创建 1 回复',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of work
-- ----------------------------
INSERT INTO `work` VALUES (1, 10, '今天拜访5个客户，他们对产品很感兴趣!!!', 1, '加油', '2018-05-18 11:24:55', '2018-05-18 16:34:15', 1);

SET FOREIGN_KEY_CHECKS = 1;
