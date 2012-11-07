/*import the selected user info*/

insert into dailyreport_user_activity(`l_date`,`active`,`active2`,`active3`,`active4`,`stay`,`stay3`,`stay7`,`stay15`,`stay30`,`newnum`,`newnum_play`)  
select 
DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d') as l_date,
(SELECT count(DISTINCT vc_stb_id ) 
FROM z_user_active
WHERE left(l_date,6)=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d'))  as active,
(select count(*) as active2 from (
  select vc_stb_id, count(vc_stb_id) as num from (
     select vc_stb_id, l_date from z_user_active
      where left( l_date, 6) between DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY),'%y%m%d') and DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d')
      group by vc_stb_id,left(l_date,6)
  ) as t1
  group by vc_stb_id 
) as t2
where num = 2)  as active2,
(select count(*) from (
  select vc_stb_id, count(vc_stb_id) as num from (
     select vc_stb_id, l_date from z_user_active
      where left( l_date, 6)  between DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY),'%y%m%d') and DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d')
      group by vc_stb_id,left(l_date,6)
  ) as t1
  group by vc_stb_id 
) as t2
where num = 2) as active3,
(select count(*)  from (
  select vc_stb_id, count(vc_stb_id) as num from (
     select vc_stb_id, l_date from z_user_active
      where left( l_date, 6)  between DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY),'%y%m%d') and DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d')
      group by vc_stb_id,left(l_date,6)
  ) as t1
  group by vc_stb_id 
) as t2
where num = 2) as active4,
(select
(select count(distinct vc_stb_id) 
from z_user_active  
where left(l_date,6)=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d') and left(l_create_date,6)=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY),'%y%m%d'))
/
(select count(distinct vc_stb_id) 
from z_user_active 
where left(l_create_date,6)=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY),'%y%m%d'))) as stay,
(select
(select count(distinct vc_stb_id) 
from z_user_active  
where left(l_date,6)=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d') and left(l_create_date,6)=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY),'%y%m%d'))
/
(select count(distinct vc_stb_id) 
from z_user_active 
where left(l_create_date,6)=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d'))) as stay3,
(select
(select count(distinct vc_stb_id) 
from z_user_active  
where left(l_date,6)=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d') and left(l_create_date,6)=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY),'%y%m%d'))
/
(select count(distinct vc_stb_id) 
from z_user_active 
where left(l_create_date,6)=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d'))) as stay7,
(select
(select count(distinct vc_stb_id) 
from z_user_active  
where left(l_date,6)=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d') and left(l_create_date,6)=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 16 DAY),'%y%m%d'))
/
(select count(distinct vc_stb_id) 
from z_user_active 
where left(l_create_date,6)=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d'))) as stay15,
(select
(select count(distinct vc_stb_id) 
from z_user_active  
where left(l_date,6)=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d') and left(l_create_date,6)=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 31 DAY),'%y%m%d'))
/
(select count(distinct vc_stb_id) 
from z_user_active 
where left(l_create_date,6)=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d'))) as stay30,
(SELECT count(DISTINCT vc_stb_id ) FROM `action` WHERE left(vc_create_date,6)=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d')) as new_num,
(SELECT count(DISTINCT vc_stb_id ) 
FROM z_user_active
WHERE left( l_create_date, 6)=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d')
AND left( l_date, 6)=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d')) as new_active;
