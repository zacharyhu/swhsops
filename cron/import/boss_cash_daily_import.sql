/*BOSS≥‰÷µ[]*/
insert into dailyreport_boss_cash(l_date,cash_sum,total_num,avg,l_type)
select DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d'),sum(l_money),count(distinct member_id),sum(l_money)/count(distinct member_id),'101' 
from gp_recharge_his
where l_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d') and l_type='101'
