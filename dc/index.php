<?php

     $table_arr=array(
             "充值日报表"=>"dailyreport_boss_cash",
             "游戏数据日报表"=>"dailyreport_game_play",
             "玩家活跃信息"=>"dailyreport_user_activity",
             "会员状态"=>"dailyreport_vip_data"             
      );


       while($arr=each($table_arr)){
              echo "<a href='http://10.224.33.214/dc/show.php?t=".$arr["value"]."'>".$arr["key"]."</a><br>";                
       }

     
