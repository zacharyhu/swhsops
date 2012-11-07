#!/bin/bash
#auth huzhiwei

DATE_TODAY=`date +%Y%m%d`
DATE_YES=`date -d -1day +%Y-%m-%d`
DATE_SEL=`date -d -1day +%y%m%d`
DATA_DIR=/data/userdata/
DATA_TODAY=/data/userdata/$DATE_TODAY


cd $DATA_TODAY



sql=$DATA_TODAY/$DATE_TODAY.sql
sql3=/cron/import/gp_chg_daily_import.sql
sql4=/cron/import/user_report_daily_import.sql
sql6=/cron/import/vip_daily_import.sql
sql7=/cron/import/game_daily_import.sql
sql13=/cron/import/recharge_daily_import.sql
sql8=/cron/import/boss_billing_recharge_daily_import.sql
sql5=/cron/import/boss_cash_daily_import.sql
sqlu1=/cron/import/user_active_daily_import101.sql
sqlu2=/cron/import/user_active_daily_import201.sql
sqlu3=/cron/import/user_active_daily_import301.sql
sqlu4=/cron/import/user_active_daily_import401.sql
file1=$DATA_TODAY/data_action_$DATE_YES.csv
file2=$DATA_TODAY/data_point_$DATE_YES.csv
file3=$DATA_TODAY/data_userinfo_$DATE_YES.csv
db8633=/data/gamedata/game_single/huanlegu/singlegame/login.db3
dbgame=/data/gamedata/game_all/game_value_busi.db
dbwxr=/data/gamedata/game_cash/login.db3
sql15=/cron/import/game_gp_daily_import.sql

db172=/data/gamedata/game_single/lucky/Ttable.db
sql_lucky=$DATA_TODAY/lucky_$DATE_TODAY.sql




if [ -e $sql ];then
rm -rf $sql
echo "rm the exist sql...$sql"
else
echo "no $sql"
fi


#新框架游戏在线记录
echo "select * from tv_gp_user_game_value_busi where l_date="$DATE_SEL";" |/usr/bin/sqlite3 $dbgame |awk -F\| '{print "insert into game_value VALUE(\""$1"\",\""$2"\",\""$3"\",\""$4"\",\""$5"\",\""$6"\",\""$7"\",\""$8"\",\""$9"\",\""$10"\",\""$11"\",\""$12"\");"}'  >>$sql
echo "select * from tv_gp_user_game_online_busi where l_date="$DATE_SEL";" |/usr/bin/sqlite3 $dbgame |awk -F\| '{print "insert into game_online VALUE(\""$1"\",\""$2"\",\""$3"\",\""$4"\",\""$5"\");"}' >>$sql
#欢乐谷游戏点及登录记录
echo "select * from TUserLogin where l_date="$DATE_SEL";" |/usr/bin/sqlite3 $db8633 |awk -F\| '{print "insert into hlg_login VALUE(\""$1"\",\""$2"\",\""$3"\",\""$4"\");"}' >>$sql
echo "select * from TUserCoin where l_date="$DATE_SEL";" |/usr/bin/sqlite3 $db8633 |awk -F\| '{print "insert into hlg_coin VALUE(\""$1"\",\""$2"\",\""$3"\",\""$4"\",\""$5"\");"}' >>$sql
echo "select * from TUserLogin where l_date="$DATE_SEL";" |/usr/bin/sqlite3 $dbwxr |awk -F\| '{print "insert into hlg_login VALUE(\""$1"\",\""$2"\",\""$3"\",\""$4"\");"}'   >>$sql
#每日新充值记录录入
mysql -h10.48.179.112 -urecharge -pswhsrecharge billing_recharge -N -e"select * from tv_gp_ext_recharge_wasu where l_date=$DATE_SEL;" |awk  '{print "insert into gp_new_recharge VALUE(\""$1"\",\""$2"\",\""$3"\",\""$4"\",\""$5"\",\""$6"\",\""$7"\");"}' >>$sql
#oracle数据库中新用户注册及游戏点变化记录录入
awk -F, '{print "insert into action VALUE(\""$1"\",\""$2"\",\""$3"\");"}' $file1 >>$sql
awk -F, '{print "insert into point VALUE(\""$1"\",\""$2"\",\""$3"\",\""$4"\",\""$5"\",\""$6"\",\""$7"\");"}' $file2 >>$sql
awk -F, '{print "insert into gp_user_info  set vc_stb_id=\""$1"\",member_id=\""$2"\",member_name=\""$3"\",login_name=\""$4"\",member_status=\""$5"\",game_points=\""$6"\",vip_level=\""$7"\",create_date=\""$8"\",done_date=\""$9"\"  on duplicate key update vc_stb_id=\""$1"\",member_id=\""$2"\",member_name=\""$3"\",login_name=\""$4"\",member_status=\""$5"\",game_points=\""$6"\",vip_level=\""$7"\",create_date=\""$8"\",done_date=\""$9"\";"}' $file3 >>$sql

echo "select * from T_DaySum where ITIME=$DATE_SEL;" |sqlite3 $db172 |awk -F\| '{print "insert into event_lucky_daysum VALUES (\""$1"\",\""$2"\",\""$3"\",\""$4"\",\""$5"\");"}' >>$sql_lucky
echo "select * from T_Goods where ITIME=$DATE_SEL;" |sqlite3 $db172 |awk -F\| '{print "insert into event_lucky_Goods VALUES (\""$1"\",\""$2"\",\""$3"\",\""$4"\",\""$5"\",\""$6"\");"}' >>$sql_lucky
echo "select * from T_lucky where ITIME =$DATE_SEL;" |sqlite3 $db172 |awk -F\| '{print "insert into event_lucky_lucky VALUES (\""$1"\",\""$2"\",\""$3"\",\""$4"\",\""$5"\",\""$6"\");"}' >>$sql_lucky


mysql -h10.48.179.112 -udc -pdc datacenter <$sql
sleep 3
mysql  -h10.48.179.112 -udc -pdc datacenter <$sqlu1
sleep 3
mysql  -h10.48.179.112 -udc -pdc datacenter <$sqlu2
sleep 3
mysql  -h10.48.179.112 -udc -pdc datacenter <$sqlu3
sleep 3
mysql  -h10.48.179.112 -udc -pdc datacenter <$sqlu4
sleep 3
mysql  -h10.48.179.112 -udc -pdc datacenter <$sql3
sleep 3
mysql  -h10.48.179.112 -udc -pdc datacenter <$sql4
sleep 3
mysql  -h10.48.179.112 -udc -pdc datacenter <$sql7
sleep 3
mysql  -h10.48.179.112 -udc -pdc datacenter <$sql13
sleep 3
mysql  -h10.48.179.112 -udc -pdc datacenter <$sql8
sleep 3
mysql  -h10.48.179.112 -udc -pdc datacenter <$sql5
sleep 3
mysql  -h10.48.179.112 -udc -pdc datacenter <$sql7
mysql  -h10.48.179.112 -udc -pdc datacenter <$sql14
sleep 3
mysql  -h10.48.179.112 -udc -pdc datacenter <$sql15
sleep 3
mysql  -h10.48.179.112 -udc -pdc datacenter <$sql_lucky
sleep 3
mysql  -h10.48.179.112 -udc -pdc datacenter <$sql6
sleep 3




echo "insert complited at `date +%Y-%m-%d_%T`" >>/web/script/insert.log
