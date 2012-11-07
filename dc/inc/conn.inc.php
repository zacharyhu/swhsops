<?php
      $link=@mysql_connect("localhost","root","abcd1234")or die("mysql connect error");
      $db_selected=@mysql_select_db("test")or die("db conn error");
      mysql_set_charset("utf8",$link);
