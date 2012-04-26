#!/bin/bash
#auth huzhiwei

DATE_TODAY=`date +%Y%m%d`
DATE_YES=`date -d -1day +%Y-%m-%d`
DATE_SEL=`date -d -1day +%y%m%d`
DATA_DIR=/web/dataupload
DATA_TODAY=/web/dataupload/$DATE_TODAY


cd $DATA_TODAY


sql=$DATA_TODAY/$DATE_TODAY.sql
sql2=/web/script/dcsql/user_active_daily_import.sql
sql3=/web/script/dcsql/gp_chg_daily_import.sql
sql4=/web/script/dcsql/user_report_daily_import.sql
sql5=/web/script/dcsql/boss_cash_daily_import.sql
sql6=/web/script/dcsql/vip_daily_import.sql
sql7=/web/script/dcsql/game_daily_import.sql
file1=$DATA_TODAY/data_action_$DATE_YES.csv
file2=$DATA_TODAY/data_point_$DATE_YES.csv
db8631=$DATA_TODAY/8631_login.db3
db8633=$DATA_TODAY/8633_login.db3
dbcoin=$DATA_TODAY/coinlog.db3
dbgame=$DATA_TODAY/game_value_busi.db






if [ -e $sql ];then
rm -rf $sql
echo "rm the exist sql...$sql"
else
echo "no $sql"
fi



echo "select * from tv_gp_user_game_value_busi where l_date="$DATE_SEL";" |/usr/bin/sqlite3 $dbgame |awk -F\| '{print "insert into game_value VALUE(\""$1"\",\""$2"\",\""$3"\",\""$4"\",\""$5"\",\""$6"\",\""$7"\",\""$8"\",\""$9"\",\""$10"\",\""$11"\",\""$12"\");"}'  >>$sql
echo "select * from tv_gp_user_game_online_busi where l_date="$DATE_SEL";" |/usr/bin/sqlite3 $dbgame |awk -F\| '{print "insert into game_online VALUE(\""$1"\",\""$2"\",\""$3"\",\""$4"\",\""$5"\");"}' >>$sql
echo "select * from TCoinLog where l_date="$DATE_SEL";" |/usr/bin/sqlite3 $dbcoin |awk -F\| '{print "insert into TCoinLog VALUE(\""$1"\",\""$2"\",\""$3"\",\""$4"\",\""$5"\",\""$6"\");"}' >>$sql
echo "select * from TCoinErrLog where l_date="$DATE_SEL";" |/usr/bin/sqlite3 $dbcoin |awk -F\| '{print "insert into TCoinErrLog VALUE(\""$1"\",\""$2"\",\""$3"\",\""$4"\",\""$5"\",\""$6"\",\""$7"\");"}' >>$sql
echo "select * from TUserLogin where l_date="$DATE_SEL";" |/usr/bin/sqlite3 $db8631 |awk -F\| '{print "insert into hlg_login VALUE(\""$1"\",\""$2"\",\""$3"\",\""$4"\");"}' >>$sql
echo "select * from TUserCoin where l_date="$DATE_SEL";" |/usr/bin/sqlite3 $db8631 |awk -F\| '{print "insert into hlg_coin VALUE(\""$1"\",\""$2"\",\""$3"\",\""$4"\",\""$5"\");"}' >>$sql
echo "select * from TUserLogin where l_date="$DATE_SEL";" |/usr/bin/sqlite3 $db8633 |awk -F\| '{print "insert into hlg_login VALUE(\""$1"\",\""$2"\",\""$3"\",\""$4"\");"}' >>$sql
echo "select * from TUserCoin where l_date="$DATE_SEL";" |/usr/bin/sqlite3 $db8633 |awk -F\| '{print "insert into hlg_coin VALUE(\""$1"\",\""$2"\",\""$3"\",\""$4"\",\""$5"\");"}' >>$sql
awk -F, 'NR!=1 {print "insert into action VALUE(\""$1"\",\""$2"\",\""$3"\");"}' $file1 >>$sql
awk -F, 'NR!=1 {print "insert into point VALUE(\""$1"\",\""$2"\",\""$3"\",\""$4"\",\""$5"\",\""$6"\",\""$7"\");"}' $file2 >>$sql
mysql  -udc -pdc datacenter <$sql
sleep 10
mysql  -udc -pdc datacenter <$sql2
sleep 10
mysql  -udc -pdc datacenter <$sql3
sleep 10
mysql  -udc -pdc datacenter <$sql4
sleep 10
mysql  -udc -pdc datacenter <$sql5
sleep 10
mysql  -udc -pdc datacenter <$sql6
sleep 10
mysql  -udc -pdc datacenter <$sql7

echo "insert complited at `date +%Y-%m-%d_%T`" >>/web/script/insert.log




