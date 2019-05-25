<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/core.jsp" %>
<html>
<head>
    <title>用户管理</title>
    <script>
        var table;
        layui.use(["form", "table", "layer", "laydate"], function () {
            table = layui.table;
            var laydate = layui.laydate;
            var form = layui.form;
            laydate.render({
                elem: '#startTimeStr'
                ,type: 'datetime'
            });
            laydate.render({
                elem: '#endTimeStr'
                ,type: 'datetime'
            });
            table.on('tool(tableBind)', function (obj) {
                var data = obj.data;
                if (obj.event == 'detail') {
                    layer.msg("点击了查看");
                } else if (obj.event === 'del') {
                    layer.confirm('真的删除么?', function (index) {
                        //layer.msg("点击了删除");
                        $.post("/user/delete.do", {"userid": data.userid}, function () {
                            var where = $("#fm").serializeJSON();
                            table.reload('pageTable', {
                                where: where,
                                page: {
                                    curr: 1
                                }
                            });
                            layer.close(index);
                        });
                    });
                } else if (obj.event === 'edit') {
                    top.openLay("修改用户","${ctx}/selectOne.do?userId="+data.userid,"900px", "560px");
                }
            });
            table.on('toolbar(tableBind)', function (obj) {
                var checkStatus = table.checkStatus(obj.config.id);
                var data = checkStatus.data;
                switch (obj.event) {
                    case 'deleteCheck':
                        if (checkStatus.data.length == 0) {
                            layer.msg("请先选中要删除的行!", {icon: 2, anim: 6})
                        } else {
                            layer.confirm('真的删除么?', function (index) {
                                var userId = new Array();
                                var i = 0;
                                $(data).each(function () {
                                    userId[i] = this.userId;
                                    i++;
                                });
                                var ids = userId.join(",");
                                $.get("/delete.do", {"userid": ids, "method": "delete"}, function () {
                                    var where = $("#fm").serializeJSON();
                                    table.reload('pageTable', {
                                        where: where,
                                        page: {
                                            curr: 1
                                        }
                                    });
                                    layer.close(index);
                                });
                            });}
                        break;
                    case 'getCheckLength':
                        var data = checkStatus.data;
                        layer.msg('选中了：' + data.length + ' 个');
                        break;
                    case 'isAll':
                        layer.msg(checkStatus.isAll ? '全选' : '未全选');
                        break;
                }
                ;
            });
            // 查询角色
            $.get("/user/selectUserRole.do", function (r) {
                var roles = r.roles;
                $(roles).each(function () {
                    $("select[name=roleId]").append(new Option(this.rolename, this.roleid));
                });
                form.render("select","role_filter");
            }, "json");
            //  点击查询按钮
            $("#search").click(function(){
                var where = $("#fm").serializeJSON();
                table.reload('pageTable', {
                    where: where
                    , page: {
                        curr: 1 //重新从第 1 页开始
                    }
                });
            });
        });

        function fmtData(res) {
            return {'code': 0, 'msg': '', 'count': 100, 'data': res.data};
        }

        function setFace(face){
            return "<img onerror='this.src=\"${ctx}/images/default.ico\"' src='${ctx}/user.do?method=initFace&face="+face+"' class='layui-nav-img'>";

        }
    </script>
</head>
<body>
<form id="fm" class="layui-form">
    <div class="layui-inline">
        <label class="layui-form-label">用户名称:</label>
    </div>
    <div class="layui-inline">
        <input name="username" placeholder="请输入名称" autocomplete="off" class="layui-input">
    </div>


    <div class="layui-inline">
        <label class="layui-form-label">角色:</label>
    </div>

    <div class="layui-form layui-inline" lay-filter="role_filter">
        <select name="roleId" lay-search>
            <option value="">--输入或选择角色--</option>
        </select>
    </div>
    <br>
    <div class="layui-inline">
        <label class="layui-form-label">开始时间:</label>
    </div>
    <div class="layui-inline">
        <input readonly id="startTimeStr" name="startTimeStr" placeholder="请选择开始时间" autocomplete="off" class="layui-input">
    </div>
    <div class="layui-inline">
        <label class="layui-form-label">结束时间:</label>
    </div>
    <div class="layui-inline">
        <input readonly id="endTimeStr" name="endTimeStr" placeholder="请选择结束时间" autocomplete="off" class="layui-input">
    </div>

    <input type="button" id="search" value="查询" class="layui-btn layui-btn-sm">
</form>
<table class="layui-table" lay-data="{url:'/role/select.do', page:true, id:'pageTable',toolbar: '#myBar', parseData:fmtData, done: function(){autoFrame(${param.id})}}" lay-filter="tableBind">
    <thead>
    <tr>
        <th lay-data="{type:'checkbox'}"></th>
        <th lay-data="{type:'numbers'}">序号</th>
        <th lay-data="{field:'rolename', width:80}">角色名称</th>
        <th lay-data="{field:'description', sort: true, width: 300}">描述</th>
        <th lay-data="{toolbar: '#btns', width: 170, fixed: 'right'}">操作</th>
    </tr>
    </thead>
</table>
<script type="text/html" id="btns">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/html" id="myBar">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="deleteCheck">删除选中</button>
        <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
        <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
    </div>
</script>
</body>
</html>
