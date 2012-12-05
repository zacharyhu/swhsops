#!/bin/bash

#xinjiang data daily insert
DATE=`date -d -1day +%y%m%d`
rechargefile=/cron/data/recharg.txt
#####insert gp_chg_daily#############
echo "insert into xj_data_game_point (SELECT l_date,l_game_id,l_game_type,count(*),count(distinct l_user_id),sum(l_chg_coin) FROM tv_gp_logs_points WHERE l_date=${DATE} group by l_game_id)" |mysql -h10.48.179.112 -utvgp -ptvgp tvgame

###########insert cash recharge daily##############
echo "SELECT l_date,sum(l_money)/100,count(distinct l_user_id),sum(l_money)/100/count(distinct l_user_id) from tv_gp_logs_recharge where l_date=${DATE}" |mysql -h10.48.179.112 -utvgp -ptvgp tvgame -N >>$rechargefile
echo "LOAD DATA LOCAL INFILE '${rechargefile}' replace into table tvgame.xj_data_recharge" |mysql -h10.48.179.112 -utvgp -ptvgp tvgame
####datacenter insert recharge############
awk '{print "insert into datacenter.dailyreport_boss_cash set l_date=\""$1"\",cash_sum=\""$2"\",total_num=\""$3"\",avg=\""$4"\",l_type=\"991\";"}' ${rechargefile}  |mysql -h10.48.179.112 -udc -pdc datacenter
rm -rf $rechargefile

############user action insert#################################
echo "insert into xj_data_user(l_date,l_new_user,l_login_user,l_recharge_user,l_stay_1,l_stay_3,l_stay_7,l_stay_15,l_stay_30)
select DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d') as date,
(SELECT count(distinct l_user_id) FROM tv_gp_user_info WHERE l_create_date=${DATE}) as new_num,
(SELECT count(distinct vc_stb_id) FROM xj_gate_login WHERE  l_date=${DATE}) as login_num,
(SELECT count(distinct l_user_id)  FROM  tv_gp_logs_recharge where l_date=${DATE}) as recharge_num,
(select (SELECT count(distinct t3.vc_stb_id)
FROM 
tv_gp_ext_xinjiang t1, tv_gp_user_info t2, xj_gate_login t3
where
t1.vc_user_no=t2.vc_user_no
and t1.vc_stb_id=t3.vc_stb_id
and t2.l_create_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY),'%y%m%d')
and t3.l_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d'))
/
(SELECT count(distinct t2.l_user_id)
FROM 
tv_gp_ext_xinjiang t1, tv_gp_user_info t2
where
t1.vc_user_no=t2.vc_user_no
and t2.l_create_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY),'%y%m%d'))) as stay1,
(select (SELECT count(distinct t3.vc_stb_id)
FROM 
tv_gp_ext_xinjiang t1, tv_gp_user_info t2, xj_gate_login t3
where
t1.vc_user_no=t2.vc_user_no
and t1.vc_stb_id=t3.vc_stb_id
and t2.l_create_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY),'%y%m%d')
and t3.l_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d'))
/
(SELECT count(distinct t2.l_user_id)
FROM 
tv_gp_ext_xinjiang t1, tv_gp_user_info t2
where
t1.vc_user_no=t2.vc_user_no
and t2.l_create_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY),'%y%m%d'))) as stay3,
(select (SELECT count(distinct t3.vc_stb_id)
FROM 
tv_gp_ext_xinjiang t1, tv_gp_user_info t2, xj_gate_login t3
where
t1.vc_user_no=t2.vc_user_no
and t1.vc_stb_id=t3.vc_stb_id
and t2.l_create_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY),'%y%m%d')
and t3.l_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d'))
/
(SELECT count(distinct t2.l_user_id)
FROM 
tv_gp_ext_xinjiang t1, tv_gp_user_info t2
where
t1.vc_user_no=t2.vc_user_no
and t2.l_create_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY),'%y%m%d'))) as stay7,
(select (SELECT count(distinct t3.vc_stb_id)
FROM 
tv_gp_ext_xinjiang t1, tv_gp_user_info t2, xj_gate_login t3
where
t1.vc_user_no=t2.vc_user_no
and t1.vc_stb_id=t3.vc_stb_id
and t2.l_create_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 16 DAY),'%y%m%d')
and t3.l_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d'))
/
(SELECT count(distinct t2.l_user_id)
FROM 
tv_gp_ext_xinjiang t1, tv_gp_user_info t2
where
t1.vc_user_no=t2.vc_user_no
and t2.l_create_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 16 DAY),'%y%m%d'))) as stay15,
(select (SELECT count(distinct t3.vc_stb_id)
FROM 
tv_gp_ext_xinjiang t1, tv_gp_user_info t2, xj_gate_login t3
where
t1.vc_user_no=t2.vc_user_no
and t1.vc_stb_id=t3.vc_stb_id
and t2.l_create_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 31 DAY),'%y%m%d')
and t3.l_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d'))
/
(SELECT count(distinct t2.l_user_id)
FROM 
tv_gp_ext_xinjiang t1, tv_gp_user_info t2
where
t1.vc_user_no=t2.vc_user_no
and t2.l_create_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 31 DAY),'%y%m%d'))) as stay30" |mysql -h10.48.179.112 -utvgp -ptvgp tvgame

###=======================================================##

echo "
insert into datacenter.dailyreport_game_play(l_date,l_gid,l_game_name,total_num,user_num,avg_num,game_points,l_source)
SELECT t1.l_date,t1.l_game_id,t2.game_name,t1.l_sum,t1.l_num,t1.l_sum/t1.l_num,l_gp_change,'105'
FROM tvgame.xj_data_game_point t1,datacenter.gp_gameid_cfg t2
WHERE 
t1.l_game_id=t2.game_id
and t1.l_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d')" |mysql -h10.48.179.112 -udc -pdc 



