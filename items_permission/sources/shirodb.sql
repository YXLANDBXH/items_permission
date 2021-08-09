/*
Navicat MySQL Data Transfer

Source Server         : test_01
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : shirodb

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2019-05-16 10:40:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `pic` varchar(50) DEFAULT NULL,
  `createtime` date DEFAULT NULL,
  `detail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO `items` VALUES ('1', 'computer22', '99', null, null, 'adsfasfd');
INSERT INTO `items` VALUES ('2', 'mobile', '45', 'aaa.jpg', '2018-03-05', 'adsfasfd');
INSERT INTO `items` VALUES ('3', 'book', '230', 'ccc.jpg', '2018-03-05', 'adsfasfd');
INSERT INTO `items` VALUES ('4', '康师傅', '5', 'ddd.jpg', '2018-03-08', 'adsfasfd');
INSERT INTO `items` VALUES ('5', 'iphone', '4500', 'aaa.jpg', '2018-03-08', 'adsfasfd');
INSERT INTO `items` VALUES ('6', 'huawei', '2300', 'ccc.jpg', '2018-03-08', 'adsfasfd');
INSERT INTO `items` VALUES ('7', '小米电视', '5000', 'ddd.jpg', '2018-03-08', 'adsfasfd');
INSERT INTO `items` VALUES ('10', '中兴手机', '2300', 'ccc.jpg', '2018-03-08', 'adsfasfd');
INSERT INTO `items` VALUES ('20', '皮鞋', '222', 'sfda', '2018-03-14', 'sdfa');
INSERT INTO `items` VALUES ('21', '皮鞋3333', '222', 'sfda', '2018-03-14', 'sdfa');
INSERT INTO `items` VALUES ('22', '皮鞋3333', '222', 'ss', '2017-12-31', 'dsfsf');
INSERT INTO `items` VALUES ('23', '化工材料', '78', 'xxx.jpg', '2018-01-10', 'dssafsaf');
INSERT INTO `items` VALUES ('24', '化工材料', '78', 'xxx.jpg', '2018-01-10', 'dssafsaf');

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '资源名称',
  `type` varchar(32) NOT NULL COMMENT '资源类型：menu,button,',
  `url` varchar(128) DEFAULT NULL COMMENT '访问url地址',
  `percode` varchar(128) DEFAULT NULL COMMENT '权限代码字符串',
  `parentid` bigint(20) DEFAULT NULL COMMENT '父结点id',
  `parentids` varchar(128) DEFAULT NULL COMMENT '父结点id列表串',
  `sortstring` varchar(128) DEFAULT NULL COMMENT '排序号',
  `available` char(1) DEFAULT NULL COMMENT '是否可用,1：可用，0不可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('1', '权限', '', '', null, '0', '0/', '0', '1');
INSERT INTO `sys_permission` VALUES ('11', '商品管理', 'menu', '/items/queryItem.action', null, '1', '0/1/', '1.', '1');
INSERT INTO `sys_permission` VALUES ('12', '商品新增', 'permission', '/items/add.action', 'item:create', '11', '0/1/11/', '', '1');
INSERT INTO `sys_permission` VALUES ('13', '商品修改', 'permission', '/items/editItem.action', 'item:update', '11', '0/1/11/', '', '1');
INSERT INTO `sys_permission` VALUES ('14', '商品删除', 'permission', '', 'item:delete', '11', '0/1/11/', '', '1');
INSERT INTO `sys_permission` VALUES ('15', '商品查询', 'permission', '/items/queryItem.action', 'item:query', '11', '0/1/15/', null, '1');
INSERT INTO `sys_permission` VALUES ('21', '用户管理', 'menu', '/user/query.action', 'user:query', '1', '0/1/', '2.', '1');
INSERT INTO `sys_permission` VALUES ('22', '用户新增', 'permission', '', 'user:create', '21', '0/1/21/', '', '1');
INSERT INTO `sys_permission` VALUES ('23', '用户修改', 'permission', '', 'user:update', '21', '0/1/21/', '', '1');
INSERT INTO `sys_permission` VALUES ('24', '用户删除', 'permission', '', 'user:delete', '21', '0/1/21/', '', '1');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(36) NOT NULL,
  `name` varchar(128) NOT NULL,
  `available` char(1) DEFAULT NULL COMMENT '是否可用,1：可用，0不可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('ebc8a441-c6f9-11e4-b137-0adc305c3f28', '商品管理员', '1');
INSERT INTO `sys_role` VALUES ('ebc9d647-c6f9-11e4-b137-0adc305c3f28', '用户管理员', '1');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `id` varchar(36) NOT NULL,
  `sys_role_id` varchar(32) NOT NULL COMMENT '角色id',
  `sys_permission_id` varchar(32) NOT NULL COMMENT '权限id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('ebc8a441-c6f9-11e4-b137-0adc305c3f21', 'ebc8a441-c6f9-11e4-b137-0adc305c', '12');
INSERT INTO `sys_role_permission` VALUES ('ebc8a441-c6f9-11e4-b137-0adc305c3f22', 'ebc8a441-c6f9-11e4-b137-0adc305c', '11');
INSERT INTO `sys_role_permission` VALUES ('ebc8a441-c6f9-11e4-b137-0adc305c3f24', 'ebc9d647-c6f9-11e4-b137-0adc305c', '21');
INSERT INTO `sys_role_permission` VALUES ('ebc8a441-c6f9-11e4-b137-0adc305c3f25', 'ebc8a441-c6f9-11e4-b137-0adc305c', '15');
INSERT INTO `sys_role_permission` VALUES ('ebc9d647-c6f9-11e4-b137-0adc305c3f23', 'ebc9d647-c6f9-11e4-b137-0adc305c', '22');
INSERT INTO `sys_role_permission` VALUES ('ebc9d647-c6f9-11e4-b137-0adc305c3f26', 'ebc8a441-c6f9-11e4-b137-0adc305c', '13');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `usercode` varchar(32) NOT NULL COMMENT '账号',
  `username` varchar(64) NOT NULL COMMENT '姓名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `salt` varchar(64) DEFAULT NULL COMMENT '盐',
  `locked` char(1) DEFAULT NULL COMMENT '账号是否锁定，1：锁定，0未锁定',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('lisi', 'lisi', '李四', '1753810a48cf8a8a2e70a9b036fd4c89', 'eteokues', '0');
INSERT INTO `sys_user` VALUES ('wangwu', 'wangwu', '王五', '1753810a48cf8a8a2e70a9b036fd4c89', 'eteokues', '0');
INSERT INTO `sys_user` VALUES ('zhangsan', 'zhangsan', '张三', '1753810a48cf8a8a2e70a9b036fd4c89', 'eteokues', '0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` varchar(36) NOT NULL,
  `sys_user_id` varchar(32) NOT NULL,
  `sys_role_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('ebc8a441-c6f9-11e4-b137-0adc305c3f28', 'zhangsan', 'ebc8a441-c6f9-11e4-b137-0adc305c');
INSERT INTO `sys_user_role` VALUES ('ebc9d647-c6f9-11e4-b137-0adc305c3f28', 'lisi', 'ebc9d647-c6f9-11e4-b137-0adc305c');
