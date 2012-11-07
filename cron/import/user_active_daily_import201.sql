/*导入游戏点[201]*/
insert into z_user_active(vc_stb_id,l_create_date,l_date,l_source_id)
SELECT t2.vc_stb_id, t2.vc_create_date, DATE_FORMAT( t1.done_date,'%y%m%d%H%i%S')AS l_date, 201
FROM 
point t1, action t2
WHERE t1.busi_id =202
AND t1.notes !='gameId:158'
AND t2.vc_user_id = t1.member_id
AND t1.done_date between DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 00:00:00') and DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 23:59:59');

