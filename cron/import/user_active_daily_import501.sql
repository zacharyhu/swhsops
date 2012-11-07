/*µº»Îª∂¿÷π»[401]*/
insert into z_user_active(vc_stb_id,l_create_date,l_date,l_source_id) 
select t1.vc_stb_id,t1.vc_create_date,concat( t2.l_date, t2.l_time ),401 
from 
action t1,hlg_wxr_login t2 
where t1.vc_user_id=t2.vc_user_id 
and l_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d')
group by l_date,vc_stb_id;

