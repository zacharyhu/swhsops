insert into dailyreport_vip_data(date,mon_points,mon_num,coin_points,coin_num,ingame_num,incash_num,cash)
select DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d') as date,
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
(select count(distinct t1.member_id) 
from 
(select distinct member_id from point where done_date between DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 00:00:00') and DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 23:59:59') and notes='gameId:158') 
as t1,point t2 
where t2.done_date between DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 00:00:00') and DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 23:59:59')
and t2.notes!='gameId:158' 
and t2.busi_id=101
and t1.member_id=t2.member_id) as incash_num,
(select (
(SELECT  sum(t2.chg_game_points )/7500 AS total_cash2
FROM 
(select distinct member_id from point where done_date between DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 00:00:00') and DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 23:59:59') and notes='gameId:158') 
as t1,point t2
WHERE t2.busi_id ='101'
AND t2.done_date between DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 00:00:00') and DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 23:59:59')
AND t2.chg_game_points ='15000'
AND t1.member_id=t2.member_id)
+
(SELECT sum(t2.chg_game_points )/10000 AS total_cash5
FROM 
(select distinct member_id from point where done_date between DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 00:00:00') and DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 23:59:59') and notes='gameId:158') 
as t1,point t2
WHERE t2.busi_id ='101'
AND t2.done_date between DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 00:00:00') and DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 23:59:59')
AND t2.chg_game_points ='50000'
AND t1.member_id=t2.member_id)
+
(SELECT sum(t2.chg_game_points )/12000 AS total_cash10 
FROM 
(select distinct member_id from point where done_date between DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 00:00:00') and DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 23:59:59') and notes='gameId:158') 
as t1,point t2
WHERE t2.busi_id ='101'
AND t2.done_date between DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 00:00:00') and DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 23:59:59')
AND t2.chg_game_points ='120000'
AND t1.member_id=t2.member_id)
) as total_cash
FROM point
WHERE busi_id ='101'
AND done_date between DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 00:00:00') and DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 23:59:59') limit 1) as cash;
