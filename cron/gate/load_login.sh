#!/bin/bash
#load log file into db

DATE=`date -d -1day +%y%m%d`
LOG_DATE=`date -d -1day +%Y%m%d`
LOGFILE=/usr/local/nginx/logs/gate_${LOG_DATE}_access.log

loadfile=/usr/local/nginx/logs/login.txt
xj_file=/usr/local/nginx/logs/xj_login.txt


if [ -e $LOGFILE ];then
  echo "${LOGFILE} exist,now load file"
  awk '{print $4,$7}' $LOGFILE  |grep -v 'images' | grep login | awk -F '[/|=|&]' '{print $3,$4,$5,$6,$7,$8,$9,$10,$11}' |grep -v gate_xj|awk '{print $1 "|"$2"|"$8}' >>$loadfile
  awk '{print $4,$7}' $LOGFILE  |grep -v 'images' | grep login | awk -F '[/|=|&]' '{print $3,$4,$5,$6,$7,$8,$9,$10,$11}' |awk '{if ( $2=="gate_xj" ) print $1"|"$2"|"$4}' >>$loadfile
  awk '{print $4,$7}' $LOGFILE  |grep -v 'images' | grep login | awk -F '[/|=|&]' '{print $3,$4,$5,$6,$7,$8,$9,$10,$11}' |awk '{if ( $2=="gate_xj" ) print $1"|"$2"|"$4}' >>$xj_file
  sed -i -e "s/2012:/${DATE}\| /g" $loadfile
  sed -i -e "s/2012:/${DATE}\| /g" $xj_file
  echo "LOAD DATA  LOCAL INFILE '${loadfile}' replace into table datacenter.gp_gate_login FIELDS TERMINATED BY '\|'"|mysql -h10.48.179.112 -udc -pdc datacenter 
  echo "LOAD DATA  LOCAL INFILE '${xj_file}' replace into table tvgame.xj_gate_login FIELDS TERMINATED BY '\|'"|mysql -h10.48.179.112 -utvgp -ptvgp tvgame 
  rm -rf ${loadfile}
  rm -rf ${xj_file}
else
  echo "no ${LOGFILE}..."
fi

   
