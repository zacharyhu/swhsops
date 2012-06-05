#!/bin/bash
source .bash_profile

DATE=`date -d -1day +%Y-%m-%d`
DATEBEGIN=`date -d -2day +%Y-%m-%d`
OUTFILE=/home/oracle/databak/data_point_$DATE.csv
OUTFILE2=/home/oracle/databak/data_action_$DATE.csv

#取消列名、打印信息、字段长度为100
VALUE=`sqlplus -S "gp/gp" << !
set head  off;
set feed off;
set echo off;
set termout off;
set linesize 100;


spool $OUTFILE
select member_id||','||busi_id||','||before_points_busi||','||chg_game_points||','||game_points||','||to_char(done_date,'yyyy/mm/dd hh24:mi:ss')||','||notes from gp.gp_user_points_busi t 
where DONE_DATE > to_date('$DATEBEGIN 23:59:59','yyyy-mm-dd hh24:mi:ss') and DONE_DATE < to_date('$DATE 23:59:59','yyyy-mm-dd hh24:mi:ss');
spool off;

spool $OUTFILE2
select member_id||','||out_id||','||to_char(create_date,'yymmddhh24miss') from gp.gp_user_info where create_date > to_date('$DATEBEGIN 23:59:59','yyyy-mm-dd hh24:mi:ss') and create_date < to_date('$DATE 23:59:59','yyyy-mm-dd hh24:mi:ss');
spool off;
exit
!`
#echo $VALUE
if [ -e "$OUTFILE" ]; then
sed -i '1i\member_id,busi_id,before_points_busi,chg_game_points,game_points,done_date,notes' $OUTFILE
sed -i '/^$/d' $OUTFILE
sed -i -e 's/\s*$//g' $OUTFILE

sed -i '1i\vc_user_id,vc_stb_id,vc_org_id,l_region_code,l_city_code,vc_create_date,vc_active_date' $OUTFILE2
sed -i '/^$/d' $OUTFILE2
sed -i -e 's/\s*$//g' $OUTFILE2

#zip /home/oracle/databak/data_$DATE.zip $OUTFILE $OUTFILE2

#通过curl上传提交csv数据格式文件
curl -F upload=@$OUTFILE http://125.210.228.137/data_upload.php
curl -F upload=@$OUTFILE2 http://125.210.228.137/data_upload.php
echo "$OUTFILE $OUTFILE2 uploaded! at `date`"  >> /home/oracle/datesend.log
else
echo "There is no outfile $OUTFILE"
fi

