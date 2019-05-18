<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/core.jsp" %>
<html>
<head>
    <title>试卷管理</title>
    <script>
        var table;
        var i = 0;
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
                    layer.open({
                        anim:0,
                        title: ['查看试卷', 'font-size:18px;font-weight:bold;'],
                        area:['950px','600px'],
                        type:2,
                        content:'/test.do?testId='+ data.testId +'&method=look'
                    });
                } else if (obj.event === 'del') {
                    layer.confirm('真的删除么?', function (index) {
                        $.get("/test.do", {"testId": data.testId, "method": "del"}, function () {
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
                } /*else if (obj.event === 'edit') {
                    //top.active.openLay("修改用户","https://www.baidu.com","500px", "400px");
                    top.openLay("修改用户","/user.do?method=init&userId="+data.userId,"900px", "560px");


                }*/
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
                                var testIds = new Array();
                                var i = 0;
                                $(data).each(function () {
                                    testIds[i] = this.testId;
                                    i++;
                                });
                                var ids = testIds.join(",");
                                $.get("/test.do", {"testId": ids, "method": "del"}, function () {
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
                        }
                        break;
                    case 'add':
                        var data = checkStatus.data;
                        layer.open({
                            anim:0,
                            title: ['创建试卷', 'font-size:18px;font-weight:bold;'],
                            area:['900px','500px'],
                            type:2,
                            content:'/yuanj/testManage/addTest.jsp'
                        });
                        break;
                    case 'isAll':
                        layer.msg(checkStatus.isAll ? '全选' : '未全选');
                        break;
                }
                ;
            });
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

        function transfer(str) {
            i = str;
        }

        function fmtData(res) {
            return {'code': 0, 'msg': '', 'count': res.counts, 'data': res.beans};
        }

    </script>
</head>
<body>
<br>
<form id="fm" class="layui-form">
    <div class="layui-inline">
        <label class="layui-form-label">试卷名称:</label>
    </div>
    <div class="layui-inline">
        <input name="testName" placeholder="请输入名称" autocomplete="off" class="layui-input">
    </div>
    <div class="layui-inline">
        <label class="layui-form-label">出卷人:</label>
    </div>
    <div class="layui-inline">
        <input name="userName" placeholder="请输入名称" autocomplete="off" class="layui-input">
    </div><br><br>
    <div class="layui-inline">
        <label class="layui-form-label">考试时长:</label>
    </div>
    <div class="layui-inline">
        <input name="testDate" placeholder="请输入时长" autocomplete="off" class="layui-input">
    </div>
    <div class="layui-inline">
        <label class="layui-form-label">试卷总分:</label>
    </div>
    <div class="layui-inline">
        <input name="testVal" placeholder="请输入试卷总分" autocomplete="off" class="layui-input">
    </div>

    <input type="button" id="search" value="查询" class="layui-btn layui-btn-sm">
</form>

<table class="layui-table" lay-data="{url:'/test.do?method=page', page:true, id:'pageTable',toolbar: '#myBar', parseData:fmtData}" lay-filter="tableBind">
    <thead>
    <tr>
        <th lay-data="{type:'checkbox'}"></th>
        <th lay-data="{type:'numbers'}">序号</th>
        <th lay-data="{field:'testName', width:180}">试卷名称</th>
        <th lay-data="{field:'userName',width:100}">出卷人</th>
        <th lay-data="{field:'testStarDate',sort: true,width:200}">最早开考时间</th>
        <th lay-data="{field:'testEndDate',sort: true, width: 200}">最晚开考时间</th>
        <th lay-data="{field:'testDate',width:100}">考试时长</th>
        <th lay-data="{field:'testVal', width: 100}">试卷总分</th>
        <th lay-data="{toolbar: '#btns', width: 200}">操作</th>
    </tr>
    </thead>
</table>
<script type="text/html" id="btns">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看详情</a>
    <%--<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>--%>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除试卷</a>
</script>
<script type="text/html" id="myBar">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="deleteCheck">删除选中</button>
        <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
        <button class="layui-btn layui-btn-sm" lay-event="add">添加</button>
    </div>
</script>
</body>
</html>
