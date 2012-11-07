/*BOSS≥‰÷µ[]*/
insert into dailyreport_boss_cash(l_date,cash_sum,total_num,avg,l_type)
select DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d'),(
(SELECT  sum( chg_game_points )/7500 AS total_cash2
FROM point
WHERE busi_id ='101'
AND done_date between DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 00:00:00') and DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 23:59:59')
AND chg_game_points ='15000')+
(SELECT sum( chg_game_points )/10000 AS total_cash5
FROM point
WHERE busi_id ='101'
AND done_date between DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 00:00:00') and DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 23:59:59')
AND chg_game_points ='50000')+
(SELECT sum( chg_game_points )/12000 AS total_cash10 
FROM point
WHERE busi_id ='101'
AND done_date between DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 00:00:00') and DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 23:59:59')
AND chg_game_points ='120000')
) as total_cash, count(DISTINCT member_id )AS total_num,(
(SELECT  sum( chg_game_points )/7500 AS total_cash2
FROM point
WHERE busi_id ='101'
AND done_date between DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 00:00:00') and DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 23:59:59')
AND chg_game_points ='15000')+
(SELECT sum( chg_game_points )/10000 AS total_cash5
FROM point
WHERE busi_id ='101'
AND done_date between DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 00:00:00') and DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 23:59:59')
AND chg_game_points ='50000')+
(SELECT sum( chg_game_points )/12000 AS total_cash10
FROM point
WHERE busi_id ='101'
AND done_date between DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 00:00:00') and DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 23:59:59')
AND chg_game_points ='120000')
)/count(DISTINCT member_id ) as avg,'1'
FROM point
WHERE busi_id ='101'
AND done_date between DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 00:00:00') and DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 23:59:59');
