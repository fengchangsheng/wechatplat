<%--
  Created by IntelliJ IDEA.
  User: Lucare
  Date: 2016/1/25
  Time: 9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/wechatplat/static/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="/wechatplat/static/easyui/themes/icon.css">
    <script type="text/javascript" src="/wechatplat/static/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="/wechatplat/static/easyui/plugins/jquery.tree.js"></script>
    <script type="text/javascript" src="/wechatplat/static/easyui/jquery.easyui.min.js"></script>
    <script>
        function showMsgGrandParent(info){
            window.parent.parent.$.messager.show({
                title:'提示',
                msg:info,
                showType:'show'
            });
        }
        function showMsgParent(info){
            window.parent.$.messager.show({
                title:'提示',
                msg:info,
                showType:'show'
            });
        }
        function showMsg(info){
            $.messager.show({
                title:'提示',
                msg:info,
                showType:'show'
            });
        }

    </script>
</head>

</html>
