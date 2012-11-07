
#!/bin/bash


DATE=`date -d -1day +%y%m%d`
LOGFILE=/cron/mail/daily/data.$DATE.log


echo "===========daily report=================================">>$LOGFILE
mysql -h10.48.179.112 -udc -pdc datacenter --default-character-set=utf8 -e "select * from dailyreport_user_activity where l_date=$DATE" >>$LOGFILE
mysql -h10.48.179.112 -udc -pdc datacenter --default-character-set=utf8 -e "SELECT t1.*, t2.name FROM dailyreport_boss_cash t1, gp_recharge_cp t2 WHERE t1.l_date =$DATE  AND t1.l_type = t2.l_type" >>$LOGFILE
mysql -h10.48.179.112 -udc -pdc datacenter --default-character-set=utf8 -e "select * from dailyreport_vip_data where l_date=$DATE" >>$LOGFILE
mysql -h10.48.179.112 -udc -pdc datacenter --default-character-set=utf8 -e "select * from dailyreport_game_info where l_date=$DATE" >>$LOGFILE
mysql -h10.48.179.112 -udc -pdc datacenter --default-character-set=utf8 -e "select * from dailyreport_game_play where l_date=$DATE" >>$LOGFILE
mysql -h10.48.179.112 -udc -pdc datacenter --default-character-set=utf8 -e "select count(*) from z_visit_log where v_time between DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 00:00:00') and DATE_FORMAT(CURDATE(), '%Y/%m/%d 00:00:00');" >>$LOGFILE
echo "======================total cash==================" >>$LOGFILE
mysql -h10.48.179.112 -udc -pdc datacenter -e "SELECT sum(cash_sum) FROM dailyreport_boss_cash WHERE l_date=$DATE" >>$LOGFILE
echo "==========lucky=====">>$LOGFILE
mysql -h10.48.179.112 -udc -pdc datacenter -e "SELECT chg_points,user_num FROM gp_chg_daily where l_date=$DATE and game_id=246" >>$LOGFILE

echo "========================top 3 recharge=============================" >>$LOGFILE
mysql -h10.48.179.112 -udc -pdc datacenter -e "SELECT t1.member_id,sum(t1.chg_game_points),t2.vc_stb_id FROM point t1,action t2 WHERE t1.member_id=t2.vc_user_id and t1.done_date between DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%Y/%m/%d 00:00:00') and DATE_FORMAT(CURDATE(), '%Y/%m/%d 00:00:00') and t1.busi_id='101' group by t1.member_id  order by sum(t1.chg_game_points) desc limit 3;"   >> $LOGFILE

echo "=========================active gate login=================================" >>$LOGFILE
mysql -h10.48.179.112 -udc -pdc datacenter -e "SELECT l_date, l_gate, count(DISTINCT vc_stb_id )  FROM gp_gate_login where l_date=$DATE GROUP BY l_date, l_gate" >> $LOGFILE
mysql -h10.48.179.112 -udc -pdc datacenter -e "SELECT l_date,count(DISTINCT vc_stb_id )  FROM gp_gate_login where l_date=$DATE " >> $LOGFILE


echo "========================game info=============================" >>$LOGFILE
mysql -h10.48.179.112 -udc -pdc datacenter  --default-character-set=utf8 -e "SELECT t1.l_date ,t2.game_id,t2.game_desc,t1.chg_points,t1.user_num,t1.total_num FROM gp_chg_daily t1, gp_gameid_cfg t2 WHERE t1.l_date=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY),'%y%m%d') AND t1.game_id = t2.game_id;"  >>$LOGFILE



cat $LOGFILE |mutt -s "data_$DATE" huzhiwei01@yunyou.tv,liwarn@yunyou.tv,mashiliang@yunyou.tv
