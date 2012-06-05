#!?bin/bash





DATE=`date -d -1day +%y%m%d`

mysql -h125.210.228.137 -N -pswhs2012 datacenter -e "SELECT l_time,l_online FROM game_online where l_game_id='185' and l_date=$DATE "| sort -n |mutt -s "niushen_online _$DATE" huzhiwei01@yunyou.tv,mashiliang@yunyou.tv
mysql -h125.210.228.137 -N -pswhs2012 datacenter -e "SELECT l_time,l_online FROM game_online where l_game_id='226' and l_date=$DATE "| sort -n |mutt -s "marj_online _$DATE" huzhiwei01@yunyou.tv,mashiliang@yunyou.tv
mysql -h125.210.228.137 -N -pswhs2012 datacenter -e "SELECT l_time,l_online FROM game_online where l_game_id='240' and l_date=$DATE "| sort -n |mutt -s "3k1_online _$DATE" huzhiwei01@yunyou.tv,mashiliang@yunyou.tv
