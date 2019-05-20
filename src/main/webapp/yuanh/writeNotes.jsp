
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
        function fmtData(res) {
            return {'code': 0 ,'msg':'','count': res.counts,'data': res.beans};
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


<div id="detail2-box" class="clearfix">
	<div class="tit-80"><a href="list-text2.html">学习笔记</a> - 查看详情</div>

    <form class="layui-form" action="/writeNotes.do">
        <input type="hidden" name="method" value="newNotes">
        <div class="model">
            <div style="width: 1000px;height:175px">
                <img src="/images/note.jpg">
            </div>

            <br>
            <div class="layui-inline">
                <label class="layui-form-label">标题:</label>
            </div>
            <div class="layui-inline">
                <input name="notesName" placeholder="请输入标题名称" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">笔记类别:</label>
            </div>
            <div class="layui-inline">
                <input name="notesType" placeholder="请输入笔记类别" autocomplete="off" class="layui-input">
            </div>
            <br><br>
            <div class="layui-inline">
                <label class="layui-form-label">署名:</label>
            </div>
            <div class="layui-inline">
                <input name="userName" placeholder="请输入作者姓名" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">关键字:</label>
            </div>
            <div class="layui-inline">
                <input name="keyWord" placeholder="请输入查询关键字" autocomplete="off" class="layui-input">
            </div>
            <br><br>
            <div class="layui-form-item">
                <label class="layui-form-label">单选框</label>
                <div class="layui-input-block">
                    <input type="radio" name="isPublic" value="1" title="公开">
                    <input type="radio" name="isPublic" value="0" title="不公开" checked="checked">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">请编辑内容:</label>
            </div>
            <div id="editor"></div>
            <input type="hidden" id="notesContent" name="notesContent">
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
            <table class="layui-table" lay-data="{url:'/writeNotes.do?method=page', page:true, id:'pageTable',toolbar:'#myBar',parseData:fmtData}" lay-filter="tableBind">
                <thead>
                <tr>
                    <th lay-data="{type:'numbers'}">序号</th>
                    <th lay-data="{field:'notesName'}">笔记名称</th>
                    <th lay-data="{field:'userName'}">创建者</th>
                    <th lay-data="{field:'writeTime',sort: true}">创建时间</th>
                    <th lay-data="{field:'notesType'}">笔记类别</th>
                    <th lay-data="{field:'keyWord'}">关键字</th>
                    <th lay-data="{field:'isPublic', sort: true,templet:function(res){return res.isPublic == 1 ? '<font color=green>公开</font>': '<font color=gray>不公开</font>'}}">是否公开</th>
                    <th lay-data="{fixed: 'right', toolbar: '#btns'}">操作</th>
                </tr>
                </thead>
            </table>
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
<div id="div6">Copyright &copy; 2018 南昌思诚科技有限公司 All rights reserved.</div>




</body>
</html>