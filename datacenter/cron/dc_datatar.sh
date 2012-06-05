#!/bin/bash

#auth huzhiwei

#tar zcvf /web/datadaily/data_`date -d -1day +%Y%m%d`.tar.gz /web/dataupload/8631_login.db3 /web/dataupload/8633_login.db3 /web/dataupload/coinlog.db3 /web/dataupload/data_action_`date -d -1day +%Y-%m-%d`.csv /web/dataupload/data_point_`date -d -1day +%Y-%m-%d`.csv /web/dataupload/game_value_busi.db 

cd /web/dataupload/
zip -r `date +%Y%m%d`.zip `date +%Y%m%d`

