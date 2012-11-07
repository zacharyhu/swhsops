
insert into gp_recharge_his(vc_stb_id,member_id,l_money,l_date,l_time,l_type)
select t1.vc_stb_id,t2.member_id,t1.l_money/100,t1.l_date,t1.l_time,t1.l_sp_code 
from gp_new_recharge t1,gp_user_info t2
where t1.vc_stb_id=t2.vc_stb_id
and t1.l_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d');

insert into gp_recharge_his(vc_stb_id,member_id,l_money,l_date,l_time,l_type)
SELECT t2.vc_stb_id, t1.member_id, t1.`chg_game_points`/12000, date_format( t1.done_date,'%y%m%d') , date_format( t1.done_date,'%H%i%S'),'101'
FROM point t1, gp_user_info t2
WHERE t1.member_id = t2.member_id
AND t1.busi_id ='101'
AND t1.chg_game_points ='120000'
AND t1.done_date between DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 00:00:00') 
and DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 23:59:59'); 

insert into gp_recharge_his(vc_stb_id,member_id,l_money,l_date,l_time,l_type)
SELECT t2.vc_stb_id, t1.member_id, t1.`chg_game_points`/10000, date_format( t1.done_date,'%y%m%d') , date_format( t1.done_date,'%H%i%S'),'101'
FROM  point  t1, gp_user_info t2
WHERE t1.member_id = t2.member_id
AND t1.busi_id ='101'
AND t1.chg_game_points ='50000'
AND t1.done_date  between DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 00:00:00') 
and DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 23:59:59');

insert into gp_recharge_his(vc_stb_id,member_id,l_money,l_date,l_time,l_type)
SELECT t2.vc_stb_id, t1.member_id, t1.`chg_game_points`/7500, date_format( t1.done_date,'%y%m%d') , date_format( t1.done_date,'%H%i%S'),'101'
FROM  point t1, gp_user_info t2
WHERE t1.member_id = t2.member_id
AND t1.busi_id ='101'
AND t1.chg_game_points ='15000'
AND t1.done_date between DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 00:00:00') 
and DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 23:59:59'); 
