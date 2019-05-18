<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/core.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>思诚e-leaning 教育平台</title>
    <link rel="stylesheet" href="/chat/css/style.css" type="text/css" media="all"/>
    <style>
        a:hover{
            text-decoration: none;
        }
        #menu > li {
            font-size: 20px;
        }
        #result{
            display: none;
        }
        .cx{
            display: block !important;
        }
        #chatWindow{
            font-size: 12px;
            font-family: "微软雅黑";
            left:50%;
            display: none;
            margin-left:-400px;
            height:640px;
            width:800px;
            position:absolute;
            top:50px;
            box-shadow: gray 0px 4px 5px;
            background: url("/images/chat.jpg");
        }
        #title{
            height:40px;
            line-height:40px;
            background:-webkit-linear-gradient(left,#4B8CFE,#1FD1FF);
            text-align: center;
            color:white;
            position: relative;
            z-index:10;
        }
        #data{
            height:400px;
            border-top:1px solid gray;
            border-bottom:1px solid gray;
            overflow:auto;
            padding:5px;

        }
        #send{
            height:110px;
            padding:5px;
            outline:none;
            overflow:auto;
            color:#00FFFF;
        }
        #util{
            height:30px;
        }
        #btns1{
            text-align:right;
            padding-right:10px;
        }
        .btnSetting{
            display: inline-block;
            line-height:28px;
            font-height:12px;font-family:"微软雅黑";
            text-align:center;
            border-radius: 3px;
            text-decoration:none;
        }
        #closeBtn{
            width:70px;
            height:26px;
            color:black;
            border:1px solid gray;
            margin-right: 10px;
        }
        #closeBtn:hover{
            background-color:#EFEFF0;
        }
        #sendBtn{
            width:72px;
            height:28px;
            background-color:#4B8CFE;
            color:white;
            vertical-align: 1px;
        }
        #sendBtn:hover{
            background-color:#47C8F8;
        }
        .dataBox{
            border-radius:5px;
            padding:3px;
            background-color:#4B8CFE;
            margin-left:20px;
            color:white;
            width:auto;
            display: inline-block;
        }
        .fright{
            float: right;
            clear:both;
            text-align:right;
        }
        .fleft{
            float:left;
            clear:both;
        }
        #util>a{
            display: inline-block;
            width:25px;
            height:25px;
            margin:0 6px;
        }
        #util>a:hover{
            background: lightgray;
            border-radius:4px;
        }
        .i1{
            background: url("/images/i1.png") no-repeat center;
        }
        .i2 {
            background: url("/images/i2.png") no-repeat center;
        }
        .i3 {
            background: url("/images/i3.png") no-repeat center;
        }
        .dou{
            clear:both;
            text-align:center;
            line-height:30px;
            border-radius: 5px;
            background-color:yellowgreen;
        }
    </style>

    <script>
        var layer;
        var friend1;
        function openLay(title, url, width, height) {
            layer.open({
                type: 2//此处以iframe举例,1为div,2为iframe
                , title: title
                , area: [width, height]
                , shade: 0.3
                , maxmin: true
                , offset: [
                    "50px","233px"
                ]
                , content: url
                , btn: ['关闭']
                , yes: function () {
                    layer.closeAll();
                }, zIndex: layer.zIndex
                , success: function (layero) {
                    layer.setTop(layero);
                }
            })
        }

        layui.use(["element", "form", "table", "layer", "upload"], function () {
            var $ = layui.jquery
                , element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
            var form = layui.form;
            var table = layui.table;
            var upload = layui.upload;
            //触发事件
            var active = {
                tabChange: function () {
                    //切换到指定Tab项
                    element.tabChange('demo', '22'); //切换到：用户管理
                }
            };
            //查询好友的条件
            $("#search").click(function () {
                var where = $("#fm").serializeJSON();
                $("#result").addClass("cx");
                //alert(JSON.stringify(where));//将json数据格式转化成字符串
                table.reload('pageTable', {
                    where: where
                    , page: {
                        curr: 1 //重新从第一页开始
                    }
                });

            })
            //查看查询出来的好友个人资料，只可读,和添加好友
            table.on('tool(tableBind)', function (obj) {
                var data = obj.data;
                if (obj.event === 'append') {
                    window.location.href='/chat.do?method=addFriend&divId=myfriend&myId=${sessionScope.user.userId}&userId=' + data.userId;
                } else if (obj.event === 'detail') {
                    openLay("查看用户",
                        "${ctx}/chat.do?method=init&userId=" + data.userId, "900px", "560px");
                }
            });
            //修改个人资料
            var uploadInst = upload.render({
                elem: '#uploadBtn'
                , accept: 'images'
                , auto: false
                , size: 1024 * 1024 * 2
                , choose: function (obj) {
                    //预读本地文件实例，不支持ie8
                    obj.preview(function (index, file, result) {
                        $('#faceImg').attr('src', result);//图片链接(base64)
                        $(":hidden[name=face]").val(result);
                    })
                }
            })

            //监听提交，提交按钮
            form.on('submit(tj)', function (data) {
                return true;
            });
            //表单初始赋值
            form.val('myform', {
                "username": "${sessionScope.user.username}" // "name": "value"
                , "age": "${sessionScope.user.age}"
                , "gender": "${sessionScope.user.gender}"
                , "register": "${sessionScope.user.timeStamp}"
            })



            //聊天JS
            var ws;
            var xpy,ypy;
            $("#title")[0].ondragstart=function(e){
                //开始拖拽之前，记录偏移量，因为浏览器以左上角计算位置
                xpy=e.offsetX;
                ypy=e.offsetY;
            }
            $("#title")[0].ondrag=function(e){
                //松开鼠标默认会置零，这里不记录最后一次置零操作
                if(e.pageX==0 && e.pageY==0) return;
                //拖拽的时候，让窗口跟着鼠标移动
                $("#chatWindow").css({"left":e.pageX-xpy,"top":e.pageY-ypy,"margin":0});
            }


            $(".chat").click(function (){
                var url="ws://"+location.host+"/chat/"+$("#nickname").val()+"/"+friend1;//ws是一种协议，代表长连接，HTTP为短链接
                //此处的$("#nickname").val()作为值，传递给后台的{a}里面，
                //后台的"/chat/{a}"里面的{a}
                ws=new WebSocket(url);
                //当和服务器连上时触发
                ws.onopen=function (session) {
                    $("#chatWindow").show();
                    $("#data").html("");
                    display();
                };
                /*前台接受后台的数据*/
                ws.onmessage=function (msg) {
                    //将String转换成json对象
                    var chat=JSON.parse(msg.data);//chat是Chat对象
                    //console.log(msg);
                    if(((chat.nickName==$("#nickname").val()) && (chat.nickName1==friend1))) {
                        if (chat.type == 1) {
                            dou();
                        } else{//chat.nickName 和 chat.time调用的分别是Chat中的getChat()方法，和getTime()方法；
                            $("#data").append("<span class='fright'>" + "<font color='red'>" + chat.nickName + "  " + chat.time + "</font>" + "<br>" + "<font color='#00bfff'>" + chat.message + "</font>" + "</span>");
                        }
                    }
                    if((chat.nickName==friend1) && (chat.nickName1==$("#nickname").val())){
                        if (chat.type == 1) {
                            dou();
                        }else {
                            $("#data").append("<span class='fleft'>" + "<font color='#00bfff'>" + chat.nickName + "  " + chat.time + "</font>" + "<br>" + "<font color='red'>" + chat.message + "</font>" + "</span>");
                        }
                    }
                    /*让发送的信息就在当前，滚动条在最下方*/
                    $("#data").scrollTop(9999999);
                }

            });
            /*发送按钮*/
            $("#sendBtn").click(function (){
                var content=$("#send").html();
                //使用ws发送该消息至后台
                $("#send").html("");
                $("#send").focus();
                ws.send(content);
                //往数据库里面写入消息
                $.post("/chat.do","method=record&username="+friend1+"&myname=${sessionScope.user.username}&content="+content,function(r){
                },"json");
            });
            /*关闭按钮*/
            $("#closeBtn").click(function () {
                ws.close();//关闭客户端与服务端的连接
                $("#join").show();
                $("#chatWindow").hide();
            })
            $(".i1").click(function (){
                $("#myFile").click();//模拟点击一下
            })
            var reader=new FileReader();
            $("#myFile").change(function (){
                var thisFile=this.files[0];
                reader.readAsDataURL(thisFile);//去解析这个图片
                //清空一次状态，防止重复选择，不触发onchange
                $("#myFile").val("");
            });
            //解析图片完成的时候会触发这个事件
            reader.onload=function(){
                var obj=document.createElement("img");
                obj.src=reader.result;
                $("#send").append(obj);
            }
            //加载emoji
            $("#send").emoji({
                button:"#emoji",
                showTab:true,
                animation:'fade',
                icons:[{
                    name:"QQ表情",
                    path:"/emoji/dist/img/qq/",
                    maxNum:91,
                    file:".gif"
                },{
                    name:"贴吧表情",
                    path:"/emoji/dist/img/tieba/",
                    maxNum:50,
                    file:".jpg"
                }]
            });
            var down=0;
            /*添加快捷键*/
            $("#send").keydown(function (event) {
                if((event.ctrlKey && event.keyCode==13)|| event.keyCode==13){
                    $("#sendBtn").click();//模拟手动点击发送按钮，代码点击；
                }
            })
            $(".i3").click(function () {
                ws.send("\0");
            })
        })


       $(document).ready(function(){
            gbdiv();

        })
        //与好友聊天的好友名字
        function friend(friendname) {
            friend1=friendname;
        }
        //显示全部聊天记录
        function display(){
            $.get("/chat.do","method=display&username="+friend1+"&myname=${sessionScope.user.username}",function(r){
                $(r).each(function(){
                    if((this.sendname==$("#nickname").val()) && (this.recevice==friend1)){
                        $("#data").append("<span class='fright'>" + "<font color='red'>" + this.sendname + "  " + this.time + "</font>" + "<br>" + "<font color='#00bfff'>" + this.content + "</font>" + "</span>");
                    }
                    if((this.sendname==friend1)&& (this.recevice==$("#nickname").val())){
                        $("#data").append("<span class='fleft'>" + "<font color='#00bfff'>" + this.sendname + "  " + this.time + "</font>" + "<br>" + "<font color='red'>" + this.content + "</font>" + "</span>");
                    }
                    $("#data").scrollTop(9999999);
                })
            },"json");
        }
        //改变div
        function gbdiv(){
            $("#myfriend").removeClass("layui-show");
            $("#mydata").removeClass("layui-show");
            $("#myblack").removeClass("layui-show");
            $("#findfriend").removeClass("layui-show");
            $("#stranger").removeClass("layui-show");
            $("#friendrequest").removeClass("layui-show");
            $("#${divId}").addClass("layui-show");
        }

        //窗口抖动
        function dou() {
            var initx=$("#chatWindow").offset().left;
            var inity=$("#chatWindow").offset().top;
            for(var i=0;i<=10;i++){
                $("#chatWindow").animate({"left":initx-10,"top":inity-10},10);
                $("#chatWindow").animate({"left":initx,"top":inity},10);
                $("#chatWindow").animate({"left":initx+10,"top":inity+10},10);
                $("#chatWindow").animate({"left":initx,"top":inity},10);
            }
        }
        //分页返回的状态码
        function fmtData(res) {
            return {'code': 0, 'msg': '', 'count': res.counts, 'data': res.beans};
        }
        //设置默认头像
        function setFace(face) {
            return "<img onerror='this.src=\"${ctx}/images/default.gif\"' src='${ctx}/chat.do?method=initFace&face=" + face + "' class='layui-nav-img'>";
        }
    </script>
</head>

<body>
<div id="hearder2" class="clearfix">
    <div class="logo">
        <img src="/chat/images/head_seecen.png">
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
    <div class="tit-80"><a href="list-text2.html">交友中心</a> - 查看详情</div>
    <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
    <ul class="layui-tab-title" id="menu">
        <li>我的好友</li>
        <li>个人资料</li>
        <li>黑名单</li>
        <li>找朋友</li>
        <li>陌生人</li>
        <li>好友请求</li>
    </ul>

    <div class="layui-tab-content">
        <%--我的好友--%>
        <div class="layui-tab-item" id="myfriend">
            <c:forEach var="friend" items="${sessionScope.friends}">
                <img style="width:100px;height:100px;"
                     onerror="this.src='${ctx}/images/default.gif'"
                     src="${ctx}/chat.do?method=initFace&face=${friend.face}"
                     class="layui-upload-img" >
                <span style="font-size: 15px;font-weight: bold">姓名：${friend.username}&nbsp&nbsp&nbsp&nbsp</span>
                <span style="font-size: 15px;font-weight: bold">年龄: ${friend.age}&nbsp&nbsp&nbsp&nbsp</span>
                <span style="font-size: 15px;font-weight: bold">性别：<c:if test="${friend.gender==1}">男</c:if>
                        <c:if test="${friend.gender==0}">女</c:if>&nbsp&nbsp&nbsp&nbsp</span>
                <span style="font-size: 15px;font-weight: bold">注册时间：${friend.timeStamp}&nbsp&nbsp&nbsp&nbsp</span>
                <div><a href="/chat.do?method=black&userId=${friend.userId}&divId=myfriend&myId=${sessionScope.user.userId}"  style="font-size: 15px;font-weight: bold"><img src="/images/black.png">&nbsp&nbsp加入黑名单</a></div>
                <div><a href="/chat.do?method=delete&userId=${friend.userId}&myId=${sessionScope.user.userId}&divId=myfriend" style="font-size: 15px;font-weight: bold"><img src="/images/delete.png">&nbsp&nbsp删除好友</a></div>
                <div><a href="javascript:;" onclick="friend('${friend.username}')" class="chat" style="font-size: 15px;font-weight: bold"><img src="/images/chat.png">&nbsp&nbsp与好友聊天</a></div>
            </c:forEach>
        </div>

        <%--个人资料--%>
        <div class="layui-tab-item" id="mydata">
            <form  lay-filter="myform" class="layui-form layui-form-pane" method="post" action="${ctx}/chat.do">
                <input type="hidden" name="method" value="update">
                <input type="hidden" name="userId" value="${sessionScope.user.userId}">
                <input type="hidden" name="face" value="${sessionScope.user.face}">
                <input type="hidden" name="divId" value="mydata">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">用户名</label>
                        <div class="layui-input-block">
                            <input readonly name="username" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">年龄</label>
                        <div class="layui-input-inline">
                            <input readonly lay-verify="required" type="text" name="age" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>
                <%--注册时间--%>
                <div class="layui-inline">
                    <label class="layui-form-label">注册时间</label>
                    <div class="layui-input-inline">
                        <input readonly lay-verify="required" type="text" name="register" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item" pane="">
                    <label class="layui-form-label">单选框</label>
                    <div class="layui-input-block">
                        <input disabled type="radio" name="gender" value="1" title="男">
                        <input disabled type="radio" name="gender" value="0" title="女">
                    </div>
                </div>

                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">头像</label>
                    <div class="layui-input-block">
                        <%--<div class="layui-inline">
                            <button type="button" class="layui-btn" id="uploadBtn">上传图片</button>
                        </div>--%>
                        <div class="layui-inline">
                            <img style="border-radius:50%;width:100px;height:100px;"
                                 onerror="this.src='${ctx}/images/default.gif'"
                                 src="${ctx}/chat.do?method=initFace&face=${sessionScope.user.face}" class="layui-upload-img"
                                 id="faceImg">
                        </div>
                    </div>
                </div>

                <%--<div class="layui-form-item">
                    <button class="layui-btn" lay-submit="" lay-filter="tj">提交</button>
                    &lt;%&ndash;<input type="submit" value="提交">&ndash;%&gt;
                </div>--%>
            </form>
        </div>

        <%--我的黑名单--%>
        <div class="layui-tab-item" id="myblack">
            <c:forEach var="black" items="${sessionScope.blacks}">
                <img style="width:100px;height:100px;"
                     onerror="this.src='${ctx}/images/default.gif'"
                     src="${ctx}/chat.do?method=initFace&face=${black.face}"
                     class="layui-upload-img" >
                <span style="font-size: 15px;font-weight: bold">姓名：${black.username}&nbsp&nbsp&nbsp&nbsp</span>
                <span style="font-size: 15px;font-weight: bold">年龄: ${black.age}&nbsp&nbsp&nbsp&nbsp</span>
                <span style="font-size: 15px;font-weight: bold">性别：<c:if test="${black.gender==1}">男</c:if>
                        <c:if test="${black.gender==0}">女</c:if>&nbsp&nbsp&nbsp&nbsp</span>
                <span style="font-size: 15px;font-weight: bold">注册时间：${black.timeStamp}&nbsp&nbsp&nbsp&nbsp</span>
                <div><a href="/chat.do?method=remove&userId=${black.userId}&divId=myblack&myId=${sessionScope.user.userId}" style="font-size: 15px;font-weight: bold"><img src="/images/white.png">&nbsp移除黑名单</a></div>
            </c:forEach>
        </div>

        <%--查找好友--%>
        <div class="layui-tab-item" id="findfriend">
            <b><font size="5">筛选条件：</font></b><br><br><br>
            <form id="fm">
                <div class="layui-inline">
                    <label class="layui-from-label">性别：</label>
                </div>
                <div class="layui-form layui-inline">
                    <select name="gender" lay-search>
                        <option value="">--输入或选择性别--</option>
                        <option value="1">男</option>
                        <option value="0">女</option>
                    </select>
                </div>

                <div class="layui-inline">
                    <label class="layui-form-label">用户名称:</label>
                </div>
                <div class="layui-inline">
                    <input name="username" placeholder="请输入名称" autocomplete="off" class="layui-input">
                </div>

                <div class="layui-inline">
                    <label class="layui-form-label">年龄:</label>
                </div>
                <div class="layui-inline">
                    <input name="age" placeholder="请输入年龄" autocomplete="off" class="layui-input">
                </div>

                <input type="button" id="search" value="查找" style="background: #30a89d" class="layui-btn layui-btn-sm">
            </form>

            <%--查询出来的结果--%>
            <div id="result">
            <table  class="layui-table" lay-data="{url:'/chat.do?method=page&myId=${sessionScope.user.userId}', id:'pageTable',parseData:fmtData}"
                   lay-filter="tableBind">
                <thead>
                <tr>
                    <th lay-data="{type:'numbers',width:80}">序号</th>
                    <th lay-data="{field:'username', width:80}">用户名</th>
                    <th lay-data="{field:'gender', width:80, sort: true,templet:function(res){return res.gender == 1 ? '男':'女'}}">
                        性别
                    </th>
                    <th lay-data="{field:'age',width:180}">年龄</th>
                    <th lay-data="{field:'face',width:80,templet:function(res){return setFace(res.face);}}">头像</th>
                    <th lay-data="{fixed: 'right', toolbar: '#btns'}">操作</th>
                </tr>
                </thead>
            </table>
            </div>
            <script type="text/html" id="btns">
                <a class="layui-btn layui-btn-xs" lay-event="append">发送好友请求</a>
                <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看信息</a>
            </script>
        </div>

        <%--陌生人--%>
        <div class="layui-tab-item" id="stranger">
            <c:forEach var="stranger" items="${sessionScope.strangers}">
                <img style="width:100px;height:100px;"
                     onerror="this.src='${ctx}/images/default.gif'"
                     src="${ctx}/chat.do?method=initFace&face=${stranger.face}"
                     class="layui-upload-img" >
                <span style="font-size: 15px;font-weight: bold">姓名：${stranger.username}&nbsp&nbsp&nbsp&nbsp</span>
                <span style="font-size: 15px;font-weight: bold">年龄: ${stranger.age}&nbsp&nbsp&nbsp&nbsp</span>
                <span style="font-size: 15px;font-weight: bold">性别：<c:if test="${stranger.gender==1}">男</c:if>
                        <c:if test="${stranger.gender==0}">女</c:if>&nbsp&nbsp&nbsp&nbsp</span>
                <span style="font-size: 15px;font-weight: bold">注册时间：${stranger.timeStamp}&nbsp&nbsp&nbsp&nbsp</span>
                <div><a href="/chat.do?method=addFriend&userId=${stranger.userId}&myId=${sessionScope.user.userId}&divId=stranger" style="font-size: 15px;font-weight: bold"><img src="/images/add.png">&nbsp发送好友请求</a></div>
            </c:forEach>
        </div>
        <%--好友请求--%>
        <div class="layui-tab-item" id="friendrequest">
            <c:forEach var="friendreq" items="${sessionScope.friendreqs}">
                <img style="width:100px;height:100px;"
                     onerror="this.src='${ctx}/images/default.gif'"
                     src="${ctx}/chat.do?method=initFace&face=${friendreq.face}"
                     class="layui-upload-img" >
                <span style="font-size: 15px;font-weight: bold">姓名：${friendreq.username}&nbsp&nbsp&nbsp&nbsp</span>
                <span style="font-size: 15px;font-weight: bold">年龄: ${friendreq.age}&nbsp&nbsp&nbsp&nbsp</span>
                <span style="font-size: 15px;font-weight: bold">性别：<c:if test="${friendreq.gender==1}">男</c:if>
                        <c:if test="${friendreq.gender==0}">女</c:if>&nbsp&nbsp&nbsp&nbsp</span>
                <span style="font-size: 15px;font-weight: bold">注册时间：${friendreq.timeStamp}&nbsp&nbsp&nbsp&nbsp</span>
                <div><a href="/chat.do?method=agree&userId=${friendreq.userId}&myId=${sessionScope.user.userId}&divId=myfriend" style="font-size: 15px;font-weight: bold"><img src="/images/yes.png">同意该好友请求</a></div>
                <div><a href="/chat.do?method=refuse&userId=${friendreq.userId}&myId=${sessionScope.user.userId}&divId=myfriend" style="font-size: 15px;font-weight: bold"><img src="/images/no.png">拒绝该好友请求</a></div>
            </c:forEach>
        </div>
    </div>
</div>
</div>
<%--聊天窗口--%>
<input id="nickname" type="hidden" value="${sessionScope.user.username}">
<div id="chatWindow">
    <div id="title"></div>
    <div id="data"></div>
    <div id="util">
        <input accept=".jpg,.gif,.png,.bmp,.jpeg" style="display:none" type="file" id="myFile">
        <a class="i1" href="javascript:;"></a>
        <a id="emoji" class="i2" href="javascript:;"></a>
        <a class="i3" href="javascript:;"></a>
    </div>
    <div id="send" contenteditable="true"></div>
    <div id="btns1">
        <a id="closeBtn" class="btnSetting" href="javascript:;">关闭(<u>C</u>)</a>
        <a id="sendBtn" class="btnSetting" href="javascript:;">发送(<u>S</u>)</a>
    </div>
</div>
<div id="div6">Copyright &copy; 2018 南昌思诚科技有限公司 All rights reserved.</div>

