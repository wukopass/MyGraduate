$(document).ready(function () {
    $(".zhgl").click(function () {
        if($(this).hasClass("zhgl_bg")){
            $(".xxgl").addClass("xxgl_bg");
            $(".zhgl").addClass("zhgl_bg_click");
            $(".xxgl").removeClass("xxgl_bg_click");
            $(".zhgl").removeClass("zhgl_bg");
            $(".zhgl_menu").animate({"margin-left":"0"},400);
            $(".xxgl_menu").animate({"margin-left":"50%"},400)
        }
    });
    $(".xxgl").click(function () {
        if($(this).hasClass("xxgl_bg")){
            $(".zhgl").addClass("zhgl_bg");
            $(".xxgl").addClass("xxgl_bg_click");
            $(".zhgl").removeClass("zhgl_bg_click");
            $(".xxgl").removeClass("xxgl_bg");
            $(".zhgl_menu").animate({"margin-left":"-50%"},400);
            $(".xxgl_menu").animate({"margin-left":"0"},400)
        }
    });
    $(".jbxx").click(function(){
       $("#jbxx_son").siblings().hide();
       $("#jbxx_son").show();
    });
    $(".sfyz").click(function(){
        $("#sfyz_son").siblings().hide();
        $("#sfyz_son").show();
    });
    $(".yqzc").click(function(){
        $("#yqzc_son").siblings().hide();
        $("#yqzc_son").show();
    });
    $(".wdxx").click(function(){
        $("#wdxx_son").siblings().hide();
        $("#wdxx_son").show();
        MySysMails();
        myReciverMail();
        mySendMails();
    });
    $(".myInfo_box_font").click(function () {
        $(".wdxx").click();
        $(".sys_message").click();
    });
    $(".wdxm").click(function(){
        $("#wdxm_son").siblings().hide();
        $("#wdxm_son").show();

    });
    $(".wdsc").click(function(){
        $("#wdsc_son").siblings().hide();
        $("#wdsc_son").show();
    });
    $(".wdyq").click(function(){
        $("#wdyq_son").siblings().hide();
        $("#wdyq_son").show();
    });
    $(".getmsg").click(function(){
        $(".getmsg").siblings().css({"color":"white"});
        $(".getmsg").css({"color":"rgb(204,153,102)"});
        $("#getmsg").siblings().hide();
        $("#getmsg").show();
    });
    $(".send").click(function(){
        $(".send").siblings().css({"color":"white"});
        $(".send").css({"color":"rgb(204,153,102)"});
        $("#send").siblings().hide();
        $("#send").show();
    });
    $(".sys_message").click(function(){
        $(".sys_message").siblings().css({"color":"white"});
        $(".sys_message").css({"color":"rgb(204,153,102)"});
        $("#sys_message").siblings().hide();
        $("#sys_message").show();
    });
    $(".wdyq_son_top_choose").click(function(){
        $(this).siblings().css({"color":"white"});
        $(this).css({"color":"rgb(204,153,102)"});
        $(".wdyq_son_top_choose_body").siblings().hide();
        var index = $(this).index();
        $(".wdyq_son_top_choose_body").eq(index).show();
    });
    $("#realmsg").click(function () {
        var real_realName = $("#real_realName").val();
        var real_identity = $("#real_identity").val();
        $.ajax({
            url:"/rtUser/insertRealMsg.do",
            //contentType:"application/json",
            dataType:"json",
            data:{"realName":real_realName,"identity":real_identity},
            type:"post",
            success:function(r){
                if(r == 1){
                    alert("成功认证");
                }
            },
            error:function(e) {
                alert(e + "错误了");
            }
        });
    });
    function myReciverMail(){
        $.ajax({
            url:"/rtUser/myReciverMail.do",
            //contentType:"application/json",
            dataType:"json",
            //data:,
            type:"post",
            success:function(r){
                $("#getmsg").html("");
                $(r).each(function(i,o){
                    isread = "未读";
                    if(o.isRead ==  '1'){
                        isread = "已读";
                    }
                    var str = "<div class=\"mail_message\">\n" +
                        "                            <span>title:</span><span><a style=\"text-decoration: none;color:white;\" href=\"/rtUser/MailMessage.do?id="+o.id+"\">"+o.title+"</a></span><br>\n" +
                        "                            <span>收件人:</span><span>"+o.sendName+"</span><br>\n" +
                        "                            <span>发送人:</span><span>"+o.reciverName+"</span><span style=\"margin-right:\">"+isread+"</span><br>\n" +
                        "                        </div>";
                    $("#getmsg").append(str);

                });
            },
            error:function(e) {
                alert(e + "错误了");
            }
        });
    }
    function mySendMails(){
        $.ajax({
            url:"/rtUser/mySendMails.do",
            //contentType:"application/json",
            dataType:"json",
            //data:,
            type:"post",
            success:function(r){
                $("#send").html("");
                $(r).each(function(i,o){
                    isread = "未读";
                    if(o.isRead ==  '1'){
                        isread = "已读";
                    }
                    var str = "<div class=\"mail_message\">\n" +
                        "                            <span>title:</span><span><a style=\"text-decoration: none;color:white;\" href=\"/rtUser/MailMessage.do?id="+o.id+"\">"+o.title+"</a></span><br>\n" +
                        "                            <span>收件人:</span><span>"+o.sendName+"</span><br>\n" +
                        "                            <span>发送人:</span><span>"+o.reciverName+"</span><span style=\"margin-right:\">"+isread+"</span><br>\n" +
                        "                        </div>";
                    $("#send").append(str);

                });
            },
            error:function(e) {
                alert(e + "错误了");
            }
        });
    }
    function MySysMails(){
        $.ajax({
            url:"/rtUser/MySysMails.do",
            //contentType:"application/json",
            dataType:"json",
            //data:,
            type:"post",
            success:function(r){
                $("#sys_message").html("");
                $(r).each(function(i,o){
                    isread = "未读";
                    if(o.isRead ==  '1'){
                        isread = "已读";
                    }
                    var str = "<div class=\"mail_message\">\n" +
                        "                            <span>title:</span><span><a style=\"text-decoration: none;color:white;\" href=\"/rtUser/MailMessage.do?id="+o.id+"\">"+o.title+"</a></span><br>\n" +
                        "                            <span>收件人:</span><span>"+o.sendName+"</span><br>\n" +
                        "                            <span>发送人:</span><span>"+o.reciverName+"</span><span style=\"margin-right:\">"+isread+"</span><br>\n" +
                        "                        </div>";
                    $("#sys_message").append(str);

                });
            },
            error:function(e) {
                alert(e + "错误了");
            }
        });
    }
    $("#updatemy_Password").click(function () {
        $(".Choose_back").show();
        $(".Choose_choosemain").hide();
        $(".Choose_password").show();
    });
    $("#my_like").click(function () {
        $(".Choose_back").show();
        $(".Choose_password").hide();
        $(".Choose_choosemain").show();
    });
    $(".f_btn").click(function () {
        var index = $(this).index(".f_btn");
        if(index == 0){
            $(".check_message").show();
            $(".youxiang_message").hide();
            $(".mails_messages").hide();
            $(".sfyz_message").hide();
        }
        if(index == 1){
            $(".check_message").hide();
            $(".youxiang_message").show();
            $(".mails_messages").hide();
            $(".sfyz_message").hide();
        }
        if(index == 2){
            $(".check_message").hide();
            $(".youxiang_message").hide();
            $(".mails_messages").show();
            $(".sfyz_message").hide();
        }
    });


    //上传图片
    function changepic1(obj) {
        //console.log(obj.files[0]);//这里可以获取上传文件的name
        var newsrc=getObjectURL(obj.files[0]);
        document.getElementById('sfzgh').src=newsrc;
    }
    //上传图片
    function changepic2(obj) {
        //console.log(obj.files[0]);//这里可以获取上传文件的name
        var newsrc=getObjectURL(obj.files[0]);
        document.getElementById('sfzrx').src=newsrc;
    }
    //上传图片
    function changepic3(obj) {
        //console.log(obj.files[0]);//这里可以获取上传文件的name
        var newsrc=getObjectURL(obj.files[0]);
        document.getElementById('sfzzp').src=newsrc;
    }
})
//上传图片
function changepic1(obj) {
    //console.log(obj.files[0]);//这里可以获取上传文件的name
    var newsrc=getObjectURL(obj.files[0]);
    document.getElementById('sfzgh').src=newsrc;
}
//上传图片
function changepic2(obj) {
    //console.log(obj.files[0]);//这里可以获取上传文件的name
    var newsrc=getObjectURL(obj.files[0]);
    document.getElementById('sfzrx').src=newsrc;
}
//上传图片
function changepic3(obj) {
    //console.log(obj.files[0]);//这里可以获取上传文件的name
    var newsrc=getObjectURL(obj.files[0]);
    document.getElementById('sfzzp').src=newsrc;
}
function getObjectURL(file) {
    var url = null ;
    // 下面函数执行的效果是一样的，只是需要针对不同的浏览器执行不同的 js 函数而已
    if (window.createObjectURL!=undefined) { // basic
        url = window.createObjectURL(file) ;
    } else if (window.URL!=undefined) { // mozilla(firefox)
        url = window.URL.createObjectURL(file) ;
    } else if (window.webkitURL!=undefined) { // webkit or chrome
        url = window.webkitURL.createObjectURL(file) ;
    }
    return url ;
}
function recognize_image(){
    document.getElementById('transcription').innerText = "(Recognizing...)"
    OCRAD(document.getElementById("pic"), function(text){
        document.getElementById('transcription').className = "done"
        document.getElementById('transcription').innerText = text;
    })
}