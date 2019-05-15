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
    <script>
        $(document).ready(function(){
            $("#buttonback").click(function(){

               window.location.replace("searchInvest.jsp");

            });
            $.ajax({
                type:'post',
                url:'${ctx}/getInvestById.do',
                data:{"id":$("#cid").text()},
                success:function(data){
                    $(data).each(function(){
                        //项目名称
                        $("#proName").text(this.pname);
                       /* $(this.pmessagetype).each(function(){
                            $("#resourceType").append(this+"   ")
                        });*/

                        $("#cooperationType").text(this.pmessagetype);
                        $("#city").text(this.city);
                         $(this.industry).each(function(){

                            $("#myindustry").append(this+"   ");
                        });
                         $("#pmoney").text(this.pmoney);
                         $("#pstarttime").text(this.pstarttime);
                         $("#pendtime").text(this.pendtime);
                         $("#ptimestate").text(this.timestate);
                         $("#pincome").text(this.pincome);
                         $("#ppstate").text(this.ppstate);
                         $("#createtime").text(this.createTime);
                        $("#company").text(this.pcompname);
                        $("#tip").text(this.pspot);
                        $("#username").text(data.username);
                    });
                },
                dataType:'json'
            });

           /* $.ajax({
                type:'post',
                url:'/getUser.do',
                data:{"id":$("#cid").text()},
                success:function(data){
                    $("#faceimg").attr("src","/imgGet.do?fileName="+data.rtfaceimg);
                    $("#userCompany").text(data.companyName);
                    $("#username").text(data.rtUserName);
                },
                dataType:'json'
            });*/
        });
    </script>
</head>
<body>
<span id="cid" hidden="hidden">${param.id}</span>
<h2 align="center">项目详情</h2>
<div id="title">
     <span  style="color:purple;font-size: 25px" id="proName"><br></span><%--<a href="jsvascript:;">收藏</a>--%>

     <br><br><br>
</div>
<div id="context">
    <div id="contextLeft" style="width:400px;float: left;">
        <h3>基本信息</h3>
        <span>资源类型:</span><span id="cooperationType"></span><br><br>
        <span>所在地区:</span><span id="city"></span><br><br>
        <span>行业:</span><span id="myindustry"></span><br><br>
        <span>资金:</span><span id="pmoney"></span>元<br><br>
        <span>投资限期:</span><span id="pstarttime"></span>~~~~~<span id="pendtime">&nbsp</span><br><br>
        <span>预计收入:</span><span id="pincome"></span><span id="ppstate"></span><br><br>
        <span>发布时间:</span><span id="createtime"></span><br><br>
        <br>
        <div id="bottom" style="float: left;">
            <span>公司亮点:</span><br>
            <span id="tip"></span>
        </div>
        <br><br><br><br>
        <button type="button" id="buttonback">返回</button>
    </div>
    <div id="contextRight" style="width:400px;border: 1px solid green;float: right;">
        <div id="face"><img id="faceimg" src=""></div>
        <span id="userCompany"></span><br>
        <span id="username"></span><br>
        <a href="${ctx}/jsp/personMessage/SendEMail.jsp?id=${param.id}">联系他</a>
    </div>
</div>




</body>
</html>
