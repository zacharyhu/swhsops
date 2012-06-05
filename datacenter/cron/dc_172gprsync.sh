#!/bin/bash
#huzhiwei@gmail.com

rsync -avz --progress --delete --password-file=/root/rsync.pas rsync@125.210.228.172::gamedb8631 /data/game_data8631
rsync -avz --progress --delete --password-file=/root/rsync.pas rsync@125.210.228.172::gamedb8633 /data/game_data8633
