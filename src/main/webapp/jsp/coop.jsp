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
                    $("#img1").val("");
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
                    $("#img2").val("");
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
                    $("#img3").val("");
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
                    $("#img4").val("");
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

            $.ajax({
                type:'post',
                url:'${ctx}/initResource.do',
                data:{},
                success:function(data){
                    var num=0;
                    $(data).each(function(){
                        var obj=document.createElement("input");
                        obj.type="checkbox";
                        obj.name="resourcesType["+num+"]";
                        obj.value=this.id;
                        var obj1=document.createElement("span");
                        obj1.innerText=this.typeName;

                        $("#resourceType").append(obj);
                        $("#resourceType").append(obj1);
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

            $("#midOne").click(function(){
                window.location.href="";
            });
            $("#midTwo").click(function(){
                window.location.href="";
            });
            $("#midThr").click(function(){
                window.location.href="";
            });
            $("#midFour").click(function(){
                window.location.href="/jsp/asset.jsp";
            });
            $("#midFive").click(function(){
                window.location.href="/jsp/stock.jsp";
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

        #tipContext{width: 700px;line-height: 40px;font-size: 16px;}
        #textArea{width: 100%;height: 170px;padding: 0 10px;color: #000;border-radius: 5px;}
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
            <i id="midThr" class="mid"><img src="../images/demand/fbhzxq_1.png"></i>
            <i id="midFour" class="mid"><img src="../images/demand/fbzcxq.png"></i>
            <i id="midFive" class="mid"><img src="../images/demand/fbgqjy.png"></i>
        </div>
        <div id="fmContext">
            <form id="fm1" action="${ctx}/saveCooperation.do" method="post" enctype="multipart/form-data">
                <div style="margin: auto;width:50%;">
                    <div class="compant">
                        <span class="fontCssOne">合作名称:</span>
                        <input class="input" type="text" name="projectName">
                    </div>
                    <div class="compant">
                        <span class="fontCssOne">合作类型:</span>
                        <input id="radioOne" type="radio" name="cooperationType" value="寻找资源"><label class="fontTwo" for="radioOne">寻找资源</label>
                        <input id="radioTwo" type="radio" name="cooperationType" value="提供资源"><label class="fontTwo" for="radioTwo">提供资源</label>
                    </div>
                    <div class="compant">
                        <span class="fontCssOne">所在地区:</span>
                        <select class="select" id="city" name="city">

                        </select>
                    </div>
                    <div class="compant">
                        <span class="fontCssOne">资源类型:</span>
                        <span id="resourceType"></span>
                    </div>
                    <div class="compant">
                        <span class="fontCssOne">行业类型:</span>
                        <select class="select" id="industry" name="industryType">

                        </select>
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
                    <div class="compant" id="tipContext">
                        <span class="fontCssOne">合作描述:</span>
                        <textarea id="textArea" name="tip"></textarea>
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
