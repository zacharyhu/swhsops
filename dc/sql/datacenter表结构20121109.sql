-- phpMyAdmin SQL Dump
-- version 2.10.3
-- http://www.phpmyadmin.net
-- 
-- 主机: 10.48.179.112
-- 生成日期: 2012 年 11 月 09 日 18:29
-- 服务器版本: 5.5.27
-- PHP 版本: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- 数据库: `datacenter`
-- 

-- --------------------------------------------------------

-- 
-- 表的结构 `action`
-- 

CREATE TABLE `action` (
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

CREATE TABLE `dailyreport_boss_cash` (
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

CREATE TABLE `dailyreport_game_info` (
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

CREATE TABLE `dailyreport_game_play` (
  `l_date` varchar(10) CHARACTER SET latin1 NOT NULL COMMENT '日期',
  `l_gid` varchar(10) CHARACTER SET latin1 NOT NULL COMMENT 'gameid',
  `l_game_name` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '游戏名',
  `total_num` varchar(10) CHARACTER SET latin1 NOT NULL COMMENT '总次数',
  `user_num` varchar(10) CHARACTER SET latin1 NOT NULL COMMENT '人数',
  `avg_num` decimal(10,0) NOT NULL COMMENT '人均次数',
  `game_points` varchar(20) CHARACTER SET latin1 NOT NULL COMMENT '消耗游戏点数',
  `cash_sum` varchar(10) CHARACTER SET latin1 NOT NULL COMMENT '消费金额',
  KEY `l_date` (`l_date`,`l_gid`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk COMMENT='各游戏参与信息表';

-- --------------------------------------------------------

-- 
-- 表的结构 `dailyreport_user_activity`
-- 

CREATE TABLE `dailyreport_user_activity` (
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

CREATE TABLE `dailyreport_vip_data` (
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
-- 表的结构 `event_501`
-- 

CREATE TABLE `event_501` (
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

CREATE TABLE `event_lucky_daysum` (
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

CREATE TABLE `event_lucky_Goods` (
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

CREATE TABLE `event_lucky_lucky` (
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

CREATE TABLE `game_login` (
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

CREATE TABLE `game_online` (
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

CREATE TABLE `game_value` (
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

CREATE TABLE `gp_cfg_org` (
  `vc_org_id` varchar(16) NOT NULL,
  `vc_org_name` varchar(64) NOT NULL,
  PRIMARY KEY (`vc_org_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='组织代码地区表';

-- --------------------------------------------------------

-- 
-- 表的结构 `gp_chg_daily`
-- 

CREATE TABLE `gp_chg_daily` (
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

CREATE TABLE `gp_gameid_cfg` (
  `game_id` varchar(10) CHARACTER SET latin1 NOT NULL,
  `game_name` varchar(20) CHARACTER SET gbk NOT NULL,
  `game_desc` varchar(50) CHARACTER SET gbk NOT NULL,
  `l_game_spcode` varchar(10) NOT NULL COMMENT '游戏spcode',
  KEY `game_id` (`game_id`),
  KEY `l_game_spcode` (`l_game_spcode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='游戏gameid对照表';

-- --------------------------------------------------------

-- 
-- 表的结构 `gp_game_info`
-- 

CREATE TABLE `gp_game_info` (
  `l_game_id` int(4) NOT NULL,
  `l_game_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `l_game_desc` varchar(50) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  KEY `l_game_id` (`l_game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='游戏gameid表';

-- --------------------------------------------------------

-- 
-- 表的结构 `gp_gate_login`
-- 

CREATE TABLE `gp_gate_login` (
  `l_date` varchar(10) NOT NULL,
  `l_time` varchar(40) NOT NULL,
  `l_gate` varchar(20) NOT NULL,
  `vc_stb_id` varchar(50) NOT NULL,
  KEY `l_time` (`l_time`,`l_gate`,`vc_stb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='门户登录表';

-- --------------------------------------------------------

-- 
-- 表的结构 `gp_new_recharge`
-- 

CREATE TABLE `gp_new_recharge` (
  `l_index` int(11) NOT NULL,
  `vc_stb_id` varchar(128) CHARACTER SET latin1 NOT NULL,
  `vc_account_no` varchar(32) NOT NULL,
  `l_sp_code` int(11) NOT NULL,
  `l_money` int(11) NOT NULL,
  `l_date` int(11) NOT NULL,
  `l_time` int(11) NOT NULL,
  PRIMARY KEY (`l_index`),
  KEY `vc_stb_id` (`vc_stb_id`),
  KEY `vc_account_no` (`vc_account_no`),
  KEY `l_sp_code` (`l_sp_code`),
  KEY `l_date` (`l_date`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk COMMENT='新充值记录';

-- --------------------------------------------------------

-- 
-- 表的结构 `gp_recharge_cp`
-- 

CREATE TABLE `gp_recharge_cp` (
  `name` varchar(10) NOT NULL,
  `l_type` varchar(5) NOT NULL,
  KEY `l_type` (`l_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='备注充值类别';

-- --------------------------------------------------------

-- 
-- 表的结构 `gp_recharge_his`
-- 

CREATE TABLE `gp_recharge_his` (
  `vc_stb_id` varchar(128) NOT NULL,
  `member_id` varchar(10) NOT NULL,
  `l_money` int(10) NOT NULL,
  `l_date` varchar(10) NOT NULL,
  `l_time` varchar(10) NOT NULL,
  `l_type` varchar(5) NOT NULL,
  KEY `l_date` (`l_date`),
  KEY `l_time` (`l_time`),
  KEY `vc_stb_id` (`vc_stb_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='充值历史记录表（每天更新）';

-- --------------------------------------------------------

-- 
-- 表的结构 `gp_stb_info`
-- 

CREATE TABLE `gp_stb_info` (
  `vc_stb_id` varchar(64) NOT NULL,
  `vc_org_id` varchar(16) NOT NULL,
  PRIMARY KEY (`vc_stb_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- 表的结构 `gp_user_info`
-- 

CREATE TABLE `gp_user_info` (
  `vc_stb_id` varchar(50) CHARACTER SET latin1 NOT NULL COMMENT '机顶盒号',
  `member_id` varchar(10) CHARACTER SET latin1 NOT NULL,
  `member_name` varchar(50) NOT NULL,
  `login_name` varchar(50) NOT NULL,
  `PASSWD` varchar(64) NOT NULL,
  `GENDER` varchar(2) NOT NULL,
  `PORTRAIT` varchar(12) NOT NULL,
  `LEVEL_ID` int(6) NOT NULL,
  `member_status` varchar(5) NOT NULL,
  `GRADE_VAL` varchar(12) NOT NULL,
  `LOGIN_FLAG` varchar(2) NOT NULL,
  `game_points` varchar(20) NOT NULL,
  `vip_level` varchar(5) NOT NULL,
  `OUT_ID` varchar(32) NOT NULL,
  `OUT_TYPE` varchar(2) NOT NULL,
  `ONLINE_TAG` varchar(2) NOT NULL,
  `LOST_TIMES` varchar(10) NOT NULL,
  `ADDRESS` varchar(256) NOT NULL,
  `TITLE_ID` varchar(6) NOT NULL,
  `create_date` varchar(50) NOT NULL,
  `expire_date` varchar(30) NOT NULL,
  `done_code` varchar(40) NOT NULL,
  `done_date` varchar(50) NOT NULL,
  `OP_ID` varchar(11) NOT NULL,
  `MEMBER_CODE` varchar(11) NOT NULL,
  `USER_NO` varchar(30) NOT NULL,
  `ORG_ID` varchar(20) NOT NULL,
  `REGION_CODE` varchar(10) NOT NULL,
  `CITY_ID` varchar(10) NOT NULL,
  PRIMARY KEY (`member_id`),
  KEY `vc_stb_id` (`vc_stb_id`,`member_id`,`member_status`,`vip_level`,`create_date`,`done_date`),
  KEY `REGION_CODE` (`REGION_CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk COMMENT='用户游戏点表';

-- --------------------------------------------------------

-- 
-- 表的结构 `hlg_coin`
-- 

CREATE TABLE `hlg_coin` (
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

CREATE TABLE `hlg_login` (
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
-- 表的结构 `host_monit`
-- 

CREATE TABLE `host_monit` (
  `host` varchar(30) NOT NULL,
  `item` varchar(30) NOT NULL,
  `value` varchar(30) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='监控数据';

-- --------------------------------------------------------

-- 
-- 表的结构 `point`
-- 

CREATE TABLE `point` (
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

CREATE TABLE `point_history` (
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

CREATE TABLE `TCoinErrLog` (
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

CREATE TABLE `TCoinLog` (
  `vc_userid` varchar(30) NOT NULL,
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

CREATE TABLE `tv_gp_ext_money_wasu` (
  `vc_account_no` varchar(32) NOT NULL COMMENT 'Ã¥Â¸ÂÃ¦Ë†Â·Ã§Â¼â€“Ã¥ÂÂ·',
  `l_money` int(11) NOT NULL COMMENT 'Ã¨Â´Â¦Ã¦Ë†Â·Ã¤Â½â„¢Ã©Â¢Â',
  `l_overdraft` int(11) NOT NULL COMMENT 'Ã©â‚¬ÂÃ¦â€Â¯Ã©Â¢ÂÃ¥ÂºÂ¦',
  `l_payment` int(11) NOT NULL COMMENT 'Ã§Â¼Â´Ã¨Â´Â¹Ã¦â€“Â¹Ã¥Â¼Â 1Ã§Å½Â°Ã©â€¡â€˜ 2Ã©â€œÂ¶Ã¨Â¡Å’Ã¦â€°ËœÃ¦â€Â¶ 3Ã¤Â¿Â¡Ã§â€Â¨Ã¥ÂÂ¡ 4Ã¦â€Â¯Ã§Â¥Â¨ 5Ã¥â€¦Â¶Ã¤Â»â€“',
  `l_date` int(11) NOT NULL COMMENT 'Ã¥ÂÅ’Ã¦Â­Â¥Ã¦â€”Â¥Ã¦Å“Å¸',
  PRIMARY KEY (`vc_account_no`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk COMMENT='Ã¤Â½â„¢Ã©Â¢ÂÃ¤Â¿Â¡Ã¦ÂÂ¯Ã¨Â¡Â¨_Ã¥ÂÅ½Ã¦â€¢Â°';

-- --------------------------------------------------------

-- 
-- 表的结构 `tv_gp_ext_user_wasu`
-- 

CREATE TABLE `tv_gp_ext_user_wasu` (
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

CREATE TABLE `tv_gp_hz_stb_info` (
  `vc_stb_id` varchar(64) NOT NULL,
  `vc_org_name` varchar(64) NOT NULL,
  `vc_org_id` varchar(16) NOT NULL,
  PRIMARY KEY (`vc_stb_id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- --------------------------------------------------------

-- 
-- 表的结构 `tv_gp_user_ext_wasu`
-- 

CREATE TABLE `tv_gp_user_ext_wasu` (
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
-- 表的结构 `xj_game_login`
-- 

CREATE TABLE `xj_game_login` (
  `l_date` int(8) NOT NULL,
  `l_num` int(8) NOT NULL,
  `l_game_id` int(8) NOT NULL,
  `l_game_type` int(8) NOT NULL,
  KEY `l_date` (`l_date`),
  KEY `l_game_id` (`l_game_id`),
  KEY `l_game_type` (`l_game_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新疆每日游戏点击量';

-- --------------------------------------------------------

-- 
-- 表的结构 `xj_gp_cfg_busi_type`
-- 

CREATE TABLE `xj_gp_cfg_busi_type` (
  `l_business_id` int(11) NOT NULL COMMENT '业务编号',
  `vc_business_name` varchar(32) CHARACTER SET gb2312 NOT NULL COMMENT '名称',
  `vc_business_desc` varchar(256) CHARACTER SET gb2312 NOT NULL COMMENT '描述',
  PRIMARY KEY (`l_business_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='新疆业务配置表';

-- --------------------------------------------------------

-- 
-- 表的结构 `xj_gp_cfg_game_info`
-- 

CREATE TABLE `xj_gp_cfg_game_info` (
  `l_game_id` int(11) NOT NULL COMMENT '游戏编号(100~999)',
  `l_status` int(11) NOT NULL COMMENT '游戏状态(0=正常,1=删除)',
  `l_func_type` int(11) NOT NULL DEFAULT '0',
  `l_game_type` int(11) NOT NULL COMMENT '游戏类型(tv_gp_cfg_busi_type)',
  `vc_game_name` varchar(32) CHARACTER SET gbk DEFAULT NULL,
  `vc_game_desc` varchar(32) CHARACTER SET gbk DEFAULT NULL,
  `vc_game_image` varchar(256) CHARACTER SET gb2312 NOT NULL COMMENT '游戏图片',
  `l_date` int(11) NOT NULL,
  `l_time` int(11) NOT NULL COMMENT '创建日期(YYMMDD)',
  `l_rank_value` int(11) NOT NULL COMMENT '游戏排名权重(tv_gp_cfg_base_value, 103)',
  `vc_search_key` varchar(256) CHARACTER SET gb2312 NOT NULL COMMENT '游戏搜索关键字(空格分隔)',
  PRIMARY KEY (`l_game_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='新疆配置游戏信息表';

-- --------------------------------------------------------

-- 
-- 表的结构 `z_count_cfg`
-- 

CREATE TABLE `z_count_cfg` (
  `index` int(7) NOT NULL AUTO_INCREMENT,
  `count_id` int(10) NOT NULL COMMENT '统计代码id',
  `name` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '统计项目名称',
  PRIMARY KEY (`index`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk COMMENT='统计代码配置表' AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

-- 
-- 表的结构 `z_count_log`
-- 

CREATE TABLE `z_count_log` (
  `index_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '序列',
  `count_id` int(20) NOT NULL COMMENT '统计id',
  `gate_type` varchar(20) NOT NULL DEFAULT '0' COMMENT '门户类型',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY (`index_id`),
  KEY `count_id` (`count_id`,`time`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=48941 ;

-- --------------------------------------------------------

-- 
-- 表的结构 `z_gamehall_log`
-- 

CREATE TABLE `z_gamehall_log` (
  `v_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `v_source` varchar(10) NOT NULL,
  `v_stbid` varchar(50) NOT NULL,
  `v_city` varchar(10) NOT NULL,
  `v_code` varchar(10) NOT NULL,
  KEY `v_source` (`v_source`,`v_city`,`v_code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='游戏大厅访问日志表';

-- --------------------------------------------------------

-- 
-- 表的结构 `z_user_active`
-- 

CREATE TABLE `z_user_active` (
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

CREATE TABLE `z_user_info` (
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

CREATE TABLE `z_visit_log` (
  `v_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `v_source` varchar(10) NOT NULL,
  `v_stbid` varchar(50) NOT NULL,
  `v_city` varchar(10) NOT NULL,
  `v_code` varchar(10) NOT NULL,
  KEY `v_source` (`v_source`,`v_city`,`v_code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='点击访问日志表';
