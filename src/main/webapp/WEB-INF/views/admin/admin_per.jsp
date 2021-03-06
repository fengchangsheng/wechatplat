﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/head.jsp" flush="true" />
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>权限管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 管理员管理 <span class="c-gray en">&gt;</span> 权限管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">

	<div class="cl pd-5 bg-1 bk-gray mt-20">
		<span class="l">
			<a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
			<a href="javascript:;" onclick="admin_permission_add('添加权限节点','toAdd','','500')" class="btn btn-primary radius">
				<i class="Hui-iconfont">&#xe600;</i> 添加权限节点
			</a>
		</span>
		<span class="r">展示数据：<strong>所有</strong> </span> </div>
	<table class="table table-border table-bordered table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="7">权限节点</th>
			</tr>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value=""></th>
				<th width="250">ID</th>
				<th width="250">parentID</th>
				<th width="200">权限名称</th>
				<th>路径</th>
				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list}" var="per">
			<tr class="text-c">
			<td><input type="checkbox" value="1" name=""></td>
			<td>${per.id}</td>
			<td>${per.parentId}</td>
			<td class="text-l"> -- ${per.text}</td>
			<td>${per.url}</td>
			<td><a title="编辑" href="javascript:;" onclick="admin_permission_edit('权限编辑','toEdit','${per.id}','','400')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
				<a title="删除" href="javascript:;" onclick="admin_permission_del(this,'${per.id}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
			</tr>

			<c:forEach items="${per.children}" var="cper">
				<tr class="text-c">
					<td><input type="checkbox" value="1" name=""></td>
					<td>${cper.id}</td>
					<td>${cper.parentId}</td>
					<td>${cper.text}</td>
					<td>${cper.url}</td>
					<td><a title="编辑" href="javascript:;" onclick="admin_permission_edit('权限编辑','toEdit','${cper.id}','','400')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
						<a title="删除" href="javascript:;" onclick="admin_permission_del(this,'${cper.id}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
				</tr>
				<c:forEach items="${cper.children}" var="sper">
					<tr class="text-c">
						<td><input type="checkbox" value="1" name=""></td>
						<td>${sper.id}</td>
						<td>${sper.parentId}</td>
						<td class="text-r">${sper.text}</td>
						<td>${sper.url}</td>
						<td><a title="编辑" href="javascript:;" onclick="admin_permission_edit('权限编辑','toEdit','${sper.id}','','400')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
							<a title="删除" href="javascript:;" onclick="admin_permission_del(this,'${sper.id}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
					</tr>
				</c:forEach>
			</c:forEach>
		</c:forEach>
		</tbody>
	</table>
</div>
<script type="text/javascript" src="/static/hui/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/static/hui/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="/static/hui/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="/static/hui/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="/static/hui/static/h-ui/js/H-ui.admin.js"></script>
<script type="text/javascript">

	$(function () {
		$(".btn-success").click(function(){
			location.replace(location.href);
		});
	});
	/*
	 参数解释：
	 title	标题
	 url		请求的url
	 id		需要操作的数据id
	 w		弹出层宽度（缺省调默认值）
	 h		弹出层高度（缺省调默认值）
	 */
	/*管理员-权限-添加*/
	function admin_permission_add(title, url, w, h) {
		layer_show(title, url, w, h);
	}
	/*管理员-权限-编辑*/
	function admin_permission_edit(title, url, id, w, h) {
		layer_show(title, url, id, w, h);
	}

	/*管理员-权限-删除*/
	function admin_permission_del(obj, id) {
		layer.confirm('权限删除须谨慎，确认要删除吗？', function (index) {
			$.ajax({
				type: "GET",
				url: "delete?id=" + id,
				dataType: "json",
				success: function (data) {
					$(obj).parents("tr").remove();
					layer.msg('已删除!', {icon: 1, time: 1000});
				}
			});

		});
	}
</script>
</body>
</html>