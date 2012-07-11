<?php

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
        //$str ="<td>".$targetItem."</td><td>".$targetIP."</td><td>".$targetPort."</td><td><font color='red'>failed ".$j." times!<font></td><td>".date_format(date_create('Asia/Shanghai'),'Y-m-d/H:i:s')."</td>";
        $str = "item: {$targetItem} server: {$targetIP} at port:{$targetPort}/{$Protocol} connect failed {$j} times!"."/".date_format(date_create('Asia/Shanghai'),'Y-m-d/H:i:s');
        echo $str."<br>";
        require 'smtp.php';
        require 'smtp_conf.php';
        //发送邮件
        $mailbody = $str;
        $mailsubject = "{$targetItem} PORT FAIL WARNING";//邮件主题
        $smtp = new smtp($smtpserver,$smtpserverport,true,$smtpuser,$smtppass);//这里面的一个true是表示使用身份验证,否则不使用身份验证.
        //$smtp->debug = TRUE;//是否显示发送的调试信息        
        $smtp->sendmail($smtpemailto, $smtpusermail, $mailsubject, $mailbody, $mailtype);
        
        return $j;
    }
    
}



    $link=mysql_connect("localhost","root","swhs2012") or die("connect error");
    mysql_select_db("moniter") or die("select db error");
    $sql="select host,port,item from mon_port ;";
    mysql_query("SET NAMES UTF8");
    $result=mysql_query($sql);
    if(!$result){
       echo "query faild  ".mysql_error();
    }

    echo '<html>';
    echo '<head>';
    echo '<title>端口监控列表</title>';
    //设置自动刷新 周期20秒 页面编码UTF-8，和数据库一致。
    echo '<meta http-equiv="Refresh" content="20";charset=UTF-8>';
    echo '</head>';
    echo '<body>';

    echo '<table align="center" width="800" border="1">';
    echo '<caption><h1>端口监控</h1></caption>';
    while($row=mysql_fetch_assoc($result)){
        echo "<tr>";
        PortCheck($row['host'],$row['port'],$row['item']);
        echo "<tr>";
    }
    
//PortCheck('125.210.228.171','888', 'bad!');





