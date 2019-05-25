
<%@ page contentType="text/html; charset=utf-8"%>
<!doctype html>
<html>



<%@ include file="/core.jsp" %>


<head>
    <script type="text/javascript" src="/js/wangEditor.min.js"></script>
    <style>
        .model{
            width:1000px;
            heigt:1500px;
            margin:auto;
        }
        .backIndex{
            width:70px;
            line-height:30px;
            font-size: 16px;
            text-align: center;
            position: fixed;
            top:200px;
            right:80px;
            background-color: #0f62c5;
            border-radius: 3px;
        }
        .backIndex:hover{
            color:orangered;
        }
    </style>
    <script>
        layui.use(['form',"layer","table"], function() {
            table = layui.table;
            var form = layui.form;
            var layer = layui.layer;
            <c:if test="${not empty sessionScope.msg}">
            layer.msg("${sessionScope.msg}",{icon:6});
            </c:if>
            <c:remove var="msg" scope="session"></c:remove>

            table.on('tool(tableBind)', function (obj) {
                var data = obj.data;
                if(obj.data.isPublic == 0){
                    layer.open({
                        type: 1,
                        shade: 0.3,
                        offset: '150px',
                        area: ['500px','200px'],
                        content: '<i style="font-size: 20px;color:red">无法查看</i>'
                    });
                    $("#look").css(style("display:none"));
                }
                if (obj.event == 'detail') {
                    layer.open({
                        anim: 1,
                        area: ['500px'],
                        offset:'150px',
                        type: 1,
                        title: '<b style="font-size: 20px">笔记详情</b>',
                        content: '<div style="color: gray;" class="indent"><div><b>笔记名称:</b>  ' + data.notesName + '</div><br>' +
                        '<div class="indent"><b>创建者:</b>  ' + data.userName + '</div><br>' +
                        '<div class="indent"><b>创建时间:</b>  ' + data.writeTime + '</div><br>' +
                        '<div class="indent"><b>笔记类别:</b>  ' + data.notesType + '</div><br>' +
                        '<div class="indent"><b>关键字:</b>  ' + data.keyWord + '</div><br>' +
                        '<div class="indent"><b>笔记内容:</b>  ' + data.notesContent + '</div><br>' +
                        '<div class="indent"><b>是否公开:</b>  ' + data.isPublic + '</div></div>'
                    });
                }
            });
        });
    </script>
    <meta charset="utf-8">
    <link rel="stylesheet" href="/Quan/css/style.css" type="text/css" media="all"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>....管理系统</title>
 </head>
<body>
<div id="hearder2" class="clearfix">
	<div class="logo">
  <img src="/Quan/images/copy.ico">
  </div>
  <div class="logo-name"> 小甚 New Memmber 会员管理系统</div>

</div>


<div id="menu-box" class="clearfix">
    <ul>
        <li><a href="/Quan/mainMenu.jsp">首页</a></li>
        <li><a href="javascript:;">VI区</a></li>
        <li><a href="javascript:;">VII区</a></li>
        <li><a href="/Quan/vFive.jsp">VIII区</a></li>
        <li><a href="/Quan/writeNotes.jsp">邮件</a></li>
        <li><a href="/Quan/aboutSeecen.jsp" target="_blank">关于小甚</a></li>
    </ul>

</div>
<!-- detail -->
<div id="detail2-box" class="clearfix">
	<div class="tit-80"><a href="list-text2.html">邮件</a> - 查看详情</div>
    <form class="layui-form" action="/mail/sendMail.do">
        <input type="hidden" name="method" value="newNotes">
        <div class="model">

            <br>
            <div class="layui-inline">
                <label class="layui-form-label">标题:</label>
            </div>
            <div class="layui-inline">
                <input name="title" placeholder="请输入标题名称" autocomplete="off" class="layui-input">
            </div>
            <br><br>
            <input name="senderMailId" type="hidden" value="${sessionScope.memberUser.userid}" class="layui-input">
            <input name="receiverMailId" type="hidden" value="13" class="layui-input">
            <br><br>
            <div class="layui-inline">
                <label class="layui-form-label">请编辑内容:</label>
            </div>
            <div id="editor"></div>
            <input type="hidden" id="notesContent" name="content">
            <script>
                var E = window.wangEditor;
                var editor = new E('#editor');
                editor.customConfig.onchange = function (html) {
                    $("#notesContent").val(html);
                }
                editor.create();
                $("#notesContent").val(editor.txt.html())
            </script>
            <br>
            <div class="layui-form-item" style="float:right">
                <div class="layui-input-block">
                    <button class="layui-btn" id="submit" lay-filter="demo1" lay-submit="formDemo">保存</button>
                    <button class="layui-btn layui-btn-primary" type="reset">重置</button>
                </div>
            </div>
            <br><br>
            <table id="demo" lay-filter="test"></table>
            <script>
                layui.use('table', function(){
                    var table = layui.table;
                    //第一个实例
                    table.render({
                        elem: '#demo'
                        ,height: 312
                        ,url: '/mail/selectMail.do' //数据接口
                        ,where:{id:'${sessionScope.memberUser.userid}'}
                        ,parseData:function(res) { //res 即为原始返回的数据
                            return {
                                "code": 0, //解析接口状态
                                "msg": "", //解析提示文本
                                "count": 10, //解析数据长度
                                "data": res.data //解析数据列表
                            };
                        }
                        ,page: false //开启分页
                        ,cols:[[ //表头
                             {field: 'id', title: 'ID', width:80,sort:false}
                           /* ,{field: 'username', title: '用户名', width:80}*/
                            ,{field:'createtime',title:'创建时间',width:130,sort:true}
                            ,{field:'title', title: '标题', width:80, sort: true}
                            ,{field:'content', title: '内容', width:200, sort: true}
                            ,{fixed:'right',toolbar:'#btns'}
                        ]]
                    });
                });
            </script>
            <script type="text/html" id="btns">
                <a id="look" class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
            </script>
            <div style="height:175px;width:1000px">
                <img src="/images/foot.jpg">
            </div>
        </div>
    </form>








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
<div id="div6"> Copyright &copy; 2019 WU1379028478@qq.com  All rights reserved.</div>




</body>
</html>
