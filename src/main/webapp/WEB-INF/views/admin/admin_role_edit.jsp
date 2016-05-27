<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/head.jsp" flush="true" />
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <title>编辑网站角色 - 管理员管理</title>
</head>
<body>
<article class="page-container">
    <form action="edit" method="post" class="form form-horizontal" id="form-admin-role-edit">
        <input type="hidden" name="id" value="${roleInfo.id}">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>角色名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${roleInfo.name}" placeholder="" id="roleName" name="name"
                       datatype="*4-16" nullmsg="用户账户不能为空">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">备注：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${roleInfo.des}" placeholder="" id="" name="des">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">网站角色：</label>
            <div class="formControls col-xs-8 col-sm-9" id="list">

            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <button type="submit" class="btn btn-success radius" id="admin-role-save" name="admin-role-save"><i
                        class="icon-ok"></i> 确定
                </button>
            </div>
        </div>
    </form>
</article>

<!--_footer 作为公共模版分离出去-->
<jsp:include page="../common/footer.jsp" flush="true" />
<!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript">
    $(function () {
        $("#list").on("click",".permission-list dt input:checkbox", function () {
            $(this).closest("dl").find("dd input:checkbox").prop("checked", $(this).prop("checked"));
            $t = $(this).parents(".permission-list").find("dt").first().find("input:checkbox");
            if($t != null){
                $t.prop("checked", $(this).prop("checked"));
            }
        });
        $("#list").on("click",".permission-list2 dd input:checkbox", function () {
            var l = $(this).parent().parent().find("input:checked").length;
            var l2 = $(this).parents(".permission-list").find(".permission-list2 dd").find("input:checked").length;
            if ($(this).prop("checked")) {
                $(this).closest("dl").find("dt input:checkbox").prop("checked", true);
                $(this).parents(".permission-list").find("dt").first().find("input:checkbox").prop("checked", true);
            }else {
                if (l == 0) {
                    $(this).closest("dl").find("dt input:checkbox").prop("checked", false);
                }
                if (l2 == 0) {
                    $(this).parents(".permission-list").find("dt").first().find("input:checkbox").prop("checked", false);
                }
            }
        });

        $("#form-admin-role-edit").validate({
            rules: {
                roleName: {
                    required: true,
                },
            },
            onkeyup: false,
            focusCleanup: true,
            success: "valid",
            submitHandler: function (form) {
                $(form).ajaxSubmit();
                var index = parent.layer.getFrameIndex(window.name);
                parent.$('.btn-success').click();
                parent.layer.close(index);
            }
        });


        <!--处理列表-->
        var res = ${resList};
        $.each(res.pmenu,function (index,element) {
            $("#list").append('<dl class="permission-list" id="'+element.id+'"><dt>' +
                        '<label><input type="checkbox" value="'+element.id+'" name="ids" id="user-Character-0" '+element.checked+'>' +
                        element.text + '</label></dt></dl>');
            $.each(element.children, function (c, e) {
                $("#" + e.parentId).append('<dd><dl class="cl permission-list2" id="' + e.id + '"><dt><label class="">' +
                        '<input type="checkbox" value="' + e.id + '" name="ids" id="user-Character-0-0" '+e.checked+'>' +
                        e.text + '</label></dt></dl></dd>');
                $.each(e.children, function (sc, se) {
                    $("#"+se.parentId).append('<dd><label class="">'+
                            '<input type="checkbox" value="'+se.id+'" name="ids" id="user-Character-0-0-0" '+se.checked+'>'
                            +se.text+'</label></dd>');
                });

            });
        });

    });
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>