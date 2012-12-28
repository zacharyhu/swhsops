#!/bin/bash
#load log file into db

DATE=`date -d -1day +%y%m%d`
LOG_DATE=`date -d -1day +%Y%m%d`
LOGFILE=/usr/local/nginx/logs/gate_${LOG_DATE}_access.log

gamefile=/usr/local/nginx/logs/game.txt


if [ -e $LOGFILE ];then
  echo "${LOGFILE} exist,now load file"
  awk '{print $4,$7}' ${LOGFILE} |grep '/gate_xj/gameAdd' | awk -F '[/|=|&]' '{print $6}' |sort |uniq -c |sort -nr|awk '{print DATE"|"$1"|"$2}' DATE=$DATE  >>$gamefile
  echo "LOAD DATA  LOCAL INFILE '${gamefile}' replace into table datacenter.xj_game_login FIELDS TERMINATED BY '\|'"|mysql -h10.48.179.112 -udc -pdc datacenter 
  echo "LOAD DATA  LOCAL INFILE '${gamefile}' replace into table tvgame.xj_data_game_login FIELDS TERMINATED BY '\|'"|mysql -h10.48.179.112 -utvgp -ptvgp tvgame 
  rm -rf ${gamefile}
else
  echo "no ${LOGFILE}..."
fi

   
