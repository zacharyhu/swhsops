<html>
	<head>
		<title>Tabs</title>
		<link rel="stylesheet" type="text/css" href="css/tabs.css" media="screen" />
	</head>
	<body >
		<div class="tabContainer">			
			<div class="contents">
				<div class="tabContent">				  
				  <h3>Tab 1</h3>
				  <div id="bk_1">
				  Content for tab1aaaaa
				  </div>
				</div>
				<div class="tabContent">
					<h3>Tab 2</h3>
					 Content for Tab 2
				</div>
				<div class="tabContent">
					<h3>Tab 3</h3>
					 Content for Tab 3
				</div>
				<div class="tabContent">
					<h3>Tab 4</h3>
					 Content for Tab 4
				</div>
				<div class="tabContent">
					<h3>Tab 5</h3>
					 Content for Tab 5
				</div>
			</div>
			<ul class="tabHeader">
				<li>Tab 1</li>
				<li>Tab 2</li>
				<li>Tab 3</li>
				<li>Tab 4</li>
				<li>Tab 5</li>
			</ul>
		</div>
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript">
			$(document).ready(function ()
			{//当页面载入时，自动运行以下代码；
				$('.tabContent:gt(0)').hide();//将所有的选项卡内容隐藏，gt(x)表示改元素中第x后的所有元素，0表示第一个；
				$('.tabHeader > li:eq(2)').addClass('active');//默认给第一个选项卡添加深色；
				//$('.tabHeader > li').click(showHideTabs);//点击某个选项卡之后，运行showHideTabs函数；
				$('.tabHeader > li').mouseover(showHideTabs);//鼠标移至选项卡之后，运行showHideTabs函数；
			});
			function showHideTabs()
			{
				var allLi = $('.tabHeader > li').removeClass('active')//将所有选项卡变为浅色，并让allLi表示为所有的选项卡；
				$(this).addClass('active');//给点击中的选项卡添加深色；
				
				var index = allLi.index(this);//找出点击中的选项卡处于队列中的第几个；
				$('.tabContent:visible').hide();//让原先的选项卡内容隐藏；
				$('.tabContent:eq('+index+')').show();//显示被点中的选项卡内容；
			}
		</script>
	</body>
</html>
