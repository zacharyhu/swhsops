-- phpMyAdmin SQL Dump
-- version 3.5.4
-- http://www.phpmyadmin.net
--
-- 主机: 10.48.179.112
-- 生成日期: 2012 年 12 月 28 日 11:13
-- 服务器版本: 5.5.27-log
-- PHP 版本: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `datacenter`
--

-- --------------------------------------------------------

--
-- 表的结构 `action`
--

CREATE TABLE IF NOT EXISTS `action` (
  `vc_user_id` varchar(20) CHARACTER SET latin1 NOT NULL,
  `vc_stb_id` varchar(30) CHARACTER SET latin1 NOT NULL,
  `vc_create_date` varchar(15) CHARACTER SET latin1 NOT NULL,
  KEY `vc_user_id` (`vc_user_id`),
  KEY `vc_create_date_2` (`vc_create_date`),
  KEY `vc_stb_id` (`vc_stb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户注册信息表';

-- --------------------------------------------------------

--
-- 表的结构 `dailyreport_boss_cash`
--

CREATE TABLE IF NOT EXISTS `dailyreport_boss_cash` (
  `l_date` varchar(10) NOT NULL,
  `cash_sum` int(20) NOT NULL,
  `total_num` varchar(20) NOT NULL,
  `avg` varchar(10) NOT NULL,
  `l_type` int(10) NOT NULL DEFAULT '1' COMMENT '1为旧充值，2为新充值',
  KEY `l_date` (`l_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='boss充值每天数据';

-- --------------------------------------------------------

--
-- 表的结构 `dailyreport_game_info`
--

CREATE TABLE IF NOT EXISTS `dailyreport_game_info` (
  `l_date` varchar(10) NOT NULL,
  `total_p` varchar(20) NOT NULL,
  `niu_p` varchar(20) NOT NULL,
  `niu_n` varchar(20) NOT NULL,
  `marj_p` varchar(20) NOT NULL,
  `marj_n` varchar(20) NOT NULL,
  `bbsk_p` varchar(20) NOT NULL,
  `bbsk_n` varchar(20) NOT NULL,
  `sk_p` varchar(20) NOT NULL,
  `sk_n` varchar(20) NOT NULL,
  `sk1_p` varchar(20) NOT NULL,
  `sk1_n` varchar(20) NOT NULL,
  `hlg_p` varchar(20) NOT NULL,
  `hlg_n` varchar(20) NOT NULL,
  `mxd_cash` varchar(20) NOT NULL,
  `mxd_n` varchar(20) NOT NULL,
  PRIMARY KEY (`l_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `dailyreport_game_play`
--

CREATE TABLE IF NOT EXISTS `dailyreport_game_play` (
  `l_date` varchar(10) CHARACTER SET latin1 NOT NULL COMMENT '日期',
  `l_gid` varchar(10) CHARACTER SET latin1 NOT NULL COMMENT 'gameid',
  `l_game_name` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '游戏名',
  `total_num` varchar(10) CHARACTER SET latin1 NOT NULL COMMENT '总次数',
  `user_num` varchar(10) CHARACTER SET latin1 NOT NULL COMMENT '人数',
  `avg_num` decimal(10,0) NOT NULL COMMENT '人均次数',
  `game_points` varchar(20) CHARACTER SET latin1 NOT NULL COMMENT '消耗游戏点数',
  `cash_sum` varchar(10) CHARACTER SET latin1 NOT NULL COMMENT '消费金额',
  `l_source` int(5) NOT NULL DEFAULT '201' COMMENT '游戏点来源，201老门户,105',
  KEY `l_date` (`l_date`,`l_gid`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk COMMENT='各游戏参与信息表';

-- --------------------------------------------------------

--
-- 表的结构 `dailyreport_user_activity`
--

CREATE TABLE IF NOT EXISTS `dailyreport_user_activity` (
  `l_date` varchar(15) CHARACTER SET latin1 NOT NULL,
  `active` varchar(10) CHARACTER SET latin1 NOT NULL,
  `active2` varchar(10) CHARACTER SET latin1 NOT NULL,
  `active3` varchar(10) CHARACTER SET latin1 NOT NULL,
  `active4` varchar(10) CHARACTER SET latin1 NOT NULL,
  `stay` varchar(10) CHARACTER SET latin1 NOT NULL,
  `stay3` varchar(10) CHARACTER SET latin1 NOT NULL,
  `stay7` varchar(10) CHARACTER SET latin1 NOT NULL,
  `stay15` varchar(10) CHARACTER SET latin1 NOT NULL,
  `stay30` varchar(10) CHARACTER SET latin1 NOT NULL,
  `newnum` varchar(10) CHARACTER SET latin1 NOT NULL,
  `newnum_play` varchar(10) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`l_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户数据分析';

-- --------------------------------------------------------

--
-- 表的结构 `dailyreport_vip_data`
--

CREATE TABLE IF NOT EXISTS `dailyreport_vip_data` (
  `l_date` varchar(10) NOT NULL,
  `mon_points` varchar(20) NOT NULL,
  `mon_num` varchar(10) NOT NULL,
  `coin_points` varchar(20) NOT NULL,
  `coin_num` varchar(10) NOT NULL,
  `ingame_num` varchar(10) NOT NULL,
  `incash_num` varchar(10) NOT NULL,
  `cash` varchar(10) NOT NULL,
  PRIMARY KEY (`l_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `dec_active`
--

CREATE TABLE IF NOT EXISTS `dec_active` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `member_id` int(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16384 ;

-- --------------------------------------------------------

--
-- 表的结构 `event_501`
--

CREATE TABLE IF NOT EXISTS `event_501` (
  `user_id` varchar(15) CHARACTER SET latin1 NOT NULL,
  `grade` int(20) NOT NULL,
  `date` varchar(10) NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `date` (`date`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk COMMENT='活动_501杭麻活动积分前30';

-- --------------------------------------------------------

--
-- 表的结构 `event_lucky_daysum`
--

CREATE TABLE IF NOT EXISTS `event_lucky_daysum` (
  `ID` int(5) NOT NULL,
  `ITIME` int(10) NOT NULL,
  `PLAYER` int(20) NOT NULL,
  `POINT` int(50) NOT NULL,
  `PRIZE` int(50) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ITIME` (`ITIME`),
  KEY `PLAYER` (`PLAYER`),
  KEY `POINT` (`POINT`),
  KEY `PRIZE` (`PRIZE`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk COMMENT='幸运大转盘每日日数据';

-- --------------------------------------------------------

--
-- 表的结构 `event_lucky_Goods`
--

CREATE TABLE IF NOT EXISTS `event_lucky_Goods` (
  `ID` int(5) NOT NULL,
  `NAME` int(10) NOT NULL,
  `ITIME` int(10) NOT NULL,
  `STIME` int(10) NOT NULL,
  `POINT` int(50) NOT NULL,
  `PID` int(5) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `NAME` (`NAME`),
  KEY `ITIME` (`ITIME`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk COMMENT='幸运大转盘中奖实物数据';

-- --------------------------------------------------------

--
-- 表的结构 `event_lucky_lucky`
--

CREATE TABLE IF NOT EXISTS `event_lucky_lucky` (
  `ID` int(5) NOT NULL,
  `NAME` int(20) NOT NULL,
  `ITIME` int(20) NOT NULL,
  `STIME` int(20) NOT NULL,
  `POINT` int(20) NOT NULL,
  `PID` int(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `NAME` (`NAME`),
  KEY `ITIME` (`ITIME`),
  KEY `PID` (`PID`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk COMMENT='幸运大转盘中奖数据';

-- --------------------------------------------------------

--
-- 表的结构 `game_login`
--

CREATE TABLE IF NOT EXISTS `game_login` (
  `vc_user_id` varchar(20) NOT NULL COMMENT 'memberid',
  `l_date` varchar(10) NOT NULL COMMENT '日期',
  `l_time` varchar(10) NOT NULL COMMENT '时间',
  `l_gid` varchar(10) NOT NULL COMMENT 'gameid',
  KEY `vc_user_id` (`vc_user_id`,`l_date`,`l_gid`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk COMMENT='游戏登录';

-- --------------------------------------------------------

--
-- 表的结构 `game_online`
--

CREATE TABLE IF NOT EXISTS `game_online` (
  `l_game_id` varchar(10) CHARACTER SET latin1 NOT NULL,
  `l_server_id` varchar(10) CHARACTER SET latin1 NOT NULL,
  `l_date` varchar(10) CHARACTER SET latin1 NOT NULL,
  `l_time` varchar(10) CHARACTER SET latin1 NOT NULL,
  `l_online` int(10) NOT NULL,
  KEY `l_game_id` (`l_game_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='tv_gp_user_game_online_busi 游戏在线人数表-4.0框架';

-- --------------------------------------------------------

--
-- 表的结构 `game_value`
--

CREATE TABLE IF NOT EXISTS `game_value` (
  `l_user_id` varchar(10) CHARACTER SET latin1 NOT NULL,
  `l_game_id` varchar(10) CHARACTER SET latin1 NOT NULL,
  `l_game_key` varchar(10) CHARACTER SET latin1 NOT NULL,
  `l_coin_chg` varchar(20) CHARACTER SET latin1 NOT NULL,
  `l_grade_chg` varchar(20) CHARACTER SET latin1 NOT NULL,
  `l_win_chg` varchar(20) CHARACTER SET latin1 NOT NULL,
  `l_lose_chg` varchar(20) CHARACTER SET latin1 NOT NULL,
  `l_standoff_chg` varchar(20) CHARACTER SET latin1 NOT NULL,
  `l_escape_chg` varchar(20) CHARACTER SET latin1 NOT NULL,
  `l_play_chg` varchar(20) CHARACTER SET latin1 NOT NULL,
  `l_date` varchar(20) CHARACTER SET latin1 NOT NULL,
  `l_time` varchar(20) CHARACTER SET latin1 NOT NULL,
  KEY `l_user_id` (`l_user_id`,`l_game_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='tv_gp_user_game_value_busi 用户游戏记录表-4.0';

-- --------------------------------------------------------

--
-- 表的结构 `gp_cfg_org`
--

CREATE TABLE IF NOT EXISTS `gp_cfg_org` (
  `vc_org_id` varchar(16) NOT NULL,
  `vc_org_name` varchar(64) NOT NULL,
  PRIMARY KEY (`vc_org_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='组织代码地区表';

-- --------------------------------------------------------

--
-- 表的结构 `gp_chg_daily`
--

CREATE TABLE IF NOT EXISTS `gp_chg_daily` (
  `l_date` char(10) CHARACTER SET latin1 DEFAULT NULL,
  `game_id` char(20) CHARACTER SET latin1 DEFAULT NULL,
  `chg_points` char(50) CHARACTER SET latin1 DEFAULT NULL,
  `user_num` varchar(10) CHARACTER SET latin1 NOT NULL,
  `total_num` varchar(20) NOT NULL COMMENT '总人次',
  KEY `game_id` (`game_id`),
  KEY `date` (`l_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='每日游戏点总变化表';

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='游戏id配置表' AUTO_INCREMENT=34 ;

-- --------------------------------------------------------

--
-- 表的结构 `gp_game_info`
--

CREATE TABLE IF NOT EXISTS `gp_game_info` (
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
-- 表的结构 `gp_gate_login`
--

CREATE TABLE IF NOT EXISTS `gp_gate_login` (
  `l_date` varchar(20) NOT NULL,
  `l_time` varchar(20) NOT NULL,
  `l_gate` varchar(20) NOT NULL,
  `vc_stb_id` varchar(50) NOT NULL,
  KEY `l_date` (`l_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `gp_new_recharge`
--

CREATE TABLE IF NOT EXISTS `gp_new_recharge` (
  `l_index` int(11) NOT NULL,
  `vc_stb_id` varchar(128) CHARACTER SET latin1 NOT NULL,
  `vc_account_no` varchar(32) CHARACTER SET latin1 NOT NULL,
  `l_sp_code` int(11) NOT NULL,
  `l_money` int(11) NOT NULL,
  `l_date` int(11) NOT NULL,
  `l_time` int(11) NOT NULL,
  PRIMARY KEY (`l_index`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk COMMENT='新充值记录';

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='充值历史记录表（每天更新）' AUTO_INCREMENT=886680 ;

-- --------------------------------------------------------

--
-- 表的结构 `gp_stb_info`
--

CREATE TABLE IF NOT EXISTS `gp_stb_info` (
  `vc_stb_id` varchar(64) NOT NULL,
  `vc_org_id` varchar(16) NOT NULL,
  PRIMARY KEY (`vc_stb_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `gp_user_info`
--

CREATE TABLE IF NOT EXISTS `gp_user_info` (
  `vc_stb_id` varchar(50) CHARACTER SET latin1 NOT NULL COMMENT '机顶盒号',
  `member_id` varchar(10) CHARACTER SET latin1 NOT NULL,
  `member_name` varchar(50) NOT NULL,
  `login_name` varchar(50) NOT NULL,
  `member_status` varchar(5) NOT NULL,
  `game_points` varchar(20) NOT NULL,
  `vip_level` varchar(5) NOT NULL,
  `create_date` varchar(50) NOT NULL,
  `done_date` varchar(50) NOT NULL,
  KEY `vc_stb_id` (`vc_stb_id`,`member_id`,`member_status`,`vip_level`,`create_date`,`done_date`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk COMMENT='用户游戏点表';

-- --------------------------------------------------------

--
-- 表的结构 `gp_user_info_ora`
--

CREATE TABLE IF NOT EXISTS `gp_user_info_ora` (
  `vc_stb_id` varchar(50) CHARACTER SET latin1 NOT NULL COMMENT '机顶盒号',
  `member_id` varchar(10) CHARACTER SET latin1 NOT NULL,
  `member_name` varchar(50) NOT NULL,
  `login_name` varchar(50) NOT NULL,
  `member_status` varchar(5) NOT NULL,
  `game_points` varchar(20) NOT NULL,
  `vip_level` varchar(5) NOT NULL,
  `create_date` varchar(50) NOT NULL,
  `done_date` varchar(50) NOT NULL,
  `REGION_CODE` int(10) NOT NULL,
  `CITY_ID` int(10) NOT NULL,
  KEY `vc_stb_id` (`vc_stb_id`,`member_id`,`member_status`,`vip_level`,`create_date`,`done_date`),
  KEY `CITY_ID` (`CITY_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk COMMENT='用户游戏点表';

-- --------------------------------------------------------

--
-- 表的结构 `hlg_coin`
--

CREATE TABLE IF NOT EXISTS `hlg_coin` (
  `vc_user_id` varchar(20) NOT NULL,
  `l_date` varchar(10) NOT NULL,
  `l_time` varchar(10) NOT NULL,
  `l_gid` varchar(10) NOT NULL,
  `l_coin` varchar(10) NOT NULL,
  KEY `vc_user_id` (`vc_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='æ¬¢ä¹è°·coin';

-- --------------------------------------------------------

--
-- 表的结构 `hlg_login`
--

CREATE TABLE IF NOT EXISTS `hlg_login` (
  `vc_user_id` varchar(10) NOT NULL,
  `l_date` varchar(10) NOT NULL,
  `l_time` varchar(10) NOT NULL,
  `l_gid` varchar(10) NOT NULL,
  KEY `vc_user_id` (`vc_user_id`),
  KEY `l_gid` (`l_gid`),
  KEY `l_date` (`l_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='æ¬¢ä¹è°·login';

-- --------------------------------------------------------

--
-- 表的结构 `old_account`
--

CREATE TABLE IF NOT EXISTS `old_account` (
  `id` int(10) NOT NULL,
  `begin` varchar(20) NOT NULL,
  `end` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `account_no` int(10) NOT NULL,
  `time` varchar(20) NOT NULL,
  `stb` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调账账户表';

-- --------------------------------------------------------

--
-- 表的结构 `old_need`
--

CREATE TABLE IF NOT EXISTS `old_need` (
  `id` int(11) NOT NULL,
  `beg` varchar(20) NOT NULL,
  `end` varchar(20) NOT NULL,
  `account_no` int(11) NOT NULL,
  `stbid` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `old_stb`
--

CREATE TABLE IF NOT EXISTS `old_stb` (
  `account_no` int(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `stbid` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `point`
--

CREATE TABLE IF NOT EXISTS `point` (
  `member_id` varchar(10) NOT NULL,
  `busi_id` varchar(10) NOT NULL,
  `before_points_busi` varchar(10) NOT NULL,
  `chg_game_points` varchar(10) NOT NULL,
  `game_points` varchar(15) NOT NULL,
  `done_date` varchar(20) NOT NULL,
  `notes` varchar(20) NOT NULL,
  KEY `member_id` (`member_id`,`busi_id`),
  KEY `notes` (`notes`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='game ponits游戏点变化表';

-- --------------------------------------------------------

--
-- 表的结构 `point_history`
--

CREATE TABLE IF NOT EXISTS `point_history` (
  `member_id` varchar(10) NOT NULL,
  `busi_id` varchar(10) NOT NULL,
  `before_points_busi` varchar(10) NOT NULL,
  `chg_game_points` varchar(10) NOT NULL,
  `game_points` varchar(15) NOT NULL,
  `done_date` varchar(20) NOT NULL,
  `notes` varchar(20) NOT NULL,
  KEY `member_id` (`member_id`,`busi_id`),
  KEY `done_date` (`done_date`),
  KEY `notes` (`notes`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='game ponits游戏点变化历史表';

-- --------------------------------------------------------

--
-- 表的结构 `TCoinErrLog`
--

CREATE TABLE IF NOT EXISTS `TCoinErrLog` (
  `vc_userid` varchar(30) NOT NULL,
  `l_date` varchar(10) NOT NULL,
  `l_time` varchar(10) NOT NULL,
  `vc_cp` varchar(10) NOT NULL,
  `vc_gameid` varchar(10) NOT NULL,
  `l_coin` varchar(10) NOT NULL,
  `vc_message` varchar(10) NOT NULL,
  KEY `l_date` (`l_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='TCoinErrLog';

-- --------------------------------------------------------

--
-- 表的结构 `TCoinLog`
--

CREATE TABLE IF NOT EXISTS `TCoinLog` (
  `vc_userid` varchar(30) CHARACTER SET latin1 NOT NULL,
  `l_date` varchar(10) CHARACTER SET latin1 NOT NULL,
  `l_time` varchar(10) CHARACTER SET latin1 NOT NULL,
  `vc_cp` varchar(10) CHARACTER SET latin1 NOT NULL,
  `vc_gameid` varchar(10) CHARACTER SET latin1 NOT NULL,
  `l_coin` varchar(10) CHARACTER SET latin1 NOT NULL,
  KEY `vc_userid` (`vc_userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='康德游戏日志';

-- --------------------------------------------------------

--
-- 表的结构 `tv_gp_ext_money_wasu`
--

CREATE TABLE IF NOT EXISTS `tv_gp_ext_money_wasu` (
  `vc_account_no` varchar(32) NOT NULL COMMENT 'Ã¥Â¸ÂÃ¦Ë†Â·Ã§Â¼â€“Ã¥ÂÂ·',
  `l_money` int(11) NOT NULL COMMENT 'Ã¨Â´Â¦Ã¦Ë†Â·Ã¤Â½â„¢Ã©Â¢Â',
  `l_overdraft` int(11) NOT NULL COMMENT 'Ã©â‚¬ÂÃ¦â€Â¯Ã©Â¢ÂÃ¥ÂºÂ¦',
  `l_payment` int(11) NOT NULL COMMENT 'Ã§Â¼Â´Ã¨Â´Â¹Ã¦â€“Â¹Ã¥Â¼Â 1Ã§Å½Â°Ã©â€¡â€˜ 2Ã©â€œÂ¶Ã¨Â¡Å’Ã¦â€°ËœÃ¦â€Â¶ 3Ã¤Â¿Â¡Ã§â€Â¨Ã¥ÂÂ¡ 4Ã¦â€Â¯Ã§Â¥Â¨ 5Ã¥â€¦Â¶Ã¤Â»â€“',
  `l_date` int(11) NOT NULL COMMENT 'Ã¥ÂÅ’Ã¦Â­Â¥Ã¦â€”Â¥Ã¦Å“Å¸',
  PRIMARY KEY (`vc_account_no`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk COMMENT='Ã¤Â½â„¢Ã©Â¢ÂÃ¤Â¿Â¡Ã¦ÂÂ¯Ã¨Â¡Â¨_Ã¥ÂÅ½Ã¦â€¢Â°';

-- --------------------------------------------------------

--
-- 表的结构 `tv_gp_ext_new_user_wasu`
--

CREATE TABLE IF NOT EXISTS `tv_gp_ext_new_user_wasu` (
  `vc_stb_id` varchar(128) NOT NULL COMMENT '机顶盒编号',
  `vc_account_no` varchar(32) NOT NULL COMMENT '帐户编号',
  `vc_user_no` varchar(32) CHARACTER SET latin1 NOT NULL COMMENT '用户编号',
  `vc_customer_no` varchar(32) CHARACTER SET latin1 NOT NULL COMMENT '客户编号',
  `vc_customer_name` varchar(128) NOT NULL COMMENT '客户名称',
  `vc_org_id` varchar(16) CHARACTER SET latin1 NOT NULL COMMENT '组织编号',
  `vc_org_name` varchar(128) NOT NULL COMMENT '组织名称',
  `vc_telphone` varchar(32) CHARACTER SET latin1 NOT NULL COMMENT '电话号码',
  `vc_mobile` varchar(32) CHARACTER SET latin1 NOT NULL COMMENT '手机号码',
  `vc_stb_type` varchar(128) NOT NULL COMMENT '机顶盒类型',
  `vc_address` varchar(128) NOT NULL COMMENT '地址',
  PRIMARY KEY (`vc_stb_id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- --------------------------------------------------------

--
-- 表的结构 `tv_gp_ext_recharge_wasu`
--

CREATE TABLE IF NOT EXISTS `tv_gp_ext_recharge_wasu` (
  `l_index` int(11) NOT NULL AUTO_INCREMENT,
  `vc_stb_id` varchar(128) NOT NULL,
  `vc_account_no` varchar(32) NOT NULL,
  `l_sp_code` int(11) NOT NULL,
  `l_money` int(11) NOT NULL,
  `l_date` int(11) NOT NULL,
  `l_time` int(11) NOT NULL,
  PRIMARY KEY (`l_index`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=262359 ;

-- --------------------------------------------------------

--
-- 表的结构 `tv_gp_ext_user_wasu`
--

CREATE TABLE IF NOT EXISTS `tv_gp_ext_user_wasu` (
  `vc_stb_id` varchar(128) NOT NULL COMMENT '机顶盒编号',
  `vc_account_no` varchar(32) NOT NULL COMMENT '帐户编号',
  `vc_user_no` varchar(32) CHARACTER SET latin1 NOT NULL COMMENT '用户编号',
  `vc_customer_no` varchar(32) CHARACTER SET latin1 NOT NULL COMMENT '客户编号',
  `vc_customer_name` varchar(128) NOT NULL COMMENT '客户名称',
  `vc_org_id` varchar(16) CHARACTER SET latin1 NOT NULL COMMENT '组织编号',
  `vc_org_name` varchar(128) NOT NULL COMMENT '组织名称',
  `vc_telphone` varchar(32) CHARACTER SET latin1 NOT NULL COMMENT '电话号码',
  `vc_mobile` varchar(32) CHARACTER SET latin1 NOT NULL COMMENT '手机号码',
  `vc_stb_type` varchar(128) NOT NULL COMMENT '机顶盒类型',
  `vc_address` varchar(128) NOT NULL COMMENT '地址',
  PRIMARY KEY (`vc_stb_id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- --------------------------------------------------------

--
-- 表的结构 `tv_gp_hz_stb_info`
--

CREATE TABLE IF NOT EXISTS `tv_gp_hz_stb_info` (
  `vc_stb_id` varchar(64) NOT NULL,
  `vc_org_name` varchar(64) NOT NULL,
  `vc_org_id` varchar(16) NOT NULL,
  PRIMARY KEY (`vc_stb_id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- --------------------------------------------------------

--
-- 表的结构 `tv_gp_user_ext_wasu`
--

CREATE TABLE IF NOT EXISTS `tv_gp_user_ext_wasu` (
  `vc_stb_id` varchar(128) CHARACTER SET utf8 NOT NULL COMMENT '机顶盒编号',
  `vc_user_no` varchar(32) NOT NULL COMMENT '用户编号',
  `vc_customer_no` varchar(32) NOT NULL COMMENT '客户编号',
  `vc_customer_name` varchar(128) NOT NULL COMMENT '客户名称',
  `vc_org_id` varchar(16) NOT NULL COMMENT '组织编号',
  `vc_org_name` varchar(128) NOT NULL COMMENT '组织名称',
  `vc_telphone` varchar(32) NOT NULL COMMENT '电话号码',
  `vc_mobile` varchar(32) NOT NULL COMMENT '手机号码',
  `vc_stb_type` varchar(128) NOT NULL COMMENT '机顶盒类型',
  `vc_address` varchar(128) NOT NULL COMMENT '地址',
  `vc_account_no` varchar(32) NOT NULL COMMENT '帐户编号',
  `l_money` int(11) NOT NULL COMMENT '帐户余额',
  `l_payment` int(11) NOT NULL COMMENT '缴费方式(现金  1, 银行托收 2, 信用卡 3, 支票 4, 其他 5)',
  `l_overdraft` int(11) NOT NULL DEFAULT '0' COMMENT '透支额度',
  PRIMARY KEY (`vc_stb_id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- --------------------------------------------------------

--
-- 表的结构 `xj_data_game_login`
--

CREATE TABLE IF NOT EXISTS `xj_data_game_login` (
  `l_date` int(10) NOT NULL COMMENT '日期',
  `l_lobby_id` int(10) NOT NULL COMMENT '大厅来源编号',
  `l_sum` varchar(10) NOT NULL COMMENT '次数',
  `l_game_id` varchar(10) NOT NULL COMMENT '游戏ID',
  KEY `l_date` (`l_date`),
  KEY `l_game_id` (`l_game_id`),
  KEY `l_lobby_id` (`l_lobby_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='游戏登录次数表';

-- --------------------------------------------------------

--
-- 表的结构 `xj_data_game_point`
--

CREATE TABLE IF NOT EXISTS `xj_data_game_point` (
  `l_date` int(8) NOT NULL COMMENT '日期',
  `l_lobby_id` int(10) NOT NULL COMMENT '大厅来源编号',
  `l_game_id` varchar(10) NOT NULL COMMENT '游戏id',
  `l_game_type` varchar(10) NOT NULL COMMENT '游戏类别',
  `l_sum` varchar(10) NOT NULL COMMENT '总人次',
  `l_num` varchar(10) NOT NULL COMMENT '总人数',
  `l_gp_change` varchar(10) NOT NULL COMMENT '总游戏点变更',
  KEY `l_date` (`l_date`,`l_game_id`,`l_game_type`),
  KEY `l_lobby_id` (`l_lobby_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='游戏点变化汇总表';

-- --------------------------------------------------------

--
-- 表的结构 `xj_data_recharge`
--

CREATE TABLE IF NOT EXISTS `xj_data_recharge` (
  `l_date` int(10) NOT NULL COMMENT '日期',
  `l_lobby_id` int(10) NOT NULL COMMENT '大厅编号',
  `l_money` varchar(20) NOT NULL COMMENT '总金额',
  `l_num` varchar(6) NOT NULL COMMENT '总人数',
  `l_avg` float NOT NULL COMMENT '人均',
  KEY `l_lobby_id` (`l_lobby_id`),
  KEY `l_date` (`l_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='每天充值统计';

-- --------------------------------------------------------

--
-- 表的结构 `xj_data_user`
--

CREATE TABLE IF NOT EXISTS `xj_data_user` (
  `l_date` int(10) NOT NULL COMMENT '日期',
  `l_lobby_id` int(10) NOT NULL COMMENT '大厅来源编号',
  `l_new_user` varchar(20) NOT NULL COMMENT '新注册用户数',
  `l_new_gamer` int(10) NOT NULL COMMENT '新玩家数',
  `l_login_user` varchar(10) NOT NULL COMMENT '登录用户数',
  `l_recharge_user` varchar(10) NOT NULL COMMENT '充值用户数',
  `l_stay_1` varchar(10) NOT NULL COMMENT '1天留存用户',
  `l_stay_3` varchar(10) NOT NULL COMMENT '3天留存用户',
  `l_stay_7` varchar(10) NOT NULL COMMENT '5天留存用户',
  `l_stay_15` varchar(10) NOT NULL COMMENT '15天留存用户',
  `l_stay_30` varchar(10) NOT NULL COMMENT '30天留存用户',
  KEY `l_date` (`l_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户行为表';

-- --------------------------------------------------------

--
-- 表的结构 `xj_gate_login`
--

CREATE TABLE IF NOT EXISTS `xj_gate_login` (
  `l_date` varchar(10) NOT NULL,
  `l_time` varchar(40) NOT NULL,
  `l_gate` varchar(20) NOT NULL,
  `vc_stb_id` varchar(50) NOT NULL,
  KEY `l_time` (`l_time`,`l_gate`,`vc_stb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='门户登录表';

-- --------------------------------------------------------

--
-- 表的结构 `z_count_cfg`
--

CREATE TABLE IF NOT EXISTS `z_count_cfg` (
  `index` int(7) NOT NULL AUTO_INCREMENT,
  `count_id` int(10) NOT NULL COMMENT '统计代码id',
  `name` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '统计项目名称',
  PRIMARY KEY (`index`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk COMMENT='统计代码配置表' AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `z_count_log`
--

CREATE TABLE IF NOT EXISTS `z_count_log` (
  `index_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '序列',
  `count_id` int(20) NOT NULL COMMENT '统计id',
  `gate_type` varchar(20) NOT NULL DEFAULT '0' COMMENT '门户类型',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY (`index_id`),
  KEY `count_id` (`count_id`,`time`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=35330 ;

-- --------------------------------------------------------

--
-- 表的结构 `z_user_active`
--

CREATE TABLE IF NOT EXISTS `z_user_active` (
  `vc_stb_id` varchar(64) NOT NULL,
  `l_create_date` varchar(16) NOT NULL,
  `l_date` varchar(16) NOT NULL,
  `l_source_id` varchar(10) NOT NULL,
  KEY `l_date` (`l_date`),
  KEY `l_source_id` (`l_source_id`),
  KEY `l_create_date` (`l_create_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='用户行为总表';

-- --------------------------------------------------------

--
-- 表的结构 `z_user_info`
--

CREATE TABLE IF NOT EXISTS `z_user_info` (
  `stbid` varchar(50) CHARACTER SET utf8 NOT NULL,
  `name` varchar(10) NOT NULL,
  `addr` varchar(50) NOT NULL,
  `tel` varchar(20) CHARACTER SET utf8 NOT NULL,
  `cell` varchar(20) CHARACTER SET utf8 NOT NULL,
  `area` varchar(10) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`stbid`),
  KEY `area` (`area`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk COMMENT='用户基本信息表';

-- --------------------------------------------------------

--
-- 表的结构 `z_visit_log`
--

CREATE TABLE IF NOT EXISTS `z_visit_log` (
  `v_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `v_source` varchar(10) NOT NULL,
  `v_stbid` varchar(50) NOT NULL,
  `v_city` varchar(10) NOT NULL,
  `v_code` varchar(10) NOT NULL,
  KEY `v_source` (`v_source`,`v_city`,`v_code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='点击访问日志表';

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
