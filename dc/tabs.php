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
			{//��ҳ������ʱ���Զ��������´��룻
				$('.tabContent:gt(0)').hide();//�����е�ѡ��������أ�gt(x)��ʾ��Ԫ���е�x�������Ԫ�أ�0��ʾ��һ����
				$('.tabHeader > li:eq(2)').addClass('active');//Ĭ�ϸ���һ��ѡ������ɫ��
				//$('.tabHeader > li').click(showHideTabs);//���ĳ��ѡ�֮������showHideTabs������
				$('.tabHeader > li').mouseover(showHideTabs);//�������ѡ�֮������showHideTabs������
			});
			function showHideTabs()
			{
				var allLi = $('.tabHeader > li').removeClass('active')//������ѡ���Ϊǳɫ������allLi��ʾΪ���е�ѡ���
				$(this).addClass('active');//������е�ѡ������ɫ��
				
				var index = allLi.index(this);//�ҳ�����е�ѡ����ڶ����еĵڼ�����
				$('.tabContent:visible').hide();//��ԭ�ȵ�ѡ��������أ�
				$('.tabContent:eq('+index+')').show();//��ʾ�����е�ѡ����ݣ�
			}
		</script>
	</body>
</html>
