insert into dailyreport_game_info(l_date,total_p,niu_p,niu_n,marj_p,marj_n,bbsk_p,bbsk_n,sk_p,sk_n,sk1_p,sk1_n,hlg_p,hlg_n,mxd_cash,mxd_n)
select DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d') as date,
(SELECT sum(chg_points) FROM gp_chg_daily WHERE l_date = DATE_FORMAT(DATE_SUB(CURDATE(),INTERVAL 1 DAY),'%y%m%d') AND game_id NOT LIKE '40%' AND game_id != '999') as total_p,
(SELECT chg_points  FROM `gp_chg_daily` WHERE l_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d') and `game_id`='306') as niu_p,
(SELECT user_num FROM `gp_chg_daily` WHERE l_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d') and `game_id`='306') as niu_n,
(SELECT chg_points FROM `gp_chg_daily` WHERE l_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d') and `game_id`='305') as marj_p,
(SELECT user_num FROM `gp_chg_daily` WHERE l_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d') and `game_id`='305') as marj_n,
(SELECT chg_points FROM `gp_chg_daily` WHERE l_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d') and `game_id`='230') as bbsk_p,
(SELECT user_num FROM `gp_chg_daily` WHERE l_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d') and `game_id`='230') as bbsk_n,
(SELECT chg_points FROM `gp_chg_daily` WHERE l_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d') and `game_id`='308') as sk_p,
(SELECT user_num FROM `gp_chg_daily` WHERE l_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d') and `game_id`='308') as sk_n,
(SELECT chg_points FROM `gp_chg_daily` WHERE l_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d') and `game_id`='307') as sk1_p,
(SELECT user_num FROM `gp_chg_daily` WHERE l_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d') and `game_id`='307') as sk1_n,
(SELECT chg_points FROM `gp_chg_daily` WHERE l_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d') and `game_id`='250') as hlg_p,
(SELECT count(DISTINCT vc_user_id ) FROM  hlg_login WHERE l_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d')) as hlg_n,
(SELECT sum(l_coin)/100 as mxd_cash FROM `TCoinLog` where l_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d')) as mxd_cash,
(SELECT count(distinct vc_userid) as mxd_num FROM `TCoinLog` where l_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d')) as mxd_n;