<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<LINK rel="Bookmark" href="/favicon.ico" >
<LINK rel="Shortcut Icon" href="/favicon.ico" />
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
<!--/meta 作为公共模版分离出去-->

<title>新建网站角色 - 管理员管理 - H-ui.admin v2.3</title>
<meta name="keywords" content="H-ui.admin v2.3,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description" content="H-ui.admin v2.3，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
<article class="page-container">
	<form action="add" method="post" class="form form-horizontal" id="form-admin-role-add">
		<input type="hidden" name="id" value="${menuTree.id}">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>权限名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${menuTree.text}" placeholder="" id="perName" name="text" datatype="*4-16" nullmsg="权限名不能为空">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">权限路径：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${menuTree.url}" placeholder="" id="" name="url">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">父节点：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select name="pid">
					<c:forEach items="${list}" var="per">
						<option value="${per.id}" <c:if test="${per.id eq menuTree.parentId}">selected="selected"</c:if>>${per.text}</option>
					</c:forEach>
					<option value="0">根节点</option>
				</select>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<button type="submit" class="btn btn-success radius" id="admin-role-save" name="admin-role-save"><i class="icon-ok"></i> 确定</button>
			</div>
		</div>
	</form>
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="/static/hui/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/static/hui/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="/static/hui/lib/icheck/jquery.icheck.min.js"></script>
<script type="text/javascript" src="/static/hui/lib/jquery/validation/1.14.0/jquery.validate.min.js"></script>
<script type="text/javascript" src="/static/hui/lib/jquery/validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="/static/hui/lib/jquery/validation/1.14.0/messages_zh.min.js"></script>
<script type="text/javascript" src="/static/hui/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="/static/hui/static/h-ui/js/H-ui.admin.js"></script>
<script type="text/javascript" src="/static/hui/lib/jquery/jquery-form.js"></script>
<!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript">
$(function(){
//	$(".permission-list dt input:checkbox").click(function(){
//		$(this).closest("dl").find("dd input:checkbox").prop("checked",$(this).prop("checked"));
//	});
//	$(".permission-list2 dd input:checkbox").click(function(){
//		var l =$(this).parent().parent().find("input:checked").length;
//		var l2=$(this).parents(".permission-list").find(".permission-list2 dd").find("input:checked").length;
//		if($(this).prop("checked")){
//			$(this).closest("dl").find("dt input:checkbox").prop("checked",true);
//			$(this).parents(".permission-list").find("dt").first().find("input:checkbox").prop("checked",true);
//		}
//		else{
//			if(l==0){
//				$(this).closest("dl").find("dt input:checkbox").prop("checked",false);
//			}
//			if(l2==0){
//				$(this).parents(".permission-list").find("dt").first().find("input:checkbox").prop("checked",false);
//			}
//		}
//	});
	
	$("#form-admin-role-add").validate({
		rules:{
			perName:{
				required:true,
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$(form).ajaxSubmit();
			var index = parent.layer.getFrameIndex(window.name);
			parent.layer.close(index);
			parent.$('.btn-success').click();
		}
	});
});
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>