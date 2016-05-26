<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/head.jsp" flush="true" />
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>角色管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>
	首页 <span class="c-gray en">&gt;</span> 用户管理 <span class="c-gray en">&gt;</span>角色管理
	 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" >
		<i class="Hui-iconfont">&#xe68f;</i>
	 </a>
</nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray">
		<span class="l">
			<a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
			<a class="btn btn-primary radius" href="javascript:;" onclick="admin_role_add('添加角色','toAdd','800')">
				<i class="Hui-iconfont">&#xe600;</i> 添加角色
			</a>
	   </span> <span class="r">共有数据：<strong>54</strong> 条</span>
	</div>
	<table class="table table-border table-bordered table-hover table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="6">角色管理</th>
			</tr>
			<tr class="text-c">
				<th width="25"><input type="checkbox" value="" name=""></th>
				<th width="250">ID</th>
				<th width="200">角色名</th>
				<th>用户列表</th>
				<th width="300">描述</th>
				<th width="70">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="role">
				<tr class="text-c">
					<td><input type="checkbox" value="" name=""></td>
					<td>${role.id}</td>
					<td>${role.name}</td>
					<td><a href="#">admin</a></td>
					<td>${role.des}</td>
					<td class="f-14"><a title="编辑" href="javascript:;" onclick="admin_role_edit('角色编辑','toEdit','${role.id}')" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> <a title="删除" href="javascript:;" onclick="admin_role_del(this,'${role.id}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<script type="text/javascript" src="/static/hui/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/static/hui/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="/static/hui/lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/static/hui/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="/static/hui/static/h-ui/js/H-ui.admin.js"></script>
<script type="text/javascript">
	$(function () {
		$(".btn-success").click(function(){
			location.replace(location.href);
		});
	});

	/*管理员-角色-添加*/
	function admin_role_add(title,url,w,h){
		layer_show(title,url,w,h);
	}
	/*管理员-角色-编辑*/
	function admin_role_edit(title,url,id,w,h){
		layer_show(title,url,id,w,h);
	}
	/*管理员-角色-删除*/
	function admin_role_del(obj,id){
		layer.confirm('角色删除须谨慎，确认要删除吗？',function(index){
			//此处请求后台程序，下方是成功后的前台处理……
			$.ajax({
				type: "GET",
				url: "delete?id=" + id,
				dataType: "json",
				success: function (data) {
					$(obj).parents("tr").remove();
					layer.msg('已删除!',{icon:1,time:1000});
				}
			});
		});
	}
</script>
</body>
</html>