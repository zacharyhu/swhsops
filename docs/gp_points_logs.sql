-- phpMyAdmin SQL Dump
-- version 3.5.4
-- http://www.phpmyadmin.net
--
-- 主机: 10.48.179.112
-- 生成日期: 2012 年 12 月 28 日 11:14
-- 服务器版本: 5.5.27-log
-- PHP 版本: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `gp_data_center`
--

-- --------------------------------------------------------

--
-- 表的结构 `gp_points_logs`
--

CREATE TABLE IF NOT EXISTS `gp_points_logs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `member_id` int(10) NOT NULL COMMENT '亿家游编号',
  `busi_id` int(10) DEFAULT NULL COMMENT '操作编号',
  `before_points_busi` varchar(20) DEFAULT NULL COMMENT '变更前游戏点',
  `chg_game_points` varchar(20) DEFAULT NULL COMMENT '变更游戏点数',
  `game_points` varchar(20) DEFAULT NULL COMMENT '变更后游戏点',
  `l_date` int(10) DEFAULT NULL COMMENT '变更日期',
  `l_time` int(10) DEFAULT NULL COMMENT '变更时间',
  `l_game_id` varchar(10) DEFAULT NULL COMMENT '游戏ID',
  PRIMARY KEY (`id`),
  KEY `membr_id` (`member_id`,`busi_id`,`l_date`,`l_time`,`l_game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='游戏点变更历史表' AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
