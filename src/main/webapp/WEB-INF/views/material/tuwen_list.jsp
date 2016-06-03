<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../common/head.jsp" flush="true" />
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>素材管理</title>
</head>
<body>
<nav class="breadcrumb">
    <i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
    素材管理 <span class="c-gray en">&gt;</span> 图文列表
    <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" >
        <i class="Hui-iconfont">&#xe68f;</i>
    </a>
</nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray">
		<span class="l">

	   </span> <span class="r">共有数据：<strong id="nums"></strong> 条</span>
	</div>
	<table class="table table-border table-bordered table-hover table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="6">图文列表</th>
			</tr>
			<tr class="text-c">
				<th width="25"><input type="checkbox" value="" name=""></th>
				<th width="250">media_id</th>
				<th width="200">标题</th>
				<th width="200">作者</th>
				<th>更新时间</th>
				<th width="150">操作</th>
			</tr>
		</thead>
		<tbody id="ubody">
			
		</tbody>
	</table>
</div>
<script type="text/javascript" src="/static/hui/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/static/hui/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="/static/hui/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="/static/hui/static/h-ui/js/H-ui.admin.js"></script>
<script type="text/javascript">
	$(function(){
		var data = ${data};
		var datas = data.item;
		var html = '';
		$.each(datas, function(index, comment){
            var news = comment.content.news_item[0];
			html += '<tr class="text-c"><td><input type="checkbox" value="" name=""></td><td>'
					+ comment.media_id +'</td><td><a href="detail?media_id='+comment.media_id+'">'+ news.title+'</a></td><td>'
					+ news.author+ '</td><td>'+ comment.update_time+'</td>'
					+ '<td class="f-14"><a title="修改备注" href="javascript:;" onclick="admin_role_edit(\'修改备注\',\'admin-role-add.html\',\'1\')" '
					+ 'style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a></td> ';
		});
		$('#nums').html(data.total_count);
		$('#ubody').append(html);

	})

	/*管理员-角色-编辑*/
	function admin_role_edit(title, url, id, w, h) {
		layer_show(title, url, w, h);
	}

</script>
</body>
</html>