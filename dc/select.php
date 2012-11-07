<?php 
include 'inc/conn.inc.php';//mysql数据库
include 'inc/page.class.php';//分页
?>
<form action="select.php" method="get">
机顶盒号<input type="input", name="stb">
起始日期:<input type="input", name="datebegin">
结束日期:<input type="input", name="dateend">
<input type="submit" name="sub" value="查询">
<input type="submit" name="out" value="导出">
</form>
<?php
$sub=$_GET['sub'];
$stb=$_GET['stb'];
$datebegin=$_GET['datebegin'];
$dateend=$_GET['dateend'];
//确认表单提交
if(isset($sub)){
	if(!empty($stb) && !empty($datebegin) && !empty($dateend)){
		//echo "stb: ".$stb." datebegin :".$datebegin." dateend :".$dateend."  ";
		//$sql="select * from gp_recharge_his where vc_stb_id='".$stb."' and l_date between '".$datebegin."' and '".$dateend."'  order by l_date desc,l_time desc {$page->limit};";
        $sql="SELECT t1.vc_stb_id, t1.member_id, t1.l_money, t1.l_date, t1.l_time, t2.name
              FROM gp_recharge_his t1, gp_recharge_cp t2 
              WHERE 
              t1.l_type = t2.l_type
              AND t1.vc_stb_id ='".$stb."'
              AND t1.l_date  BETWEEN  '".$datebegin."'  AND '".$dateend."'
              order by t2.name,t1.l_date desc,t1.l_time desc {$page->limit};";
        $result=mysql_query($sql);
		$total=mysql_num_rows($result);
        //echo $total."<br>";
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
        $result=mysql_query($sql);
	    $cols=mysql_num_fields($result);  		     
        if(!empty($result)){   
        echo '<table align="center" border="1" width="800">';
        echo "<caption><h1>机顶盒 ".$stb." 于 ".$datebegin."-".$dateend." 期间记录：</h1></caption>"; 
	    echo '<tr>';
             for($i=0; $i<$cols; $i++){
                echo '<th>'.mysql_field_name($result, $i).'</th>';
        }
        echo '</tr>';
        echo "<br>";
        while($row=mysql_fetch_assoc($result)){
                echo '<tr>';
                foreach($row as $col){
                        echo '<td>'.$col.'</td>';
                }
                echo '</tr>';
            }
		echo '<tr><td colspan="5" align="right">'.$page->fpage(array(8,3,4,5,6,7,0,1,2)).'</td></tr>';
        }else{
    	echo "没有相关记录！！！！" ;
        }
	echo '</table>';
	}else {
		//有内容为空时提示
		echo "机顶盒号、起始时间、结束时间都不能为空 ！<br>";
	}
}

?>	
