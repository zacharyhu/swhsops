#!/bin/bash
#usage :   sh get.sh $uid file

outfile=user_content_`date +%Y%m%d`.csv
echo "stbid,member_id,name,addr,tel,cell,帐户编号,帐户状态,支付类型,现金余额,增值点余额,点余额,本月月租费,本月点播费,积分,欠费" >>$outfile
for id in `cat $1` ; do 
#busi=`mysql -h10.48.179.112 -udc -pdc datacenter -N -e"select sum(t1.chg_game_points) from point t1,action t2
#where
#t1.member_id=t2.vc_user_id
#and t2.vc_stb_id=\"$i\"
#and t1.busi_id='101'
#and done_date between DATE_FORMAT('2012/04/01','%Y/%m/%d 00:00:00') and DATE_FORMAT('2012/05/01','%Y/%m/%d 23:59:59');"`
echo ${id}
i=`echo "SELECT out_id from gp_user_info where member_id='${id}';" |mysql -h10.48.179.112 -udc -pdc -N datacenter`
rel=`curl http://125.210.207.86:8080/boss-self/newself/hzselfservice/CustomerInfo.jsp?stbid=$i |grep '</td>'|grep -v ":" |sed -e 's/<[^<]*>//g'|sed -e 's/\s//g'|sed -e 's/&nbsp;//g'|sed -e 's/$/,/g' |xargs echo |awk -F, '{print "\""$5"\",\""$6"\",\""$7"\",\""$8"\""}'` 
res=`curl http://125.210.207.86:8080/boss-self/newself/hzselfservice/AccountInfo.jsp?stbid=$i |grep '</td>'|grep -v ':' |sed -e 's/<[^<]*>//g'|sed -e 's/\s//g'|sed -e 's/&nbsp;//g'|sed -e 's/$/,/g' |xargs echo |awk -F, '{print "\""$3"\",\""$4"\",\""$5"\",\""$6"\",\""$7"\",\""$8"\",\""$9"\",\""$10"\",\""$11"\",\""$12"\""}'`
echo "\"stbid:"$i"\",\""${id}"\","${rel}","${res} >> ${outfile};

done
