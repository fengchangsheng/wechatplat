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
<title>群组管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户管理 <span class="c-gray en">&gt;</span> 群组管理
    <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" >
        <i class="Hui-iconfont">&#xe68f;</i></a>
</nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray">
		<span class="l">
			<a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
			<a class="btn btn-primary radius" href="javascript:;" onclick="user_group_add('添加群组','toAdd','600','400')">
				<i class="Hui-iconfont">&#xe600;</i> 添加群组
			</a>
	   </span> <span class="r">共有数据：<strong id="count"></strong> 条</span>
	</div>
	<table class="table table-border table-bordered table-hover table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="6">群组管理</th>
			</tr>
			<tr class="text-c">
				<th width="25"><input type="checkbox" value="" name=""></th>
				<th width="40">ID</th>
				<th width="200">群组名</th>
				<th>用户列表</th>
				<th width="300">用户数</th>
				<th width="70">操作</th>
			</tr>
		</thead>
		<tbody id="gbody">

		</tbody>
	</table>
</div>
<script type="text/javascript" src="/static/hui/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/static/hui/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="/static/hui/lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/static/hui/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="/static/hui/static/h-ui/js/H-ui.admin.js"></script>
<script type="text/javascript">
	$(function(){
		$.ajax({
			type: "GET",
			url: "getGroups",
			dataType: "json",
			success: function(data){
				var groups = data.groups;
				var html = '';
				var count = 0;
				$.each(groups, function(commentIndex, comment){
					html += '<tr class="text-c"><td><input type="checkbox" value="" name=""></td><td>'
							+ comment.id +'</td><td>'+ comment.name+'</td><td><a href="#">admin</a></td><td>'
							+ comment.count+ '</td>'
							+ '<td class="f-14"><a title="编辑" href="javascript:;" onclick="user_group_edit(\'群组编辑\',\'toEdit\','+comment.id+')"  style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> '
					        + '<a title="删除" href="javascript:;" onclick="user_group_del(this,'+comment.id+')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>';
					count = commentIndex + 1;
				});
				$('#gbody').append(html);
				$('#count').html(count);
			}
		});

        $(".btn-success").click(function(){
            location.replace(location.href);
        });
	})

	function user_group_add(title, url, w, h) {
		layer_show(title, url,null, w, h);
	}

	function user_group_edit(title, url, id, w, h) {
		layer_show(title, url, id,  600, 400);
	}

	function user_group_del(obj, id) {
		layer.confirm('群组删除须谨慎，确认要删除吗？', function (index) {
			//此处请求后台程序，下方是成功后的前台处理……
            $.ajax({
                type: "GET",
                url: "delete?id="+id,
                dataType: "json",
                success: function(data){
                    $(obj).parents("tr").remove();
                    var oldCount = $('#count').html();
                    $('#count').html(oldCount-1);
                    layer.msg('已删除!', {icon: 1, time: 1000});
                }
            });
		});
	}

    function datadel() {
        layer.msg('暂时不支持此功能!', {icon: 2, time: 1000});
    }
</script>
</body>
</html>