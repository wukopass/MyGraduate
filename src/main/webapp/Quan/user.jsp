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
                        $.get("/user.do", {"userId": data.userId, "method": "delete"}, function () {
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
                    //top.active.openLay("修改用户","https://www.baidu.com","500px", "400px");
                    top.openLay("修改用户","${ctx}/user.do?method=init&userId="+data.userId,"900px", "560px");
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
                                $.get("/user.do", {"userId": ids, "method": "delete"}, function () {
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
            $.get("/user.do", {"method": "allRoles"}, function (r) {
                $(r).each(function () {
                    $("select[name=roleId]").append(new Option(this.roleName, this.roleId));
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
            return {'code': 0, 'msg': '', 'count': res.counts, 'data': res.beans};
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

    <div class="layui-inline">
        <label class="layui-form-label">性别:</label>
    </div>
    <div class="layui-form layui-inline">
        <select name="gender" lay-search>
            <option value="">--输入或选择性别--</option>
            <option value="1">男</option>
            <option value="0">女</option>
        </select>
    </div>
    <input type="button" id="search" value="查询" class="layui-btn layui-btn-sm">
</form>
<table class="layui-table" lay-data="{url:'/user.do', page:true, id:'pageTable',toolbar: '#myBar', parseData:fmtData, done: function(){autoFrame(${param.id})}}" lay-filter="tableBind">
    <thead>
    <tr>
        <th lay-data="{type:'checkbox'}"></th>
        <th lay-data="{type:'numbers'}">序号</th>
        <th lay-data="{field:'face',width:70,templet:function(res){return setFace(res.face);}}">头像</th>
        <th lay-data="{field:'username', width:80}">用户名</th>
        <th lay-data="{field:'gender', width:80, sort: true,templet:function(res){return res.gender == 1 ? '男':'女'}}">
            性别
        </th>
        <th lay-data="{field:'age', width:80}">年龄</th>
        <th lay-data="{field:'stuclass', width:80}">班级</th>

        <th lay-data="{field:'roleName', width: 200}">角色</th>
        <th lay-data="{field:'timeStamp', sort: true, width: 180}">注册时间</th>

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
