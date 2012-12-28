#!/bin/bash
#nginx access log cut

DATE=`date +%Y%m%d`
LOG=/usr/local/nginx/logs/gate_access.log
BAKLOG=/usr/local/nginx/logs/gate_${DATE}_access.log

if [ -z $BAKLOG ];then
     echo "$BAKLOG exisit,please cut tomorrow..."
else
     mv $LOG $BAKLOG
     /usr/local/nginx/sbin/nginx -s reload
     echo "$BAKLOG MOVED success...."
fi 
