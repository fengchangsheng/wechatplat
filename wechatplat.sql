/*
Navicat MySQL Data Transfer

Source Server         : fcs
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : wechatplat

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2016-01-29 16:55:48
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
-- Table structure for manage_menutree
-- ----------------------------
DROP TABLE IF EXISTS `manage_menutree`;
CREATE TABLE `manage_menutree` (
  `id` varchar(36) NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  `iconCls` varchar(255) DEFAULT NULL,
  `checked` int(2) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `parentId` varchar(36) DEFAULT NULL,
  `enabled` int(2) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manage_menutree
-- ----------------------------
INSERT INTO `manage_menutree` VALUES ('2', '菜单管理', null, null, null, null, '0', '2016-01-27 15:14:30', null, null);
INSERT INTO `manage_menutree` VALUES ('21', '菜单列表', null, null, '/menu/toMenuList', '2', '0', '2016-01-27 15:14:30', null, null);
INSERT INTO `manage_menutree` VALUES ('3', '用户管理', null, null, '', null, '0', '2016-01-27 15:14:30', null, null);
INSERT INTO `manage_menutree` VALUES ('31', '基本信息', null, null, '/oper/toUserList', '3', '0', '2016-01-27 15:14:30', null, null);
INSERT INTO `manage_menutree` VALUES ('32', '用户操作', null, null, 'l', '3', '0', '2016-01-27 15:14:30', null, null);
INSERT INTO `manage_menutree` VALUES ('33', '角色管理', null, null, '', '3', '0', '2016-01-27 15:14:30', null, null);
INSERT INTO `manage_menutree` VALUES ('331', '角色列表', null, null, 'rolelist', '33', '0', '2016-01-27 15:14:30', null, null);
INSERT INTO `manage_menutree` VALUES ('4', '内训管理', null, null, null, null, '0', '2016-01-27 15:14:30', null, null);
INSERT INTO `manage_menutree` VALUES ('41', '内训信息', null, null, 'f', '4', '0', '2016-01-27 15:14:30', null, null);
INSERT INTO `manage_menutree` VALUES ('42', '内训操作', null, null, 'g', '4', '0', '2016-01-27 15:14:30', null, null);
INSERT INTO `manage_menutree` VALUES ('5', '外派管理', null, null, null, null, '0', '2016-01-27 15:14:30', null, null);
INSERT INTO `manage_menutree` VALUES ('51', '外派信息', null, null, 's', '5', '0', '2016-01-27 15:14:30', null, null);
INSERT INTO `manage_menutree` VALUES ('52', '外派操作', null, null, 'h', '5', '0', '2016-01-27 15:14:30', null, null);
INSERT INTO `manage_menutree` VALUES ('6', '问卷管理', null, null, null, null, '0', '2016-01-27 15:14:30', null, null);
INSERT INTO `manage_menutree` VALUES ('61', '问卷信息', null, null, 'hh', '6', '0', '2016-01-27 15:14:30', null, null);
INSERT INTO `manage_menutree` VALUES ('62', '问卷操作', null, null, 'kk', '6', '0', '2016-01-27 15:14:30', null, null);
INSERT INTO `manage_menutree` VALUES ('7', '试卷管理', null, null, null, null, '0', '2016-01-27 15:14:30', null, null);
INSERT INTO `manage_menutree` VALUES ('71', '试卷信息', null, null, 'll', '7', '0', '2016-01-27 15:14:30', null, null);
INSERT INTO `manage_menutree` VALUES ('71a32da4-6f86-4716-9567-3e07f4be37d0', '菜单测哈', null, null, 'test222', '2', '0', '2016-01-28 15:47:35', '2016-01-28 16:16:42', null);
INSERT INTO `manage_menutree` VALUES ('72', '试卷操作', null, null, 'ss', '7', '0', '2016-01-27 15:14:30', null, null);
INSERT INTO `manage_menutree` VALUES ('c8429d90-3dfc-4050-a04b-08f4c1c30967', '菜单哈哈', null, null, 'hsh', '2', '1', '2016-01-28 14:20:03', '2016-01-28 14:44:48', null);

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
