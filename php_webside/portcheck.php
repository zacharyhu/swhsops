<?php
    $link=mysql_connect("localhost","root","swhs2012") or die("connect error");
    mysql_select_db("moniter") or die("select db error");
    $sql="select host,port,item from mon_port ;";
    mysql_query("SET NAMES UTF8");
    $result=mysql_query($sql);
    if(!$result){
       echo "query faild  ".mysql_error();
    }
    
   //获取列数
//   $cols=mysql_num_fields($result);
   //获取行数
//   $rows=mysql_num_rows($result);
echo '<html>';
echo '<head>';
echo '<title>绔彛鐩戞帶鍒楄〃  </title>';
//设置自动刷新 周期20秒 页面编码UTF-8，和数据库一致。
echo '<meta http-equiv="Refresh" content="20";charset=UTF-8>';
echo '</head>';
echo '<body>';



function PortCheck($targetIP,$targetPort,$targetItem,$Protocol="tcp",$echoChar=NULL,$timeout=5,$number=4){
    $i     = 0;
    $j    = 0;
    while ($i++<$number) {
        $fp = @fsockopen("$Protocol://$targetIP",$targetPort, $errno, $errstr,$timeout); 
        if (!$fp) {
            //失败次数累计
            $j++;
        }
        else{
            fclose($fp);
            //成功则直接返回OK
            echo "<td>".$targetItem."</td><td>".$targetIP."</td><td>".$targetPort."</td><td> OK </td><td>".date_format(date_create('Asia/Shanghai'),'Y-m-d/H:i:s')."</td>";
            return 1;
        }
    }
    //echo $j;
    if ($j > $number/2) {
        $str ="<td>".$targetItem."</td><td>".$targetIP."</td><td>".$targetPort."</td><td><font color='red'>failed ".$j." times!<font></td><td>".date_format(date_create('Asia/Shanghai'),'Y-m-d/H:i:s')."</td>";
    //$str = "{$targetIP}端口{$targetPort}/{$Protocol}连接失败{$j}次!"."/".date_format(date_create('Asia/Shanghai'),'Y-m-d/H:i:s');
        echo $str."<br>";
        return $j;
    }
    
}

              echo '<table align="center" width="800" border="1">';
              echo '<caption><h1>绔彛鐩戞帶鍒楄〃</h1></caption>';
    while($row=mysql_fetch_assoc($result)){
            //遍历关联数组
             // echo "host: ".$row['host']." port :".$row['port']."<br>";
              echo "<tr>";
              PortCheck($row['host'],$row['port'],$row['item']);
              echo "</tr>";
    }

//释放资源
    mysql_free_result($result);
    //关闭连接
    mysql_close();
echo '</body>';
echo '</html>';
?>
