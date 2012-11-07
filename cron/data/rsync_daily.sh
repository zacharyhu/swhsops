#!/bin/bash
#rsync all game data from game servers
#@auth huzhiwei01@yunyou.tv
#


rsync -avz --progress --delete --password-file=/cron/rsync.pas rsync@10.48.179.109::gamedata172 /data/gamedata/game_single
rsync -avz --progress --delete --password-file=/cron/rsync.pas rsync@10.48.179.109::gamedbwxr /data/gamedata/game_cash
rsync -avz --progress --delete --password-file=/cron/rsync.pas rsync@10.48.179.99::gamedb /data/gamedata/game_all
