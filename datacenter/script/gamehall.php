<?php
$gate=$_GET['gate'];
$stbid=$_GET['stbid'];
$code=$_GET['code'];
$city=$_GET['city'];
if($gate=='gonggao'){
   $fp=fopen('/web/vistlog/gamehall_vist.log','a');
   if(!$fp){
     echo "open file failed..";
   }else{
     fwrite($fp,"stbid: ".$stbid." code:".$code." city:".$city." login at ".date("Y-m-d H:i:s"."\n"));
   }
   fclose($fp);
   }
?>
