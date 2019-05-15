<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../core.jsp" %>

<html>
<head>
    <title>Title</title>

    <script src="../js/jquery-2.1.1.min.js"></script>
    <script src="../js/jquery.serializejson.min.js"></script>
    <link rel="stylesheet" href="../css/user_info.css">
    <script>
        $(document).ready(function(){

            $("#dvImg1").click(function(){
                var read=new FileReader();
                $("#img1").click();
                $("#dvImg1").empty();
                $("#img1").change(function(){
                    //获取被选择文件的第一个
                    var thisfile=this.files[0];
                    read.readAsDataURL(thisfile);
                });
                read.onload=function(){
                    $.ajax({
                        url:"${ctx}/imgLoad.do",
                        type:"post",
                        data:{"imgData":read.result},
                        success:function(data){
                            var img=document.createElement("img");
                            img.src="${ctx}/imgGet.do?fileName="+data;

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
                });
                read.onload=function(){
                    $.ajax({
                        url:"${ctx}/imgLoad.do",
                        type:"post",
                        data:{"imgData":read.result},
                        success:function(data){
                            var img=document.createElement("img");
                            img.src="${ctx}/imgGet.do?fileName="+data;
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
                });
                read.onload=function(){
                    $.ajax({
                        url:"${ctx}/imgLoad.do",
                        type:"post",
                        data:{"imgData":read.result},
                        success:function(data){
                            var img=document.createElement("img");
                            img.src="${ctx}/imgGet.do?fileName="+data;

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
                });
                read.onload=function(){
                    $.ajax({
                        url:"${ctx}/imgLoad.do",
                        type:"post",
                        data:{"imgData":read.result},
                        success:function(data){
                            var img=document.createElement("img");
                            img.src="${ctx}/imgGet.do?fileName="+data;
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
                        url:'${ctx}/file.do',
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

            $.ajax({
                type:'post',
                url:'${ctx}/initLable.do',
                data:{},
                success:function(data){
                    var num=0;
                    $(data).each(function(){
                        var obj=document.createElement("input");
                        obj.type="checkbox";
                        obj.value=this.id;
                        obj.name="lable["+num+"]";
                        var obj1=document.createElement("span");
                        obj1.innerText=this.lable;

                        $("#lable").append(obj);
                        $("#lable").append(obj1);
                        num++;
                    });
                },
                dataType:'json'
            });

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

            $("#midOne").click(function(){
                window.location.href="";
            });
            $("#midTwo").click(function(){
                window.location.href="";
            });
            $("#midThr").click(function(){
                window.location.href="/jsp/coop.jsp";
            });
            $("#midFour").click(function(){
                window.location.href="/jsp/asset.jsp";
            });
            $("#midFive").click(function(){
                window.location.href="";
            });

        });
    </script>

    <style>
        #dvImg1 img{max-height: 52px;max-width: 52px;}
        #dvImg2 img{max-height: 52px;max-width: 52px;}
        #dvImg3 img{max-height: 52px;max-width: 52px;}
        #dvImg4 img{max-height: 52px;max-width: 52px;}

        #dvImg1,#dvImg2,#dvImg3,#dvImg4{width: 52px; height: 52px; border: 2px dashed #CC9966;
            float: left;
        }
        *{margin: 0;}
        #mid{height: 120px;width:100%; background-color: #666666; }
        #midOne{display: inline-block;width:86px;height: 70px;
            margin-left: 320px;margin-top:30px;
        }
        #midTwo{display: inline-block;width:86px;height: 70px;}
        #midThr{display: inline-block;width:86px;height: 70px;}
        #midFour{display: inline-block;width:86px;height: 70px;}
        .mid{margin-right: 85px;}

        #fmContext{width:100%;background-color: #1C1C1C;padding-top: 40px;}
        #fm1{background-color: #666666;width:90%;margin: auto;}

        .fontCssOne{color: white;line-height: 40px;font-size: 16px;margin-right: 40px;}
        .fontTwo{color: white;font-weight: bold;line-height: 40px;font-size: 16px;}

        .tipContext{width: 700px;line-height: 40px;font-size: 16px;}
        .textArea{width: 100%;height: 170px;padding: 0 10px;color: #000;border-radius: 5px;}
        .input{width:400px;height:30px;border-radius: 5px;}
        .select{width:150px;height:30px;border-radius: 5px;}

        .compant{margin-bottom:20px;}

        #subtn{width:200px;height:60px;background-color: #CC9966;border:0;border-radius: 5px;
            color:white;font-size:16px;font-weight: bold;
        }
    </style>

</head>
<body>
    <%@include file="/jsp/personMessage/xyzTitle.jsp"%>
    <div id="all">
        <div id="mid">
            <i id="midOne" class="mid"><img src="../images/demand/fbtzxq.png"></i>
            <i id="midTwo" class="mid"><img src="../images/demand/fbrzxq.png"></i>
            <i id="midThr" class="mid"><img src="../images/demand/fbhzxq.png"></i>
            <i id="midFour" class="mid"><img src="../images/demand/fbzcxq.png"></i>
            <i id="midFive" class="mid"><img src="../images/demand/fbgqjy_1.png"></i>
        </div>
        <div id="fmContext">
            <form id="fm1" action="${ctx}/saveStock.do" method="post" enctype="multipart/form-data">
                <div style="margin: auto;width:50%;">
                    <div class="compant">
                    <span class="fontCssOne">项目名称:</span>
                    <input class="input" type="text" name="projectName">
                    </div>

                    <div class="compant">
                    <span class="fontCssOne">所属行业:</span>
                    <select class="select" id="industry" name="industryType">

                    </select>
                    </div>

                    <div class="compant">
                    <span class="fontCssOne">企业性质:</span>
                    <select class="select" name="nature">
                        <option value="国有">国有</option>
                        <option value="民营">民营</option>
                        <option value="外资">外资</option>
                        <option value="合资">合资</option>
                    </select>
                    </div>

                    <div class="compant">
                    <span class="fontCssOne">上市公司:</span>
                    <select class="select" name="listedCompany">
                        <option value="主板">主板</option>
                        <option value="中小板">中小板</option>
                        <option value="新三板">新三板</option>
                        <option value="海外">海外</option>
                        <option value="港股">港股</option>
                        <option value="非上市">非上市</option>
                    </select>
                    </div>

                    <div class="compant">
                        <span class="fontCssOne">本轮估值:</span>
                        <input class="input" style="width:150px;" type="text" name="evaluationMin">---
                        <input class="input" style="width:150px;" type="text" name="evaluationMax">万元
                    </div>

                    <div class="compant">
                    <span class="fontCssOne">转让价格:</span>
                    <input class="input" type="text" name="price">
                    </div>

                    <div class="compant">
                    <span class="fontCssOne">转让股数:</span>
                    <input class="input" type="text" name="stockNum">
                    </div>

                    <div class="compant">
                    <span class="fontCssOne">转让比例:</span>
                    <input class="input" type="text" name="stockProportion">
                    </div>

                    <div class="compant">
                    <span class="fontCssOne">热门标签:</span>
                    <span id="lable"></span>
                    </div>

                    <div class="compant">
                        <span class="fontCssOne">信息类型:</span>
                        <input id="radioThr" type="radio" name="mesageType" value="本企业"><label class="fontTwo" for="radioThr">本企业</label>
                        <input id="radioFour" type="radio" name="mesageType" value="代发"><label class="fontTwo" for="radioFour">代发</label>
                    </div>

                    <div class="compant">
                    <span class="fontCssOne">公司名称:</span>
                    <input class="input" type="text" name="company">
                    </div>

                    <div class="compant" class="tipContext">
                    <span class="fontCssOne">标的企业简介:</span>
                    <textarea class="textArea" name="companyTip"></textarea>
                    </div>

                    <div class="compant" class="tipContext">
                    <span class="fontCssOne">标的运营状况:</span>
                    <textarea class="textArea" name="statusTip"></textarea>
                    </div>

                    <div class="compant">
                        <span class="fontCssOne" style="display: inline-block;float: left;">相关图片:</span>
                        <input id="images1" hidden="hidden" type="checkbox" name="images[0]" value="">
                        <input id="images2" hidden="hidden" type="checkbox" name="images[1]" value="">
                        <input id="images3" hidden="hidden" type="checkbox" name="images[2]" value="">
                        <input id="images4" hidden="hidden" type="checkbox" name="images[3]" value="">

                        <input accept=".jpg,.png,.bmp,.gif,.jpeg" hidden="hidden" type="file" id="img1">
                        <input accept=".jpg,.png,.bmp,.gif,.jpeg" hidden="hidden" type="file" id="img2">
                        <input accept=".jpg,.png,.bmp,.gif,.jpeg" hidden="hidden" type="file" id="img3">
                        <input accept=".jpg,.png,.bmp,.gif,.jpeg" hidden="hidden" type="file" id="img4">
                        <div id="dvImg1"></div>
                        <div id="dvImg2"></div>
                        <div id="dvImg3"></div>
                        <div id="dvImg4"></div>
                    </div>
                    <div class="compant" style="clear: both;">
                        <span class="fontCssOne" style="display: inline-block;float: left;">相关附件:</span>
                        <div id="fileArea" style="height: 20px;width: 150px;float: left;margin-top: 10px;border: 2px dashed #CC9966;color:white;">已上传(<span id="fileNum">0</span>)个文件</div>
                        <input style="margin-left: 10px;" type="checkbox" name="fileView" value="1"><span class="fontTwo">文件是否可见</span>
                        <input hidden="hidden" id="file" type="file">
                        <span id="files"></span>
                    </div>
                    <input hidden="hidden" type="text" name="createRtUser" value="${sessionScope.rtUserName}">

                    <input id="subtn" type="submit" value="提交">
                </div>
            </form>
        </div>
    </div>

</body>
</html>
