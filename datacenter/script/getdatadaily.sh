#!/bin/bash
#get daily data from 137 gathered.
#auth  by huzhiwei 


wget -P /web/datadaily/ http://125.210.228.137/dataupload/`date +%Y%m%d`.zip

