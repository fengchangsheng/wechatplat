<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/head.jsp" flush="true" />
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>编辑管理员 - 管理员管理</title>
</head>
<body>
<article class="page-container">
	<form class="form form-horizontal" id="form-admin-add" action="edit" method="post">
		<input type="hidden" name="id" value="${user.id}">
		<input type="hidden" name="status" value="${user.status}">
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>管理员：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" value="${user.username}" placeholder="" id="adminName" name="username">
		</div>
	</div>
	<%--<div class="row cl">--%>
		<%--<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>初始密码：</label>--%>
		<%--<div class="formControls col-xs-8 col-sm-9">--%>
			<%--<input type="password" class="input-text" autocomplete="off" value="" placeholder="密码" id="password" name="password">--%>
		<%--</div>--%>
	<%--</div>--%>
	<%--<div class="row cl">--%>
		<%--<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>确认密码：</label>--%>
		<%--<div class="formControls col-xs-8 col-sm-9">--%>
			<%--<input type="password" class="input-text" autocomplete="off"  placeholder="确认新密码" id="password2" name="password2">--%>
		<%--</div>--%>
	<%--</div>--%>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>性别：</label>
		<div class="formControls col-xs-8 col-sm-9 skin-minimal">
			<div class="radio-box">
				<input name="sex" type="radio" id="sex-1" checked value="1">
				<label for="sex-1">男</label>
			</div>
			<div class="radio-box">
				<input type="radio" id="sex-2" name="sex" value="2">
				<label for="sex-2">女</label>
			</div>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>手机：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" value="${user.phone}" placeholder="" id="phone" name="phone">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>邮箱：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" placeholder="@" name="email" id="email" value="${user.email}">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3">角色：</label>
		<div class="formControls col-xs-8 col-sm-9"> <span class="select-box" style="width:150px;">
			<select class="select" name="adminRole" size="1">
				<option value="" >未选择</option>
				<c:forEach items="${roleList}" var="role">
					<option value="${role.id}" <c:if test="${role.id eq roleInfo.id}">selected="selected"</c:if>>${role.name}</option>
				</c:forEach>
			</select>
			</span> </div>
	</div>
	<%--<div class="row cl">--%>
		<%--<label class="form-label col-xs-4 col-sm-3">备注：</label>--%>
		<%--<div class="formControls col-xs-8 col-sm-9">--%>
			<%--<textarea name="" cols="" rows="" class="textarea"  placeholder="说点什么...100个字符以内" dragonfly="true" onKeyUp="textarealength(this,100)"></textarea>--%>
			<%--<p class="textarea-numberbar"><em class="textarea-length">0</em>/100</p>--%>
		<%--</div>--%>
	<%--</div>--%>
	<div class="row cl">
		<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
			<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
		</div>
	</div>
	</form>
</article>

<!--_footer 作为公共模版分离出去-->
<jsp:include page="../common/footer.jsp" flush="true" />
<!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本--> 
<script type="text/javascript">
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	$("#form-admin-add").validate({
		rules:{
			adminName:{
				required:true,
				minlength:4,
				maxlength:16
			},
			password:{
				required:true,
			},
			password2:{
				required:true,
				equalTo: "#password"
			},
			sex:{
				required:true,
			},
//			phone:{
//				required:true,
//				isPhone:true,
//			},
//			email:{
//				required:true,
//				email:true,
//			},
			adminRole:{
				required:true,
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$(form).ajaxSubmit();
			var index = parent.layer.getFrameIndex(window.name);
			parent.$('.btn-success').click();
			parent.layer.close(index);
		}
	});
});
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>