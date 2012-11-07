insert into dailyreport_vip_data(l_date,mon_points,mon_num,coin_points,coin_num,ingame_num,incash_num,cash)
select DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d') as l_date,
(SELECT sum( chg_game_points ) as total_points
FROM `point` 
WHERE chg_game_points =100000
AND notes ="gameId:158"
AND done_date between DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 00:00:00') and DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 23:59:59')) as mon_points,
(SELECT count(*) as num
FROM `point` 
WHERE chg_game_points =100000
AND notes ="gameId:158"
AND done_date between DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 00:00:00') and DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 23:59:59')) as mon_num,
(SELECT sum( chg_game_points )AS total_points
FROM `point` 
WHERE chg_game_points !=100000
AND done_date between DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 00:00:00') and DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 23:59:59')
AND notes ="gameId:158") as coin_points,
(SELECT count(DISTINCT member_id )AS num
FROM `point` 
WHERE chg_game_points !=100000
AND done_date between DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 00:00:00') and DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 23:59:59')
AND notes ="gameId:158") as coin_num,
(select count(distinct t1.member_id) 
from 
(select distinct member_id from point where done_date between DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 00:00:00') and DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 23:59:59') and notes='gameId:158') 
as t1,point t2 
where t2.done_date between DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 00:00:00') and DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 23:59:59') 
and t2.notes!='gameId:158' 
and t2.busi_id=202
and t1.member_id=t2.member_id) as ingame_num,
(select count(distinct t2.member_id) 
FROM  point t1,gp_recharge_his t2
WHERE t1.member_id=t2.member_id
and   t1.notes='gameId:158'
AND t1.done_date BETWEEN DATE_FORMAT( DATE_SUB( CURDATE() ,INTERVAL 1  DAY) ,'%Y/%m/%d 00:00:00')  AND DATE_FORMAT( DATE_SUB( CURDATE() ,INTERVAL 1  DAY) ,'%Y/%m/%d 23:59:59')
and t2.l_date=date_format(DATE_SUB( CURDATE() ,INTERVAL 1  DAY) ,'%y%m%d')) as incash_num,
(select sum(t2.l_money) 
FROM  point t1,gp_recharge_his t2
WHERE t1.member_id=t2.member_id
and   t1.notes='gameId:158'
AND t1.done_date BETWEEN DATE_FORMAT( DATE_SUB( CURDATE() ,INTERVAL 1  DAY) ,'%Y/%m/%d 00:00:00')  AND DATE_FORMAT( DATE_SUB( CURDATE() ,INTERVAL 1  DAY) ,'%Y/%m/%d 23:59:59')
and t2.l_date=date_format(DATE_SUB( CURDATE() ,INTERVAL 1  DAY) ,'%y%m%d')) as cash_sum
;

