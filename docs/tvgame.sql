-- phpMyAdmin SQL Dump
-- version 3.5.4
-- http://www.phpmyadmin.net
--
-- 主机: 10.48.179.112
-- 生成日期: 2012 年 12 月 28 日 11:15
-- 服务器版本: 5.5.27-log
-- PHP 版本: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `tvgame`
--

-- --------------------------------------------------------

--
-- 表的结构 `Test`
--

CREATE TABLE IF NOT EXISTS `Test` (
  `a` char(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- --------------------------------------------------------

--
-- 表的结构 `tv_gp_cfg_action`
--

CREATE TABLE IF NOT EXISTS `tv_gp_cfg_action` (
  `l_action_id` int(11) NOT NULL COMMENT '行为编号',
  `l_father_id` int(11) NOT NULL COMMENT '总类编号, 多个‘行为编号’属于一个总类编号',
  `vc_business_name` varchar(64) NOT NULL COMMENT '名称',
  `vc_father_name` varchar(64) NOT NULL COMMENT '总类名称',
  `vc_business_desc` varchar(256) NOT NULL COMMENT '描述',
  PRIMARY KEY (`l_action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置扣费行为表';

-- --------------------------------------------------------

--
-- 表的结构 `tv_gp_cfg_base_value`
--

CREATE TABLE IF NOT EXISTS `tv_gp_cfg_base_value` (
  `l_index` int(11) NOT NULL COMMENT '编号',
  `l_value` int(11) NOT NULL COMMENT '数值',
  `vc_name` varchar(128) NOT NULL COMMENT '名称',
  PRIMARY KEY (`l_index`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk COMMENT='提供一些基础配置信息';

-- --------------------------------------------------------

--
-- 表的结构 `tv_gp_cfg_busi_type`
--

CREATE TABLE IF NOT EXISTS `tv_gp_cfg_busi_type` (
  `l_business_id` int(11) NOT NULL COMMENT '业务编号',
  `vc_business_name` varchar(32) CHARACTER SET gb2312 NOT NULL COMMENT '名称',
  `vc_business_desc` varchar(256) CHARACTER SET gb2312 NOT NULL COMMENT '描述',
  PRIMARY KEY (`l_business_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='业务配置表';

-- --------------------------------------------------------

--
-- 表的结构 `tv_gp_cfg_cp_info`
--

CREATE TABLE IF NOT EXISTS `tv_gp_cfg_cp_info` (
  `l_cp_code` int(11) NOT NULL COMMENT 'CP编号',
  `vc_cp_name` varchar(64) CHARACTER SET gbk NOT NULL COMMENT '名称',
  PRIMARY KEY (`l_cp_code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='游戏CP信息表';

-- --------------------------------------------------------

--
-- 表的结构 `tv_gp_cfg_game_info`
--

CREATE TABLE IF NOT EXISTS `tv_gp_cfg_game_info` (
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
  `l_cp_code` int(10) unsigned NOT NULL DEFAULT '501' COMMENT '游戏商编号',
  PRIMARY KEY (`l_game_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='配置游戏信息表';

-- --------------------------------------------------------

--
-- 表的结构 `tv_gp_cfg_game_lobby_info`
--

CREATE TABLE IF NOT EXISTS `tv_gp_cfg_game_lobby_info` (
  `l_lobby_id` int(11) NOT NULL COMMENT '大厅编号',
  `vc_org_name` varchar(32) NOT NULL COMMENT '名称',
  `vc_recharge_ipaddr` varchar(32) NOT NULL COMMENT '计费服务器IP',
  `l_recharge_port` int(11) NOT NULL COMMENT '计费服务器端口',
  `l_payment` int(11) NOT NULL COMMENT '支付开关（0=密码校验,1=不需要校验; 默认1）',
  `l_day_money` int(11) NOT NULL COMMENT '每日充值上限(元, 0不限制)',
  `l_month_money` int(11) NOT NULL COMMENT '每月充值上限(元, 0不限制)',
  `vc_business_id` varchar(256) NOT NULL COMMENT '业务编号串(业务编号1:业务编号2:业务编号3)',
  `l_status` int(11) NOT NULL COMMENT '维护状态(0=正常运行,1=维护状态)',
  PRIMARY KEY (`l_lobby_id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk COMMENT='配置游戏大厅信息表';

-- --------------------------------------------------------

--
-- 表的结构 `tv_gp_cfg_game_svr_ref`
--

CREATE TABLE IF NOT EXISTS `tv_gp_cfg_game_svr_ref` (
  `l_game_id` int(11) NOT NULL COMMENT '游戏编号',
  `l_server_id` int(11) NOT NULL COMMENT '服务器编号',
  `vc_url` varchar(512) NOT NULL COMMENT 'URL路径',
  PRIMARY KEY (`l_game_id`,`l_server_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='配置游戏与服务器对应表';

-- --------------------------------------------------------

--
-- 表的结构 `tv_gp_cfg_menu`
--

CREATE TABLE IF NOT EXISTS `tv_gp_cfg_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL COMMENT '菜单编号',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT '上一级菜单编号',
  `menu_title` varchar(64) NOT NULL COMMENT '菜单标题',
  `menu_path` varchar(64) DEFAULT NULL COMMENT '目录路径',
  `menu_url` varchar(64) NOT NULL COMMENT '执行路径',
  `menu_img` varchar(64) NOT NULL COMMENT '菜单图片',
  `menu_visible` int(10) unsigned NOT NULL COMMENT '是否可用（0:不可用  1:可用）',
  `create_date` int(10) unsigned NOT NULL COMMENT '创建日期',
  `update_date` int(10) unsigned DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=51 ;

-- --------------------------------------------------------

--
-- 表的结构 `tv_gp_cfg_order`
--

CREATE TABLE IF NOT EXISTS `tv_gp_cfg_order` (
  `l_order_id` int(11) NOT NULL COMMENT '订购编号',
  `l_seconds` int(11) NOT NULL COMMENT '有效时长(秒; 0=长期有效)',
  `l_tips` int(11) NOT NULL COMMENT '到期提示(0=不提示, 1=提示)',
  `l_type_id` int(11) NOT NULL COMMENT '订购类型(100=游戏平台, 101=单一游戏订购,102=组合游戏订购, 103=道具)',
  `l_invalid_date` int(11) NOT NULL DEFAULT '991231' COMMENT '失效日期(YYMMDD, 默认=991231)',
  `vc_notes` varchar(256) NOT NULL COMMENT '描述',
  PRIMARY KEY (`l_order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk COMMENT='配置订购信息';

-- --------------------------------------------------------

--
-- 表的结构 `tv_gp_cfg_server_info`
--

CREATE TABLE IF NOT EXISTS `tv_gp_cfg_server_info` (
  `l_server_id` int(11) NOT NULL COMMENT '服务器编号',
  `l_game_id` int(11) NOT NULL COMMENT '游戏编号(tv_gp_cfg_game)',
  `l_vip_id` int(11) NOT NULL COMMENT '绑定会员(tv_gp_config_vip), 0=不限制, 否则为所属会员类型,普通用户无法进入',
  `l_server_type` int(11) NOT NULL COMMENT '服务器类型(0=普通,1=活动)',
  `vc_server_name` varchar(128) CHARACTER SET gbk NOT NULL COMMENT '服务器名称',
  `vc_server_ipaddr` varchar(16) NOT NULL COMMENT '服务器地址',
  `l_server_port` int(11) NOT NULL COMMENT '服务器端口',
  `l_server_onlines_limit` int(11) NOT NULL COMMENT '服务器人数上限',
  `l_status` int(11) NOT NULL COMMENT '服务器状态(0=正常,1=删除)',
  `vc_route_ipaddr` varchar(16) DEFAULT NULL COMMENT '路由地址',
  `l_route_port` int(11) DEFAULT NULL COMMENT '路由端口',
  `vc_route_account` varchar(16) DEFAULT NULL COMMENT '路由帐户',
  `vc_route_passwd` varchar(16) DEFAULT NULL COMMENT '路由口令',
  `vc_jar_name` varchar(16) NOT NULL COMMENT 'jar包',
  `vc_jad_name` varchar(16) NOT NULL COMMENT 'jad包',
  `l_date_begin` int(11) NOT NULL COMMENT '开启日期(YYMMDD)',
  `l_date_end` int(11) NOT NULL COMMENT '关闭日期(YYMMDD)',
  PRIMARY KEY (`l_server_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='配置游戏服务器信息表';

-- --------------------------------------------------------

--
-- 表的结构 `tv_gp_ext_tzwasu`
--

CREATE TABLE IF NOT EXISTS `tv_gp_ext_tzwasu` (
  `vc_user_no` varchar(64) NOT NULL COMMENT '用户编号(外部唯一标识)',
  `vc_stb_id` varchar(128) NOT NULL COMMENT '机顶盒编号',
  `vc_customer_no` varchar(32) NOT NULL COMMENT '客户编号',
  `vc_customer_name` varchar(128) NOT NULL COMMENT '客户名称',
  `l_identify_type` int(11) NOT NULL COMMENT '证件类型（11：身份证，12：护照，13：户口本，14：暂住证，15：军官证，16：学生证，17：教师证，19：警官证，22：工作证，31：营业执照，32：税务登记证，33：工商登记证）',
  `vc_identify_no` varchar(64) NOT NULL COMMENT '证件编号',
  `vc_relation_name` varchar(64) NOT NULL COMMENT '联系人姓名',
  `vc_area_name` varchar(128) NOT NULL COMMENT '地区名称',
  `vc_install_addr` varchar(128) NOT NULL COMMENT '安装地址',
  `vc_stb_type` varchar(128) NOT NULL COMMENT '机顶盒类型',
  `vc_stb_status` varchar(64) NOT NULL COMMENT '机顶盒状态',
  `vc_phone` varchar(64) NOT NULL COMMENT '用户电话',
  `vc_mobile` varchar(64) NOT NULL COMMENT '用户手机',
  `vc_account_no` varchar(64) NOT NULL COMMENT '帐户编号',
  `l_money` int(11) NOT NULL DEFAULT '0' COMMENT '帐户余额',
  `l_date` int(11) NOT NULL COMMENT '更新日期(YYMMDD)',
  `l_time` int(11) NOT NULL COMMENT '更新时间(HHMMSS)',
  PRIMARY KEY (`vc_user_no`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk COMMENT='华数拓展_帐号拓展信息表';

-- --------------------------------------------------------

--
-- 表的结构 `tv_gp_ext_xinjiang`
--

CREATE TABLE IF NOT EXISTS `tv_gp_ext_xinjiang` (
  `vc_user_no` varchar(64) NOT NULL COMMENT '用户编号(外部唯一标识)',
  `vc_stb_id` varchar(128) NOT NULL COMMENT '机顶盒编号',
  `vc_account_no` varchar(32) NOT NULL COMMENT '帐户编号',
  `l_money` int(11) NOT NULL COMMENT '帐户余额',
  `l_payment` int(11) NOT NULL COMMENT '缴费方式',
  `vc_customer_no` varchar(32) NOT NULL COMMENT '客户编号',
  `vc_customer_name` varchar(128) NOT NULL COMMENT '客户名称',
  `vc_stb_type` varchar(128) NOT NULL COMMENT '机顶盒类型',
  `vc_stb_status` varchar(128) NOT NULL COMMENT '机顶盒状态',
  `l_date` int(11) NOT NULL COMMENT '更新日期(YYMMDD)',
  `l_time` int(11) NOT NULL COMMENT '更新时间(HHMMSS)',
  PRIMARY KEY (`vc_user_no`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk COMMENT='新疆省网_帐号扩展信息表';

-- --------------------------------------------------------

--
-- 表的结构 `tv_gp_ext_yunyou`
--

CREATE TABLE IF NOT EXISTS `tv_gp_ext_yunyou` (
  `vc_yunyou_no` varchar(64) NOT NULL COMMENT '云游唯一标识',
  `l_date` int(11) NOT NULL COMMENT '创建日期',
  `l_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`vc_yunyou_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='云游_帐号扩展信息';

-- --------------------------------------------------------

--
-- 表的结构 `tv_gp_logs_order`
--

CREATE TABLE IF NOT EXISTS `tv_gp_logs_order` (
  `l_index` int(11) NOT NULL AUTO_INCREMENT,
  `l_user_id` int(11) NOT NULL COMMENT '亿家游号(唯一)',
  `l_order_id` int(11) NOT NULL COMMENT '会员类型(0=普通,101=铜牌会员,102=银牌会员,103=金牌会员)',
  `l_seconds` int(11) NOT NULL COMMENT '时间(HHMMSS)',
  `l_date` int(11) NOT NULL COMMENT '操作类型(0=退订,1=订购)',
  `l_time` int(11) NOT NULL COMMENT '日期(YYMMDD)',
  PRIMARY KEY (`l_index`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk COMMENT='帐号订购日志' AUTO_INCREMENT=2618 ;

-- --------------------------------------------------------

--
-- 表的结构 `tv_gp_logs_points`
--

CREATE TABLE IF NOT EXISTS `tv_gp_logs_points` (
  `l_index` int(11) NOT NULL AUTO_INCREMENT,
  `l_user_id` int(11) NOT NULL COMMENT '亿家游号',
  `l_lobby_id` int(11) NOT NULL COMMENT '大厅编号',
  `l_source_id` int(11) NOT NULL COMMENT '来源编号(101充值,201玩游戏)',
  `l_game_type` int(11) NOT NULL COMMENT '游戏类型',
  `l_game_id` int(11) NOT NULL COMMENT '游戏编号(0=非游戏中产生)',
  `l_before_coin` int(11) NOT NULL COMMENT '变化前游戏点',
  `l_chg_coin` int(11) NOT NULL COMMENT '变化游戏点',
  `l_coin` int(11) NOT NULL COMMENT '游戏点余额',
  `l_date` int(11) NOT NULL COMMENT '日期(YYMMDD)',
  `l_time` int(11) NOT NULL COMMENT '时间(HHMMSS)',
  PRIMARY KEY (`l_index`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk COMMENT='帐号游戏点记录表' AUTO_INCREMENT=232973 ;

-- --------------------------------------------------------

--
-- 表的结构 `tv_gp_logs_recharge`
--

CREATE TABLE IF NOT EXISTS `tv_gp_logs_recharge` (
  `l_index` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `l_user_id` int(11) NOT NULL COMMENT '亿家游号',
  `l_cp_code` int(11) NOT NULL COMMENT '游戏提供商',
  `l_action_id` int(11) NOT NULL COMMENT '扣费行为编号',
  `l_money` int(11) NOT NULL COMMENT '充值金额(分)',
  `l_date` int(11) NOT NULL COMMENT '日期(YYMMDD)',
  `l_time` int(11) NOT NULL COMMENT '时间(HHMMSS)',
  `vc_serial` char(32) NOT NULL COMMENT '流水号(用户编号（7位到8位），加上格林秒数以及毫秒数)',
  PRIMARY KEY (`l_index`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='帐号扣费记录表' AUTO_INCREMENT=36047 ;

-- --------------------------------------------------------

--
-- 表的结构 `tv_gp_sys_admin`
--

CREATE TABLE IF NOT EXISTS `tv_gp_sys_admin` (
  `l_index` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `vc_account` varchar(32) NOT NULL COMMENT '帐号',
  `vc_password` varchar(32) NOT NULL COMMENT '口令',
  `l_cp_code` int(11) NOT NULL COMMENT '所属游戏商(tv_gp_cfg_cp_info),如果为零,那么是全局帐号',
  `vc_desc` varchar(256) NOT NULL COMMENT '描述',
  `l_date` int(11) NOT NULL COMMENT '创建日期(YYMMDD)',
  `l_time` int(11) NOT NULL COMMENT '创建时间(HHMMSS)',
  `l_status` int(11) NOT NULL COMMENT '状态(0=正常,1=冻结,2=删除)',
  `l_power_id` int(11) NOT NULL COMMENT '权限组号(tv_gp_sys_power)',
  PRIMARY KEY (`l_index`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk COMMENT='2.管理员信息表' AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- 表的结构 `tv_gp_sys_power`
--

CREATE TABLE IF NOT EXISTS `tv_gp_sys_power` (
  `l_power_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组号',
  `vc_name` varbinary(32) NOT NULL COMMENT '名称',
  `vc_func` varbinary(128) NOT NULL COMMENT '功能串(tv_gp_cfg_menu)\r\n            menu_id:menu_id:menu_id',
  `l_status` int(11) NOT NULL COMMENT '状态(0=正常,1=删除)',
  PRIMARY KEY (`l_power_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk COMMENT='管理员权限表' AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `tv_gp_user_game_login`
--

CREATE TABLE IF NOT EXISTS `tv_gp_user_game_login` (
  `l_user_id` int(11) NOT NULL COMMENT '亿家游编号',
  `vc_game_login` varchar(32) NOT NULL COMMENT '游戏列表',
  `l_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`l_user_id`),
  KEY `l_user_id` (`l_user_id`,`vc_game_login`,`l_time`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk COMMENT='帐号游戏足迹';

-- --------------------------------------------------------

--
-- 表的结构 `tv_gp_user_info`
--

CREATE TABLE IF NOT EXISTS `tv_gp_user_info` (
  `l_user_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '亿家游号(唯一)',
  `l_coin` int(11) NOT NULL DEFAULT '50000' COMMENT '游戏点',
  `l_spread` int(11) NOT NULL DEFAULT '0' COMMENT '推广点数',
  `vc_user_no` varchar(64) CHARACTER SET gbk NOT NULL COMMENT '客户编号(对应到OS系统), 换机顶盒后不变',
  `l_lobby_id` int(11) DEFAULT NULL COMMENT '大厅编号,区分用户BOSS来源, 101华数杭州, 102华数省网',
  `vc_nickname` varchar(16) CHARACTER SET gbk NOT NULL COMMENT '用户昵称(唯一)',
  `l_title_id` int(11) NOT NULL DEFAULT '0' COMMENT '头衔编号(0=无头衔)',
  `vc_payment_pwd` varchar(16) CHARACTER SET gbk NOT NULL DEFAULT 'swhs2012' COMMENT '支付密码',
  `l_payment_id` int(11) NOT NULL DEFAULT '1' COMMENT '自动支付(0=口令校验,1=自动支付; 默认1)',
  `l_image_id` int(11) NOT NULL DEFAULT '1' COMMENT '形象编号',
  `l_gender` int(11) NOT NULL DEFAULT '9' COMMENT '性别(0=男,1=女,9=未知)',
  `l_create_date` int(11) NOT NULL COMMENT '创建日期(YYMMDD)',
  `l_create_time` int(11) NOT NULL COMMENT '创建时间(HHMMSS)',
  `l_spread_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属推广员编号(0=没有任何所属, 否则为亿家游号)',
  `l_status` int(11) NOT NULL DEFAULT '0' COMMENT '用户状态(0=正常,1=冻结,2=删除)',
  PRIMARY KEY (`l_user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='帐号信息表, 接口:\r\n 1506, 帐号查询' AUTO_INCREMENT=2512516 ;

-- --------------------------------------------------------

--
-- 表的结构 `tv_gp_user_order`
--

CREATE TABLE IF NOT EXISTS `tv_gp_user_order` (
  `vc_key_id` char(32) NOT NULL COMMENT '键值(''亿家游号(唯一)''+''_''+''游戏编号'')',
  `l_user_id` int(11) NOT NULL COMMENT '亿家游号(唯一)',
  `l_order_id` int(11) NOT NULL COMMENT '订购标识',
  `l_seconds` int(11) NOT NULL COMMENT '有效时长(秒数)',
  `l_order_time` int(11) NOT NULL COMMENT '订购时间(秒数)',
  `l_date` int(11) NOT NULL COMMENT '日期',
  `l_time` int(11) NOT NULL COMMENT '时间',
  PRIMARY KEY (`vc_key_id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk COMMENT='帐号订购信息, 可作为道具使用,游戏订购';

-- --------------------------------------------------------

--
-- 表的结构 `tv_gp_user_quota`
--

CREATE TABLE IF NOT EXISTS `tv_gp_user_quota` (
  `l_user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '亿家游号(唯一)',
  `l_type` int(11) NOT NULL COMMENT '帐号类型(0=测试帐号,1=正式帐号)',
  `l_day_pay` int(11) NOT NULL COMMENT '当日已支付金额(元, $$$YYMMDD)',
  `l_month_pay` int(11) NOT NULL COMMENT '当月已支付金额(元, $$$YYMM)',
  PRIMARY KEY (`l_user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk COMMENT='帐号限额表' AUTO_INCREMENT=20120513 ;

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
