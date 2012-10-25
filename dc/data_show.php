<?php
 require "./inc/conn.inc.php";
 require "./inc/selecttable.php";

$table_sel=$_GET['t'];
table("{$table_sel}",'30');


