-- phpMyAdmin SQL Dump
-- version 3.5.0
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2014 年 09 月 04 日 16:37
-- 服务器版本: 5.1.73
-- PHP 版本: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `framework`
--

-- --------------------------------------------------------

--
-- 表的结构 `app_group`
--

CREATE TABLE IF NOT EXISTS `app_group` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(6) unsigned NOT NULL COMMENT '父id',
  `name` char(20) NOT NULL COMMENT '组名',
  `title` varchar(255) DEFAULT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0启用1禁用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='组' AUTO_INCREMENT=54 ;

--
-- 转存表中的数据 `app_group`
--

INSERT INTO `app_group` (`id`, `pid`, `name`, `title`, `create_time`, `update_time`, `status`) VALUES
(30, 0, 'Public-(后台公开组)', '公开组', 1381493899, 1381493899, 0),
(52, 0, 'All-(所有权限)', '所有权限', 1386863836, 1386863836, 0),
(53, 0, '酒店管理', '酒店管理组（只有管理酒店权限的功能）', 1393463419, 1393463419, 0);

-- --------------------------------------------------------

--
-- 表的结构 `app_group_node`
--

CREATE TABLE IF NOT EXISTS `app_group_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` smallint(6) unsigned NOT NULL COMMENT '组id',
  `node_id` smallint(6) unsigned NOT NULL COMMENT '节点id',
  PRIMARY KEY (`id`),
  KEY `groupId` (`group_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='组与节点关系表' AUTO_INCREMENT=42 ;

--
-- 转存表中的数据 `app_group_node`
--

INSERT INTO `app_group_node` (`id`, `group_id`, `node_id`) VALUES
(22, 53, 14),
(2, 53, 118),
(31, 53, 122),
(30, 53, 120),
(29, 53, 110),
(6, 53, 124),
(7, 53, 125),
(8, 53, 126),
(9, 53, 127),
(10, 53, 128),
(11, 53, 133),
(12, 53, 134),
(13, 53, 135),
(14, 53, 136),
(15, 53, 137),
(16, 53, 138),
(17, 53, 139),
(18, 53, 140),
(19, 53, 141),
(20, 53, 142),
(21, 53, 143),
(23, 53, 15),
(28, 53, 1),
(32, 53, 123),
(26, 53, 113),
(27, 53, 114),
(33, 53, 145),
(34, 53, 146),
(35, 53, 147),
(36, 53, 148),
(37, 53, 149),
(38, 53, 150),
(39, 52, 1),
(40, 52, 4),
(41, 52, 5);

-- --------------------------------------------------------

--
-- 表的结构 `app_group_user`
--

CREATE TABLE IF NOT EXISTS `app_group_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `group_id` smallint(6) unsigned NOT NULL COMMENT '组id',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='组与用户关系表' AUTO_INCREMENT=19 ;

--
-- 转存表中的数据 `app_group_user`
--

INSERT INTO `app_group_user` (`id`, `group_id`, `user_id`) VALUES
(18, 53, 61),
(17, 53, 60),
(16, 53, 56),
(15, 53, 58),
(14, 53, 59),
(13, 53, 57),
(12, 53, 62),
(11, 53, 55);

-- --------------------------------------------------------

--
-- 表的结构 `app_node`
--

CREATE TABLE IF NOT EXISTS `app_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(6) unsigned NOT NULL COMMENT '父id',
  `name` char(40) NOT NULL COMMENT '名称',
  `title` varchar(20) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `sort` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '等级:1分组、2模块、3方法',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0启用1禁用',
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='节点表(1项目、2模块、3方法)的关系' AUTO_INCREMENT=151 ;

--
-- 转存表中的数据 `app_node`
--

INSERT INTO `app_node` (`id`, `pid`, `name`, `title`, `remark`, `sort`, `level`, `status`) VALUES
(1, 0, 'Admin', '尊旅会后台管理系统', NULL, 0, 1, 0),
(4, 1, 'Rbac', '权限控制模块', NULL, 0, 2, 0),
(5, 4, 'rbac_node', '管理系统-权限控制模块-节点管理', NULL, 0, 3, 0),
(6, 4, 'node_edit', '管理系统-权限控制模块-编辑节点', NULL, 0, 3, 0),
(7, 4, 'node_status', '管理系统-权限控制模块-节点状态管理', NULL, 0, 3, 0),
(8, 4, 'group_node', '管理系统-权限控制模块-组与节点关系', NULL, 0, 3, 0),
(9, 4, 'edit_group_node', '管理系统-权限控制模块-组与节点关系编辑', NULL, 0, 3, 0),
(10, 4, 'group', '管理系统-权限控制模块-组管理', NULL, 0, 3, 0),
(11, 4, 'groupEdit', '管理系统-权限控制模块-组编辑', NULL, 0, 3, 0),
(12, 4, 'group_user', '管理系统-权限控制模块-分配组用户管理', NULL, 0, 3, 0),
(13, 4, 'group_user_edit', '管理系统-权限控制模块-用户与组管理编', NULL, 0, 3, 0),
(14, 1, 'Index', '主页模块', NULL, 0, 2, 0),
(15, 14, 'index', '管理系统-主页模块-首页', NULL, 0, 3, 0),
(16, 1, 'Login', '登陆模块', NULL, 0, 2, 0),
(17, 16, 'login', '登陆页面', NULL, 0, 3, 0),
(18, 16, 'check_login', '验证登陆', NULL, 0, 3, 0),
(19, 16, 'logout', '退出登陆', NULL, 0, 3, 0),
(90, 82, 'order_send_msg', '发送短信', NULL, 0, 3, 0),
(94, 4, 'group_node_two', '第二种，checkbox格式', NULL, 0, 3, 0),
(95, 4, 'group_node_update', '组与节点关系编辑-第二种编辑', NULL, 0, 3, 0),
(110, 1, 'User', '后台用户管理', NULL, 0, 2, 0),
(111, 110, 'index', '用户列表	', NULL, 0, 3, 0),
(112, 110, 'user_status', '修改用户账号状态', NULL, 0, 3, 0),
(113, 110, 'modifi_password', '修改用户账号状态', NULL, 0, 3, 0),
(114, 110, 'personal', '个人中心模块', NULL, 0, 3, 0),
(118, 1, 'Hotel', '酒店管理', NULL, 0, 2, 0),
(119, 1, 'HotelOrder', '订单管理', NULL, 0, 2, 0),
(120, 1, 'HotelRoom', '房型管理', NULL, 0, 2, 0),
(121, 1, 'Map', '地图', NULL, 0, 2, 0),
(122, 1, 'RoomSchedule', '房型价格', NULL, 0, 2, 0),
(123, 1, 'RoomPutaway', '上下架规则', NULL, 0, 2, 0),
(124, 118, 'index', '酒店列表', NULL, 0, 3, 0),
(125, 118, 'hotel_edit', '编辑酒店', NULL, 0, 3, 0),
(126, 118, 'hotel_img', '酒店图片编辑', NULL, 0, 3, 0),
(127, 118, 'ajax_photo_upload', '图片上传', NULL, 0, 3, 0),
(128, 118, 'ajax_photo_remove', '删除图片', NULL, 0, 3, 0),
(129, 119, 'index', '订单列表', NULL, 0, 3, 0),
(130, 119, 'order_dispose', '订单处理', NULL, 0, 3, 0),
(131, 119, 'order_log', '订单日志', NULL, 0, 3, 0),
(132, 119, 'add_data_order_log', '添加订单日志', NULL, 0, 3, 0),
(133, 120, 'index', '酒店房型列表', NULL, 0, 3, 0),
(134, 120, 'room_edit', '房型修改', NULL, 0, 3, 0),
(135, 120, 'room_img', '酒店房型图片编辑', NULL, 0, 3, 0),
(136, 120, 'ajax_photo_upload', '上传图片', NULL, 0, 3, 0),
(137, 120, 'ajax_photo_remove', '删除图片', NULL, 0, 3, 0),
(138, 122, 'index', '价格列表', NULL, 0, 3, 0),
(139, 122, 'Ajax_room_schedule_edit', '编辑酒店价格', NULL, 0, 3, 0),
(140, 122, 'AJAX_Get_Schedule', '获取日程', NULL, 0, 3, 0),
(141, 122, 'AJAX_DEL_Schedule', '删除价格', NULL, 0, 3, 0),
(142, 123, 'index', '酒店房型列表', NULL, 0, 3, 0),
(143, 123, 'putaway_edit', '规则编辑', NULL, 0, 3, 0),
(144, 110, 'del_account', '删除账号', NULL, 0, 3, 0),
(145, 1, 'Coupon', '优惠券模块', NULL, 0, 2, 0),
(146, 145, 'index', '优惠券列表', NULL, 0, 3, 0),
(147, 145, 'coupon_edit', '优惠券编辑', NULL, 0, 3, 0),
(148, 145, 'coupon_img', '优惠券图片', NULL, 0, 3, 0),
(149, 145, 'ajax_photo_upload', 'AJAX处理上传图片', NULL, 0, 3, 0),
(150, 145, 'ajax_photo_remove', 'AJAX删除图片', NULL, 0, 3, 0);

-- --------------------------------------------------------

--
-- 表的结构 `app_users`
--

CREATE TABLE IF NOT EXISTS `app_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account` char(11) NOT NULL,
  `nickname` varchar(20) DEFAULT NULL COMMENT '称呢',
  `password` char(32) NOT NULL,
  `last_login_time` int(11) unsigned NOT NULL DEFAULT '0',
  `last_login_ip` char(20) DEFAULT NULL,
  `login_count` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '登陆次数',
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  `type` tinyint(1) unsigned NOT NULL COMMENT '用户类型:0管理员，1酒店用户',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0正常',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除，0正常，-2删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='员工账号表' AUTO_INCREMENT=65 ;

--
-- 转存表中的数据 `app_users`
--

INSERT INTO `app_users` (`id`, `account`, `nickname`, `password`, `last_login_time`, `last_login_ip`, `login_count`, `create_time`, `update_time`, `type`, `status`, `is_del`) VALUES
(1, 'admin', '管理员', 'e10adc3949ba59abbe56e057f20f883e', 1409819815, '180.166.126.90', 330, 1376561926, 1376561926, 0, 0, 0),
(42, 'manage1', '管理员1', 'e10adc3949ba59abbe56e057f20f883e', 1395128032, '192.168.1.102', 302, 1376561926, 1376561926, 1, 0, 0),
(43, 'manage2', '管理员2', 'e10adc3949ba59abbe56e057f20f883e', 1393464144, '116.239.6.82', 295, 1376561926, 1376561926, 1, 0, 0),
(44, 'manage3', '管理员3', 'e10adc3949ba59abbe56e057f20f883e', 1392714035, '58.246.6.18', 287, 1376561926, 1376561926, 1, 0, 0),
(45, 'manage4', '管理员4', 'e10adc3949ba59abbe56e057f20f883e', 1392876080, '116.239.6.82', 287, 1376561926, 1376561926, 1, 0, 0),
(64, 'manage5', '昵称', 'e10adc3949ba59abbe56e057f20f883e', 1395128122, '192.168.1.102', 1, 1395128049, 1395128049, 1, 0, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
