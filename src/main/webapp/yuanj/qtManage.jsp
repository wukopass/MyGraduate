<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/core.jsp"%>
<html>
<head>
    <title>题库管理</title>
    <style>
        b{
            font-size: 16px;
            text-indent: 100px;
        }
        .indent{
             text-indent: 20px;
             padding-bottom: 5px;
         }
    </style>
    <script>
        var table;
        var i = 0;
        layui.use(["form", "table","layer","laydate"], function () {
            table = layui.table;
            var layer = layui.layer;
            var laydate = layui.laydate;
            var form = layui.form;
            //工具栏监听事件
            table.on('tool(tableBind)', function (obj) {
                var data = obj.data;
                if (obj.event == 'detail') {
                    layer.open({
                        anim:1,
                        area:['700px'],
                        type:1,
                        title:'<b style="font-size: 20px">题目详情</b>',
                        content:'<div style="color: gray;" class="indent"><div><b>题目类型:</b>  '+data.qtbType+'</div><br>' +
                            '<div class="indent"><b>科目:</b>  '+data.qtbSub+'</div><br>' +
                            '<div class="indent"><b>题目内容:</b>  '+data.qtbContent+'</div><br>' +
                            '<div class="indent"><b>题目答案:</b>  '+data.qtbResult+'</div><br>' +
                            '<div class="indent"><b>题目选项:</b>  '+data.qtOptions+'</div></div>'
                    });
                } else if (obj.event === 'del') {
                    layer.confirm('真的删除么?', function (index) {
                        $.get("/insert.do", {"qtbId": data.qtbId, "method": "del"}, function () {
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
                    top.openLay("修改题目"
                        ,"/insert.do?qtbId="+ data.qtbId +"&method=init"
                        ,"930px","600px");
                }
            });
            //头部监听事件
            table.on('toolbar(tableBind)', function (obj) {
                var checkStatus = table.checkStatus(obj.config.id);
                var data = checkStatus.data;
                switch (obj.event) {
                    case 'deleteCheck':
                        if (checkStatus.data.length == 0) {
                            layer.msg("请先选中要删除的行!", {icon: 2, anim: 6})
                        } else {
                            layer.confirm('真的删除么?', function (index) {
                                var qtbIds = new Array();
                                var i = 0;
                                $(data).each(function () {
                                     qtbIds[i] = this.qtbId;
                                     i++;
                                });
                                var ids = qtbIds.join(",");
                                $.get("/insert.do", {"qtbIds": ids, "method": "dels"}, function () {
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
                        layer.open({
                            anim:0,
                            title: ['题目录入', 'font-size:18px;font-weight:bold;'],
                            area:['930px','600px'],
                            type:2,
                            content:'/yuanj/insert.jsp'
                        });
                        break;
                    case 'isAll':
                        layer.msg(checkStatus.isAll ? '全选' : '未全选');
                        break;
                };
            });
            $("#search").click(function () {
                var where = $("#fm").serializeJSON();
                table.reload('pageTable',{
                    where:where,
                    page:{
                        curr:1
                    }
                });
            });
        });
        function fmtData(res) {
            return {'code': 0 ,'msg':'','count': res.counts,'data': res.beans};
        }

        function transfer(str) {
            i = str;
        }
        /*function openLay(title, url, width, height){
            layer.open({
                type: 2 //此处以iframe举例
                ,title: title
                ,area: [width, height]
                ,shade: 0.3
                ,maxmin: true
                /!*,offset: [ //为了演示，随机坐标
                    "auto"
                ]*!/
                ,content: url
                /!*,btn: ['关闭'] //只是为了演示*!/
                ,yes: function(){
                    layer.closeAll();
                },zIndex: layer.zIndex
                ,success: function(layero){
                    layer.setTop(layero); //置顶当前窗口，该参数为当前窗口的dom对象
                }
            });
        }*/

    </script>
</head>
<body>
<form id="fm">
        <div class="layui-inline">
            <label class="layui-form-label">题目类型:</label>
        </div>
        <div class="layui-form layui-inline">
        <select name="qtbType" lay-search lay-filter="test">
            <option value="">--请选择--</option>
            <option value="单选">单选题</option>
            <option value="多选">多选题</option>
            <option value="判断">判断题</option>
            <option value="主观">主观题</option>
        </select>
    </div>
    <div class="layui-inline">
        <label class="layui-form-label">科目:</label>
    </div>
    <div class="layui-form layui-inline">
        <select name="qtbSub" lay-search>
            <option value="">--请选择--</option>
            <option value="CSS">CSS</option>
            <option value="HTML">HTML</option>
            <option value="JS">JS</option>
            <option value="JQUERY">JQUERY</option>
            <option value="JAVA">JAVA</option>
            <option value="AJAX">AJAX</option>
            <option value="SQL">SQL</option>
        </select>
    </div>
    <input type="button" id="search" value="查询" class="layui-btn layui-btn-sm">
</form>
<table class="layui-table" lay-data="{url:'/insert.do?method=page', page:true, id:'pageTable',toolbar:'#myBar',parseData:fmtData}" lay-filter="tableBind">
    <thead>
    <tr>
        <th lay-data="{type:'checkbox'}"></th>
        <th lay-data="{type:'numbers'}">序号</th>
        <th lay-data="{field:'qtbType', width:100}">题目类型</th>
        <th lay-data="{field:'qtbSub',width:100}">科目</th>
        <th lay-data="{field:'qtbContent',width:600}">题目内容</th>
        <th lay-data="{fixed: 'right', toolbar: '#btns', width: 200}">操作</th>
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
        <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
        <button class="layui-btn layui-btn-sm" lay-event="add">添加</button>
    </div>
</script>
</body>
</html>

