<%--
  Created by IntelliJ IDEA.
  User: Lucare
  Date: 2016/1/22
  Time: 9:10
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/easy.jsp"%>
<html>
<head>
    <title>后台管理首页</title>
</head>
<body>

<div class="easyui-layout" style="width:100%;height:100%;">
    <div data-options="region:'north'" style="height:50px">

        <p><h3>欢迎光临长晟信息后台管理系统！</h3></p>
    </div>
    <div data-options="region:'west',split:true" title="West" style="width:200px;">
        <ul class="easyui-tree" id="tt">

        </ul>

    </div>
    <div data-options="region:'east',split:true" title="East" style="width:185px;">
        <div id="cc" style="width:180px;height:180px;"></div>
    </div>

    <div data-options="region:'center',title:'Main Title',iconCls:'icon-ok'">
        <div class="easyui-tabs" fit="true" border="false" id="tabs">
            <div title="首页">

                <p>欢迎光临培训神器后台管理系统！</p>
            </div>
        </div>
    </div>
</div>
<script>

$(function(){
    //实例化树形菜单
    $("#tt").tree({
        url:"${ctx}/menu/buildTree",
        onClick : function (node) {
            if (node.attributes) {
                Open(node.text, node.attributes.url);
            }
        }
    });

    //右边日历显示
    $('#cc').calendar({
        width:180,
        height:180,
        current:new Date()
    });

    //在右边center区域打开菜单，新增tab
    function Open(text, url) {
        if ($("#tabs").tabs('exists', text)) {
            $('#tabs').tabs('select', text);
        } else {
            $('#tabs').tabs('add', {
                title : text,
                closable : true,
                href : url
            });
        }
    }

    //绑定tabs的右键菜单
    $("#tabs").tabs({
        onContextMenu : function (e, title) {
            e.preventDefault();
            $('#tabsMenu').menu('show', {
                left : e.pageX,
                top : e.pageY
            }).data("tabTitle", title);
        }
    });

    //实例化menu的onClick事件
    $("#tabsMenu").menu({
        onClick : function (item) {
            CloseTab(this, item.name);
        }
    });

    //几个关闭事件的实现
    function CloseTab(menu, type) {
        var curTabTitle = $(menu).data("tabTitle");
        var tabs = $("#tabs");

        if (type === "close") {
            tabs.tabs("close", curTabTitle);
            return;
        }

        var allTabs = tabs.tabs("tabs");
        var closeTabsTitle = [];

        $.each(allTabs, function () {
            var opt = $(this).panel("options");
            if (opt.closable && opt.title != curTabTitle && type === "Other") {
                closeTabsTitle.push(opt.title);
            } else if (opt.closable && type === "All") {
                closeTabsTitle.push(opt.title);
            }
        });

        for (var i = 0; i < closeTabsTitle.length; i++) {
            tabs.tabs("close", closeTabsTitle[i]);
        }
    }

})

</script>

</body>
</html>
