<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/head.jsp" flush="true" />
<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="utf-8">
	<title>新建权限 - 管理员管理</title>
</head>
<body>
<article class="page-container">
	<form action="add" method="post" class="form form-horizontal" id="form-admin-role-add">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>权限名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="" id="perName" name="text" datatype="*4-16" nullmsg="权限名不能为空">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">权限路径：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="" id="" name="url">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">父节点：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select name="pid">
					<option value="0">根节点</option>
					<c:forEach items="${list}" var="per">
						<option value="${per.id}">${per.text}</option>
						<c:forEach items="${per.children}" var="sper">
							<option value="${sper.id}">${sper.text}</option>
						</c:forEach>
					</c:forEach>
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