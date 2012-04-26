insert into gp_chg_daily(date,game_id,chg_points,user_num) 
select DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d') as date,
substring(notes,8,10) as game_id,sum(chg_game_points) as chg_points,
count(distinct member_id) as num 
from 
point  
where  
done_date between DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 00:00:00') and DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 23:59:59') 
and notes!='gameId:0' and notes!='' and notes!='gameId:158'
group by notes;
