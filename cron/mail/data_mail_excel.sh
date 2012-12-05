
#!/bin/bash


DATE=`date -d -1day +%y%m%d`
LOGFILE=/cron/mail/daily/data.$DATE.excel.log
myquery="mysql -h10.48.179.112 -udc -pdc datacenter -N"
gameid=(306 313 305 246 230 308 307 250)
cpid=(991 101 501 201 502 503 204 207 205 202)



echo "select * from  dailyreport_user_activity where l_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d')"|$myquery >>$LOGFILE
echo "select sum(cash_sum) from  dailyreport_boss_cash where l_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d')"|$myquery >>$LOGFILE


for ((i=0;i<${#cpid[*]};i++))
do
    echo "select cash_sum,total_num,avg from dailyreport_boss_cash where l_type=${cpid[$i]} and l_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d')" |$myquery >>$LOGFILE
done


echo "select mon_points,mon_num,coin_points,coin_num,ingame_num,incash_num,cash from  dailyreport_vip_data where l_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d')"|$myquery >>$LOGFILE


echo "select sum(chg_points) from gp_chg_daily where game_id not like '4%' and game_id !='999' and l_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d')"|$myquery >>$LOGFILE

for ((i=0;i<${#gameid[*]};i++))
do
 echo "select sum(game_points),sum(user_num) from dailyreport_game_play where l_gid=${gameid[$i]}  and l_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d')" |$myquery  >>$LOGFILE
done

echo "SELECT count(*) FROM gp_gate_login WHERE l_date =DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d')"|$myquery >>$LOGFILE

sed -i -e 's/\s\+/\n/g' $LOGFILE

cat $LOGFILE |mutt -s "data_$DATE" huzhiwei01@yunyou.tv,liwarn@yunyou.tv,mashiliang@yunyou.tv
