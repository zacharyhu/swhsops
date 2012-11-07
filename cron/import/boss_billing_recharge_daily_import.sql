/*BOSS≥‰÷µ[]*/
insert into dailyreport_boss_cash(l_date,cash_sum,total_num,avg,l_type)
SELECT DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d'),sum(l_money)/100,count(distinct vc_stb_id),sum(l_money)/100/count(distinct vc_stb_id),l_sp_code FROM `gp_new_recharge` WHERE l_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d') group by l_sp_code;
