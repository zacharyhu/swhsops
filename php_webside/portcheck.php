<?php
    $link=mysql_connect("localhost","root","swhs2012") or die("connect error");
    mysql_select_db("moniter") or die("select db error");
    $sql="select host,port,item from mon_port ;";
    mysql_query("SET NAMES UTF8");
    $result=mysql_query($sql);
    if(!$result){
       echo "query faild  ".mysql_error();
    }
    
   //��ȡ����
//   $cols=mysql_num_fields($result);
   //��ȡ����
//   $rows=mysql_num_rows($result);
echo '<html>';
echo '<head>';
echo '<title>端口监控列表  </title>';
//�����Զ�ˢ�� ����20�� ҳ�����UTF-8�������ݿ�һ�¡�
echo '<meta http-equiv="Refresh" content="20";charset=UTF-8>';
echo '</head>';
echo '<body>';



function PortCheck($targetIP,$targetPort,$targetItem,$Protocol="tcp",$echoChar=NULL,$timeout=5,$number=4){
    $i     = 0;
    $j    = 0;
    while ($i++<$number) {
        $fp = @fsockopen("$Protocol://$targetIP",$targetPort, $errno, $errstr,$timeout); 
        if (!$fp) {
            //ʧ�ܴ����ۼ�
            $j++;
        }
        else{
            fclose($fp);
            //�ɹ���ֱ�ӷ���OK
            echo "<td>".$targetItem."</td><td>".$targetIP."</td><td>".$targetPort."</td><td> OK </td><td>".date_format(date_create('Asia/Shanghai'),'Y-m-d/H:i:s')."</td>";
            return 1;
        }
    }
    //echo $j;
    if ($j > $number/2) {
        $str ="<td>".$targetItem."</td><td>".$targetIP."</td><td>".$targetPort."</td><td><font color='red'>failed ".$j." times!<font></td><td>".date_format(date_create('Asia/Shanghai'),'Y-m-d/H:i:s')."</td>";
    //$str = "{$targetIP}�˿�{$targetPort}/{$Protocol}����ʧ��{$j}��!"."/".date_format(date_create('Asia/Shanghai'),'Y-m-d/H:i:s');
        echo $str."<br>";
        return $j;
    }
    
}

              echo '<table align="center" width="800" border="1">';
              echo '<caption><h1>端口监控列表</h1></caption>';
    while($row=mysql_fetch_assoc($result)){
            //������������
             // echo "host: ".$row['host']." port :".$row['port']."<br>";
              echo "<tr>";
              PortCheck($row['host'],$row['port'],$row['item']);
              echo "</tr>";
    }

//�ͷ���Դ
    mysql_free_result($result);
    //�ر�����
    mysql_close();
echo '</body>';
echo '</html>';
?>
