/*
Navicat MySQL Data Transfer

Source Server         : fcs
Source Server Version : 50621
Source Host           : 127.0.0.1:3306
Source Database       : wechatplat

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2016-05-08 23:31:22
*/

SET FOREIGN_KEY_CHECKS=0;

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
INSERT INTO `menutree` VALUES ('31', '基本信息', null, null, '/admin/list', '3', '1', '2016-01-27 15:14:30', null, null, '4');
INSERT INTO `menutree` VALUES ('32', '角色管理', null, null, '/role/index', '3', '1', '2016-01-27 15:14:30', null, null, '5');
INSERT INTO `menutree` VALUES ('33', '权限管理', null, null, '/per/index', '3', '1', '2016-01-27 15:14:30', null, null, '6');
INSERT INTO `menutree` VALUES ('4', '用户管理', null, null, '', '0', '1', '2016-04-25 14:38:09', null, null, '7');
INSERT INTO `menutree` VALUES ('41', '用户列表', null, null, 'weuser/index', '4', '1', '2016-04-25 14:38:42', null, null, '8');
INSERT INTO `menutree` VALUES ('42', '用户群组', null, null, 'wegroup/index', '4', '1', '2016-04-25 14:39:07', null, null, '9');
INSERT INTO `menutree` VALUES ('50487476-cb64-407d-b53a-8b8f10cc1e8e', '菜单测试', null, null, '/menu/ceshi', '2', '1', '2016-05-08 00:00:00', null, null, null);
INSERT INTO `menutree` VALUES ('6', '素材管理', null, null, null, '0', '1', '2016-04-27 13:40:59', null, null, '15');
INSERT INTO `menutree` VALUES ('61', '图文消息', null, null, null, '6', '1', '2016-04-27 14:58:50', null, null, '16');
INSERT INTO `menutree` VALUES ('62', '图片管理', null, null, null, '6', '1', '2016-04-27 14:59:33', null, null, '17');
INSERT INTO `menutree` VALUES ('8', '数据统计', null, null, null, '0', '1', '2016-04-27 10:57:51', null, null, '20');
INSERT INTO `menutree` VALUES ('81', '用户分析', null, null, 'westatis/index', '8', '1', '2016-04-27 11:00:05', null, null, '21');
INSERT INTO `menutree` VALUES ('82', '图文分析', null, null, null, '8', '1', '2016-04-27 11:00:08', null, null, '22');
INSERT INTO `menutree` VALUES ('83', '菜单分析', null, null, null, '8', '1', '2016-04-27 11:00:10', null, null, '23');
INSERT INTO `menutree` VALUES ('84', '消息分析', null, null, null, '8', '1', '2016-04-27 11:00:13', null, null, '24');

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
  `id` varchar(36) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `status` int(2) DEFAULT '1' COMMENT '是否开启',
  `email` varchar(30) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  `enabled` int(2) DEFAULT '1',
  `sex` int(1) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', 'Lucare', '1', '1', 'fengchangsheng123@qq.com', '2016-05-01 22:55:26', null, '1', '1', '15507529497');
INSERT INTO `user_info` VALUES ('2', 'debbie', '2', '1', null, null, '2016-05-07 00:00:00', null, '0', null);
INSERT INTO `user_info` VALUES ('3f77c402-4f21-4039-b25a-afa4948b2383', 'joe', null, '0', 'joe@qq.com', '2016-05-07 00:00:00', '2016-05-07 00:00:00', '1', '1', '15598765432');
INSERT INTO `user_info` VALUES ('5f3acb03-28a6-4677-bc3b-5ebed8055636', 'test', '2', null, 'saswa@qq.com', '2016-05-07 00:00:00', '2016-05-07 00:00:00', null, '1', '15556326542');
INSERT INTO `user_info` VALUES ('b146fedf-bc98-4013-b382-3c0f5a8b80b5', 'tiger', '6', '1', '', '2016-05-07 00:00:00', '2016-05-07 00:00:00', '1', '1', '');

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
INSERT INTO `user_role` VALUES ('2', '2', '2');
INSERT INTO `user_role` VALUES ('9310feea-1212-482b-95ea-cf74a2da4713', 'b146fedf-bc98-4013-b382-3c0f5a8b80b5', '2');
