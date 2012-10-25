<?php
	header("Content-Type:text/html;charset=utf-8");
	include "inc/page.class.php";
        require "inc/conn.inc.php";
	
	//$link=mysql_connect("125.210.228.137", "dc", "dc");

	//mysql_select_db("datacenter");

        $tab_name=$_GET['t'];


	$total=mysql_num_rows($result);

	$num=30;
	
	$page=new Page($total, $num, "&cid=99");
         
	$sql="select * from  {$tab_name} order by l_date desc {$page->limit}";
        echo $sql."<br>";
        mysql_query("set names 'utf8'");
	$result=mysql_query($sql);

	echo '<table align="center" border="1" width="960">';
	echo "<caption><h1>{$tab_name}</h1></caption>";

        $cols=mysql_num_fields($result);
        //echo '<table align="center" width="800" border="1">';
        //echo '<caption><h1>'.$tabname.'</h1></caption>';
        if($t='dailyreport_game_play'){
             echo '<tr>';
             $arr_game=array(
                         307=>'三扣一',
                         308=>'双扣'
                         );
             foreach($arr_game as $game_id=>$game){
                      echo '<td><a href=./show_game.php?t=dailyreport_game_play&game_id='.$game_id.'>'.$game.'</td>';
                }
             echo '</tr>';
             echo '<tr><td>日期</td><td>游戏id</td><td>游戏名称</td><td>总人次</td><td>总人数</td><td>人均次数</td><td>游戏点数</td><td>现金</td></tr>';
        }
        echo '<tr>';
        for($i=0; $i<$cols; $i++){

                echo '<th>'.mysql_field_name($result, $i).'</th>';
        }
        echo '</tr>';
        while($row=mysql_fetch_assoc($result)){
                echo '<tr>';
                foreach($row as $col){
                        echo '<td>'.$col.'</td>';
                }
                echo '</tr>';
        }

	echo '<tr><td colspan="5" align="right">'.$page->fpage(array(8,3,4,5,6,7,0,1,2)).'</td></tr>';
	echo '</table>';

