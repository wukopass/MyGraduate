<%--
  Created by IntelliJ IDEA.
  User: tl
  Date: 2018/11/13
  Time: 20:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/core.jsp"%>
<html>
<head>
    <title>Title</title>
    <style>
        Choose_back *{
            margin: 0px;
            padding: 0px;
            font-size:0px;
        }
        a{
            text-decoration: none;
        }
        .Choose_back{
            position: fixed;
            top:0px;
            left:0px;
            width:100%;
            height:100%;
            background: rgba(0, 0, 0, 0.8);
            z-index: 9999999;
        }
        .Choose_choosemain{
            width:1100px;
            height:600px;
            margin:50px auto;

        }
        .Choose_head{
            height:50px;
            display:inline-block;
            background-color: rgb(204,153,102);
        }
        .Choose_head a{
            display:inline-block;
            margin-left:2px;
            width:200px;
            height:50px;
            line-height: 50px;
            font-size: 20px;
            text-align: center;
            font-weight: 800;
            color:rgb(204,153,102);
            border-radius:3px;
            text-underline: none;
            background-color:white;
        }
        .choose_mychoose{
            color:white !important;
            background-color: rgb(204,153,102) !important;
        }
        .Choose_body{
            width:100%;
            height:547px;
            font-size: 30px;
            border-top:3px solid rgb(204,153,102);
            background-color: white;
            padding:30px;
            box-sizing: border-box;
            overflow: auto;
        }
        .Choose_spantype{
            display: inline-block;
            padding-left: 10px;
            font-size: 20px;
            color:black;
            font-weight: bold;
            border-left: 5px rgb(204,153,102) solid;
        }
        .Choose_instance{
            width:160px;
            height:40px;
            margin: 5px;
            line-height: 40px;
            font-size: 18px;
            font-weight: bold;
            color:black;
            text-align: center;
            display: inline-block;
            background-color: white;
            border-radius: 5px;
            box-shadow: black 1px 1px 10px -5px;
        }
        .Choose_button{
            font-size: 20px;
            width:250px;
            height: 50px;
            text-align: center;
            line-height: 50px;
        }
        .Choose_password{
            position: relative;
            margin: 200px auto;
            background-color: white;
            display: block;
            width:600px;
            height:400px;
            font-size: 16px;
            color: black;
            background: url("${ctx}/images/zhuzi/tanchuang.png");
        }
        .Choose_password input{
            font-size: 16px;
/*            width:240px;
            height:30px;*/
            outline: none;
            border: 0px;
            border-bottom: 2px solid black;
        }
        .Choose_password .choose_input{
            position: absolute;
        }
        .Choose_password span{
            font-size: 16px;
            color: black;
            position: absolute;
        }
        .choose_button{
            width:180px;
            height:50px;
            border-radius: 5px;
            display: inline-block;
            border: 1px black solid;
            margin-right:20px;
        }
    </style>
</head>
<body>
    <div style="display: none;" class="Choose_back">
        <div  class="Choose_choosemain">
            <div class="Choose_head">
                <a href="javascript:;" class="choose_mychoose">投资偏好</a>
                <a href="javascript:;">融资偏好</a>
                <a href="javascript:;">合作偏好</a>
            </div>
            <div class="Choose_body">
                <div class="Choose_Choosetype">
                    <span class="Choose_spantype">请选择您的偏好融资类型</span><br>
                    <span style="font-weight: bold;display: inline-block;width:140px;font-size: 25px;vertical-align: top;color:black;">股权投资:</span>
                    <div class="Choose_InvestType_TZ0" style="width:860px;display: inline-block;vertical-align: top;">
                    </div><br>
                    <span style="font-weight: bold;display: inline-block;width:140px;font-size: 25px;vertical-align: top;color:black;">债权投资:</span>
                    <div class="Choose_InvestType_TZ1" style="width:860px;display: inline-block;vertical-align: top;">
                    </div><br>
                    <span style="font-weight: bold;display: inline-block;width:140px;font-size: 25px;vertical-align: top;color:black;">新三板业务:</span>
                    <div class="Choose_InvestType_TZ2" style="width:860px;display: inline-block;vertical-align: top;">
                    </div><br>
                    <span style="font-weight: bold;display: inline-block;width:140px;font-size: 25px;vertical-align: top;color:black;">上市公司业务:</span>
                    <div class="Choose_InvestType_TZ3" style="width:860px;display: inline-block;vertical-align: top;">
                    </div><br>
                    <br><span class="Choose_spantype">请选择您偏好的行业分类</span><br>
                    <div class="Choose_Industry_TZ">
                    </div>
                    <div style="text-align: center">
                        <input type="button" value="保存" id="TZsave" class="Choose_button">
                        <input type="button" value="退出" class="quit Choose_button">
                    </div>
                </div>
                <div class="Choose_Choosetype" style="display: none">
                    <span class="Choose_spantype">请选择您的偏好融资类型</span><br>
                    <span style="font-weight: bold;display: inline-block;width:140px;font-size: 25px;vertical-align: top;color:black;">股权投资:</span>
                    <div class="Choose_InvestType_RZ0" style="width:860px;display: inline-block;vertical-align: top;">
                    </div><br>
                    <span style="font-weight: bold;display: inline-block;width:140px;font-size: 25px;vertical-align: top;color:black;">债权投资:</span>
                    <div class="Choose_InvestType_RZ1" style="width:860px;display: inline-block;vertical-align: top;">
                    </div><br>
                    <span style="font-weight: bold;display: inline-block;width:140px;font-size: 25px;vertical-align: top;color:black;">新三板业务:</span>
                    <div class="Choose_InvestType_RZ2" style="width:860px;display: inline-block;vertical-align: top;">
                    </div><br>
                    <span style="font-weight: bold;display: inline-block;width:140px;font-size: 25px;vertical-align: top;color:black;">上市公司业务:</span>
                    <div class="Choose_InvestType_RZ3" style="width:860px;display: inline-block;vertical-align: top;">
                    </div><br>
                    <div style="text-align: center">
                        <input type="button" value="保存" id="RZsave" class="Choose_button">
                        <input type="button" value="退出" class="quit Choose_button">
                    </div>
                </div>
                <div class="Choose_Choosetype" style="display: none">
                    <span class="Choose_spantype">请选择您的偏好合作类型</span><br>
                    <div class="Choose_CoopType_HZ">
                    </div>
                    <br><span class="Choose_spantype">请选择您偏好的行业分类</span><br>
                    <div class="Choose_Industry_HZ">
                    </div>
                    <div style="text-align: center">
                        <input type="button" value="保存" id="HZsave" class="Choose_button">
                        <input type="button" value="退出" class="quit Choose_button">
                    </div>

                </div>
            </div>
        </div>
        <div class="Choose_password" style="display: none" >
            <span style="top:155px;left:100px;">新密码：</span><div class="choose_input" style="top:155px;left:200px;"><input type="password"></div>
            <span style="top:200px;left:100px;">确认密码</span><div class="choose_input" style="top:200px;left:200px;"><input type="password"></div>
            <div style="position: absolute;top:250px;text-align: center;">
            <a href="javascript:;" class="choose_button password_update" style="margin-left: 100px;background-color: rgb(204,153,102);color:white;">提交</a>
            <a href="javascript:;" class="quit choose_button">返回</a>
            </div>
        </div>
    </div>
    <script>
        var flag = false;//判断是否修改
        var flag2 = true;//判断是否需要加载
        function MyIndustryMessageTZ(){
            $.ajax({
                url:"/type/MyIndustryMessage.do",
                contentType:"application/json",
                dataType:"json",
                //data:jsonStr,
                type:"post",
                success:function(r){
                    $(".Choose_Industry_TZ").html("");
                    $(r).each(function (i,o) {
                        var str = "<a href=\"javascript:;\" class=\"Choose_instance\">"+o.iname+"</a>" +
                            "<input style=\"display:none\" type=\"checkbox\" name=\"MyIndustryMessageTZ\" value=\""+o.id+"\">";
                        $(".Choose_Industry_TZ").append(str);
                    });
                    $(".Choose_Industry_TZ").append("<a href=\"javascript:;\" class=\"Choose_instance\">其他</a>" +
                        "<input style=\"display:none\" type=\"checkbox\" name=\"MyIndustryMessageTZ\" value=\"\">");
                    $(".Choose_Industry_TZ").append("<a href=\"javascript:;\" class=\"Choose_instance\">不限</a>" +
                        "<input style=\"display:none\" type=\"checkbox\" id = \"MyIndustryMessageTZ\" class=\"Choose_Quanxuan\" name=\"MyIndustryMessageTZ\" value=\"\">");
                },
                error:function(e) {
                    alert(e + "错误了");
                }
            });
        }
        function MyInvestTypeMessageTZ(){
            $.ajax({
                url:"/type/MyInvestTypeMessage.do",
                contentType:"application/json",
                dataType:"json",
                //data:jsonStr,
                type:"post",
                success:function(r){
                    $(r).each(function (ii,obj) {
                        if(obj.belonged == 0){
                            $(".Choose_InvestType_TZ"+ii).html("");
                            $(r).each(function (i,o) {
                                if(o.belonged == ii+1){
                                    var str = "<a href=\"javascript:;\" class=\"Choose_instance\">"+o.investName+"</a>" +
                                        "<input style=\"display:none\" type=\"checkbox\" name=\"MyInvestTypeMessageTZ"+ii+"\" value=\""+o.id+"\">";
                                    $(".Choose_InvestType_TZ"+ii).append(str);
                                }
                            });
                            $(".Choose_InvestType_TZ"+ii).append("<a href=\"javascript:;\" class=\"Choose_instance\">其他</a>" +
                                "<input style=\"display:none\" type=\"checkbox\" name=\"MyInvestTypeMessageTZ"+ii+"\" value=\"\">");
                            $(".Choose_InvestType_TZ"+ii).append("<a href=\"javascript:;\" class=\"Choose_instance\">不限</a>" +
                                "<input style=\"display:none\" type=\"checkbox\" id = \"MyInvestTypeMessageTZ"+ii+"\" class=\"Choose_Quanxuan\" name=\"MyInvestTypeMessageTZ"+ii+"\" value=\"\">");
                        }
                    });
                },
                error:function(e) {
                    alert(e + "错误了");
                }
            });
        }
        function MyInvestTypeMessageRZ(){
            $.ajax({
                url:"/type/MyInvestTypeMessage.do",
                contentType:"application/json",
                dataType:"json",
                //data:jsonStr,
                type:"post",
                success:function(r){
                    $(r).each(function (ii,obj) {
                        if(obj.belonged == 0){
                            $(".Choose_InvestType_RZ"+ii).html("");
                            $(r).each(function (i,o) {
                                if(o.belonged == ii+1){
                                    var str = "<a href=\"javascript:;\" class=\"Choose_instance\">"+o.investName+"</a>" +
                                        "<input style=\"display:none\" type=\"checkbox\" name=\"MyInvestTypeMessageRZ"+ii+"\" value=\""+o.id+"\">";
                                    $(".Choose_InvestType_RZ"+ii).append(str);
                                }
                            });
                            $(".Choose_InvestType_RZ"+ii).append("<a href=\"javascript:;\" class=\"Choose_instance\">其他</a>" +
                                "<input style=\"display:none\" type=\"checkbox\" name=\"MyInvestTypeMessageRZ"+ii+"\" value=\"\">");
                            $(".Choose_InvestType_RZ"+ii).append("<a href=\"javascript:;\" class=\"Choose_instance\">不限</a>" +
                                "<input style=\"display:none\" type=\"checkbox\" id = \"MyInvestTypeMessageRZ"+ii+"\" class=\"Choose_Quanxuan\" name=\"MyInvestTypeMessageRZ"+ii+"\" value=\"\">");
                        }
                    });
                },
                error:function(e) {
                    alert(e + "错误了");
                }
            });
        }
        function MyIndustryMessageHz(){
            $.ajax({
                url:"/type/MyIndustryMessage.do",
                contentType:"application/json",
                dataType:"json",
                //data:jsonStr,
                type:"post",
                success:function(r){
                    $(".Choose_Industry_HZ").html("");
                    $(r).each(function (i,o) {
                        var str = "<a href=\"javascript:;\" class=\"Choose_instance\">"+o.iname+"</a>" +
                            "<input style=\"display:none\" type=\"checkbox\" name=\"MyIndustryMessageHZ\" value=\""+o.id+"\">";
                        $(".Choose_Industry_HZ").append(str);
                    });
                    $(".Choose_Industry_HZ").append("<a href=\"javascript:;\" class=\"Choose_instance\">其他</a>" +
                        "<input style=\"display:none\" type=\"checkbox\" name=\"MyIndustryMessageHZ\" value=\"\">");
                    $(".Choose_Industry_HZ").append("<a href=\"javascript:;\" class=\"Choose_instance\">不限</a>" +
                        "<input style=\"display:none\" type=\"checkbox\" id = \"MyIndustryMessageHZ\" class=\"Choose_Quanxuan\" name=\"MyIndustryMessageHZ\" value=\"\">");
                },
                error:function(e) {
                    alert(e + "错误了");
                }
            });
        }
        function MyCoopTypeMessageHz(){
            $.ajax({
                url:"/type/MyCoopTypeMessage.do",
                contentType:"application/json",
                dataType:"json",
                //data:jsonStr,
                type:"post",
                success:function(r){
                    $(".Choose_CoopType_HZ").html("");
                    $(r).each(function (i,o) {
                        var str = "<a href=\"javascript:;\" class=\"Choose_instance\">"+o.typeName+"</a>" +
                            "<input style=\"display:none\" type=\"checkbox\" name=\"MyCoopPhMessage\" value=\""+o.id+"\">";
                        $(".Choose_CoopType_HZ").append(str);
                    });
                    $(".Choose_CoopType_HZ").append("<a href=\"javascript:;\" class=\"Choose_instance\">其他</a>" +
                        "<input style=\"display:none\" type=\"checkbox\" name=\"MyCoopPhMessage\" value=\"\">");
                    $(".Choose_CoopType_HZ").append("<a href=\"javascript:;\" class=\"Choose_instance\">不限</a>" +
                        "<input style=\"display:none\" type=\"checkbox\" id = \"MyCoopPhMessage\" class=\"Choose_Quanxuan\" name=\"MyCoopPhMessage\" value=\"\">");
                },
                error:function(e) {
                    alert(e + "错误了");
                }
            });
        }
        function ajaxSelect(){
            var json = {"chooseType":"TZ","messageType":"industry"};
            $.ajax({
                url:"/type/MyTypeId.do",
                //contentType:"application/json",
                dataType:"json",
                data:json,
                type:"post",
                success:function(r){
                    $(r).each(function(i,o){
                        $(":checkbox[name^=MyIndustryMessageTZ][value="+o.typeId+"]").prev().click();
                    });
                },
                error:function(e) {
                    alert(e + "错误了");
                }
            });

            var json = {"chooseType":"TZ","messageType":"investType"};
            $.ajax({
                url:"/type/MyTypeId.do",
                //contentType:"application/json",
                dataType:"json",
                data:json,
                type:"post",
                success:function(r){
                    $(r).each(function(i,o){
                        $(":checkbox[name^=MyInvestTypeMessageTZ][value="+o.typeId+"]").prev().click();
                    });
                },
                error:function(e) {
                    alert(e + "错误了");
                }
            });

            var json = {"chooseType":"RZ","messageType":"investType"};
            $.ajax({
                url:"/type/MyTypeId.do",
                //contentType:"application/json",
                dataType:"json",
                data:json,
                type:"post",
                success:function(r){
                    $(r).each(function(i,o){
                        $(":checkbox[name^=MyInvestTypeMessageRZ][value="+o.typeId+"]").prev().click();
                    });
                },
                error:function(e) {
                    alert(e + "错误了");
                }
            });

            var json = {"chooseType":"HZ","messageType":"coopType"};
            $.ajax({
                url:"/type/MyTypeId.do",
                //contentType:"application/json",
                dataType:"json",
                data:json,
                type:"post",
                success:function(r){
                    $(r).each(function(i,o){
                        $(":checkbox[name=MyCoopPhMessage][value="+o.typeId+"]").prev().click();
                    });
                },
                error:function(e) {
                    alert(e + "错误了");
                }
            });

            var json = {"chooseType":"HZ","messageType":"industry"};
            $.ajax({
                url:"/type/MyTypeId.do",
                //contentType:"application/json",
                dataType:"json",
                data:json,
                type:"post",
                success:function(r){
                    $(r).each(function(i,o){
                        var aa= $(":checkbox[name='MyIndustryMessageHZ'][value="+o.typeId+"]").prev().click();
                    });
                },
                error:function(e) {
                    alert(e + "错误了");
                }
            });
        }
        MyIndustryMessageTZ();
        MyInvestTypeMessageTZ();
        MyInvestTypeMessageRZ();
        MyIndustryMessageHz();
        MyCoopTypeMessageHz();

        setTimeout(ajaxSelect,200);

        $("html").on("click",".Choose_Quanxuan",function(){
            var id = $(this).prop("id");
            if (this.checked) {
                $(":checkbox[name="+id+"]").prop("checked", true);
                $(":checkbox[name="+id+"]").prev().css("background-color","rgb(197,154,109)");
            }else {
                $(":checkbox[name="+id+"]").prop("checked", false);
                $(":checkbox[name="+id+"]").prev().css("background-color","white");
            }
        });
        $("html").on("click",".Choose_instance",function(){
            flag = true;
            var color = $(this).css("background-color");
            if(color == "rgb(197, 154, 109)"){
                $(this).css("background-color","white");
            }else{
                $(this).css("background-color","rgb(197,154,109)");
            }
            var i = $(this).next();
            $(i).click();
        });
        $(".password_update").click(function(){
            var password= $(".choose_input input").eq(0).val();
            var repassword= $(".choose_input:eq(1) input").val();
            if(password == repassword){
                $.ajax({
                    url:"/rtUser/update_password.do",
                    //contentType:"application/json",
                    dataType:"json",
                    data:{"rtPassword":password},
                    type:"post",
                    success:function(r){
                        if(r > 0){
                            alert("添加成功");
                        }else{
                            alert("添加失败");
                        }
                    },
                    error:function(e) {
                        alert(e + "错误了");
                    }
                });
            }else{
                alert("两次密码不统一，请重新在输入。");
            }

        });
        $(".quit").click(function () {
            $(".Choose_back").hide();
        });
        $("#HZsave").click(function(){
            if(flag){
                var str = $(":checkbox[name=MyCoopPhMessage]").map(function(){
                    if(this.checked){
                        return $(this).val();
                    }
                }).get().join(",");
                var str2 = $(":checkbox[name^=MyIndustryMessageHZ]").map(function(){
                    if(this.checked){
                        return $(this).val();
                    }
                }).get().join(",");
                var json = {"MyInvestTypeMessageRZ":str,"MyIndustryMessageHZ":str2};
                $.ajax({
                    url:"/type/EditUserHZ.do",
                    //contentType:"application/json",
                    dataType:"json",
                    data:json,
                    type:"post",
                    success:function(r){
                        flag = false;
                    },
                    error:function(e) {
                        alert(e + "错误了");
                    }
                });
            }
        });
        $("#RZsave").click(function(){
            if(flag){
                var str = $(":checkbox[name^=MyInvestTypeMessageRZ]").map(function(){
                    if(this.checked){
                        return $(this).val();
                    }
                }).get().join(",");
                var json = {"MyInvestTypeMessageRZ":str};
                $.ajax({
                    url:"/type/EditUserRZ.do",
                    //contentType:"application/json",
                    dataType:"json",
                    data:json,
                    type:"post",
                    success:function(r){
                    },
                    error:function(e) {
                        alert(e + "错误了");
                    }
                });
            }
        });
        $("#TZsave").click(function(){
            if(flag){
                var str = $(":checkbox[name^=MyIndustryMessageTZ]").map(function(){
                    if(this.checked){
                        return $(this).val();
                    }
                }).get().join(",");
                var str2 = $(":checkbox[name^=MyInvestTypeMessageTZ]").map(function(){
                    if(this.checked){
                        return $(this).val();
                    }
                }).get().join(",");
                var json = {"MyIndustryMessageTZ":str,"MyInvestTypeMessageTZ":str2};
                $.ajax({
                    url:"/type/EditUserTZ.do",
                    //contentType:"application/json",
                    dataType:"json",
                    data:json,
                    type:"post",
                    success:function(r){
                        flag = false;
                    },
                    error:function(e) {
                        alert(e + "错误了");
                    }
                });
            }
        });
    </script>
    <script>
        $(".Choose_head a").click(function(){
            $(".Choose_head a").removeClass("choose_mychoose");
            $(this).addClass("choose_mychoose");
            var i = $(this).index();
            $(".Choose_Choosetype").hide();
            $(".Choose_Choosetype").eq(i).show();
        })
    </script>
</body>
</html>
