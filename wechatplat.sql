﻿/*
Navicat MySQL Data Transfer

Source Server         : fcs
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : wechatplat

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2016-05-30 15:24:03
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
  `type` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menutree
-- ----------------------------
INSERT INTO `menutree` VALUES ('2', '菜单管理', null, null, null, '0', '1', '2016-01-27 15:14:30', null, null, '1', '1');
INSERT INTO `menutree` VALUES ('21', '菜单列表', null, null, '/per/index', '2', '1', '2016-01-27 15:14:30', null, null, '2', '1');
INSERT INTO `menutree` VALUES ('277035f2-abb0-4a20-8390-b1d984505103', '菜单哈哈', null, null, '/menu/hah', '2', '1', '2016-05-26 00:00:00', '2016-05-26 00:00:00', null, null, '1');
INSERT INTO `menutree` VALUES ('3', '管理员管理', null, null, '', '0', '1', '2016-01-27 15:14:30', null, null, '3', '1');
INSERT INTO `menutree` VALUES ('31', '基本信息', null, null, '/admin/list', '3', '1', '2016-01-27 15:14:30', null, null, '4', '1');
INSERT INTO `menutree` VALUES ('311', '管理员添加', null, null, '/admin/add;/admin/toAdd', '31', '1', null, '2016-05-30 00:00:00', null, null, '2');
INSERT INTO `menutree` VALUES ('312', '管理员编辑', null, null, '/admin/edit;/admin/toEdit', '31', '1', null, '2016-05-30 14:20:15', null, null, '2');
INSERT INTO `menutree` VALUES ('313', '管理员删除', null, null, '/admin/delete', '31', '1', null, '2016-05-22 00:00:00', null, null, '2');
INSERT INTO `menutree` VALUES ('32', '角色管理', null, null, '/role/index', '3', '1', '2016-01-27 15:14:30', null, null, '5', '1');
INSERT INTO `menutree` VALUES ('321', '角色添加', null, null, '/role/add;/role/toAdd', '32', '1', null, null, null, null, '2');
INSERT INTO `menutree` VALUES ('322', '角色编辑', null, null, '/role/edit;/role/toEdit', '32', '1', null, null, null, null, '2');
INSERT INTO `menutree` VALUES ('323', '角色删除', null, null, '/role/delete', '32', '1', null, null, null, null, '2');
INSERT INTO `menutree` VALUES ('33', '权限管理', null, null, '/per/index', '3', '1', '2016-01-27 15:14:30', null, null, '6', '1');
INSERT INTO `menutree` VALUES ('4', '用户管理', null, null, '', '0', '1', '2016-04-25 14:38:09', null, null, '7', '1');
INSERT INTO `menutree` VALUES ('41', '用户列表', null, null, '/weuser/index', '4', '1', '2016-04-25 14:38:42', null, null, '8', '1');
INSERT INTO `menutree` VALUES ('42', '用户群组', null, null, '/wegroup/index', '4', '1', '2016-04-25 14:39:07', null, null, '9', '1');
INSERT INTO `menutree` VALUES ('50487476-cb64-407d-b53a-8b8f10cc1e8e', '菜单测试', null, null, '/menu/ceshi', '2', '1', '2016-05-08 00:00:00', null, null, null, '1');
INSERT INTO `menutree` VALUES ('6', '素材管理', null, null, null, '0', '1', '2016-04-27 13:40:59', null, null, '15', '1');
INSERT INTO `menutree` VALUES ('61', '图文消息', null, null, null, '6', '1', '2016-04-27 14:58:50', null, null, '16', '1');
INSERT INTO `menutree` VALUES ('62', '图片管理', null, null, null, '6', '1', '2016-04-27 14:59:33', null, null, '17', '1');
INSERT INTO `menutree` VALUES ('8', '数据统计', null, null, null, '0', '1', '2016-04-27 10:57:51', null, null, '20', '1');
INSERT INTO `menutree` VALUES ('81', '用户分析', null, null, '/westatis/index', '8', '1', '2016-04-27 11:00:05', null, null, '21', '1');
INSERT INTO `menutree` VALUES ('82', '图文分析', null, null, null, '8', '1', '2016-04-27 11:00:08', null, null, '22', '1');
INSERT INTO `menutree` VALUES ('83', '菜单分析', null, null, null, '8', '1', '2016-04-27 11:00:10', null, null, '23', '1');
INSERT INTO `menutree` VALUES ('84', '消息分析', null, null, null, '8', '1', '2016-04-27 11:00:13', null, null, '24', '1');

-- ----------------------------
-- Table structure for oper_record
-- ----------------------------
DROP TABLE IF EXISTS `oper_record`;
CREATE TABLE `oper_record` (
  `id` varchar(36) NOT NULL,
  `operateid` varchar(36) DEFAULT NULL,
  `operater` varchar(255) DEFAULT NULL COMMENT '操作者名',
  `text` varchar(255) DEFAULT NULL,
  `operatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oper_record
-- ----------------------------
INSERT INTO `oper_record` VALUES ('02f21365-aa5c-440e-b24c-4de450c0a7ba', '1', 'Lucare', '编辑管理员', '2016-05-24 14:57:27');
INSERT INTO `oper_record` VALUES ('09a069d0-8dd7-4b53-9307-01352756e9ce', '1', 'Lucare', '添加管理员', '2016-05-25 15:08:18');
INSERT INTO `oper_record` VALUES ('0f299853-0c57-4c5d-950d-83c974faf564', '1', 'Lucare', '编辑管理员', '2016-05-24 14:45:42');
INSERT INTO `oper_record` VALUES ('196f29da-64e8-4e2b-9032-23e37f2bf27d', '1', 'Lucare', '编辑管理员', '2016-05-26 19:46:48');
INSERT INTO `oper_record` VALUES ('1bbaea53-3feb-463b-8309-b5b323d500c0', '1', 'Lucare', '添加管理员', '2016-05-25 15:22:38');
INSERT INTO `oper_record` VALUES ('1c87c894-1cdb-41a9-9420-7711496283a5', '1', 'Lucare', '删除管理员', '2016-05-25 16:31:47');
INSERT INTO `oper_record` VALUES ('210b43d1-9e64-42e0-8781-42016668360e', '1', 'Lucare', '添加管理员', '2016-05-24 14:56:35');
INSERT INTO `oper_record` VALUES ('32ec444e-8e34-4f97-b1bb-f332490ea5fe', '1', 'Lucare', '禁用或启用账号', '2016-05-24 09:07:03');
INSERT INTO `oper_record` VALUES ('348333e4-6326-485c-ad74-b0d0e9aaff2b', '1', 'Lucare', '删除管理员', '2016-05-25 16:31:41');
INSERT INTO `oper_record` VALUES ('3a8ab18d-3377-4772-83a2-cad2a16082dc', '1', 'Lucare', '删除管理员', '2016-05-25 16:31:33');
INSERT INTO `oper_record` VALUES ('42221cf1-b6bf-4921-bd0d-e71f300e750e', '1', 'Lucare', '添加管理员', '2016-05-25 16:31:09');
INSERT INTO `oper_record` VALUES ('429516b5-8666-4d78-b02f-d46502d8e172', '1', 'Lucare', '删除管理员', '2016-05-24 09:08:03');
INSERT INTO `oper_record` VALUES ('434c8f69-f1a6-460e-b643-e250ef06c80c', '1', 'Lucare', '添加管理员', '2016-05-25 14:52:58');
INSERT INTO `oper_record` VALUES ('5095d998-90cc-4a5b-8721-9185e62a7857', '1', 'Lucare', '添加管理员', '2016-05-24 14:17:03');
INSERT INTO `oper_record` VALUES ('518fe918-7576-40fb-8142-ceffe5332d78', '1', 'Lucare', '编辑管理员', '2016-05-24 14:57:13');
INSERT INTO `oper_record` VALUES ('5e1c0bd0-1cd1-4dc2-993f-bc3fe3abcb13', '1', 'Lucare', '删除管理员', '2016-05-30 15:03:57');
INSERT INTO `oper_record` VALUES ('67c362ff-9899-4b82-96d0-a0839f5b926b', '1', 'Lucare', '删除管理员', '2016-05-25 16:31:39');
INSERT INTO `oper_record` VALUES ('78e6dfa7-64ab-446b-addf-325eaed942ba', '1', 'Lucare', '编辑管理员', '2016-05-26 20:48:23');
INSERT INTO `oper_record` VALUES ('7aac2e24-30ca-45c3-b415-14260d5a1e5d', '1', 'Lucare', '删除管理员', '2016-05-25 16:31:36');
INSERT INTO `oper_record` VALUES ('8e339a05-cdd2-4058-b684-afe1469c2361', '1', 'Lucare', '删除管理员', '2016-05-30 15:04:04');
INSERT INTO `oper_record` VALUES ('94c8ec91-4976-4611-a8a1-6413f84c0662', '1', 'Lucare', '删除管理员', '2016-05-24 16:16:08');
INSERT INTO `oper_record` VALUES ('a110426f-3c54-4e3f-a7c6-353548b606e1', '1', 'Lucare', '添加管理员', '2016-05-26 19:40:49');
INSERT INTO `oper_record` VALUES ('a27b7292-35e4-4046-ae94-dbd08b1ac5e8', '1', 'Lucare', '添加管理员', '2016-05-23 21:59:53');
INSERT INTO `oper_record` VALUES ('a5d46860-3790-4c6b-a97f-dc317f4e30c6', '1', 'Lucare', '删除管理员', '2016-05-25 16:31:49');
INSERT INTO `oper_record` VALUES ('a67415af-4403-4f24-8eff-790df7a44d37', '1', 'Lucare', '禁用或启用账号', '2016-05-24 14:17:11');
INSERT INTO `oper_record` VALUES ('aaf0b96b-c9b1-4f09-bc88-83036f00cfca', '1', 'Lucare', '编辑管理员', '2016-05-26 19:46:23');
INSERT INTO `oper_record` VALUES ('aafdf26c-113a-44a4-852b-a4022a599c6f', '1', 'Lucare', '删除管理员', '2016-05-24 09:07:42');
INSERT INTO `oper_record` VALUES ('ac5a9b96-4c23-4508-b4f8-e6874b3a334b', '1', 'Lucare', '编辑管理员', '2016-05-26 19:46:34');
INSERT INTO `oper_record` VALUES ('af045f65-9af1-4924-a2bf-464789742def', '1', 'Lucare', '添加管理员', '2016-05-25 16:32:36');
INSERT INTO `oper_record` VALUES ('b6f95657-72bd-4ec5-a9f5-ad57aeed1e22', '1', 'Lucare', '添加管理员', '2016-05-25 15:03:28');
INSERT INTO `oper_record` VALUES ('b7738496-6b7d-4c11-a60a-16eb9750a100', '1', 'Lucare', '删除管理员', '2016-05-25 16:31:45');
INSERT INTO `oper_record` VALUES ('bc2f23fd-00e4-4d2c-90b1-55c003ca28c0', '1', 'Lucare', '删除管理员', '2016-05-24 16:19:19');
INSERT INTO `oper_record` VALUES ('bf0a0308-a80f-4237-bc17-75c116831beb', '1', 'Lucare', '添加管理员', '2016-05-26 19:46:02');
INSERT INTO `oper_record` VALUES ('bf55a152-61e9-4f57-a9eb-3a813eba35f0', '1', 'Lucare', '添加管理员', '2016-05-25 15:21:14');
INSERT INTO `oper_record` VALUES ('c8a40866-cce9-4c2a-8698-08d865d43735', '1', 'Lucare', '编辑管理员', '2016-05-26 19:39:30');
INSERT INTO `oper_record` VALUES ('d49a8fc0-c24d-41d0-aca0-8061dbd45cd9', '1', 'Lucare', '添加管理员', '2016-05-25 15:01:19');
INSERT INTO `oper_record` VALUES ('d83e63d7-971e-4b9b-a6b5-7a0e3396eaed', '1', 'Lucare', '编辑管理员', '2016-05-26 19:39:43');
INSERT INTO `oper_record` VALUES ('dad3906d-985f-48e0-9431-c6ada5a4235a', '1', 'Lucare', '添加管理员', '2016-05-30 15:04:34');
INSERT INTO `oper_record` VALUES ('ddeab320-dfe9-4737-9e60-7e2894d1dbef', '1', 'Lucare', '删除管理员', '2016-05-24 09:08:08');
INSERT INTO `oper_record` VALUES ('e1d19528-073d-4896-b953-dc56b91a6b47', '1', 'Lucare', '禁用或启用账号', '2016-05-24 14:57:01');
INSERT INTO `oper_record` VALUES ('e3c1fe11-8b2f-4bc1-bef8-ce96f55ed88b', '1', 'Lucare', '编辑管理员', '2016-05-26 20:48:02');
INSERT INTO `oper_record` VALUES ('fd1785be-3da7-4e88-8542-4275011b75b7', '1', 'Lucare', '删除管理员', '2016-05-24 14:46:07');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
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
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员', '整个系统的管理者', '1', null, '2016-05-30 14:57:23', '1');
INSERT INTO `role` VALUES ('2', '公司领导', '偶尔来找下感觉', '2', null, null, '1');
INSERT INTO `role` VALUES ('3', '管理员', '部分管理员权限', '3', null, null, '1');
INSERT INTO `role` VALUES ('726aaec4-ed81-4ff1-8701-d2f2feefccd9', '临时工', '是是是', null, '2016-05-24 14:21:03', '2016-05-24 14:21:03', null);
INSERT INTO `role` VALUES ('858deb51-0fe1-4e33-843f-ac86ca924793', 'temps', 'ha', null, '2016-05-26 20:50:38', '2016-05-30 15:04:56', '1');
INSERT INTO `role` VALUES ('df96226a-1c5e-4b97-8f3a-1f120043e1ca', 'test', '', null, '2016-05-26 20:56:39', '2016-05-26 20:56:39', '1');

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
INSERT INTO `role_per` VALUES ('11387080-df68-4ac7-ace5-24199153f099', '1', '33');
INSERT INTO `role_per` VALUES ('21046845-2d58-4447-861e-bfe1da428695', '1', '8');
INSERT INTO `role_per` VALUES ('21dac211-be87-4f22-a397-8dc9cb9f5d9f', '1', '323');
INSERT INTO `role_per` VALUES ('2712e444-f3b1-427f-97d5-b122ac6c3805', '1', '21');
INSERT INTO `role_per` VALUES ('34c0eb18-71a6-4e3b-9bc8-1868492ee8f6', '858deb51-0fe1-4e33-843f-ac86ca924793', '41');
INSERT INTO `role_per` VALUES ('38365844-317e-48f1-99e5-54dcc05ac287', '858deb51-0fe1-4e33-843f-ac86ca924793', '50487476-cb64-407d-b53a-8b8f10cc1e8e');
INSERT INTO `role_per` VALUES ('38eb0377-515f-4886-af54-1da8dd1ae34c', '858deb51-0fe1-4e33-843f-ac86ca924793', '2');
INSERT INTO `role_per` VALUES ('4b5560d2-4d03-4aa5-a60a-085c703f5d73', '1', '277035f2-abb0-4a20-8390-b1d984505103');
INSERT INTO `role_per` VALUES ('4bd7b025-54fb-4eeb-8992-275e7628c3af', '858deb51-0fe1-4e33-843f-ac86ca924793', '21');
INSERT INTO `role_per` VALUES ('51cf7eef-741a-4546-83ca-02d716004faa', '1', '321');
INSERT INTO `role_per` VALUES ('618faf1a-43cf-4845-b9f9-47b17faa638f', '1', '311');
INSERT INTO `role_per` VALUES ('639e4382-275f-44f3-a69f-02490b6cdfd4', '1', '313');
INSERT INTO `role_per` VALUES ('6bb3c057-aae0-4760-81c3-db1991294fde', '1', '322');
INSERT INTO `role_per` VALUES ('81245c94-f254-4e6c-9862-0a3009716620', '1', '50487476-cb64-407d-b53a-8b8f10cc1e8e');
INSERT INTO `role_per` VALUES ('84d69eaa-7d09-4d44-b965-2f01d5f81012', '858deb51-0fe1-4e33-843f-ac86ca924793', '277035f2-abb0-4a20-8390-b1d984505103');
INSERT INTO `role_per` VALUES ('8e38dbfd-a0c7-4844-8f0c-cb2444446ead', '1', '81');
INSERT INTO `role_per` VALUES ('9556a3f1-af63-46e8-b369-b1e71c2bb9cb', '1', '82');
INSERT INTO `role_per` VALUES ('9796c20c-214c-4b55-a04f-413d6861aa80', '1', '42');
INSERT INTO `role_per` VALUES ('9f6755eb-1d2e-4477-8b31-d77e452b274e', '1', '62');
INSERT INTO `role_per` VALUES ('a466b343-9a9f-4481-b6d6-04526bb4518b', '1', '83');
INSERT INTO `role_per` VALUES ('a8b5cb31-9cf8-4a3b-9fce-5821c2b2000a', '858deb51-0fe1-4e33-843f-ac86ca924793', '4');
INSERT INTO `role_per` VALUES ('ac51d177-e062-4d77-87fa-7bf33088d896', '858deb51-0fe1-4e33-843f-ac86ca924793', '42');
INSERT INTO `role_per` VALUES ('bcedf442-b8df-4243-a27a-d1eb9a4deec2', '1', '61');
INSERT INTO `role_per` VALUES ('bdd3b057-e9be-4dc7-a420-b311abaa0ac6', '1', '3');
INSERT INTO `role_per` VALUES ('c05fa770-e1d4-4349-af0b-78d510fa5ce7', '1', '312');
INSERT INTO `role_per` VALUES ('c97f665a-e1c8-4a10-a986-3a72aa37b953', '1', '6');
INSERT INTO `role_per` VALUES ('d167bb55-6754-4905-82c2-eb70cbe11ee7', '1', '32');
INSERT INTO `role_per` VALUES ('dc268265-19d1-47ba-9408-9d0c95e66923', '1', '31');
INSERT INTO `role_per` VALUES ('e63ad63e-6ffe-4975-b44d-6e135cd108a5', '1', '41');
INSERT INTO `role_per` VALUES ('e80e1d35-6a12-41f1-9a92-dbe779fbc9e5', '1', '4');
INSERT INTO `role_per` VALUES ('e8e3d193-577f-432a-b93f-42f44405f812', '1', '2');
INSERT INTO `role_per` VALUES ('fdc3df15-c6a5-48af-8e28-a42449645410', '1', '84');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
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
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'Lucare', '1', '1', 'fengchangsheng123@qq.com', '2016-05-01 22:55:26', null, '1', '1', '15507529497');
INSERT INTO `user` VALUES ('2', 'debbie', '2', '1', null, null, '2016-05-07 00:00:00', null, '0', null);
INSERT INTO `user` VALUES ('20afba84-e0ba-4e8d-b55f-9822da59ad8a', 'fcs', '1', '1', '', '2016-05-26 19:40:48', '2016-05-26 00:00:00', '1', '1', '15507456653');
INSERT INTO `user` VALUES ('3f77c402-4f21-4039-b25a-afa4948b2383', 'joe', null, '0', 'joe@qq.com', '2016-05-07 00:00:00', '2016-05-26 00:00:00', '1', '1', '15598765432');
INSERT INTO `user` VALUES ('b146fedf-bc98-4013-b382-3c0f5a8b80b5', 'tiger', '6', '1', '', '2016-05-07 00:00:00', '2016-05-26 00:00:00', '1', '1', '15562365985');
INSERT INTO `user` VALUES ('cffeff46-e521-462a-ab3e-2f0eca70c130', 'test', '1', '1', '', '2016-05-30 15:04:34', '2016-05-30 15:04:34', '1', '1', '');

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
INSERT INTO `user_role` VALUES ('03b0f5cc-9664-4cd8-9881-a5f21d3e75ef', '9f760c7a-bf0c-4359-8052-d994ab0fc4ef', '1');
INSERT INTO `user_role` VALUES ('05d8577f-c157-4104-9a3a-25bf7d919ccf', '01d4d0b4-4fcd-471d-9006-b91812ef2a32', '0ae75108-4bab-46fc-9691-2989bd97d1fd');
INSERT INTO `user_role` VALUES ('1', '1', '1');
INSERT INTO `user_role` VALUES ('1882dcc4-90ff-498e-8c69-387903fdc922', '52c92dd4-3149-4d39-abbb-99550f8e8620', '0ae75108-4bab-46fc-9691-2989bd97d1fd');
INSERT INTO `user_role` VALUES ('2', '2', '2');
INSERT INTO `user_role` VALUES ('23eff124-54d3-43bd-9473-cf3fc96fd98e', '29340c94-c0df-4361-980c-564b67b95d69', '0ae75108-4bab-46fc-9691-2989bd97d1fd');
INSERT INTO `user_role` VALUES ('28be41b5-839c-49e5-abe8-183535bcb3a7', '351be4fb-3f91-427d-acdf-303a59b1042d', '90d067c5-e318-41d7-b5f0-b9e3f62fb94b');
INSERT INTO `user_role` VALUES ('607252a7-0c75-43bd-ba3d-328a616c42a9', '20afba84-e0ba-4e8d-b55f-9822da59ad8a', '1');
INSERT INTO `user_role` VALUES ('6da026bc-65f9-4940-9d7b-b8a0d24b2436', '78b462cc-bf80-49ae-8414-0049a1a4450f', '1');
INSERT INTO `user_role` VALUES ('923386d7-8b58-4d7e-9f28-b523305a4306', 'f95a9c9b-7ee6-45f0-9e6a-03511610a709', '0ae75108-4bab-46fc-9691-2989bd97d1fd');
INSERT INTO `user_role` VALUES ('9310feea-1212-482b-95ea-cf74a2da4713', 'b146fedf-bc98-4013-b382-3c0f5a8b80b5', '2');
INSERT INTO `user_role` VALUES ('a1ec7477-bc98-47f0-97ec-0a561a8459a5', '8ce0d087-7387-40b2-987f-dcc8003203d4', '0ae75108-4bab-46fc-9691-2989bd97d1fd');
INSERT INTO `user_role` VALUES ('aba31647-4f4e-4daa-b28f-c6737df9ac9f', 'c60d0698-9be6-44d1-96fc-71c9539013c3', '1');
INSERT INTO `user_role` VALUES ('c03d2e79-fdbd-4b1c-9110-36b2f77deab1', '1a150a19-cc72-4348-ae3f-90eaa4f18167', '0ae75108-4bab-46fc-9691-2989bd97d1fd');
INSERT INTO `user_role` VALUES ('c90d2d94-1bbe-4d55-a49c-5f29d536f05e', '32299319-1204-44e9-9463-73b990b0d79e', '0ae75108-4bab-46fc-9691-2989bd97d1fd');
INSERT INTO `user_role` VALUES ('cb8a8c07-13a3-4517-b0c1-f63d8a94e273', '1bdc6f9b-1192-4b68-84af-a3d963df9e7a', '1');
INSERT INTO `user_role` VALUES ('d80e181e-6e6e-4bb2-b7c4-4cec5dacf07b', 'cffeff46-e521-462a-ab3e-2f0eca70c130', '858deb51-0fe1-4e33-843f-ac86ca924793');
INSERT INTO `user_role` VALUES ('e36dfaf7-115a-4188-8a29-e06e941280b9', '4cc8f1e5-5eab-4ca5-ba5c-890e31014d3b', '0ae75108-4bab-46fc-9691-2989bd97d1fd');
INSERT INTO `user_role` VALUES ('f842d46d-64ac-47d9-9eae-7b6a0f41bcd4', 'c480e069-ae68-4dec-a124-581e15c3160b', '90d067c5-e318-41d7-b5f0-b9e3f62fb94b');
