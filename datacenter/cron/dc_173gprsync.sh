#!/bin/bash
#huzhiwei@gmail.com

rsync -avz --progress --delete --password-file=/root/rsync.pas rsync@125.210.228.173::gamedb /data/game_data/
