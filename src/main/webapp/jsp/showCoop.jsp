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
    <link rel="stylesheet" href="../css/user_info.css">
    <script>
        $(document).ready(function(){

            $.ajax({
                type:'post',
                url:'${ctx}/getCoopById.do',
                data:{"id":$("#cid").text()},
                success:function(data){
                    $(data).each(function(){
                        $("#proName").text(this.projectName);
                        $(this.types).each(function(){
                            $("#resourceType").append(this+"   ")
                        });
                        $("#cooperationType").text(this.cooperationType);
                        $("#city").text(this.city);
                        $(this.myLable).each(function(){
                            $("#lable").append(this+"   ");
                        });
                        $("#company").text(this.company);
                        $("#tip").text(this.tip);
                    });
                },
                dataType:'json'
            });

            $.ajax({
                type:'post',
                url:'${ctx}/getUser.do',
                data:{"id":$("#cid").text()},
                success:function(data){
                    $("#faceimg").attr("src","${ctx}/imgGet.do?fileName="+data.rtfaceimg);
                    $("#userCompany").text(data.companyName);
                    $("#username").text(data.rtUserName);
                },
                dataType:'json'
            });
        });
    </script>
    <style>
        *{margin:0;}
        .head{background-color: #333333;height:210px;width:1300px;margin: auto;}
        .proName{color:#CC9966;font-size: 20px;margin-top: 80px;display: inline-block;
            margin-left:50px;
        }
        .context{background-color: #333333;width:1300px;margin: auto;height:320px;margin-top:30px;}
        .contextLeft{width:600px;float: left;margin-top:20px;margin-left:30px;}
        .contextRight{width:600px;float: right;margin-top:20px;}
        .fontOne{color:white;font-size:17px;}

        .tip{background-color: #333333;width:1300px;margin: auto;min-height: 100px;margin-top:20px;}
        .tell{color:#CC9966;margin-left:30px;}

    </style>
</head>
<body>
<%@include file="/jsp/personMessage/xyzTitle.jsp"%>
<div style="background-color: #1C1C1C;height:780px;">
    <span id="cid" hidden="hidden">${param.id}</span>

    <div id="title" class="head">
        <h2 align="center" style="color: white;">项目详情</h2>
        <span id="proName" class="proName"></span>
        <hr style="width:1200px;margin-left:50px;margin-top:5px;size:0.3px;">
    </div>

    <div id="context" class="context">
        <div id="contextLeft" class="contextLeft">
            <span style="color:#CC9966;font-size: 20px;">基本信息</span><br><br><br>
            <span class="fontOne">资源类型 :</span><span class="fontOne" id="resourceType"></span><br><br>
            <span class="fontOne">合作类型 :</span><span class="fontOne" id="cooperationType"></span><br><br>
            <span class="fontOne">所在地区 :</span><span class="fontOne" id="city"></span><br><br>
            <span class="fontOne">热门标签 :</span><span class="fontOne" id="lable"></span><br><br>
            <span class="fontOne">所属企业 :</span><span class="fontOne" id="company"></span><br><br>
        </div>
        <div id="contextRight" class="contextRight">
        <div id="face" style="border-radius: 45%;border:1px solid white;width:112px;height:112px;margin: auto;"><img id="faceimg" src="" style="display:inline-block; border-radius: 45%;width:110px;height:110px;"></div>
        <span id="userCompany" style="color: white;display: inline-block;width: 600px;text-align: center;">公司名</span><br>
        <span id="username" style="color:white;display: inline-block;width: 600px;text-align: center;">用户名</span><br>
        <a href="${ctx}/jsp/personMessage/SendEMail.jsp?id=${param.id}" style="color:white;background-color: #CC9966;text-underline: none;display: inline-block;width:110px;height:35px;line-height: 35px;text-align: center;border-radius: 5px;margin-left:250px;">联系他</a>
    </div>
    </div>

    <div id="bottom" class="tip">
        <span class="tell">合作描述</span><br>
        <span id="tip" style="color:white;margin-left:30px;"></span>
    </div>
    <div style="width: 1300px;">
        <button onclick="window.location.href='/jsp/findCoop.jsp'" type="button" style="width: 280px;height:50px;background-color: #CC9966;color: white;border: 0;margin: auto;display:block;margin-top:20px;">返回</button>
    </div>
</div>
</body>
</html>
