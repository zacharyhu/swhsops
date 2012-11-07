insert into dailyreport_game_play(l_date,l_gid,l_game_name,total_num,user_num,avg_num,game_points,cash_sum)
SELECT DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d') as l_date,t1.game_id,t2.l_game_name,t1.total_num,t1.user_num,t1.total_num/t1.user_num,t1.chg_points,'0' FROM gp_chg_daily t1, gp_game_info t2
where t1.l_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d')
and t1.game_id=t2.l_game_id;

update dailyreport_game_play set total_num=(SELECT count(vc_user_id ) FROM  hlg_login WHERE l_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d')),user_num=(SELECT count(DISTINCT vc_user_id ) FROM  hlg_login WHERE l_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d')),avg_num=(SELECT count(vc_user_id ) FROM  hlg_login WHERE l_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d'))/(SELECT count(DISTINCT vc_user_id ) FROM  hlg_login WHERE l_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d'))   where l_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d') and l_gid=250;



