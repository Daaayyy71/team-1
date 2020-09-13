/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100413
 Source Host           : localhost:3306
 Source Schema         : w227

 Target Server Type    : MySQL
 Target Server Version : 100413
 File Encoding         : 65001

 Date: 13/09/2020 23:30:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for hometable
-- ----------------------------
DROP TABLE IF EXISTS `hometable`;
CREATE TABLE `hometable`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `emli` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1',
  `time` timestamp(0) NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of hometable
-- ----------------------------
INSERT INTO `hometable` VALUES (1, 'admin', '123456', '18244463261', 'www.894905469@qq.com', 'Giao', 'images/giao.jpg', '1', '2020-09-13 00:00:00');
INSERT INTO `hometable` VALUES (2, '894905469', '123456', '18244463261', 'www.894905469@qq.com', '药水哥', 'images/yaoshui.jpg', '1', '2020-09-13 00:00:00');
INSERT INTO `hometable` VALUES (3, '894905469', '123456', '18244463261', 'www.894905469@qq.com', '药水哥', 'images/yaoshui.jpg', '1', '2020-09-13 00:00:00');
INSERT INTO `hometable` VALUES (4, '894905469', '123456', '18244463261', 'www.894905469@qq.com', '药水哥', 'images/yaoshui.jpg', '1', '2020-09-13 00:00:00');
INSERT INTO `hometable` VALUES (5, '894905469', '123456', '18244463261', 'www.894905469@qq.com', '药水哥', 'images/yaoshui.jpg', '1', '2020-09-13 00:00:00');
INSERT INTO `hometable` VALUES (6, '123456', NULL, '13548452252', '1321321231', 'yahu', NULL, '1', NULL);
INSERT INTO `hometable` VALUES (7, '123456', NULL, '18244463261', '123456789', 'giaogaio', NULL, '1', NULL);
INSERT INTO `hometable` VALUES (8, '123556', NULL, '18244463261', '123123213', '123455', NULL, '1', NULL);
INSERT INTO `hometable` VALUES (9, '123556', NULL, '18244463261', '123123213', '123455', NULL, '1', NULL);
INSERT INTO `hometable` VALUES (10, '12312321', NULL, '1232131232', '21321312', '12312321', NULL, '1', NULL);
INSERT INTO `hometable` VALUES (11, '3213123', NULL, '2132132', '12312312', '1231231', NULL, '1', NULL);
INSERT INTO `hometable` VALUES (12, '1235435', NULL, '123213123', '1231232131', '123456789', NULL, '1', NULL);
INSERT INTO `hometable` VALUES (13, '32132', NULL, '213213', '312312', '12321', NULL, '1', '2020-09-13 20:04:56');
INSERT INTO `hometable` VALUES (14, '1', NULL, '1', '1', '1', NULL, '1', '2020-09-13 20:05:40');
INSERT INTO `hometable` VALUES (15, '12', NULL, '12', '12', '12', NULL, '1', '2020-09-13 20:05:51');
INSERT INTO `hometable` VALUES (16, '12', NULL, '12', '12', '12', NULL, '1', '2020-09-13 20:06:13');
INSERT INTO `hometable` VALUES (17, '1', NULL, '1', '1', '1', NULL, '1', '2020-09-13 20:07:20');
INSERT INTO `hometable` VALUES (18, '12', NULL, '21', '12', '12', NULL, '1', '2020-09-13 20:07:51');
INSERT INTO `hometable` VALUES (19, '1', NULL, '1', '1', '1', NULL, '1', '2020-09-13 20:11:22');
INSERT INTO `hometable` VALUES (20, '1', NULL, '1', '1', '1', NULL, '1', '2020-09-13 20:11:53');
INSERT INTO `hometable` VALUES (21, '1', NULL, '1', '1', '1', NULL, '1', '2020-09-13 20:11:59');
INSERT INTO `hometable` VALUES (22, '1', NULL, '1', '1', '1', NULL, '1', '2020-09-13 20:12:38');
INSERT INTO `hometable` VALUES (23, '1', NULL, '1', '1', '2', NULL, '1', '2020-09-13 20:12:56');
INSERT INTO `hometable` VALUES (24, '1', NULL, '1', '1', '2', NULL, '1', '2020-09-13 20:13:03');
INSERT INTO `hometable` VALUES (25, '2', NULL, '2', '2', '2', NULL, '1', '2020-09-13 20:13:32');
INSERT INTO `hometable` VALUES (26, '2', NULL, '2', '2', '2', NULL, '1', '2020-09-13 20:13:41');
INSERT INTO `hometable` VALUES (27, '3', NULL, '3', '3', '2', NULL, '1', '2020-09-13 20:16:32');
INSERT INTO `hometable` VALUES (28, '3', NULL, '3', '3', '2', NULL, '1', '2020-09-13 20:17:06');
INSERT INTO `hometable` VALUES (29, '', NULL, '', '', '', NULL, '1', '2020-09-13 20:25:59');
INSERT INTO `hometable` VALUES (30, '123', NULL, '123', '123', '123', NULL, '1', '2020-09-13 20:26:22');
INSERT INTO `hometable` VALUES (31, '9', NULL, '9', '9', '9', NULL, '1', '2020-09-13 20:26:45');
INSERT INTO `hometable` VALUES (32, '1', NULL, '1', '1', '1', NULL, '1', '2020-09-13 20:30:33');
INSERT INTO `hometable` VALUES (33, '1', NULL, '1', '1', '1', NULL, '0', '2020-09-13 20:32:08');
INSERT INTO `hometable` VALUES (34, '1', NULL, '1', '1', '1', NULL, '0', '2020-09-13 20:33:48');
INSERT INTO `hometable` VALUES (35, '19', NULL, '19', '19', '9', NULL, '0', '2020-09-13 20:34:00');
INSERT INTO `hometable` VALUES (36, '1121', NULL, '··', '··', '啊啊大', NULL, '0', '2020-09-13 20:46:06');
INSERT INTO `hometable` VALUES (37, '1', NULL, '1', '1', '秀秀', NULL, '0', '2020-09-13 20:47:05');
INSERT INTO `hometable` VALUES (38, '2', NULL, '2', '2', '2', NULL, '1', '2020-09-13 20:59:35');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `emli` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123456', '18244463261', 'www.894905469@qq.com', 'Giao', 'images/giao.jpg');
INSERT INTO `user` VALUES (2, '894905469', '123456', '18244463261', 'www.894905469@qq.com', '药水哥', 'images/yaoshui.jpg');

SET FOREIGN_KEY_CHECKS = 1;
