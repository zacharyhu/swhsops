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
    	$table .= '<thead><tr><th>�����к�</th><th>�û�id</th><th>���</th><th>����</th><th>ʱ��</th><th>��Ŀ</th></thead>';
    }elseif ($_SESSION["subtype"]=="point"){
    	$table .= '<thead><tr><th>�����к�</th><th>�û�id</th><th>���ǰ��Ϸ��</th><th>�����Ϸ��</th><th>�������Ϸ��</th><th>ʱ��</th><th>��Ϸ��</th></thead>';
    }elseif ($_SESSION["subtype"]=="login"){
    	$table .= '<thead><tr><th>�����к�</th><th>��Դ</th><th>��¼ʱ��</th><th>�������</th><th>���б��</th></thead>';
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

