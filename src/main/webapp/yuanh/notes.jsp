<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/core.jsp"%>
<html>
<head>
    <title>学习管理</title>
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
        layui.use(["form", "table","layer","laydate"], function () {
            table = layui.table;
            var laydate = layui.laydate;
            var form = layui.form;
            laydate.render({
                elem:'#writeTime',
                type:'datetime'
            });
            //工具栏监听事件
            table.on('tool(tableBind)', function (obj) {
                var data = obj.data;
                if (obj.event == 'detail') {
                    layer.open({
                        anim:1,
                        area:['500px'],
                        type:1,
                        title:'<b style="font-size: 20px">笔记详情</b>',
                        content:'<div style="color: gray;" class="indent"><div><b>笔记名称:</b>  '+data.notesName+'</div><br>' +
                        '<div class="indent"><b>创建者:</b>  '+data.userName+'</div><br>' +
                        '<div class="indent"><b>创建时间:</b>  '+data.writeTime+'</div><br>' +
                        '<div class="indent"><b>笔记类别:</b>  '+data.notesType+'</div><br>' +
                        '<div class="indent"><b>关键字:</b>  '+data.keyWord+'</div><br>' +
                        '<div class="indent"><b>笔记内容:</b>  '+data.notesContent+'</div><br>' +
                        '<div class="indent"><b>是否公开:</b>  '+data.isPublic+'</div></div>'
                    });
                } else if (obj.event === 'delete') {
                    layer.confirm('真的删除么?', function (index) {
                        $.get("/writeNotes.do", {"notesId": data.notesId, "method": "delNotes"}, function () {
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
                }else if(obj.event === 'check') {
                    layer.confirm('真的更改属性是否公开么?', function (index) {
                        $.get("/writeNotes.do", {"notesId": data.notesId, "method": "updatePublic"}, function () {
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
                                var notesId = new Array();
                                var i = 0;
                                $(data).each(function () {
                                    notesId[i] = this.notesId;
                                    i++;
                                });
                                var ids = notesId.join(",");
                                $.get("/writeNotes.do", {"notesId": ids, "method": "delNotes"}, function () {
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
                    case 'getCheckLength':
                        var data = checkStatus.data;
                        layer.msg('选中了：' + data.length + ' 个');
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
    </script>
</head>
<body>
<form id="fm">
    <br>
    <div class="layui-inline">
        <label class="layui-form-label">笔记名称:</label>
    </div>
    <div class="layui-inline">
        <input name="notesName" placeholder="请输入笔记名称" autocomplete="off" class="layui-input">
    </div>
    <div class="layui-inline">
    <label class="layui-form-label">创建人:</label>
    </div>
    <div class="layui-inline">
        <input name="userName" placeholder="请输入创建人名称" autocomplete="off" class="layui-input">
    </div>
    <br>
    <div class="layui-inline">
        <label class="layui-form-label">笔记类别:</label>
    </div>
    <div class="layui-inline">
        <input name="notesType" placeholder="请输入查询笔记类别" autocomplete="off" class="layui-input">
    </div>
    <div class="layui-inline">
        <label class="layui-form-label">关键字:</label>
    </div>
    <div class="layui-inline">
        <input name="keyWord" placeholder="请输入查询关键字" autocomplete="off" class="layui-input">
    </div>
    <input type="button" id="search" value="查询" class="layui-btn layui-btn-sm">
</form>
<table class="layui-table" lay-data="{url:'/writeNotes.do?method=page', page:true, id:'pageTable',toolbar:'#myBar',parseData:fmtData}" lay-filter="tableBind">
    <thead>
    <tr>
        <th lay-data="{type:'checkbox'}"></th>
        <th lay-data="{type:'numbers'}">序号</th>
        <th lay-data="{field:'notesId'}">笔记编号</th>
        <th lay-data="{field:'notesName'}">笔记名称</th>
        <th lay-data="{field:'userName'}">创建者</th>
        <th lay-data="{field:'writeTime',sort: true,width:220}">创建时间</th>
        <th lay-data="{field:'notesType'}">笔记类别</th>
        <th lay-data="{field:'keyWord'}">关键字</th>
        <th lay-data="{field:'isPublic', sort: true,templet:function(res){return res.isPublic == 1 ? '<font color=green>公开</font>': '<font color=gray>不公开</font>'}}">是否公开</th>
        <th lay-data="{fixed: 'right', toolbar: '#btns',width: 180}">操作</th>
    </tr>
    </thead>
</table>
<script type="text/html" id="btns">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="check">审核</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
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
