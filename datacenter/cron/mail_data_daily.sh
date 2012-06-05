#!/bin/bash


DATE=`date -d -1day +%y%m%d`
LOGFILE=/cron/log/data.$DATE.log

mysql -h125.210.228.137 -pswhs2012 datacenter -e "select * from dailyreport_user_activity where date=$DATE" >>$LOGFILE
mysql -h125.210.228.137 -pswhs2012 datacenter -e "select * from dailyreport_boss_cash where l_date=$DATE" >>$LOGFILE
mysql -h125.210.228.137 -pswhs2012 datacenter -e "select * from dailyreport_vip_data where date=$DATE" >>$LOGFILE
mysql -h125.210.228.137 -pswhs2012 datacenter -e "select * from dailyreport_game_info where date=$DATE" >>$LOGFILE
mysql -h125.210.228.137 -pswhs2012 datacenter -e "select count(*) from z_visit_log where v_time between DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 00:00:00') and DATE_FORMAT(CURDATE(), '%Y/%m/%d 00:00:00');" >>$LOGFILE
cat $LOGFILE |mutt -s "data_$DATE" huzhiwei01@yunyou.tv
