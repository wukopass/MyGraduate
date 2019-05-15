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
    <title>发布投资项目表</title>
    <!---->


        <style>
            #dvImg1 img{max-height: 100px;max-width: 100px;}
            #dvImg2 img{max-height: 100px;max-width: 100px;}
            #dvImg3 img{max-height: 100px;max-width: 100px;}
            #dvImg4 img{max-height: 100px;max-width: 100px;}
        </style>
    <script>
           $(document).ready(function(){
            //阶段选择下拉条单选
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
            //行业多选框
            $.ajax({
                url: "${ctx}/selectindustry.do",
                //contentType:"application/json;charset=utf-8",
                type:"post",
                dataType:"json",
                success:function (data) {
                    var dataobj=data;
                    $.each(dataobj,function(index,item){
                        var obj=document.createElement("input");
                        obj.type="checkbox";
                        obj.value=index;
                        obj.name="pindustry["+index+"]";
                        var obj2=document.createElement("span");
                        obj2.innerText=item;
                        $("#pindustry").append(obj);
                        $("#pindustry").append(obj2);
                    })
                },
                error:function (msg) {
                    alert("不能出现阶段下拉表");
                }
            });
               //标签的多选框
            $.ajax({
               url:"${ctx}/selectlable.do",
               //contentType:"application/json;charset=utf-8",
               type:"post",
               dataTyoe:"json",
               success:function(data){
                   var dataobj=data;
                   $.each(dataobj,function (index,item) {
                       var obj=document.createElement("input");
                       obj.type="checkbox";
                       obj.value=this.id;
                       obj.name="plable["+index+"]";
                       var obj2=document.createElement("span");
                       obj2.innerText=this.lable;
                       $("#plable").append(obj);
                       $("#plable").append(obj2);
                   })
               }
            });

        $("#dvImg1").click(function(){
            var read=new FileReader();
            $("#img1").click();
            $("#dvImg1").empty();
            $("#img1").change(function(){
                //获取被选择文件的第一个
                var thisfile=this.files[0];
                read.readAsDataURL(thisfile);
                $("#img1").val("");
            });
            read.onload=function(){
                $.ajax({
                    url:"${ctx}/newimgLoad.do",
                    type:"post",
                    data:{"imgData":read.result},
                    success:function(data){
                        var img=document.createElement("img");
                        img.src="${ctx}/newimgGet.do?fileName="+data;

                        $("#dvImg1").append(img);
                        $("#images1").val(data);
                        $("#images1").prop("checked","checked");
                    }
                })
            };

        });
        $("#dvImg2").click(function(){
            var read=new FileReader();
            $("#img2").click();
            $("#dvImg2").empty();
            $("#img2").change(function(){
                //获取被选择文件的第一个
                var thisfile=this.files[0];
                read.readAsDataURL(thisfile);
                $("#img2").val("");
            });
            read.onload=function(){
                $.ajax({
                    url:"${ctx}/newimgLoad.do",
                    type:"post",
                    data:{"imgData":read.result},
                    success:function(data){
                        var img=document.createElement("img");
                        img.src="${ctx}/newimgGet.do?fileName="+data;
                        $("#dvImg2").append(img);
                        $("#images2").val(data);
                        $("#images2").prop("checked","checked");
                    }
                })
            };

        });
        $("#dvImg3").click(function(){
            var read=new FileReader();
            $("#img3").click();
            $("#dvImg3").empty();
            $("#img3").change(function(){
                //获取被选择文件的第一个
                var thisfile=this.files[0];
                read.readAsDataURL(thisfile);
                $("#img3").val("");
            });
            read.onload=function(){
                $.ajax({
                    url:"${ctx}/newimgLoad.do",
                    type:"post",
                    data:{"imgData":read.result},
                    success:function(data){
                        var img=document.createElement("img");
                        img.src="${ctx}/newimgGet.do?fileName="+data;

                        $("#dvImg3").append(img);
                        $("#images3").val(data);
                        $("#images3").prop("checked","checked");
                    }
                })
            };

        });
        $("#dvImg4").click(function(){
            var read=new FileReader();
            $("#img4").click();
            $("#dvImg4").empty();
            $("#img4").change(function(){
                //获取被选择文件的第一个
                var thisfile=this.files[0];
                read.readAsDataURL(thisfile);
                $("#img4").val("");
            });
            read.onload=function(){
                $.ajax({
                    url:"${ctx}/newimgLoad.do",
                    type:"post",
                    data:{"imgData":read.result},
                    success:function(data){
                        var img=document.createElement("img");
                        img.src="${ctx}/newimgGet.do?fileName="+data;
                        $("#dvImg4").append(img);
                        $("#images4").val(data);
                        $("#images4").prop("checked","checked");
                    }
                })
            };

        });

        var num=0;
        $("#fileArea").click(function(){
            var readFile=new FileReader();
            var thisfile;
            $("#file").click();
            $("#file").change(function(){
                //获取被选择文件的第一个
                thisfile=this.files[0];
                readFile.readAsDataURL(thisfile);
                $("#file").val("");
            });
            readFile.onload=function(){
                $.ajax({
                    type:'post',
                    url:'${ctx}/newfile.do',
                    data:{"fileData":readFile.result,"fileName":thisfile.name},
                    success:function(data){
                        var obj=document.createElement("input");
                        obj.type="text";
                        obj.name="files["+num+"]";
                        obj.value=data;
                        obj.hidden="hidden";
                        $("#files").append(obj);
                        num++;
                        $("#fileNum").text(num);
                    }
                });
            }
        });
        });
    </script>
</head>


<body>
<div id="alltable" style="width:100% ;height:auto">
<div id="invest"  style="width:620px;height:auto;margin:auto" >
<form action="${ctx}/saveInvest.do" method="post">
    <h2>投资需求表</h2>

    1：信息分类:
    <input type="radio" name="pmessagetype"  value="股权投资">股权投资
    <input type="radio" name="pmessagetype"  value="债权投资">债权投资
    <input type="radio" name="pmessagetype"  value="金融投资">金融投资<br><br>
    2：项目名称:<input name="pname"><br><br>
    3：投资地区:
    <select id="pcity" name="city"  style="width:100px">
        <option >----- </option>
    </select><br><br>
    <br>
    4：投资金额: <input type="text" name="pmoney"><br><br>
    5：投资行业:<br>
    <!--行业多选-->
    <span id="pindustry">

    </span>
    <br><br>
    6： 投资阶段:----------------------------------<br>
    <select id="period" name="pstage">
        <option value="">--------</option>
    </select>
    <br><br>
    7：投资期限:<br>
    <input   style="width:50px" name="pstarttime" >----<input  style="width:50px" name="pendtime">
    <select id="ptimestate" name="ptimestate">
        <option>---</option>
        <option  value="年">年</option>
        <option  value="年">月</option>
        <option  value="年">日</option>
    </select>
    <br><br>
    8：预期收益:
    <input  name="pincome" type="text">
    <select id="pincome" name="ppstate">
        <option name="pinstate" value="%年">%年</option>
        <option name="pinstate" value="%年">%月</option>
        <option name="pinstate" value="%年">%日</option>
    </select>
    <br><br>
    9：需提供材料:
    <input type="checkbox" name="pstaff[0]">商业/项目计划书
    <input type="checkbox" name="pstaff[1]">公司证件
    <input type="checkbox" name="pstaff[2]">相关财务资料
    <input type="checkbox" name="pstaff[3]">其他资料

    <br><br>
    10：热门标签:<br>
    <span id="plable">
        <%-- <input type="checkbox" name="plable[0]">新兴行业
         <input type="checkbox" name="plable[1]">金融科技
         <input type="checkbox" name="plable[2]">评级机构
         <input type="checkbox" name="plable[3]">IT互联网
         <input type="checkbox" name="plable[4]">在线教育--%>

    </span><br><br>
    11:信息类型
    <input type="radio" name="ptype">本企业
    <input type="radio" name="ptype">代发
    <br><br>
    12:公司名称:
    <input name="pcompname" type="text"><br><br>
    13:项目亮点:
    <textarea name="pspot" style="width:350px;height:100px">




    </textarea>

    <br><br>
      14：相关图片:
    <input id="images1" hidden="hidden" type="checkbox" name="images[0]" value="">
    <input id="images2" hidden="hidden" type="checkbox" name="images[1]" value="">
    <input id="images3" hidden="hidden" type="checkbox" name="images[2]" value="">
    <input id="images4" hidden="hidden" type="checkbox" name="images[3]" value="">

    <input accept=".jpg,.png,.bmp,.gif,.jpeg" hidden="hidden" type="file" id="img1">
    <div id="dvImg1" style="display:inline-block;width: 100px; height: 100px; border: 1px solid black;"></div>


    <input accept=".jpg,.png,.bmp,.gif,.jpeg" hidden="hidden" type="file" id="img2">
    <div id="dvImg2" style="display:inline-block;width: 100px; height: 100px; border: 1px solid black;"></div>

    <input accept=".jpg,.png,.bmp,.gif,.jpeg" hidden="hidden" type="file" id="img3">
    <div id="dvImg3" style="display:inline-block;width: 100px; height: 100px; border: 1px solid black;"></div>

    <input accept=".jpg,.png,.bmp,.gif,.jpeg" hidden="hidden" type="file" id="img4">
    <div id="dvImg4" style="display:inline-block;width: 100px; height: 100px; border: 1px solid black;"></div>
    <br><br>
    15：<h3>相关附件:</h3>
    <div id="fileArea" style="height: 20px;width: 100px;background-color: chartreuse;clear: both; ">
        已上传(<span id="fileNum">0</span>)个文件</div>
    <br><br>
  <%--  16：<input type="checkbox" name="fileView" value="1">文件是否可见
    <input hidden="hidden" id="file" type="file">
    <span id="files"></span>
    --%>
    <input hidden="hidden" type="text" name="username" value="方翔鸣">
    <br><br>
    <input type="submit" value="提交">

</form>
</div>
</div>
</body>
</html>
