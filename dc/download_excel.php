<?php
session_start();
    $sql_excel="";
    //print_r($_SESSION);
    if(isset($_SESSION["excel"]))
    {
    	//	echo "SESSION_ -- ".$_SESSION."</br>";
        $sql_excel=$_SESSION["excel"];
    }	
    //echo "sql ".$sql_excel."</br>";
    //unset($_SESSION["excel"]);
    include 'inc/conn.inc.php';
    $result=mysql_query($sql_excel);
    header("Content-type:application/vnd.ms-excel");
    header("Content-Disposition:attachment;filename=".$_SESSION["subtype"]."_".$_SESSION["stb"]."_".date('y-m-d').".xls");
    //$result=mysql_query($sql_excel);
    $result=mysql_query($sql_excel);
    //$nu=mysql_fetch_row($result);
    //echo $nu."...nums<br>";
    $table = '<table>';
    if($_SESSION["subtype"]=="chongzhi"){
    	$table .= '<thead><tr><th>机顶盒号</th><th>用户id</th><th>金额</th><th>日期</th><th>时间</th><th>条目</th></thead>';
    }elseif ($_SESSION["subtype"]=="point"){
    	$table .= '<thead><tr><th>机顶盒号</th><th>用户id</th><th>变更前游戏点</th><th>变更游戏点</th><th>变更后游戏点</th><th>时间</th><th>游戏名</th></thead>';
    }elseif ($_SESSION["subtype"]=="login"){
    	$table .= '<thead><tr><th>机顶盒号</th><th>来源</th><th>登录时间</th><th>大区编号</th><th>城市编号</th></thead>';
    }
    $table .= '<tbody>';
    while($row=mysql_fetch_assoc($result)){
              $table .= '<tr>';
              foreach($row as $col){
                      $table .= '<td>'.$col.'</td>';
              }
              $table .= '</tr>';
            }
    $table .= '</tbody>';
    $table .= '</table>';
	echo $table;

?>

