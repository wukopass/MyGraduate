<%--
  Created by IntelliJ IDEA.
  User: charlotte
  Date: 2018/11/18
  Time: 12:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../core.jsp" %>
<html>
<head>

    <style>

    </style>
    <title>寻找投资项目</title>
    <script src="../js/jquery-2.1.1.min.js"></script>
    <script src="../js/jquery.serializejson.min.js"></script>
    <script src="../layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <script>
        $(document).ready(function(){
            $.ajax({
                url: "${ctx}/selectperiod.do",
                //contentType:"application/json;charset=utf-8",
                type:"post",
                dataType:"json",
                success:function (data) {
                    var dataobj=data;
                    $.each(dataobj,function(index,item){
                        var obj=document.createElement("option");
                        obj.value=item.periodname;
                        obj.text=item.periodname;
                        $("#period").append(obj);
                    })
                },
                error:function (msg) {
                    alert("不能出现阶段下拉表");
                }
            });
            //城市单选选框
            $.ajax({
                url: "${ctx}/selectcity.do",
                //contentType:"application/json;charset=utf-8",
                type:"post",
                dataType:"json",
                success:function (data) {
                    var dataobj=data;
                    $.each(dataobj,function(index,item){
                        var obj=document.createElement("option");
                        obj.value=item.cityname;
                        obj.text=item.cityname;
                        $("#pcity").append(obj);
                    })
                },
                error:function (msg) {
                    alert("不能出现阶段下拉表");
                }
            });
            layui.use(['layer','laypage'], function() {
                var laypage = layui.laypage
                    , layer = layui.layer;

                $.ajax({
                    type:'post',
                    url:'${ctx}/investPage.do',
                    success:function(data){
                        laypage.render({
                            elem: 'page'
                            ,count: data.length
                            ,limit:5//每页显示多少条数据
                            ,layout: ['count', 'prev', 'page', 'next', 'skip']
                            ,jump: function(obj){
                                var thisData = data.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);
                                $("#contexts").empty();
                                $(thisData).each(function () {
                                    addContext(this);
                                });
                            }
                        });
                    },
                    dataType:'json'
                });
                $("#btn").click(function(){
                    $.ajax({
                        type:'post',
                        url:'${ctx}/investPage.do',
                        data:$("#fm1").serialize(),
                        success:function(data){
                            laypage.render({
                                elem: 'page'
                                ,count: data.length
                                ,limit:20//每页显示多少条数据
                                /*,limits:[10]*/
                                ,layout: ['count', 'prev', 'page', 'next', 'skip']
                                ,jump: function(obj){
                                    $("#pageNum").text(data.lengtch);
                                    var thisData = data.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);
                                    $("#contexts").empty();
                                    $(thisData).each(function () {
                                        addContext(this);
                                    });
                                }
                            });
                        },
                        dataType:'json'
                    });
                });
                function addContext(obj){
                    var str;
                    str="<div>" +"<hr>"+
                        "<h3 style='color:blueviolet'>"+obj.pname+"</h3>" +

                        "<span class='mylist'>所在地区:</span><span class='ziduan'>"+obj.city+"</span><br>" +
                        "<span class='mylist'>投资类型:</span><span class='ziduan'>"+obj.pmessagetype+"</span><br>" +
                        "<span class='mylist'>投资阶段:</span><span class='ziduan'>"+obj.pstage+"</span><br>" +
                        "<span class='mylist'>发布时间:</span><span class='ziduan'>"+obj.createTime+"\<br>\</span><a  style='color:blue;font-size:14px' " +
                        "target=\"_blank\" href=\"/jsp/showInvest.jsp?id="+obj.id+"\">查看详情</a>" +
                        "</div>"
                    $("#contexts").append(str);
                }

                $("#zx").click(function(){
                    $("#time").val("true");
                    $("#btn").click();
                });

                $("#zh").click(function(){
                    $("#time").val("");
                    $("#btn").click();
                });
            })
        });
    </script>
</head>
<body>
<div id="Alldiv" style="width:1000px;heigth:1500px;">
<div id =maindiv style="display:inline-block;width:800px;height:1400px;float:right;margin: auto;">
<form id="fm1">
     <h2>寻找合作项目</h2>
    <br>
    <br>
    <br>
    合作类型:
    <input type="radio" name="pmessagetype" value="股权投资">股权投资
    <input type="radio" name="pmessagetype" value="债权投资">债权投资
    <input type="radio" name="pmessagetype" value="金融投资">金融投资<br><br>
    投资阶段:
    <select id="period" name="pstage">
        <option value="">--------</option>
    </select>
    <br><br>
    所在地区:
    <select id="pcity" name="city">
        <option value="">--请选择--</option>
    </select>
    <br><br>
    <input type="text" name="pname" placeholder="输入项目关键字">
    <input id="time" hidden="hidden" type="text" name="time">

    <button  type="button" id="btn">搜索</button>
    <br>
    <br>

</form>

<div id="mid"><span id="zh">综合排序</span>|<span id="zx">最新项目</span></div>
<div id="contexts">

</div>

<div id="page" style="background-color:white;width:980px;margin:auto;">
    <div class="layui-box layui-laypage layui-laypage-default" id="layui-laypage-10">
        <span class="layui-laypage-count">共<span id="pageNum"></span>条</span>
        <a href="javascript:;" class="layui-laypage-prev layui-disabled" data-page="0">上一页</a>
        <span class="layui-laypage-curr">
                <em class="layui-laypage-em"></em>
                <em>1</em></span>
        <a href="javascript:;" data-page="2">2</a>
        <a href="javascript:;" data-page="3">3</a>
        <a href="javascript:;" data-page="4">4</a>
        <a href="javascript:;" data-page="5">5</a>
        <span class="layui-laypage-spr">…</span>
        <a href="javascript:;" class="layui-laypage-last" title="尾页" data-page="10">10</a>
        <a href="javascript:;" class="layui-laypage-next" data-page="2">下一页</a>
        <span class="layui-laypage-limits">
                <select lay-ignore="">
                    <option value="10">10 条/页</option>
                    <option value="15">15条/页</option>
                    <option value="20">20 条/页</option>
                </select>
            </span>
        <a href="javascript:;" data-page="1" class="layui-laypage-refresh">
            <i class="layui-icon layui-icon-refresh"></i>
        </a>
        <span class="layui-laypage-skip">
                到第<input type="text" min="1" value="1" class="layui-input">页
                <button type="button" class="layui-laypage-btn">确定</button>
            </span>
    </div>
</div>
</div>
</div>
</body>
</html>
