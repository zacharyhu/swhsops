/*导入领工资[301]*/
insert into z_user_active(vc_stb_id,l_create_date,l_date,l_source_id) 
select t1.vc_stb_id,t1.vc_create_date,DATE_FORMAT(t2.done_date,'%y%m%d%H%i%S') as l_date,301 
from 
action t1,point t2 
where 
t1.vc_user_id=t2.member_id 
and t2.notes='gameId:158'
AND t2.done_date between DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 00:00:00') and DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 23:59:59') 
group by l_date,vc_stb_id;


