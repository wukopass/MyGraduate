<%--
  Created by IntelliJ IDEA.
  User: tl
  Date: 2018/11/10
  Time: 12:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../core.jsp" %>
<html>
<head>
    <title>Title</title>
    <script src="../js/jquery-2.1.1.min.js"></script>
    <script src="../js/jquery.serializejson.min.js"></script>
    <script src="../layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <link rel="stylesheet" href="../css/user_info.css">
    <script>
        $(document).ready(function(){

            $.ajax({
                type:'post',
                url:'${ctx}/initIndustry.do',
                data:{},
                success:function(data){
                    $(data).each(function(){
                        var obj=document.createElement("option");
                        obj.text=this.iname;
                        obj.value=this.iname;
                        $("#industry").append(obj);
                    });
                },
                dataType:'json'
            });

            $.ajax({
                type:'post',
                url:'${ctx}/initCity.do',
                data:{},
                success:function(data){
                    for(var i=0;i<data.length;i++){
                        var obj=document.createElement("option");
                        obj.value=data[i];
                        obj.text=data[i];
                        $("#city").append(obj);
                    }

                },
                dataType:"json"
            });



        });

        layui.use(['layer','laypage'], function() {
            var laypage = layui.laypage
                , layer = layui.layer;

            $.ajax({
                type:'post',
                url:'${ctx}/coopPage.do',
                success:function(data){
                    laypage.render({
                        elem: 'page'
                        ,count: data.length
                        ,limit:20//每页显示多少条数据
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
                    url:'${ctx}/coopPage.do',
                    data:$("#fm1").serialize(),
                    success:function(data){
                        laypage.render({
                            elem: 'page'
                            ,count: data.length
                            ,limit:20//每页显示多少条数据
                            /*,limits:[10]*/
                            ,layout: ['count', 'prev', 'page', 'next', 'skip']
                            ,jump: function(obj){
                                $("#pageNum").text(data.length);
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
                str="<div style=\"width: 80%;margin:auto;margin-top:20px;\">" +
                    "<h4 class=\"proName\">"+obj.projectName+"</h4>" +
                    "<span class=\"fontOne\">所在地区 :</span><span class=\"fontOne\">"+obj.city+"</span><br>" +
                    "<span class=\"fontOne\">合作类型 :</span><span class=\"fontOne\">"+obj.cooperationType+"</span><br>" +
                    "<span class=\"fontOne\">发布时间 :</span><span class=\"fontOne\">"+obj.createTime+"</span><a class=\"proShow\" target=\"_blank\" href=\" /jsp/showCoop.jsp?id="+obj.id+" \">查看详情</a>" +
                    "</div>";
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


        });

    </script>

    <style>
        *{margin:0;padding: 0;}
        #menu{width:100%;height:50px;}
        .menuI{width:266px;height:50px;font-style: normal;display: inline-block;
            text-align: center;line-height: 50px;background-color: #666666;color:white;
        }
        .fontOne{color: white;line-height: 40px;font-size: 16px;margin-right: 40px;}
        .fontTwo{color: white;font-weight: bold;line-height: 40px;font-size: 16px;}
        .input{width:400px;height:30px;border-radius: 5px;}
        .select{width:150px;height:30px;border-radius: 5px;}
        #btn{width:80px;height:30px;background-color: #CC9966;color: white;border: 0;
            color: white;font-weight: bold;line-height: 30px;font-size: 16px;
        }
        #fm1{width:600px;margin-left:100px;margin-top:30px;}

        #mid{width:100%;height:60px;background-color: #4D4D4D;}
        #zh,#zx{color:white;size:18px;font-weight: bold;line-height: 40px;margin-left: 100px;
            margin-top:10px;display: inline-block;cursor: pointer;
        }

        .proName{color:#CC9966;border-bottom: 1px solid #CC9966;height:40px;line-height: 40px;}
        .proShow{text-underline: none;color: #CC9966;display: inline-block;margin-right:10px;}
    </style>
</head>
<body>
    <%@include file="/jsp/personMessage/xyzTitle.jsp"%>

    <div id="all" style="background-color: #333333;">
        <div id="menu">
            <i class="menuI" onclick="window.location.href=''">找资金</i>
            <i class="menuI" onclick="window.location.href=''">找项目</i>
            <i class="menuI" onclick="window.location.href=''" style="background-color: #CC9966;">找合作</i>
            <i class="menuI" onclick="window.location.href='/jsp/findAsset.jsp'">找资产</i>
            <i class="menuI" onclick="window.location.href='/jsp/findStock.jsp'">找股权</i>
        </div>

        <form id="fm1">
            <div class="compant">
                <span class="fontOne">合作类型:</span>
                <input id="radioOne" type="radio" name="cooperationType" value="寻找资源"><label class="fontTwo" for="radioOne">寻找资源</label>
                <input id="radioTwo" type="radio" name="cooperationType" value="提供资源"><label class="fontTwo" for="radioTwo">提供资源</label>
            </div>

            <div class="compant">
                <span class="fontOne">行业分类:</span>
                <select class="select" id="industry" name="industryType">
                    <option value="">--请选择--</option>
                </select>
            </div>

            <div class="compant">
                <span class="fontOne">所在地区:</span>
                <select class="select" id="city" name="city">
                    <option value="">--请选择--</option>
                </select>
            </div>

            <div class="compant">
                <input class="input" type="text" name="projectName" placeholder="输入项目关键字">
                <input id="time" hidden="hidden" type="text" name="time">
                <button  type="button" id="btn">搜索</button>
            </div>

        </form>

        <div id="mid">
            <span id="zh">综合排序</span><span id="zx">最新项目</span>
        </div>

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
                    <option value="20">20 条/页</option>
                    <option value="30">30 条/页</option>
                    <option value="50">50 条/页</option>
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

</body>
</html>
