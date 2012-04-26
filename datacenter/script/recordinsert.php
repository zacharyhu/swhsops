<?php

$cdate=date();
$con = mysql_connect("localhost","dc","dc");
if (!$con)
 {
  die('Could not connect: '.mysql_error());
 }
mysql_select_db("datacenter",$con);
$sql = "insert into gp_hall_visit VALUES('".$_GET['stbid']."','".$_GET['code']."','".$_GET['city']."')";
echo $sql;
mysql_query($sql,$con);

?>
