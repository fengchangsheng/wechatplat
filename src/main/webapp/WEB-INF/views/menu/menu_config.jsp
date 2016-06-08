<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/head.jsp" flush="true"/>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <title>菜单配置</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 菜单管理 <span
        class="c-gray en">&gt;</span> 菜单配置 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
                                              href="javascript:location.replace(location.href);" title="刷新"><i
        class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">

    <table class="table table-border table-bordered table-hover table-bg">
        <thead>
        <tr>
            <th scope="col" colspan="6">菜单配置</th>
        </tr>
        <tr class="text-c">
            <th width="250">名称</th>
            <th width="200">类型</th>
            <th width="200">URL</th>
            <%--<th>地址</th>--%>
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
    $(function () {
        var data = ${data};
        var datas = data.selfmenu_info.button;
        console.log(datas);
        var html = '';
        $.each(datas, function (index, comment) {
            html += '<tr class="text-c"><td>'
                    + comment.name + '</td>'
                    + '<td></td>'
                    + '<td></td>'
//                    + '<td><a href="#">'
//                    + comment.sex+ '</a></td><td>'+ comment.country +'-'
//                    + comment.province+'-'+comment.city+'</td>'
                    + '<td class="f-14"><a title="修改备注" href="javascript:;" onclick="admin_role_edit(\'修改备注\',\'admin-role-add.html\',\'1\')" '
                    + 'style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a></td></tr> ';
            var subbuttons = comment.sub_button.list;
            if (subbuttons.length > 0) {
                $.each(subbuttons, function (c, content) {
                    html += '<tr class="text-c"><td class="text-r">'
                            + content.name + '</td>'
                            + '<td>' + content.type + '</td>'
                            + '<td>' + content.url + '</td>'
                            + '<td class="f-14"><a title="修改备注" href="javascript:;" onclick="admin_role_edit(\'修改备注\',\'admin-role-add.html\',\'1\')" '
                            + 'style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a></td></tr> ';
                });
            }
        });
        $('#ubody').append(html);

    })

    /*管理员-角色-编辑*/
    function admin_role_edit(title, url, id, w, h) {
        layer_show(title, url, w, h);
    }

</script>
</body>
</html>