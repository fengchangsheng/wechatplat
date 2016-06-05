<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../common/head.jsp" flush="true" />
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>管理员列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
	管理员管理 <span class="c-gray en">&gt;</span> 管理员列表
	<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 日期范围：
		<input type="text" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})" id="datemin" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d'})" id="datemax" class="input-text Wdate" style="width:120px;">
		<input type="text" class="input-text" style="width:250px" placeholder="输入管理员名称" id="" name="">
		<button type="submit" class="btn btn-success" id="d" name=""><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20">
		<span class="l">
			<a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
			<a href="javascript:;" onclick="admin_add('添加管理员','toAdd','800','500')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加管理员</a>
		</span>
		<span class="r">共有数据：<strong>${users.size()}</strong> 条</span>
	</div>
	<table class="table table-border table-bordered table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="9">员工列表</th>
			</tr>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value=""></th>
				<th width="250">ID</th>
				<th width="150">登录名</th>
				<th width="150">手机</th>
				<th width="220">邮箱</th>
				<th>角色</th>
				<th width="230">加入时间</th>
				<th width="100">是否已启用</th>
				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${users}" var="user">
			<tr class="text-c">
				<td><input type="checkbox" value="1" name=""></td>
				<td>${user.id}</td>
				<td>${user.username}</td>
				<td>${user.phone}</td>
				<td>${user.email}</td>
				<td>
				<c:forEach items="${user.roleList}" var="role">
					${role.name}
				</c:forEach>
				</td>
				<td><fmt:formatDate value="${user.createTime}" pattern="yyyy/MM/dd  HH:mm:ss" /></td>
				<td class="td-status">
					<c:if test="${user.status == 1}"><span class="label label-success radius">已启用</span></c:if>
					<c:if test="${user.status == 0}"><span class="label label-default radius">已禁用</span></c:if>
				</td>
				<td class="td-manage">

					<c:if test="${user.status == 1}"><a style="text-decoration:none" onClick="admin_stop(this,'${user.id}')" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a></c:if>
					<c:if test="${user.status == 0}"><a style="text-decoration:none" onClick="admin_start(this,'${user.id}')" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe615;</i></a></c:if>

					<a title="编辑" href="javascript:;" onclick="admin_edit('管理员编辑','toEdit','${user.id}','800','500')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
					<a title="删除" href="javascript:;" onclick="admin_del(this,'${user.id}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
				</td>
			</tr>
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
	/*管理员-增加*/
	function admin_add(title, url, w, h) {
		layer_show(title, url, w, h);
	}
	/*管理员-删除*/
	function admin_del(obj, id) {
		layer.confirm('确认要删除吗？', function (index) {
			//此处请求后台程序，下方是成功后的前台处理……
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

	/*管理员批量删除*/
	function datadel(){
		layer.confirm('确认要删除选中的项吗？', function (index) {
			//此处请求后台程序，下方是成功后的前台处理……
//			$.ajax({
//				type: "GET",
//				url: "delSelect?id=" + id,
//				dataType: "json",
//				success: function (data) {
//					$(obj).parents("tr").remove();
//					layer.msg('已删除!', {icon: 1, time: 1000});
//				}
//			});
		});
	}


	/*管理员-编辑*/
	function admin_edit(title, url, id, w, h) {
		layer_show(title, url, id, w, h);
	}
	/*管理员-停用*/
	function admin_stop(obj, id) {
		layer.confirm('确认要停用吗？', function (index) {
			//此处请求后台程序，下方是成功后的前台处理……
			$.ajax({
				type: "GET",
				url: "disable?id=" + id + "&isOrNo=" + 1,
				dataType: "json",
				success: function (data) {
					$(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_start(this,'+id+')" href="javascript:;" title="启用" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
					$(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">已禁用</span>');
					$(obj).remove();
					layer.msg('已停用!', {icon: 5, time: 1000});
				}
			});
		});
	}

	/*管理员-启用*/
	function admin_start(obj, id) {
		layer.confirm('确认要启用吗？', function (index) {
			//此处请求后台程序，下方是成功后的前台处理……
			$.ajax({
				type: "GET",
				url: "disable?id=" + id + "&isOrNo=" + 2,
				dataType: "json",
				success: function (data) {
					$(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_stop(this,'+id+')" href="javascript:;" title="禁用" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a>');
					$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
					$(obj).remove();
					layer.msg('已启用!', {icon: 6, time: 1000});
				}
			});
		});
	}
</script>
</body>
</html>