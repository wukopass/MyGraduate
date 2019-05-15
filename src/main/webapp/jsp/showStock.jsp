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

            $.ajax({
                type:'post',
                url:'${ctx}/getStockById.do',
                data:{"id":$("#cid").text()},
                success:function(data){
                    $(data).each(function(){
                        $("#proName").text(this.projectName);

                        $("#industryType").text(this.industryType);
                        $("#nature").text(this.nature);
                        $("#listedCompany").text(this.listedCompany);
                        $("#evaluationMin").text(this.evaluationMin);
                        $("#evaluationMax").text(this.evaluationMax);
                        $("#price").text(this.price);
                        $("#stockNum").text(this.stockNum);
                        $("#stockProportion").text(this.stockProportion);
                        $(this.myLable).each(function(){
                            $("#lable").append(this+"   ");
                        });
                        $("#company").text(this.company);
                        $("#companyTip").text(this.companyTip);
                        $("#statusTip").text(this.statusTip);
                    });
                },
                dataType:'json'
            });

            $.ajax({
                type:'post',
                url:'${ctx}/getStocktUser.do',
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
        .context{background-color: #333333;width:1300px;margin: auto;height:480px;margin-top:30px;}
        .contextLeft{width:600px;float: left;margin-top:20px;margin-left:30px;}
        .contextRight{width:600px;float: right;margin-top:20px;}
        .fontOne{color:white;font-size:17px;}

        .tip{background-color: #333333;width:1300px;margin: auto;min-height: 100px;margin-top:20px;}
        .tell{color:#CC9966;margin-left:30px;}

    </style>

</head>
<body>
<div style="background-color: #1C1C1C;height:1080px;">
    <span id="cid" hidden="hidden">${param.id}</span>

    <div id="title" class="head">
        <h2 align="center" style="color: white;">项目详情</h2>
        <span id="proName" class="proName"></span>
        <hr style="width:1200px;margin-left:50px;margin-top:5px;size:0.3px;">
    </div>

    <div id="context" class="context">
        <div id="contextLeft" class="contextLeft">
            <span style="color:#CC9966;font-size: 20px;">基本信息</span><br><br><br>
            <span class="fontOne">所属行业:</span><span class="fontOne" id="industryType"></span><br><br>
            <span class="fontOne">企业性质:</span><span class="fontOne" id="nature"></span><br><br>
            <span class="fontOne">上市公司:</span><span class="fontOne" id="listedCompany"></span><br><br>
            <span class="fontOne">本轮估值:</span><span class="fontOne" id="evaluationMin"></span><i class="fontOne">--</i><span class="fontOne" id="evaluationMax"></span><span class="fontOne">万元</span><br><br>
            <span class="fontOne">转让价格:</span><span class="fontOne" id="price"></span><span class="fontOne">万元</span><br><br>
            <span class="fontOne">转让股数:</span><span class="fontOne" id="stockNum"></span><br><br>
            <span class="fontOne">占股比例:</span><span class="fontOne" id="stockProportion"></span><i class="fontOne">%</i><br><br>
            <span class="fontOne">热门标签:</span><span class="fontOne" id="lable"></span><br><br>
            <span class="fontOne">所属企业:</span><span class="fontOne" id="company"></span><br><br>
        </div>
        <div id="contextRight" class="contextRight">
            <div id="face" style="border-radius: 45%;border:1px solid white;width:112px;height:112px;margin: auto;"><img id="faceimg" src="" style="display:inline-block; border-radius: 45%;width:110px;height:110px;"></div>
            <span id="userCompany" style="color: white;display: inline-block;width: 600px;text-align: center;">公司名</span><br>
            <span id="username" style="color:white;display: inline-block;width: 600px;text-align: center;">用户名</span><br>
            <a href="${ctx}/jsp/personMessage/SendEMail.jsp?id=${param.id}" style="color:white;background-color: #CC9966;text-underline: none;display: inline-block;width:110px;height:35px;line-height: 35px;text-align: center;border-radius: 5px;margin-left:250px;">联系他</a>
        </div>
    </div>

    <div id="bottom" class="tip">
        <span class="tell">企业简介</span><br>
        <span id="companyTip" style="color:white;margin-left:30px;"></span>
    </div>

    <div id="bottom2" class="tip">
        <span class="tell">经营状况</span><br>
        <span id="statusTip" style="color:white;margin-left:30px;"></span>
    </div>

    <div style="width: 1300px;">
        <button type="button" onclick="window.location.href='/jsp/findStock.jsp'" style="width: 280px;height:50px;background-color: #CC9966;color: white;border: 0;margin: auto;display:block;margin-top:20px;">返回</button>
    </div>
</div>
</body>
</html>
