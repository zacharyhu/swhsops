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
-- 数据库: `gp_platform`
--

-- --------------------------------------------------------

--
-- 表的结构 `gp_data_daily_cash`
--

CREATE TABLE IF NOT EXISTS `gp_data_daily_cash` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `l_date` int(10) NOT NULL,
  `l_cash_sum` int(20) NOT NULL DEFAULT '0',
  `l_total_num` int(20) NOT NULL DEFAULT '0',
  `l_avg` float NOT NULL DEFAULT '0',
  `l_type` int(10) NOT NULL COMMENT '充值类型',
  PRIMARY KEY (`id`),
  KEY `l_date` (`l_date`),
  KEY `l_type` (`l_type`),
  KEY `l_cash_sum` (`l_cash_sum`),
  KEY `l_total_num` (`l_total_num`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='每天现金收入表' AUTO_INCREMENT=1732 ;

-- --------------------------------------------------------

--
-- 表的结构 `gp_data_daily_game`
--

CREATE TABLE IF NOT EXISTS `gp_data_daily_game` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `l_date` varchar(10) NOT NULL COMMENT '日期',
  `l_game_id` int(10) NOT NULL COMMENT 'gameid',
  `l_game_name` varchar(20) NOT NULL COMMENT '游戏名',
  `l_total_num` varchar(10) NOT NULL COMMENT '总次数',
  `l_user_num` int(10) NOT NULL COMMENT '人数',
  `l_avg_num` decimal(10,0) NOT NULL COMMENT '人均次数',
  `l_game_points` int(20) NOT NULL COMMENT '消耗游戏点数',
  `l_cash_sum` int(10) NOT NULL COMMENT '消费金额',
  `l_source` int(10) NOT NULL COMMENT '来源，105新疆，201老平台',
  PRIMARY KEY (`id`),
  KEY `l_date` (`l_date`,`l_game_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2447 ;

-- --------------------------------------------------------

--
-- 表的结构 `gp_data_daily_user`
--

CREATE TABLE IF NOT EXISTS `gp_data_daily_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `l_date` int(10) NOT NULL,
  `l_active` int(10) NOT NULL,
  `l_new_num` int(5) NOT NULL,
  `l_new_gamer` int(5) NOT NULL,
  `l_source` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='活跃用户表' AUTO_INCREMENT=322 ;

-- --------------------------------------------------------

--
-- 表的结构 `gp_data_daily_vip`
--

CREATE TABLE IF NOT EXISTS `gp_data_daily_vip` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `l_date` int(10) NOT NULL COMMENT '日期',
  `l_mon_points` int(20) NOT NULL COMMENT '包月领工资游戏点',
  `l_mon_num` int(10) NOT NULL COMMENT '包月领工资人数',
  `l_coin_points` int(20) NOT NULL COMMENT '接金币游戏点',
  `l_coin_num` int(10) NOT NULL COMMENT '接金币人数',
  `l_ingame_num` int(10) NOT NULL COMMENT '参与游戏会员数',
  `l_incash_num` int(10) NOT NULL COMMENT '参与充值会员人数',
  `l_cash_sum` int(10) NOT NULL COMMENT '会员充值金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=284 ;

-- --------------------------------------------------------

--
-- 表的结构 `gp_gameid_cfg`
--

CREATE TABLE IF NOT EXISTS `gp_gameid_cfg` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `l_game_id` int(5) NOT NULL,
  `l_game_name` varchar(20) CHARACTER SET gbk NOT NULL,
  `l_game_desc` varchar(50) CHARACTER SET gbk NOT NULL,
  `l_game_spcode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `game_id` (`l_game_id`),
  KEY `l_game_spcode` (`l_game_spcode`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='游戏id配置表' AUTO_INCREMENT=36 ;

-- --------------------------------------------------------

--
-- 表的结构 `gp_game_source_cfg`
--

CREATE TABLE IF NOT EXISTS `gp_game_source_cfg` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `l_source` int(5) NOT NULL COMMENT '来源编号',
  `l_source_name` varchar(20) NOT NULL COMMENT '来源名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='来源编号配置表' AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- 表的结构 `gp_gate_login`
--

CREATE TABLE IF NOT EXISTS `gp_gate_login` (
  `l_date` varchar(10) NOT NULL,
  `l_time` varchar(40) NOT NULL,
  `l_gate` varchar(20) NOT NULL,
  `vc_stb_id` varchar(50) NOT NULL,
  KEY `l_time` (`l_time`,`l_gate`,`vc_stb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='门户登录表';

-- --------------------------------------------------------

--
-- 表的结构 `gp_recharge_cp`
--

CREATE TABLE IF NOT EXISTS `gp_recharge_cp` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `l_name` varchar(10) NOT NULL,
  `l_type` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `l_type` (`l_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='备注充值类别' AUTO_INCREMENT=27 ;

-- --------------------------------------------------------

--
-- 表的结构 `gp_recharge_his`
--

CREATE TABLE IF NOT EXISTS `gp_recharge_his` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `vc_stb_id` varchar(128) NOT NULL,
  `member_id` int(10) NOT NULL,
  `l_money` int(10) NOT NULL,
  `l_date` int(10) NOT NULL,
  `l_time` int(10) NOT NULL,
  `l_type` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `l_date` (`l_date`),
  KEY `l_time` (`l_time`),
  KEY `vc_stb_id` (`vc_stb_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='充值历史记录表（每天更新）' AUTO_INCREMENT=887253 ;

-- --------------------------------------------------------

--
-- 表的结构 `monitor_check_cpu_status`
--

CREATE TABLE IF NOT EXISTS `monitor_check_cpu_status` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `host_id` int(10) NOT NULL,
  `host_cpu_us` float NOT NULL,
  `host_cpu_sy` float NOT NULL,
  `host_cpu_ni` float NOT NULL,
  `host_cpu_id` float NOT NULL,
  `host_cpu_wa` float NOT NULL,
  `check_last_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `host_id` (`host_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='进程监控表' AUTO_INCREMENT=18544 ;

-- --------------------------------------------------------

--
-- 表的结构 `monitor_check_disk_status`
--

CREATE TABLE IF NOT EXISTS `monitor_check_disk_status` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `host_id` int(10) NOT NULL,
  `host_disk_use` float NOT NULL,
  `host_disk_free` float NOT NULL,
  `host_disk_total` float NOT NULL,
  `host_disk_per` float NOT NULL COMMENT '百分比',
  `check_last_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `host_id` (`host_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='磁盘监控表' AUTO_INCREMENT=18544 ;

-- --------------------------------------------------------

--
-- 表的结构 `monitor_check_mem_status`
--

CREATE TABLE IF NOT EXISTS `monitor_check_mem_status` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `host_id` int(10) NOT NULL,
  `host_mem_use` float NOT NULL,
  `host_mem_free` float NOT NULL,
  `host_mem_cache` float NOT NULL,
  `host_mem_total` float NOT NULL,
  `host_mem_swap` float NOT NULL,
  `check_last_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `host_id` (`host_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='进程监控表' AUTO_INCREMENT=18544 ;

-- --------------------------------------------------------

--
-- 表的结构 `monitor_check_port_status`
--

CREATE TABLE IF NOT EXISTS `monitor_check_port_status` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `item_id` int(10) NOT NULL COMMENT '项目id',
  `item_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '项目名称',
  `check_status` int(5) NOT NULL COMMENT '检查状态0失败、1成功',
  `check_last_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `failed_times` int(10) NOT NULL COMMENT '失败次数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `item_id` (`item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

-- --------------------------------------------------------

--
-- 表的结构 `monitor_check_process_status`
--

CREATE TABLE IF NOT EXISTS `monitor_check_process_status` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `process_id` int(10) NOT NULL COMMENT '配置的进程编号',
  `local_process_id` int(10) NOT NULL COMMENT '本机进程id',
  `process_cpu` varchar(5) NOT NULL COMMENT '占用cpu百分比',
  `process_mem` varchar(5) NOT NULL COMMENT '占用内存百分比',
  `process_threads_num` int(10) NOT NULL COMMENT '线程数',
  `process_conn_num` int(10) NOT NULL COMMENT '连接数',
  `last_check_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  KEY `process_id` (`process_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='进程监控表' AUTO_INCREMENT=19013 ;

-- --------------------------------------------------------

--
-- 表的结构 `monitor_check_traffic_status`
--

CREATE TABLE IF NOT EXISTS `monitor_check_traffic_status` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `host_id` int(10) NOT NULL,
  `host_traffic_dev` varchar(10) NOT NULL COMMENT '设备id',
  `host_traffic_rx` float NOT NULL,
  `host_traffic_tx` float NOT NULL,
  `check_last_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='进程监控表' AUTO_INCREMENT=93506 ;

-- --------------------------------------------------------

--
-- 表的结构 `monitor_moniter_port_list`
--

CREATE TABLE IF NOT EXISTS `monitor_moniter_port_list` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item_id` int(10) NOT NULL,
  `item_name` varchar(20) NOT NULL,
  `item_host` varchar(20) NOT NULL,
  `item_port` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item_id_2` (`item_id`),
  KEY `item_name` (`item_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='端口监控列表数据库' AUTO_INCREMENT=37 ;

-- --------------------------------------------------------

--
-- 表的结构 `monitor_moniter_process_list`
--

CREATE TABLE IF NOT EXISTS `monitor_moniter_process_list` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `process_cfg_id` int(10) NOT NULL COMMENT '进程配置编号',
  `process_cfg_name` varchar(20) NOT NULL COMMENT '进程配置名称',
  `process_cfg_desc` varchar(30) NOT NULL COMMENT '进程关键字,分隔，shell中grep区分用',
  `process_cfg_type` varchar(20) NOT NULL COMMENT '种类',
  PRIMARY KEY (`id`),
  UNIQUE KEY `process_cfg_id` (`process_cfg_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='监控进程配置表' AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- 表的结构 `monitor_moniter_warn_cfg`
--

CREATE TABLE IF NOT EXISTS `monitor_moniter_warn_cfg` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(10) NOT NULL COMMENT '报警项',
  `threshold` varchar(20) NOT NULL COMMENT '阀值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `monitor_moniter_warn_status`
--

CREATE TABLE IF NOT EXISTS `monitor_moniter_warn_status` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `host_id` int(10) NOT NULL COMMENT '主机id',
  `item_name` varchar(10) NOT NULL COMMENT '报警项',
  `warn_value` varchar(10) NOT NULL COMMENT '报警值',
  `last_check_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后提示时间',
  `warning_times` int(11) NOT NULL,
  `cache_key` varchar(20) NOT NULL COMMENT 'redis key',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
