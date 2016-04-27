<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="/static/hui/lib/html5.js"></script>
<script type="text/javascript" src="/static/hui/lib/respond.min.js"></script>
<script type="text/javascript" src="/static/hui/lib/PIE_IE678.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="/static/hui/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="/static/hui/static/h-ui/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="/static/hui/lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css" href="/static/hui/lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css" href="/static/hui/static/h-ui/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="/static/hui/static/h-ui/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>用户分析</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 数据统计 <span class="c-gray en">&gt;</span> 用户分析 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div id="container" style="min-width:700px;height:400px"></div>
</div>


<script type="text/javascript" src="/static/hui/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/static/hui/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="/static/hui/lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/static/hui/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="/static/hui/static/h-ui/js/H-ui.admin.js"></script>
<script type="text/javascript" src="/static/hui/lib/Highcharts/4.1.7/js/highcharts.js"></script>
<script type="text/javascript">
	$(function () {
		$('#container').highcharts({
			title: {
				text: '新增人数趋势图',
				x: -20 //center
			},
			subtitle: {
				text: 'Source: 微信公众平台',
				x: -20
			},
			xAxis: {
				categories: ['一月', '二月', '三月', '四月', '五月', '六月','七月', '八月', '九月', '十月', '十一月', '十二月']
			},
			yAxis: {
				title: {
					text: 'Num (人)'
				},
				plotLines: [{
					value: 0,
					width: 1,
					color: '#808080'
				}]
			},
			tooltip: {
				valueSuffix: '个'
			},
			legend: {
				layout: 'vertical',
				align: 'right',
				verticalAlign: 'middle',
				borderWidth: 0
			},
			series: [{
				name: '新增人数',
				data: [7, 8, 9, 14, 18, 21, 25, 26, 23, 18, 13, 9]
			}]
		});
	});
</script>
</body>
</html>