<?php 
session_start();
include 'inc/conn.inc.php';//mysql数据库
include 'inc/page.class.php';//分页
?>
<script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>

<form action="select.php" method="get">
机顶盒号（注意空格）<input type="input", name="stb">
<input class="Wdate" type="text" onClick="WdatePicker()", name="datebegin"> <font color=red>起始日期</font>
<input class="Wdate" type="text" onClick="WdatePicker()", name="dateend"> <font color=red>结束日期</font>
<!--  结束日期（格式：120101）:<input type="input", name="dateend">-->
<input type="submit" name="sub" value="查询充值记录">
<input type="submit" name="subpoint" value="查询游戏点变化记录">
</form>
<?php
$sub=$_GET['sub'];
$subpoint=$_GET['subpoint'];
$stb=$_GET['stb'];
$datebegin=$_GET['datebegin'];
$dateend=$_GET['dateend'];
//确认表单提交查询充值记录
if(isset($sub)){
	if(!empty($stb) && !empty($datebegin) && !empty($dateend)){
		//echo "begin date:  ".date('ymd',strtotime($datebegin))." date end : ".date('ymd',strtotime($dateend))."----</br>";
		$datebegin=date('ymd',strtotime($datebegin));
		$dateend=date('ymd',strtotime($dateend));
		//echo "stb: ".$stb." datebegin :".$datebegin." dateend :".$dateend."  ";
		//$sql="select * from gp_recharge_his where vc_stb_id='".$stb."' and l_date between '".$datebegin."' and '".$dateend."'  order by l_date desc,l_time desc {$page->limit};";
        $sql="SELECT t1.vc_stb_id, t1.member_id, t1.l_money, t1.l_date, t1.l_time, t2.name
              FROM gp_recharge_his t1, gp_recharge_cp t2 
              WHERE 
              t1.l_type = t2.l_type
              AND t1.vc_stb_id ='".$stb."'
              AND t1.l_date  BETWEEN  '".$datebegin."'  AND '".$dateend."'
              order by t2.name,t1.l_date desc,t1.l_time desc;";
        $result=mysql_query($sql);
        $_SESSION["excel"]=$sql;
        $_SESSION["stb"]=$stb;
        $_SESSION["subtype"]="chongzhi";
		$total=mysql_num_rows($result);
        //echo $total."<br>-------total";
        $num=30;	
        $page=new Page($total, $num, "&cid=99");
        $sql="SELECT t1.vc_stb_id, t1.member_id, t1.l_money, t1.l_date, t1.l_time, t2.name
              FROM gp_recharge_his t1, gp_recharge_cp t2 
              WHERE 
              t1.l_type = t2.l_type
              AND t1.vc_stb_id ='".$stb."'
              AND t1.l_date  BETWEEN  '".$datebegin."'  AND '".$dateend."'
              order by t2.name,t1.l_date desc,t1.l_time desc {$page->limit};";
        //      echo $sql;
        //echo $_SESSION["excel"]."  11``11 </br>";
        $result=mysql_query($sql);
	    $cols=mysql_num_fields($result);  		     
        if(!empty($result)){   
        echo '<table align="center" border="1" width="800" style="margin-top:20px;width:80%">';
        echo "<caption>机顶盒 ".$stb." 于 ".$datebegin."-".$dateend." 期间充值记录：</caption>";
        echo '<thead>'; 
	    echo '<tr>';
             for($i=0; $i<$cols; $i++){
                echo '<th>'.mysql_field_name($result, $i).'</th>';
        }
        echo '</tr>';
        echo '</thead>';
        echo '<tbody class="">';
        while($row=mysql_fetch_assoc($result)){
                echo '<tr onMouseOver=this.style.backgroundColor="#cccccc" onMouseOut=this.style.backgroundColor="#FFFFFF">';
                foreach($row as $col){
                        echo '<td>'.$col.'</td>';
                }
                echo '</tr>';
            }
        echo '<input name="button" type="button" value="导出数据excel" onclick="excel()" />';
		echo '<tr><td colspan="5" align="right">'.$page->fpage(array(8,3,4,5,6,7,0,1,2)).'</td></tr>';
		echo '</tbody>';
		mysql_free_result($result);
		mysql_close($link);
        }else{
    	echo "没有相关记录！！！！" ;
        }
	echo '</table>';
	}else {
		//有内容为空时提示
		echo "机顶盒号、起始时间、结束时间都不能为空 ！<br>";
	}
}
//查询游戏点变化
if(isset($subpoint)){
	if(!empty($stb) && !empty($datebegin) && !empty($dateend)){
		//echo "begin date:  ".date('ymd',strtotime($datebegin))." date end : ".date('ymd',strtotime($dateend))."----</br>";
		$datebegin=date('Y/m/d',strtotime($datebegin));
		$dateend=date('Y/m/d',strtotime($dateend));
		//echo "stb: ".$stb." datebegin :".$datebegin." dateend :".$dateend."  ";
        $sql="select * from 
             (SELECT  t2.vc_stb_id,t1.member_id,t1.before_points_busi,t1.chg_game_points,t1.game_points,t1.done_date,t3.l_game_name  
             FROM `point_history` t1,`gp_user_info` t2, `gp_game_info` t3 
             WHERE t1.member_id=t2.member_id  
             and substr(t1.notes,8,3)=t3.l_game_id 
             and t1.done_date between date_format('".$datebegin."','%Y/%m/%d 00:00:00') and date_format('".$dateend."','%Y/%m/%d 00:00:00') 
             and t2.vc_stb_id='".$stb."' 
             UNION 
             SELECT  t2.vc_stb_id,t1.member_id,t1.before_points_busi,t1.chg_game_points,t1.game_points,t1.done_date,t3.l_game_name  
             FROM `point` t1,`gp_user_info` t2 , `gp_game_info` t3 
             WHERE t1.member_id=t2.member_id 
             and substr(t1.notes,8,3)=t3.l_game_id 
             and t1.done_date between date_format('".$datebegin."','%Y/%m/%d 00:00:00') and date_format('".$dateend."','%Y/%m/%d 00:00:00') 
             and t2.vc_stb_id='".$stb."')as g 
             order by g.done_date desc;";
        $result=mysql_query($sql);
        $_SESSION["excel"]=$sql;
        $_SESSION["stb"]=$stb;
        $_SESSION["subtype"]="point";
		$total=mysql_num_rows($result);
        //echo $total."<br>-------total";
        $num=30;	
        $page=new Page($total, $num, "&cid=99");
        $sql="select * from 
             (SELECT  t2.vc_stb_id,t1.member_id,t1.before_points_busi,t1.chg_game_points,t1.game_points,t1.done_date,t3.l_game_name  
             FROM `point_history` t1,`gp_user_info` t2, `gp_game_info` t3 
             WHERE t1.member_id=t2.member_id  
             and substr(t1.notes,8,3)=t3.l_game_id 
             and t1.done_date between date_format('".$datebegin."','%Y/%m/%d 00:00:00') and date_format('".$dateend."','%Y/%m/%d 00:00:00') 
             and t2.vc_stb_id='".$stb."'  
             UNION 
             SELECT  t2.vc_stb_id,t1.member_id,t1.before_points_busi,t1.chg_game_points,t1.game_points,t1.done_date,t3.l_game_name  
             FROM `point` t1,`gp_user_info` t2 , `gp_game_info` t3 
             WHERE t1.member_id=t2.member_id  
             and substr(t1.notes,8,3)=t3.l_game_id 
             and t1.done_date between date_format('".$datebegin."','%Y/%m/%d 00:00:00') and date_format('".$dateend."','%Y/%m/%d 00:00:00') 
             and t2.vc_stb_id='".$stb."')as g 
             order by g.done_date desc {$page->limit};"; 
        //      echo $sql;
        //echo $_SESSION["excel"]."  11``11 </br>";
        $result=mysql_query($sql);
	    $cols=mysql_num_fields($result);  		     
        if(!empty($result)){   
        echo '<table align="center" border="1" width="800" style="margin-top:20px;width:80%">';
        echo "<caption>机顶盒 ".$stb." 于 ".$datebegin."-".$dateend." 期间游戏点变化记录：</caption>";
        echo '<thead>'; 
	    echo '<tr>';
             for($i=0; $i<$cols; $i++){
                echo '<th>'.mysql_field_name($result, $i).'</th>';
        }
        echo '</tr>';
        echo '</thead>';
        echo '<tbody class="">';
        while($row=mysql_fetch_assoc($result)){
                echo '<tr onMouseOver=this.style.backgroundColor="#cccccc" onMouseOut=this.style.backgroundColor="#FFFFFF">';
                foreach($row as $col){
                        echo '<td>'.$col.'</td>';
                }
                echo '</tr>';
            }
        echo '<input name="button" type="button" value="导出数据excel" onclick="excel()" />';
		echo '<tr><td colspan="5" align="right">'.$page->fpage(array(8,3,4,5,6,7,0,1,2)).'</td></tr>';
		echo '</tbody>';
		mysql_free_result($result);
		mysql_close($link);
        }else{
    	echo "没有相关记录！！！！" ;
        }
	echo '</table>';
	}else {
		//有内容为空时提示
		echo "机顶盒号、起始时间、结束时间都不能为空 ！<br>";
	}
}
//print_r($_SESSION);
?>	
<script type="text/javascript">
 function excel()
   {
       window.location.href="download_excel.php";
   }
</script>

