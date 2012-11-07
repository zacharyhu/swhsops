/*导入欢乐谷[401]*/
insert into z_user_active(vc_stb_id,l_create_date,l_date,l_source_id) 
select t1.vc_stb_id,t1.vc_create_date,concat( t2.l_date, t2.l_time ),401 
from 
action t1,hlg_login t2 
where t1.vc_user_id=t2.vc_user_id 
and l_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d')
group by l_date,vc_stb_id;

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


/*导入游戏点[201]*/
insert into z_user_active(vc_stb_id,l_create_date,l_date,l_source_id)
SELECT t2.vc_stb_id, t2.vc_create_date, DATE_FORMAT( t1.done_date,'%y%m%d%H%i%S')AS l_date, 201
FROM 
point t1, action t2
WHERE t1.busi_id =202
AND t1.notes !='gameId:158'
AND t2.vc_user_id = t1.member_id
AND t1.done_date between DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 00:00:00') and DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 23:59:59');

/*导入充值[101]*/
insert into z_user_active(vc_stb_id,l_create_date,l_date,l_source_id)
SELECT t2.vc_stb_id, t2.vc_create_date, DATE_FORMAT( t1.done_date,'%y%m%d%H%i%S')AS l_date, 101
FROM 
point t1, action t2
WHERE t1.busi_id =101
AND t2.vc_user_id = t1.member_id
AND t1.done_date between DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 00:00:00') and DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 23:59:59');
