
<%@ page contentType="text/html; charset=utf-8"%>
<!doctype html>
<html>



<%@ include file="/core.jsp" %>


<head>
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
                        title: ['试卷', 'font-size:18px;font-weight:bold;'],
                        area:['1200px','600px'],
                        type:2,
                        content:'/stu.do?testId='+ data.testId +'&method=toTest'
                    });
                } else if (obj.event === 'his') {
                    layer.open({
                        anim:0,
                        title: ['历史记录', 'font-size:18px;font-weight:bold;'],
                        area:['1200px','600px'],
                        type:2,
                        content:'/yuanj/stuManage/testHistory.jsp'
                    });
                }
            });


        });

        function transfer(str) {
            i = str;
        }

        function fmtData(res) {
            return {'code': 0, 'msg': '', 'count': res.counts, 'data': res.beans};
        }

    </script>
    <meta charset="utf-8">
    <link rel="stylesheet" href="/Quan/css/style.css" type="text/css" media="all"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>....管理系统</title>
 </head>
<body>
<div id="hearder2" class="clearfix">
	<div class="logo">
  <img src="/Quan/images/head_seecen.png">
  </div>
  <div class="logo-name">思诚e-leaning 教育平台</div>
   
</div>


<div id="menu-box" class="clearfix">
    <ul>
        <li><a href="/Quan/mainMenu.jsp">首页</a></li>
        <li><a href="/chat.do?method=friend&userId=${sessionScope.user.userId}&divId=myfriend">聊天交友</a></li>
        <li><a href="/forum.do?method=index">社区</a></li>
        <li><a href="/yuanj/stuManage/stuToTest.jsp">考试</a></li>
        <li><a href="/yuanh/writeNotes.jsp">学习</a></li>
        <li><a href="/Quan/aboutSeecen.jsp" target="_blank">关于思诚</a></li>
    </ul>

</div>
<!-- detail -->
<div id="slider-box" style="background:url(/Quan/images/slider3.jpg) center center;"></div>

<div id="detail2-box"  style="width:1250px;" class="clearfix">
	<div class="tit-80"><a href="list-text2.html">考试界面</a> - 查看详情</div>

      

<table class="layui-table" lay-data="{url:'/stu.do?method=page', page:true, id:'pageTable',toolbar: '#myBar', parseData:fmtData}" lay-filter="tableBind">
    <thead>
    <tr>
        <th lay-data="{type:'numbers'}">序号</th>
        <th lay-data="{field:'testName', width:220}">试卷名称</th>
        <th lay-data="{field:'userName',width:100}">出卷人</th>
        <th lay-data="{field:'testStarDate',sort: true,width:200}">最早开考时间</th>
        <th lay-data="{field:'testEndDate',sort: true, width: 200}">最晚开考时间</th>
        <th lay-data="{field:'testDate',width:120}">考试时长</th>
        <th lay-data="{field:'testVal', width: 120}">试卷总分</th>
        <th lay-data="{toolbar: '#btns', width: 200}">操作</th>
    </tr>
    </thead>
</table>
<script type="text/html" id="btns">
    <input id="toTest" type="button"class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail" style="color: green" value="参加考试">
    <input id="history" type="button" class="layui-btn layui-btn-primary layui-btn-xs" lay-event="his"  style="color: red" disabled value="历史记录">
</script>
<br><br><br><br><br><br><br><br><br><br>






</div>
<!-- div5 -->
<div id="div5" class="clearfix">
    <div class="link-box">
    	<span>友情链接：</span>
        <select onChange="frlink(this)" name="select" class="select-link">
            <option selected>--- 教育类网站 ---</option>
            <option value="http://www.veryhuo.com">烈火网</option>
            <option value="http://www.sina.com.cn">新浪网</option>
            <option value="http://www.163.com">网易</option>
        </select>
        <select onChange="frlink(this)" name="select" class="select-link">
            <option selected>--- 政府类网站 ---</option>
            <option value="http://www.china.com">中华网</option>
            <option value="http://www.sina.com.cn">新浪网</option>
            <option value="http://www.163.com">网易</option>
        </select>
        <select onChange="frlink(this)" name="select" class="select-link">
            <option selected>--- 校园类网站 ---</option>
            <option value="http://www.veryhuo.com">烈火网</option>
            <option value="http://www.sina.com.cn">新浪网</option>
            <option value="http://www.163.com">网易</option>
        </select>
        <select onChange="frlink(this)" name="select" class="select-link">
            <option selected>--- 其它类网站 ---</option>
            <option value="http://www.veryhuo.com">烈火网</option>
            <option value="http://www.sina.com.cn">新浪网</option>
            <option value="http://www.163.com">网易</option>
        </select>
    </div>
</div>
<div id="div6">Copyright &copy; 2018 南昌思诚科技有限公司 All rights reserved.</div>




</body>
</html>
