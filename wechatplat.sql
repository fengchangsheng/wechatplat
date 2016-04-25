/*
Navicat MySQL Data Transfer

Source Server         : fcs
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : wechatplat

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2016-04-25 18:03:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for course_info
-- ----------------------------
DROP TABLE IF EXISTS `course_info`;
CREATE TABLE `course_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) DEFAULT '',
  `caddress` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_info
-- ----------------------------
INSERT INTO `course_info` VALUES ('1', '数学', '1号楼');
INSERT INTO `course_info` VALUES ('2', '化学', '综合楼');
INSERT INTO `course_info` VALUES ('3', '英语', '外教楼');

-- ----------------------------
-- Table structure for course_user_info
-- ----------------------------
DROP TABLE IF EXISTS `course_user_info`;
CREATE TABLE `course_user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_user_info_ibfk_1` (`cid`),
  KEY `uid` (`uid`),
  CONSTRAINT `course_user_info_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `course_info` (`id`),
  CONSTRAINT `course_user_info_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_user_info
-- ----------------------------
INSERT INTO `course_user_info` VALUES ('1', '1', '1');
INSERT INTO `course_user_info` VALUES ('2', '1', '3');

-- ----------------------------
-- Table structure for menutree
-- ----------------------------
DROP TABLE IF EXISTS `menutree`;
CREATE TABLE `menutree` (
  `id` varchar(36) NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  `iconCls` varchar(255) DEFAULT NULL,
  `checked` int(2) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `parentId` varchar(36) DEFAULT NULL,
  `enabled` int(2) DEFAULT NULL COMMENT '1-存在  0-逻辑删除',
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `sn` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menutree
-- ----------------------------
INSERT INTO `menutree` VALUES ('2', '菜单管理', null, null, null, '0', '1', '2016-01-27 15:14:30', null, null, '1');
INSERT INTO `menutree` VALUES ('21', '菜单列表', null, null, '/per/index', '2', '1', '2016-01-27 15:14:30', null, null, '2');
INSERT INTO `menutree` VALUES ('3', '管理员管理', null, null, '', '0', '1', '2016-01-27 15:14:30', null, null, '3');
INSERT INTO `menutree` VALUES ('31', '基本信息', null, null, '/oper/toUserList', '3', '1', '2016-01-27 15:14:30', null, null, '4');
INSERT INTO `menutree` VALUES ('32', '角色管理', null, null, '/role/index', '3', '1', '2016-01-27 15:14:30', null, null, '5');
INSERT INTO `menutree` VALUES ('33', '权限管理', null, null, '', '3', '1', '2016-01-27 15:14:30', null, null, '6');
INSERT INTO `menutree` VALUES ('4', '用户管理', null, null, '', '0', '1', '2016-04-25 14:38:09', null, null, '7');
INSERT INTO `menutree` VALUES ('41', '用户列表', null, null, 'weuser/index', '4', '1', '2016-04-25 14:38:42', null, null, '8');
INSERT INTO `menutree` VALUES ('42', '用户群组', null, null, 'wegroup/index', '4', '1', '2016-04-25 14:39:07', null, null, '9');

-- ----------------------------
-- Table structure for role_info
-- ----------------------------
DROP TABLE IF EXISTS `role_info`;
CREATE TABLE `role_info` (
  `id` varchar(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `des` varchar(255) DEFAULT NULL,
  `sn` int(2) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  `enabled` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_info
-- ----------------------------
INSERT INTO `role_info` VALUES ('1', '管理员', '整个系统的管理者', '1', null, null, '1');
INSERT INTO `role_info` VALUES ('2', '公司领导', '偶尔来找下感觉', '2', null, null, '1');
INSERT INTO `role_info` VALUES ('3', '小管理员', '部分管理员权限', '3', null, null, '1');

-- ----------------------------
-- Table structure for role_per
-- ----------------------------
DROP TABLE IF EXISTS `role_per`;
CREATE TABLE `role_per` (
  `id` varchar(36) NOT NULL,
  `roleid` varchar(36) DEFAULT NULL,
  `perid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_per
-- ----------------------------
INSERT INTO `role_per` VALUES ('1', '1', '2');
INSERT INTO `role_per` VALUES ('2', '1', '21');
INSERT INTO `role_per` VALUES ('3', '1', '3');
INSERT INTO `role_per` VALUES ('4', '1', '31');
INSERT INTO `role_per` VALUES ('5', '1', '32');
INSERT INTO `role_per` VALUES ('6', '1', '33');
INSERT INTO `role_per` VALUES ('7', '1', '4');
INSERT INTO `role_per` VALUES ('8', '1', '41');
INSERT INTO `role_per` VALUES ('9', '1', '42');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` int(5) NOT NULL,
  `uname` varchar(255) DEFAULT NULL,
  `unumber` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', 'Lucare', '5');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` varchar(36) NOT NULL,
  `userid` varchar(36) DEFAULT NULL,
  `roleid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1', '1');
