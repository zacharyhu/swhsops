-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2012 年 11 月 14 日 14:45
-- 服务器版本: 5.5.24-log
-- PHP 版本: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `test`
--

-- --------------------------------------------------------

--
-- 表的结构 `cx_data_cfg`
--

CREATE TABLE IF NOT EXISTS `cx_data_cfg` (
  `cate_id` int(11) NOT NULL COMMENT '该下拉类id',
  `parent_id` int(11) NOT NULL COMMENT '父类id',
  `name` varchar(20) CHARACTER SET gbk NOT NULL COMMENT '下拉类名称',
  KEY `cate_id` (`cate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='下拉菜单联动选项';

--
-- 转存表中的数据 `cx_data_cfg`
--

INSERT INTO `cx_data_cfg` (`cate_id`, `parent_id`, `name`) VALUES
(101, 0, '杭州地区'),
(102, 0, '新疆地区'),
(201, 101, '每日充值'),
(202, 101, '用户活跃度'),
(203, 101, 'VIP用户'),
(204, 101, '游戏点变化'),
(205, 101, '用户登录'),
(206, 102, '每日充值'),
(207, 102, '用户活跃度'),
(208, 102, '游戏点变化'),
(209, 102, '游戏点击量');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
