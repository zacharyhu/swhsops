#!?bin/bash





DATE=`date -d -1day +%y%m%d`

mysql -h125.210.228.137 -N -pswhs2012 datacenter -e "SELECT user_id,grade,date  FROM event_501 where date=$DATE order by grade desc"| mutt -s "event_501_marj_grade_$DATE" huzhiwei01@yunyou.tv,mashiliang@yunyou.tv,yangsd@wasu.com.cn
