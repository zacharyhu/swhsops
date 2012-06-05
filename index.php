<?php
/*
	fileName:index.php
	function:首页引导文件
	author:隐
	createTime：2010-08-09
*/

require_once './include/global.inc.php';

if(isset($action))
{
	$indexfile = in_array($action, array('default')) ? $action : 'default';
}
else
{
	$indexfile = 'default';
}

require_once WEB_ROOT.'/include/index_'.$indexfile.'.inc.php';
?>