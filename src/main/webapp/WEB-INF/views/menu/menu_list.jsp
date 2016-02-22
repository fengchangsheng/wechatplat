<%--
  Created by IntelliJ IDEA.
  User: Lucare
  Date: 2016/1/22
  Time: 9:10
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>菜单列表</title>
</head>
<body>
<div id="openWin" class="easyui-window" title="菜单管理" data-options="closed:true,modal:true" style="width:500px;height:500px;"></div>
<div id="mainPanel" class="easyui-panel"  border=false style="width: 900px">

</div>

<table id="tg"></table>

<div id="menu_save_dialog" class="easyui-dialog" title="菜单管理" style="width:500px;height:280px;padding:10px;"
     buttons="#menu_save_dialog_buttons" data-options="
		modal:true,
		closed:true,
		iconCls:'icon-save'">

    <div class="ftitle">请输入菜单信息</div>
    <form id="menu_info_form" method="post">
        <div class="fitem">
            <label>菜单名称:</label>
            <input type="text" id="menuName" name="text" />
        </div>
        <div class="fitem">
            <label>菜单URL:</label>
            <input type="text" id="menuUrl" name="url" />
        </div>
        <div class="fitem" id="p_row">
            <label>父菜单:</label>
            <input type="text" id="parentMenuName" readonly="readonly" />
        </div>

        <input type="hidden" id="parentMenuId" name="parentId" />
        <input type="hidden" id="menuId" name="id" />
        <p class="ftips">提示1：如果添加子菜单，请先在列表中选择父菜单；否则将添加为顶级菜单。</p>
        <p class="ftips">提示2：不在同一个控制器请加"/"在路径最前面。</p>
        <button type="button" onclick="save()">保存</button>
    </form>
</div>

<script>

    var UrlConfig = {
        SysMenuAdd: 'addMenu',
        SysMenuUpdate: 'editMenu',
        SysMenuDelete: 'delMenu',
        SysMenuList: 'menuList'
    };

    $(function(){
        $('#tg').treegrid({
            url:UrlConfig.SysMenuList,
            idField:'id',
            treeField:'text',
            columns:[[
                {field:'text',title:'菜单名称',width:250,align:'center'},
                {field:'url',title:'路径',width:200,align:'center'},
                {field:'createTime',title:'创建时间',width:80,align:'center',formatter:formatterdate}
            ]],
            toolbar : [
                {
                    text : '增加',
                    iconCls : 'icon-add',
                    handler :openAddWin
                }, '-',{
                    text : '编辑',
                    iconCls : 'icon-eidt',
                    handler :openEditWin
                }, '-',{
                    text : '删除',
                    iconCls : 'icon-remove',
                    handler :deleteMenu
                }, '-',{
                    text : '展开',
                    iconCls : 'icon-redo',
                    handler : function() {
                        var node = $('#tg').treegrid('getSelected');
                        if (node) {
                            $('#tg').treegrid('expandAll', node.cid);
                        } else {
                            $('#tg').treegrid('expandAll');
                        }
                    }
                }, '-', {
                    text : '折叠',
                    iconCls : 'icon-undo',
                    handler : function() {
                        var node = $('#tg').treegrid('getSelected');
                        if (node) {
                            $('#tg').treegrid('collapseAll', node.cid);
                        } else {
                            $('#tg').treegrid('collapseAll');
                        }
                    }
                }, '-', {
                    text : '刷新',
                    iconCls : 'icon-reload',
                    handler : function() {
                        $('#tg').treegrid('reload');
                    }
                } ]

         });

        function openAddWin() {
            $('#menu_info_form').form('clear');
            $('#p_row').show();
            var row = $('#tg').treegrid('getSelected');

            if (row) {
                $('#parentMenuName').val(row.text);
                $('#parentMenuId').val(row.id);
            }

            $('#menu_save_dialog').dialog('open');
            url = UrlConfig.SysMenuAdd;
        }

        function openEditWin() {
            $('#menu_info_form').form('clear');
            $('#p_row').hide();
            var row = $('#tg').treegrid('getSelected');

            if (row) {
                $('#menuId').val(row.id);
                $('#menu_info_form').form('load', row);
                $('#menu_save_dialog').dialog('open');
                url = UrlConfig.SysMenuUpdate;
            } else {
                alert('请选择要修改的菜单');
            }

        }

        function formatterdate(val, row) {
            if (val != null) {
                var date = new Date(val);
                return date.getFullYear() + '-' + (date.getMonth() + 1) + '-'
                        + date.getDate();
            }
        }
    });


    var url = "";

    function save() {
        $('#menu_info_form').form('submit',{
            url: url,
            onSubmit: function(){
                return $(this).form('validate');
            },
            success: function(result){
                result = eval('(' + result + ')');
                if (result.code) {
                    $('#menu_save_dialog').dialog('close');      // close the dialog
                    $('#tg').treegrid('reload');    // reload the user data
                }
                showMsg(result.msg);
                window.location.href="${ctx}/admin/treeMenu";
            }
        });
    }

    function deleteMenu() {
        var row = $('#tg').treegrid('getSelected');
        if (! row) {
            alert('请选择要删除的行，只能删除叶子节点');
            return;
        }

        if (row.children != null && row.children.length > 0) {
            alert("只能删除叶子节点");
            return;
        }

        $.messager.confirm('Confirm','请确认是否删除该菜单?',function(r){
            if (r) {
                $.post(UrlConfig.SysMenuDelete, {menuId:row.id}, function(res){
                    showMsg(res.msg);
                    $('#tg').treegrid('reload');
                }, 'json');
            }
        });
    }


</script>

</body>
</html>