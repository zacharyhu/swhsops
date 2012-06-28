-- phpMyAdmin SQL Dump
-- version 2.10.3
-- http://www.phpmyadmin.net
-- 
-- 主机: 125.210.228.137
-- 生成日期: 2012 年 06 月 28 日 17:18
-- 服务器版本: 5.0.77
-- PHP 版本: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- 数据库: `moniter`
-- 

-- --------------------------------------------------------

-- 
-- 表的结构 `mon_port`
-- 

CREATE TABLE `mon_port` (
  `index` int(5) NOT NULL auto_increment COMMENT '编号',
  `host` varchar(50) character set utf8 NOT NULL COMMENT '主机ip',
  `port` varchar(10) character set utf8 NOT NULL COMMENT '端口port',
  `item` varchar(50) character set utf8 NOT NULL COMMENT '用途',
  `time` timestamp NOT NULL default '0000-00-00 00:00:00' on update CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY  (`index`),
  KEY `host` (`host`,`port`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=26 ;

-- 
-- 导出表中的数据 `mon_port`
-- 

INSERT INTO `mon_port` VALUES (1, '125.210.228.56', '22', 'ssh端口', '2012-06-28 16:13:18');
INSERT INTO `mon_port` VALUES (2, '125.210.228.56', '3306', 'mysql数据库端口', '2012-06-28 16:13:29');
INSERT INTO `mon_port` VALUES (3, '125.210.228.56', '80', 'http端口', '2012-06-28 16:13:37');
INSERT INTO `mon_port` VALUES (4, '125.210.228.56', '81', '游戏X端口81', '2012-06-28 16:13:47');
INSERT INTO `mon_port` VALUES (5, '10.48.179.106', '8501', '百变双扣', '0000-00-00 00:00:00');
INSERT INTO `mon_port` VALUES (6, '10.48.179.106', '8502', '翻翻棋', '0000-00-00 00:00:00');
INSERT INTO `mon_port` VALUES (7, '10.48.179.106', '8503', '欢乐谷2', '0000-00-00 00:00:00');
INSERT INTO `mon_port` VALUES (8, '10.48.179.106', '8504', '欢乐谷', '0000-00-00 00:00:00');
INSERT INTO `mon_port` VALUES (9, '10.48.179.106', '8505', '领工资', '0000-00-00 00:00:00');
INSERT INTO `mon_port` VALUES (10, '10.48.179.106', '8506', '接金币', '0000-00-00 00:00:00');
INSERT INTO `mon_port` VALUES (11, '10.48.179.106', '8507', '三英战吕布', '0000-00-00 00:00:00');
INSERT INTO `mon_port` VALUES (12, '10.48.179.106', '8508', '四国军棋', '0000-00-00 00:00:00');
INSERT INTO `mon_port` VALUES (13, '10.48.179.106', '8509', '五子棋', '0000-00-00 00:00:00');
INSERT INTO `mon_port` VALUES (14, '10.48.179.106', '8510', '幸运大转盘', '0000-00-00 00:00:00');
INSERT INTO `mon_port` VALUES (15, '10.48.179.106', '8511', '炸金花', '0000-00-00 00:00:00');
INSERT INTO `mon_port` VALUES (16, '10.48.179.106', '8601', '亿家游麻将', '0000-00-00 00:00:00');
INSERT INTO `mon_port` VALUES (17, '10.48.179.106', '8602', '斗地主', '0000-00-00 00:00:00');
INSERT INTO `mon_port` VALUES (18, '10.48.179.106', '8603', '飞行棋', '0000-00-00 00:00:00');
INSERT INTO `mon_port` VALUES (19, '10.48.179.106', '8604', '关牌', '0000-00-00 00:00:00');
INSERT INTO `mon_port` VALUES (20, '10.48.179.106', '8605', '杭麻', '0000-00-00 00:00:00');
INSERT INTO `mon_port` VALUES (21, '10.48.179.106', '8606', '牛牛', '0000-00-00 00:00:00');
INSERT INTO `mon_port` VALUES (22, '10.48.179.106', '8607', '三扣一', '0000-00-00 00:00:00');
INSERT INTO `mon_port` VALUES (23, '10.48.179.106', '8608', '双扣', '0000-00-00 00:00:00');
INSERT INTO `mon_port` VALUES (24, '10.48.179.106', '8609', '梭哈', '0000-00-00 00:00:00');
INSERT INTO `mon_port` VALUES (25, '10.48.179.106', '8610', '象棋', '0000-00-00 00:00:00');
