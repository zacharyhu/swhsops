#!/bin/bash
#@auth zachary_Hu
# event 501 top30 daily import



DATE=`date -d -1day +%y%m%d`
FILE=/data/event/$DATE.sql
echo "select l_user_id,l_game_grade from tv_gp_user_game_value order by l_game_grade desc limit 30;" |sqlite3 /data/game_data/501.db |awk -F\| '{print "insert into event_501 VALUE (\""$1"\",\""$2"\",\""DATE"\");"}' DATE="$DATE" >> $FILE

mysql -pswhs2012 datacenter <$FILE
