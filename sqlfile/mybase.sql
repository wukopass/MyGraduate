/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : mybase

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 17/07/2019 21:08:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for authority
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `authorityname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pid` int(10) NOT NULL COMMENT '权限的父级id',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '访问的地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of authority
-- ----------------------------
INSERT INTO `authority` VALUES (1, '系统管理', NULL, 0, NULL);
INSERT INTO `authority` VALUES (2, '用户管理', '对用户进行增删改查等操作', 1, '/user.jsp');
INSERT INTO `authority` VALUES (3, '角色管理', '对角色进行增删改查等操作', 1, '/role.jsp');
INSERT INTO `authority` VALUES (4, '权限管理', '对权限进行增删改查等操作', 1, '/authority.jsp');
INSERT INTO `authority` VALUES (5, '邮件管理', '对邮件进行增删改查等操作', 1, '/noteManager.jsp');
INSERT INTO `authority` VALUES (6, 'index:v5', 'vip5查看区', 99, '/vFive.jsp');

-- ----------------------------
-- Table structure for mail
-- ----------------------------
DROP TABLE IF EXISTS `mail`;
CREATE TABLE `mail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isread` int(10) NULL DEFAULT NULL,
  `sendid` int(10) NULL DEFAULT NULL,
  `receiverid` int(10) NULL DEFAULT NULL,
  `createtime` datetime(0) NULL DEFAULT NULL,
  `iseffective` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mail
-- ----------------------------
INSERT INTO `mail` VALUES (1, '测试', '这是心得呼唤', 0, 13, 13, '2019-05-20 20:24:24', 0);
INSERT INTO `mail` VALUES (2, '测试2', '<p><a target=\"_blank\" href=\"https://so.gushiwen.org/mingju/juv_3601d8c59cd6.aspx\">唯愿当歌对酒时，月光长照金樽里。</a>____<a target=\"_blank\" href=\"https://so.gushiwen.org/shiwenv_837510c0a7c4.aspx\">李白《把酒问月·故人贾淳令予问之》</a>&nbsp;&nbsp;<br></p>', 0, 13, 13, '2019-05-21 21:47:14', 0);
INSERT INTO `mail` VALUES (3, '测试3', 'ddddd', 0, 13, 13, '2019-05-21 21:48:54', 0);
INSERT INTO `mail` VALUES (4, '测试4', '<p>今天的天气是真的秀</p>', 0, 13, 13, '2019-05-25 16:17:39', 0);
INSERT INTO `mail` VALUES (5, 'baby', '<p>gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg</p>', 0, 13, 13, '2019-05-25 17:10:36', 0);
INSERT INTO `mail` VALUES (6, 'hello wrrld', '<p>dddddddddddddddddddddddddddddddddddddddd</p>', 0, 13, 13, '2019-05-25 17:27:44', 0);
INSERT INTO `mail` VALUES (7, '我是谁', '<p>方法方法付付付付付付付付付付付付付付付付付付付付付付付付付</p>', 0, 13, 13, '2019-05-26 08:12:57', 0);
INSERT INTO `mail` VALUES (8, '我是谁', '<p>方法方法付付付付付付付付付付付付付付付付付付付付付付付付付</p>', 0, 13, 13, '2019-05-26 08:13:20', 0);
INSERT INTO `mail` VALUES (9, '刘浩牛逼', '<p>这是心得呼唤，这是爱的奉献</p><p><br></p>', 0, 13, 13, '2019-06-03 22:14:50', 0);

-- ----------------------------
-- Table structure for memberuser
-- ----------------------------
DROP TABLE IF EXISTS `memberuser`;
CREATE TABLE `memberuser`  (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tel` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `createtime` datetime(0) NULL DEFAULT NULL,
  `updatetime` datetime(0) NULL DEFAULT NULL,
  `iseffective` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `salt` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of memberuser
-- ----------------------------
INSERT INTO `memberuser` VALUES (1, '小吴', '8ecad5296cac34df2e9747cb8a1f98a8', NULL, NULL, '2010-10-07 00:00:00', '2010-10-12 00:00:00', '0', '7f71023ef72108ac75d9190721ca0e95');
INSERT INTO `memberuser` VALUES (2, '小吴二号', '12443434', '8691512', 'qq@qq.com', NULL, NULL, '0', 'ddddddd');
INSERT INTO `memberuser` VALUES (3, '小吴三号', '12443434', '8691512', 'qq@qq.com', '2019-01-12 12:33:22', NULL, '0', 'ddddddd');
INSERT INTO `memberuser` VALUES (5, 'fadfefa', '0bbbfd556beba3e6e5be0ea0b625b718', '123456', 'wukopass@qq.com', '2019-05-18 00:32:35', '2019-05-18 00:32:35', '0', '吴业全f10d17677a32d6c2370b0d0391788dee');
INSERT INTO `memberuser` VALUES (6, 'fafafa', '727e4feeb4365c5a3e744661fe1d9cf1', '1111', 'ee@qq.com', '2019-05-18 02:24:52', '2019-05-18 02:24:52', '1', 'fafafaaa22db7e521629fdea03cecbd1b64911');
INSERT INTO `memberuser` VALUES (7, 'fdfa', 'd4f3cf78ea45d1569fb03cffb4a118d3', '123213412', 'ss@qq.com', '2019-05-18 02:35:21', '2019-05-18 02:35:21', '0', 'fdfa290a458c6c661b81b60782e7c93f4d0e');
INSERT INTO `memberuser` VALUES (8, 'fanglaoge', '67a380b95c7ac8f584b9b18363de29b5', '134444', 'jj@qq.com', '2019-05-18 02:42:14', '2019-05-18 02:42:14', '1', 'fanglaoge1ca4672ec4fc11645428564e1ef0be98');
INSERT INTO `memberuser` VALUES (9, 'dfaddfafd', '0e527fd6218cf146400428377eb1acd2', '222', '22222', '2019-05-18 03:45:37', '2019-05-18 03:45:37', '1', '等待4c7a0c89910e6fd6a2d60f2f450114d0');
INSERT INTO `memberuser` VALUES (10, 'xiaowu3', '458c4444722f4aeeffa4d4d9a1574e2f', '15797690595', 'wu@qq.com', '2019-05-18 12:23:24', '2019-05-18 12:23:24', '1', 'xiaowu36e1338d98ea0d166a8cad472cd8bcaf3');
INSERT INTO `memberuser` VALUES (11, 'xiaowu4', 'b65a3806ecc8bc2a335b8733e30f83c0', '1379028478', 'hah@qq.com', '2019-05-18 12:25:13', '2019-05-18 12:25:13', '1', 'xiaowu4f934b1902ba33ed74b93258c162ae10d');
INSERT INTO `memberuser` VALUES (12, 'xiaowu5', '3158662f27eb007a25b1ec33e977a48f', '111111', 'dd@ss.com', '2019-05-18 12:41:36', '2019-05-18 12:41:36', '1', 'xiaowu50034d05dadcf8c2fa5106e6accb06032');
INSERT INTO `memberuser` VALUES (13, 'wuyequan', 'bae2f2b0602ab8706594adef17e2a9cf', '13838384381', '1379028478@qq.com', '2019-05-18 13:23:12', '2019-05-18 13:23:12', '1', '49abe6d0fc20d68d62f96b41b1a8be1a');
INSERT INTO `memberuser` VALUES (14, 'fadfafad', '5b92445e92cbb61c38768b707440bcbb', 'fafa', '222', '2019-05-24 12:10:41', '2019-05-24 12:10:41', '1', '6e2ffd768d6c7dd4b5a7efbf674d6016');
INSERT INTO `memberuser` VALUES (15, 'ffafadf', '1954c5fa8aceb341c953f29ba1afbfc4', 'fadfa', 'fafafaf', '2019-05-24 12:10:59', '2019-05-24 12:10:59', '1', '55e8f00a3cebffeba39f021cdb74a62c');
INSERT INTO `memberuser` VALUES (16, 'hello', '8b404c7d6d4840c227232da1a4498732', '8681512', 'happy@qq.com', '2019-05-25 13:40:18', '2019-05-25 13:40:18', '1', '0a697b53ec4f41dbb0ee5ff01f1b34b4');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `roleid` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '管理员', '管理员拥有系统管理的权限,包括用户、角色、权限、邮件的管理');
INSERT INTO `role` VALUES (2, '普通会员', '普通的会员，用户创建的时候就会分配的角色，具有最低的权限，可以收发邮件');
INSERT INTO `role` VALUES (3, 'VI会员', '1级VIP会员,可以查看I级用户才能浏览的页面');
INSERT INTO `role` VALUES (4, 'VII会员', '2级VIP会员，可以查看2级会员及其以下的页面');
INSERT INTO `role` VALUES (5, 'VIII会员', '3级VIP会员，可以查看3级会员及其以下的页面');

-- ----------------------------
-- Table structure for roleauthority
-- ----------------------------
DROP TABLE IF EXISTS `roleauthority`;
CREATE TABLE `roleauthority`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) NULL DEFAULT NULL,
  `authorityid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roleauthority
-- ----------------------------
INSERT INTO `roleauthority` VALUES (1, 1, 1);
INSERT INTO `roleauthority` VALUES (2, 1, 2);
INSERT INTO `roleauthority` VALUES (3, 1, 3);
INSERT INTO `roleauthority` VALUES (4, 1, 4);
INSERT INTO `roleauthority` VALUES (5, 1, 5);
INSERT INTO `roleauthority` VALUES (6, 1, 6);
INSERT INTO `roleauthority` VALUES (7, 2, 1);
INSERT INTO `roleauthority` VALUES (8, 2, 2);
INSERT INTO `roleauthority` VALUES (9, 3, 1);
INSERT INTO `roleauthority` VALUES (10, 3, 4);
INSERT INTO `roleauthority` VALUES (11, 3, 5);

-- ----------------------------
-- Table structure for userrole
-- ----------------------------
DROP TABLE IF EXISTS `userrole`;
CREATE TABLE `userrole`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NULL DEFAULT NULL,
  `roleid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userrole
-- ----------------------------
INSERT INTO `userrole` VALUES (1, 13, 1);
INSERT INTO `userrole` VALUES (2, 13, 2);
INSERT INTO `userrole` VALUES (3, 13, 3);
INSERT INTO `userrole` VALUES (4, 13, 4);
INSERT INTO `userrole` VALUES (5, 13, 5);

SET FOREIGN_KEY_CHECKS = 1;
