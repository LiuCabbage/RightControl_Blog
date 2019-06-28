/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : rightcontrol_blog

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2019-06-28 18:32:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_action
-- ----------------------------
DROP TABLE IF EXISTS `t_action`;
CREATE TABLE `t_action` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ActionCode` varchar(20) DEFAULT NULL COMMENT '操作编码',
  `ActionName` varchar(40) DEFAULT NULL COMMENT '操作名称',
  `Position` int(11) DEFAULT NULL COMMENT '显示位置（1：表单内，2：表单右上）',
  `Icon` varchar(30) DEFAULT NULL COMMENT '图标',
  `Method` varchar(20) DEFAULT NULL COMMENT '方法名称',
  `Remark` varchar(50) DEFAULT NULL COMMENT '说明',
  `OrderBy` int(4) DEFAULT NULL COMMENT '排序号',
  `Status` bit(1) DEFAULT NULL COMMENT '状态',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建时间',
  `UpdateOn` datetime DEFAULT NULL COMMENT '更新时间',
  `CreateBy` int(4) DEFAULT NULL COMMENT '创建者',
  `UpdateBy` int(4) DEFAULT NULL COMMENT '更新者',
  `ClassName` varchar(30) DEFAULT NULL COMMENT '样式名称',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='操作表';

-- ----------------------------
-- Records of t_action
-- ----------------------------
INSERT INTO `t_action` VALUES ('1', 'Add', '添加', '1', 'icon-add', 'Add', null, '0', '', '2019-02-28 14:44:33', '2019-06-15 23:32:07', '0', '1', null);
INSERT INTO `t_action` VALUES ('2', 'edit', '编辑', '0', 'icon-bianji', 'edit', null, '0', '', '2019-02-28 14:44:36', '2019-02-28 14:45:21', '0', '0', null);
INSERT INTO `t_action` VALUES ('3', 'detail', '查看', '0', 'icon-chakan', 'detail', null, '0', '', '2019-02-28 14:44:39', '2019-02-28 14:45:24', '0', '0', 'layui-btn-normal');
INSERT INTO `t_action` VALUES ('4', 'del', '删除', '0', 'icon-guanbi', 'del', null, '0', '', '2019-02-28 14:44:42', '2019-02-28 14:45:27', '0', '0', 'layui-btn-danger');
INSERT INTO `t_action` VALUES ('5', 'reset', '重置密码', '0', 'icon-reset', 'reset', null, '0', '', '2019-02-28 14:44:45', '2019-06-15 23:34:55', '0', '1', 'layui-btn-warm');
INSERT INTO `t_action` VALUES ('6', 'assign', '分配权限', '0', 'icon-jiaoseguanli', 'assign', null, '0', '', '2019-02-28 14:44:48', '2019-02-28 14:45:34', '0', '0', null);
INSERT INTO `t_action` VALUES ('7', 'BatchDel', '批量删除', '1', 'icon-shanchu', 'BatchDel', null, '0', '', '2019-06-15 23:34:15', '0001-01-01 00:00:00', '1', '0', null);
INSERT INTO `t_action` VALUES ('8', 'menu_action', '菜单权限', '0', 'icon-setting-permissions', 'menu_action', null, '0', '', '2019-06-17 17:00:29', '0001-01-01 00:00:00', '1', '0', null);

-- ----------------------------
-- Table structure for t_article
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '文章标题',
  `ZhaiYao` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '摘要',
  `Content` text CHARACTER SET utf8 COMMENT '内容',
  `TypeId` int(11) DEFAULT NULL,
  `ClassId` int(11) DEFAULT NULL,
  `Ding` int(11) DEFAULT NULL,
  `ReadNum` int(11) DEFAULT NULL,
  `CommentNum` int(11) DEFAULT NULL,
  `Visible` int(11) DEFAULT NULL,
  `CreateOn` datetime DEFAULT NULL,
  `UpdateOn` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_article
-- ----------------------------

-- ----------------------------
-- Table structure for t_article_class
-- ----------------------------
DROP TABLE IF EXISTS `t_article_class`;
CREATE TABLE `t_article_class` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `Name` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '文章分类',
  `OrderNo` int(11) DEFAULT NULL COMMENT '排序ID',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_article_class
-- ----------------------------
INSERT INTO `t_article_class` VALUES ('1', 'ASP.NET MVC', '1', '2019-06-25 18:31:13');
INSERT INTO `t_article_class` VALUES ('2', 'SQLServer', '2', '2019-06-25 18:31:16');
INSERT INTO `t_article_class` VALUES ('3', 'MySQL', '3', '2019-06-25 18:31:19');
INSERT INTO `t_article_class` VALUES ('4', 'IIS', '4', '2019-06-25 18:31:21');

-- ----------------------------
-- Table structure for t_article_type
-- ----------------------------
DROP TABLE IF EXISTS `t_article_type`;
CREATE TABLE `t_article_type` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `Name` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '文章类型',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_article_type
-- ----------------------------
INSERT INTO `t_article_type` VALUES ('1', '原创', '2019-06-25 18:32:10');
INSERT INTO `t_article_type` VALUES ('2', '转载', '2019-06-25 18:32:13');

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `SendId` int(11) DEFAULT NULL COMMENT '人员ID',
  `AcceptId` int(11) DEFAULT NULL COMMENT '目标人员ID',
  `Content` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '内容',
  `State` int(11) DEFAULT NULL COMMENT '状态',
  `ParentId` int(11) DEFAULT NULL COMMENT '父ID',
  `ArticleId` int(11) DEFAULT NULL COMMENT '文章ID',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_comment
-- ----------------------------

-- ----------------------------
-- Table structure for t_diarys
-- ----------------------------
DROP TABLE IF EXISTS `t_diarys`;
CREATE TABLE `t_diarys` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `Content` text CHARACTER SET utf8 COMMENT '日记内容',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_diarys
-- ----------------------------

-- ----------------------------
-- Table structure for t_feedback
-- ----------------------------
DROP TABLE IF EXISTS `t_feedback`;
CREATE TABLE `t_feedback` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `SendId` int(11) DEFAULT NULL COMMENT '人员ID',
  `AcceptId` int(11) DEFAULT NULL COMMENT '目标人员ID',
  `Content` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '内容',
  `ParentId` int(11) DEFAULT NULL COMMENT '父ID',
  `City` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '城市',
  `Equip` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '设备',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for t_links
-- ----------------------------
DROP TABLE IF EXISTS `t_links`;
CREATE TABLE `t_links` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `Name` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '网站名称',
  `Url` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '网址',
  `Icon` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '图标',
  `Describe` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '描述',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_links
-- ----------------------------

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log` (
  `Id` int(4) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `LogType` varchar(20) DEFAULT NULL COMMENT '日志类型',
  `UserName` varchar(20) DEFAULT NULL COMMENT '用户名称',
  `RealName` varchar(20) DEFAULT NULL COMMENT '操作账户',
  `ModuleName` varchar(20) DEFAULT NULL COMMENT '日志模块',
  `Description` varchar(200) DEFAULT NULL COMMENT '日志描述',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建日期',
  `IPAddress` varchar(20) DEFAULT NULL COMMENT 'IP地址',
  `IPAddressName` varchar(100) DEFAULT NULL COMMENT 'IP所在地',
  `Status` bit(1) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='日志表';

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES ('1', 'Login', 'admin', '超级管理员', '系统登录', '登录成功', '2019-06-15 22:56:18', '192.168.1.2', '本地局域网', '');
INSERT INTO `t_log` VALUES ('2', 'Login', 'admin', '超级管理员', '系统登录', '登录成功', '2019-06-15 23:11:59', '192.168.1.2', '本地局域网', '');
INSERT INTO `t_log` VALUES ('3', 'Exit', 'admin', '超级管理员', null, '安全退出系统', '2019-06-15 23:12:04', '192.168.1.2', '本地局域网', '');
INSERT INTO `t_log` VALUES ('49', 'Login', 'admin', '超级管理员', '系统登录', '登录成功', '2019-06-26 09:31:20', '192.168.1.148', '本地局域网', '');
INSERT INTO `t_log` VALUES ('50', 'Login', 'admin', '超级管理员', '系统登录', '登录成功', '2019-06-28 16:48:30', '192.168.1.148', '本地局域网', '');
INSERT INTO `t_log` VALUES ('51', 'Login', 'admin', '超级管理员', '系统登录', '登录成功', '2019-06-28 17:48:57', '192.168.1.148', '本地局域网', '');

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `Id` int(4) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `MenuName` varchar(20) DEFAULT NULL COMMENT '菜单名称',
  `MenuUrl` varchar(60) DEFAULT NULL COMMENT '菜单地址',
  `MenuIcon` varchar(30) DEFAULT NULL COMMENT '菜单图标',
  `OrderNo` tinyint(4) DEFAULT '0' COMMENT '排序号',
  `ParentId` int(4) DEFAULT '0' COMMENT '父菜单',
  `Status` bit(1) DEFAULT NULL COMMENT '状态',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建时间',
  `UpdateOn` datetime DEFAULT NULL COMMENT '修改时间',
  `CreateBy` int(4) DEFAULT NULL COMMENT '创建者',
  `UpdateBy` int(4) DEFAULT NULL COMMENT '编辑者',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('1', '权限管理', null, 'icon-setting-permissions', '1', '0', '', '2019-02-28 15:03:14', '2019-06-17 17:11:25', '0', '1');
INSERT INTO `t_menu` VALUES ('2', '菜单管理', '/permissions/menu', 'icon-caidan', '1', '1', '', '2019-02-28 15:03:20', '2019-02-28 15:03:23', '0', '0');
INSERT INTO `t_menu` VALUES ('3', '角色管理', '/permissions/role', 'icon-jiaoseguanli', '2', '1', '', '2019-02-28 15:03:25', '2019-02-28 15:03:29', '0', '0');
INSERT INTO `t_menu` VALUES ('4', '用户管理', '/permissions/user', 'icon-yonghu', '3', '1', '', '2019-02-28 15:03:32', '2019-02-28 15:03:35', '0', '0');
INSERT INTO `t_menu` VALUES ('5', '操作管理', '/permissions/action', 'icon-shezhi', '4', '1', '', '2019-02-28 15:03:39', '2019-02-28 15:03:43', '0', '0');
INSERT INTO `t_menu` VALUES ('6', '系统设置', null, 'icon-xitong', '2', '0', '', '2019-02-28 15:03:46', '2019-02-28 15:03:48', '0', '0');
INSERT INTO `t_menu` VALUES ('7', '网站设置', '/sysset/website', 'icon-ditu', '1', '6', '', '2019-02-28 15:03:51', '2019-02-28 15:03:53', '0', '0');
INSERT INTO `t_menu` VALUES ('8', '基本资料', '/SysSet/info', 'icon-jibenziliao', '2', '6', '', '2019-02-28 15:03:56', '2019-02-28 15:03:58', '0', '0');
INSERT INTO `t_menu` VALUES ('9', '修改密码', '/SysSet/password', 'icon-xiugaimima', '3', '6', '', '2019-02-28 15:04:02', '2019-02-28 15:04:05', '0', '0');
INSERT INTO `t_menu` VALUES ('10', '日志管理', '/SysSet/Log', 'icon-xitongrizhi', '4', '6', '', '2019-02-28 15:04:07', '2019-02-28 15:04:10', '0', '0');
INSERT INTO `t_menu` VALUES ('11', '博客管理', null, 'icon-zhuye', '0', '0', '', '2019-06-24 14:24:51', '0001-01-01 00:00:00', '1', '0');
INSERT INTO `t_menu` VALUES ('12', '文章类型', '/', 'icon-jibenziliao', '7', '11', '', '2019-06-24 14:32:31', '0001-01-01 00:00:00', '1', '0');
INSERT INTO `t_menu` VALUES ('13', '文章分类', '/Blog/ArticleClass', 'icon-jibenziliao', '6', '11', '', '2019-06-24 14:51:05', '2019-06-25 18:06:46', '1', '1');
INSERT INTO `t_menu` VALUES ('14', '友情链接', '/', 'icon-jibenziliao', '4', '11', '', '2019-06-24 14:55:33', '0001-01-01 00:00:00', '1', '0');
INSERT INTO `t_menu` VALUES ('15', '日记管理', '/', 'icon-jibenziliao', '3', '11', '', '2019-06-24 15:00:40', '0001-01-01 00:00:00', '1', '0');
INSERT INTO `t_menu` VALUES ('16', '文章管理', '/', 'icon-jibenziliao', '0', '11', '', '2019-06-24 15:02:17', '0001-01-01 00:00:00', '1', '0');
INSERT INTO `t_menu` VALUES ('17', '评论管理', '/', 'icon-jibenziliao', '1', '11', '', '2019-06-25 15:45:24', '0001-01-01 00:00:00', '1', '0');
INSERT INTO `t_menu` VALUES ('18', '留言管理', '/', 'icon-jibenziliao', '2', '11', '', '2019-06-25 15:45:49', '0001-01-01 00:00:00', '1', '0');
INSERT INTO `t_menu` VALUES ('19', '用户管理', '/', 'icon-jibenziliao', '5', '11', '', '2019-06-25 15:46:43', '0001-01-01 00:00:00', '1', '0');

-- ----------------------------
-- Table structure for t_menu_action
-- ----------------------------
DROP TABLE IF EXISTS `t_menu_action`;
CREATE TABLE `t_menu_action` (
  `MenuId` int(11) DEFAULT NULL COMMENT '菜单ID',
  `ActionId` int(11) DEFAULT NULL COMMENT '操作ID',
  UNIQUE KEY `idx_MenuId_ActionId` (`MenuId`,`ActionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单操作表';

-- ----------------------------
-- Records of t_menu_action
-- ----------------------------
INSERT INTO `t_menu_action` VALUES ('2', '1');
INSERT INTO `t_menu_action` VALUES ('2', '2');
INSERT INTO `t_menu_action` VALUES ('2', '4');
INSERT INTO `t_menu_action` VALUES ('2', '8');
INSERT INTO `t_menu_action` VALUES ('3', '1');
INSERT INTO `t_menu_action` VALUES ('3', '2');
INSERT INTO `t_menu_action` VALUES ('3', '3');
INSERT INTO `t_menu_action` VALUES ('3', '4');
INSERT INTO `t_menu_action` VALUES ('3', '6');
INSERT INTO `t_menu_action` VALUES ('4', '1');
INSERT INTO `t_menu_action` VALUES ('4', '2');
INSERT INTO `t_menu_action` VALUES ('4', '3');
INSERT INTO `t_menu_action` VALUES ('4', '4');
INSERT INTO `t_menu_action` VALUES ('4', '5');
INSERT INTO `t_menu_action` VALUES ('5', '1');
INSERT INTO `t_menu_action` VALUES ('5', '2');
INSERT INTO `t_menu_action` VALUES ('5', '3');
INSERT INTO `t_menu_action` VALUES ('5', '4');
INSERT INTO `t_menu_action` VALUES ('10', '4');
INSERT INTO `t_menu_action` VALUES ('10', '7');
INSERT INTO `t_menu_action` VALUES ('13', '1');
INSERT INTO `t_menu_action` VALUES ('13', '2');
INSERT INTO `t_menu_action` VALUES ('13', '3');
INSERT INTO `t_menu_action` VALUES ('13', '4');

-- ----------------------------
-- Table structure for t_menu_role_action
-- ----------------------------
DROP TABLE IF EXISTS `t_menu_role_action`;
CREATE TABLE `t_menu_role_action` (
  `MenuId` int(11) DEFAULT NULL COMMENT '菜单ID',
  `RoleId` int(11) DEFAULT NULL COMMENT '角色ID',
  `ActionId` int(11) DEFAULT NULL COMMENT '操作ID',
  UNIQUE KEY `idx_RoleId_MenuId` (`MenuId`,`RoleId`,`ActionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单角色表';

-- ----------------------------
-- Records of t_menu_role_action
-- ----------------------------
INSERT INTO `t_menu_role_action` VALUES ('1', '1', '0');
INSERT INTO `t_menu_role_action` VALUES ('1', '3', '0');
INSERT INTO `t_menu_role_action` VALUES ('2', '1', '0');
INSERT INTO `t_menu_role_action` VALUES ('2', '1', '1');
INSERT INTO `t_menu_role_action` VALUES ('2', '1', '2');
INSERT INTO `t_menu_role_action` VALUES ('2', '1', '4');
INSERT INTO `t_menu_role_action` VALUES ('2', '1', '8');
INSERT INTO `t_menu_role_action` VALUES ('2', '3', '0');
INSERT INTO `t_menu_role_action` VALUES ('3', '1', '0');
INSERT INTO `t_menu_role_action` VALUES ('3', '1', '1');
INSERT INTO `t_menu_role_action` VALUES ('3', '1', '2');
INSERT INTO `t_menu_role_action` VALUES ('3', '1', '3');
INSERT INTO `t_menu_role_action` VALUES ('3', '1', '4');
INSERT INTO `t_menu_role_action` VALUES ('3', '1', '6');
INSERT INTO `t_menu_role_action` VALUES ('3', '3', '0');
INSERT INTO `t_menu_role_action` VALUES ('3', '3', '3');
INSERT INTO `t_menu_role_action` VALUES ('4', '0', '0');
INSERT INTO `t_menu_role_action` VALUES ('4', '1', '0');
INSERT INTO `t_menu_role_action` VALUES ('4', '1', '1');
INSERT INTO `t_menu_role_action` VALUES ('4', '1', '2');
INSERT INTO `t_menu_role_action` VALUES ('4', '1', '3');
INSERT INTO `t_menu_role_action` VALUES ('4', '1', '4');
INSERT INTO `t_menu_role_action` VALUES ('4', '1', '5');
INSERT INTO `t_menu_role_action` VALUES ('4', '3', '0');
INSERT INTO `t_menu_role_action` VALUES ('4', '3', '3');
INSERT INTO `t_menu_role_action` VALUES ('5', '1', '0');
INSERT INTO `t_menu_role_action` VALUES ('5', '1', '1');
INSERT INTO `t_menu_role_action` VALUES ('5', '1', '2');
INSERT INTO `t_menu_role_action` VALUES ('5', '1', '3');
INSERT INTO `t_menu_role_action` VALUES ('5', '1', '4');
INSERT INTO `t_menu_role_action` VALUES ('5', '3', '0');
INSERT INTO `t_menu_role_action` VALUES ('5', '3', '3');
INSERT INTO `t_menu_role_action` VALUES ('6', '1', '0');
INSERT INTO `t_menu_role_action` VALUES ('6', '3', '0');
INSERT INTO `t_menu_role_action` VALUES ('7', '1', '0');
INSERT INTO `t_menu_role_action` VALUES ('7', '3', '0');
INSERT INTO `t_menu_role_action` VALUES ('8', '1', '0');
INSERT INTO `t_menu_role_action` VALUES ('8', '3', '0');
INSERT INTO `t_menu_role_action` VALUES ('9', '1', '0');
INSERT INTO `t_menu_role_action` VALUES ('9', '3', '0');
INSERT INTO `t_menu_role_action` VALUES ('10', '1', '0');
INSERT INTO `t_menu_role_action` VALUES ('10', '1', '4');
INSERT INTO `t_menu_role_action` VALUES ('10', '1', '7');
INSERT INTO `t_menu_role_action` VALUES ('10', '3', '0');
INSERT INTO `t_menu_role_action` VALUES ('11', '0', '0');
INSERT INTO `t_menu_role_action` VALUES ('11', '1', '0');
INSERT INTO `t_menu_role_action` VALUES ('12', '0', '0');
INSERT INTO `t_menu_role_action` VALUES ('12', '1', '0');
INSERT INTO `t_menu_role_action` VALUES ('13', '0', '0');
INSERT INTO `t_menu_role_action` VALUES ('13', '1', '0');
INSERT INTO `t_menu_role_action` VALUES ('13', '1', '1');
INSERT INTO `t_menu_role_action` VALUES ('13', '1', '2');
INSERT INTO `t_menu_role_action` VALUES ('13', '1', '3');
INSERT INTO `t_menu_role_action` VALUES ('13', '1', '4');
INSERT INTO `t_menu_role_action` VALUES ('14', '0', '0');
INSERT INTO `t_menu_role_action` VALUES ('14', '1', '0');
INSERT INTO `t_menu_role_action` VALUES ('15', '0', '0');
INSERT INTO `t_menu_role_action` VALUES ('15', '1', '0');
INSERT INTO `t_menu_role_action` VALUES ('16', '0', '0');
INSERT INTO `t_menu_role_action` VALUES ('16', '1', '0');
INSERT INTO `t_menu_role_action` VALUES ('17', '0', '0');
INSERT INTO `t_menu_role_action` VALUES ('17', '1', '0');
INSERT INTO `t_menu_role_action` VALUES ('18', '0', '0');
INSERT INTO `t_menu_role_action` VALUES ('18', '1', '0');
INSERT INTO `t_menu_role_action` VALUES ('19', '0', '0');
INSERT INTO `t_menu_role_action` VALUES ('19', '1', '0');

-- ----------------------------
-- Table structure for t_qq_user
-- ----------------------------
DROP TABLE IF EXISTS `t_qq_user`;
CREATE TABLE `t_qq_user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `OpenId` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT 'OpenId',
  `NickName` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '昵称',
  `Gender` tinyint(4) DEFAULT NULL COMMENT '性别（0：女，1：男）',
  `HeadShot` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '头像',
  `Email` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '邮箱',
  `LastLogin` datetime DEFAULT NULL COMMENT '最后一次登录时间',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_qq_user
-- ----------------------------

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `Id` int(4) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `RoleCode` varchar(20) DEFAULT NULL COMMENT '角色编码',
  `RoleName` varchar(30) DEFAULT NULL COMMENT '角色名称',
  `Remark` varchar(50) DEFAULT NULL COMMENT '角色描述',
  `Status` bit(1) DEFAULT NULL COMMENT '状态(1:有效，0：无效）',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建时间',
  `UpdateOn` datetime DEFAULT NULL COMMENT '更新时间',
  `CreateBy` int(4) DEFAULT NULL COMMENT '创建者',
  `UpdateBy` int(4) DEFAULT NULL COMMENT '修改者',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', 'SysAdmin', '超级管理员', null, '', '2019-02-28 15:34:59', '2019-02-28 15:35:03', '0', '0');
INSERT INTO `t_role` VALUES ('2', 'GeneralAdmin', '普通管理员', null, '', '2019-02-28 15:35:09', '2019-02-28 15:35:06', '0', '0');
INSERT INTO `t_role` VALUES ('3', 'GeneralUser', '用户', null, '', '2019-02-28 15:35:13', '2019-02-28 15:35:15', '0', '0');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `Id` int(4) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `UserName` varchar(20) DEFAULT NULL COMMENT '用户名（登录）',
  `RealName` varchar(20) DEFAULT NULL COMMENT '姓名',
  `PassWord` char(32) DEFAULT NULL COMMENT '密码',
  `RoleId` int(4) DEFAULT NULL COMMENT '角色ID',
  `Status` bit(1) DEFAULT NULL COMMENT '状态',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建时间',
  `UpdateOn` datetime DEFAULT NULL COMMENT '修改时间',
  `CreateBy` int(4) DEFAULT NULL COMMENT '创建者',
  `UpdateBy` int(4) DEFAULT NULL COMMENT '修改者',
  `Gender` tinyint(4) DEFAULT NULL COMMENT '性别（0：女，1：男）',
  `Phone` varchar(11) DEFAULT NULL COMMENT '手机',
  `Email` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `Remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `HeadShot` varchar(200) DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', '超级管理员', 'e10adc3949ba59abbe56e057f20f883e', '1', '', '2019-02-28 16:18:52', '2019-06-22 00:05:39', '0', '1', '1', '11111111111', '123456@qq.com', '最高权限', '/Upload/img/502.jpg');
INSERT INTO `t_user` VALUES ('2', 'test', '普通管理员', 'e10adc3949ba59abbe56e057f20f883e', '2', '', '2019-02-28 16:21:31', '2019-02-28 16:21:34', '0', '0', '1', '178899573', '123456@qq.com', '普通权限', '');
INSERT INTO `t_user` VALUES ('3', 'user', '用户', 'e10adc3949ba59abbe56e057f20f883e', '3', '', '2019-02-28 16:22:15', '2019-02-28 16:22:19', '0', '0', '1', '178899573', '123456@qq.com', '低级权限', null);
