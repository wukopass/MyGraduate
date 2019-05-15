<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/core.jsp"%>
<html>
<head>
    <title>个人中心-融投世界</title>
    <link rel="stylesheet" href="${ctx}/css/user_info.css">
    <script src="${ctx}/js/ocrad.js"></script>
    <script type="text/javascript" src="${ctx}/js/user_info.js"></script>
</head>
<body>
    <div style="width:100%;margin: auto;">
        <%@include file="/jsp/personMessage/xyzTitle.jsp"%>
        <div id="zhxx">
            <div class="zhgl zhgl_bg_click" style="cursor: pointer">账户管理</div>
            <div class="xxgl xxgl_bg" style="cursor: pointer">信息管理</div>
        </div>
        <div id="zhxx_menus">
            <div class="color1">
                <div class="MY_Window">
                    <div class="zhgl_menu">
                        <div class="jbxx menu_3">
                            <img src="${ctx}/images/zhuzi/jbxx.png"></div>
                        <div class="sfyz menu_3">
                            <img src="${ctx}/images/zhuzi/sfyz.png"></div>
                        <div class="yqzc menu_3">
                            <img src="${ctx}/images/zhuzi/zcyq.png"></div>
                    </div>
                    <div class="xxgl_menu">
                        <div class="wdxx menu_4">
                            <img src="${ctx}/images/zhuzi/wdxx.png"></div>
                        <div class="wdxm menu_4">
                            <img src="${ctx}/images/zhuzi/yfbxx.png"></div>
                        <div class="wdsc menu_4">
                            <img src="${ctx}/images/zhuzi/wdsc.png"></div>
                        <div class="wdyq menu_4">
                            <img src="${ctx}/images/zhuzi/wdyq.png"></div>
                    </div>
                </div>
            </div>
        </div>

        <div id="main">
            <div id="jbxx_son">
                <div class="container_box" style="background-color: #1b1b1b;padding:0px;position: relative;z-index:99;">
                    <div class="container_box1">
                        <div class="uer_info_title">个人信息</div>
                        <div class="line_style"></div>
                        <div class="user_info_box">
                            <div class="col-xs-3" style="margin-right:5%;float: left;display: inline-block">
                                <img class="tx2_img" src="${ctx}/images/zhuzi/tx2.png">
                            </div>
                            <div class="col-xs-9" style="padding:15px 30px 0px 45px">
                                <div>
                                    <div style="display: inline-block;margin-left: 15px">
                                        <a href="javascript:;" style="text-decoration: none;color:white;font-size: 18px;">${RtUserAll.rtUserName}</a>
                                        <img style="margin-left: 10px" src="${ctx}/images/zhuzi/sfrzss.png">
                                        <img style="margin-left: 10px" src="${ctx}/images/zhuzi/qyrz.png">
                                        <img style="margin-left: 10px" src="${ctx}/images/zhuzi/yxrz.png">
                                    </div>
                                </div>
                                <div class="top_25" style="display:inline-block;color: #cc9966;cursor: pointer">
                                    <span style="float: left">添加任职经历</span>
                                    <img style="width: 18px;float: left;" src="${ctx}/images/zhuzi/jiantou.png">
                                </div>
                                <div class="top_25">
                                    <img style="margin-right: 5px;width: 16px;" src="${ctx}/images/zhuzi/yjf.png">
                                    <span style="cursor: pointer">积分:</span>
                                </div>
                                <div class="top_25" style="margin-left: 25%">
                                    <span>消息提醒:</span>
                                    <span style="cursor: pointer">未读消息<span id="count" style="color: red">{${RtUserAll.additionmessage.notRead}}</span> </span>
                                    <a href="#" style="text-decoration: none;color:rgb(204,153,102);font-size: 16px;" id="updatemy_Password">修改密码</a>
                                    <a href="#" style="text-decoration: none;color:rgb(204,153,102);font-size: 16px;" id="my_like">选择我的偏好</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container_box1" style="width:830px;height: 260px;text-align: center">
                        <div class="myInfo_box">
                            <div class="myInfo_box_img">
                                <img src="${ctx}/images/zhuzi/fbxm_icon.png">
                            </div>
                            <div class="myInfo_box_font">${RtUserAll.additionmessage.myProject}</div>
                            <div class="myInfo_box_font">我的项目</div>
                        </div>
                        <div class="myInfo_box" style="margin-left: 100px;">
                            <div class="myInfo_box_img">
                                <img src="${ctx}/images/zhuzi/zj_icon.png">
                            </div>
                            <div class="myInfo_box_font">${RtUserAll.additionmessage.otherPeople}</div>
                            <div class="myInfo_box_font">谁看过项目</div>
                        </div>
                        <div class="myInfo_box" style="margin-left: 100px">
                            <div class="myInfo_box_img">
                                <img src="${ctx}/images/zhuzi/znx_icon.png">
                            </div>
                            <div class="myInfo_box_font">${RtUserAll.additionmessage.sysMessage}</div>
                            <div class="myInfo_box_font">新的站内信</div>
                        </div>
                    </div>
                    <div class="container_box1">
                        <div class="uer_info_title">信息动态</div>
                        <div class="line_style"></div>
                        <div style="margin: 0 auto;width: 700px;height: 340px">
                            <div class="foot_title">我看过谁</div>
                            <div class="footpri_box">
                                <img src="">
                                <p>何平</p>
                                <hr style="width:30px;background-color:rgb(204,153,102);"/>
                                <p>招商经理</p>
                                <p>四川咻电科技有限公司</p>
                                <p>《咻电共享充电宝诚信招商》</p>
                                <a href="${ctx}/rtUser/sendMail.do?id=2" class="MY_lxt">联系他</a>
                            </div>
                        </div>
                    </div>
                    <div class="recommend_pro">
                        <div class="recommend_title">推荐项目</div>
                        <div id="recommen"></div>
                    </div>
                </div>
            </div>
            <div id="sfyz_son">
                <div style="background-color: #333333;padding:0px;position: relative;" class="sfyz_message">
                    <div class="f_list">
                        <img class="f_img" src="${ctx}/images/zhuzi/sf.png">
                        <div class="f_text_box">
                            <div style="font-size: 18px;">个人身份验证</div>
                            <div class="f_line"></div>
                            <span style="font-size: 15px;">通过个人身份认证后，
                                将会得到特殊的认证徽标。同时保障平台会员身份的真实性。</span>
                        </div>
                        <button class="f_btn">立即验证</button>
                    </div>
                    <div class="f_list">
                        <img class="f_img" src="${ctx}/images/zhuzi/qy.png">
                        <div class="f_text_box">
                            <div style="font-size: 18px;">企业验证</div>
                            <div class="f_line"></div>
                            <span style="font-size: 15px;">通过企业认证后，
                                将会得到特殊的认证徽标。</span>
                        </div>
                        <button class="f_btn">立即验证</button>
                    </div>
                    <div class="f_list">
                        <img class="f_img" src="${ctx}/images/zhuzi/yx.png">
                        <div class="f_text_box">
                            <div style="font-size: 18px;">邮箱验证</div>
                            <div class="f_line"></div>
                            <span style="font-size: 15px;">可以让需求方有更多的途径和您
                                进行深入交流，为您的真实性加分。通过后认证，<br>
                                将会得到特殊的认证徽标。</span>
                        </div>
                        <button class="f_btn">立即验证</button>
                    </div>
                </div>
                <div class="check_message" style="display:none;">
                    <div style="display: inline-block; width:620px;vertical-align: top;height:1000px;margin-left:180px;">
                        <form action="${ctx}/rtUser/insertRealMsg.do" method="post"  enctype="multipart/form-data">
                        <span>※真实姓名</span><input type="text" id="real_realName" name="realName" placeholder="上传身份证正面照后自动识别"><br><br>
                        <span>※身份证号码</span><input type="text" id="real_identity" name="identity" placeholder="上传身份证正面照后自动识别"><br><br>
                        <span>※身份证有效期</span><input type="text" name="time" placeholder="上传身份证正面照后自动识别"><br><br>
                        <span>※身份证照片（国徽面）</span> <input type="file" accept="image/png,image/jpeg,image/gif" onchange="changepic1(this)" name="myfile" value="选择文件"><br><br>
                        <span>※身份证照片（人像面）</span> <input type="file" accept="image/png,image/jpeg,image/gif" onchange="changepic2(this)" name="myfile" value="选择文件"><br><br>
                        <span>※手持身份证照片</span>  <input type="file" accept="image/png,image/jpeg,image/gif" onchange="changepic3(this)" name="myfile" value="选择文件"><br><br>
                        <input type="button" value="提交" id="realmsg"><a href="javascript:;" class="sfyz_quit" style="display: inline-block;width:100px;height:40px;
                        line-height:40px;text-align: center;color:white;background: rgb(204,153,102);border-radius: 5px;">返回</a>
                        </form>
                    </div>
                    <div style="display: inline-block; width:330px;vertical-align: top;height:1000px;text-align: center;">
                        身份证照片（国徽面）示例
                        <div style="width:310px;border:1px red solid;margin-left:10px;height: 180px;">
                            <img src="" width="100%" height="100%" id="sfzgh">
                        </div>
                        身份证照片（人像面）示例
                        <div style="width:310px;border:1px red solid;margin-left:10px;height: 180px;">
                            <img src="" width="100%" height="100%" id="sfzrx">
                        </div>
                        手持身份证照片示例
                        <div style="width:310px;border:1px red solid;margin-left:10px;height: 180px;">
                            <img src="" width="100%" height="100%" id="sfzzp">
                        </div>
                    </div>
        <%--            <h1>Simple Ocrad.js Example</h1>
                    <div id="main_cs" style="font-size: 12px">
                        <input type="text" value="123" onclick="recognize_image()">
                        <!-- CODE大全：www.codedq.net -->
                        <img id="pic" src="" onchange="recognize_image()" width="400px" height="200px">
                        <div id="transcription"></div>
                    </div>--%>
                </div>
                <div style="display: none;" class="youxiang_message">
                    <div style="width:1000px;height:400px;margin: 20px auto;">
                        <img src="${ctx}/images/zhuzi/qiye.png" width="100%" height="100%"><br>
                        <a href="javascript:;" class="sfyz_quit" style="display: inline-block;width:100px;height:40px;
                        line-height:40px;text-align: center;color:white;background: rgb(204,153,102);border-radius: 5px;">返回</a>
                    </div>
                </div>
                <div style="display: none;" class="mails_messages">
                    <div style="margin: 20px auto; width:1000px;height: 400px;">
                        <span style="margin-left:80px;">※ 认证邮箱：</span><input type="text" name="youxiang" placeholder="如果注册时已填则默认显示邮箱"><span>
                        请确认邮箱地址准确无误</span>
                        <div>
                            <br><br>认证小贴士:<br>
                            通过认证后，将点亮您“个人主页”顶端的图标，表示：已通过邮箱认证。<br>
                            声明：融投世界严格保守用户身份信息；如未征求您本人同意，绝不向第三方透露。<br>
                            提示：认证信息是会员自愿提供，目前中国无完整渠道确保100%真实，请理性对待。
                        </div>
                        <a href="javascript:;" class="sfyz_renzheng" style="display: inline-block;width:100px;height:40px;
                        line-height:40px;text-align: center;color:white;background: rgb(204,153,102);border-radius: 5px;">提交认证</a>
                        <a href="javascript:;" class="sfyz_quit" style="display: inline-block;width:100px;height:40px;
                        line-height:40px;text-align: center;color:white;background: rgb(204,153,102);border-radius: 5px;">返回</a>
                    </div>
                    <script>
                        $(".sfyz_renzheng").click(function() {
                            $.ajax({
                                url: "/Mail/sendMail.do",
                                //contentType:"application/json",
                                dataType: "json",
                                //data:,
                                type: "post",
                                success: function (r) {
                                    alert("邮件发送成功");
                                },
                                error: function (e) {
                                    alert(e + "错误了");
                                }
                            });
                        });
                    </script>
                </div>
                <script>
                    $(".sfyz_quit").click(function (){
                        $(".check_message").hide();
                        $(".youxiang_message").hide();
                        $(".mails_messages").hide();
                        $(".sfyz_message").show();
                    });
                </script>
            </div>
            <div id="yqzc_son">
                <div class="yqzc_son_box">
                    <div class="user_info_title">邀请注册</div>
                     <div class="line_style"></div>
                    <div style="text-align: center">
                        <input class="copy_input" type="text" readonly="readonly" value="这里有一个网址">
                    </div>
                    <div></div>
                    <div></div>
                </div>
            </div>
            <div id="wdxx_son">
                <div class="top_title">
                    <div class="top_title_son">
                        <div class="row">
                            <div class="getmsg">
                                收信箱
                            </div>
                            <div class="send">
                                发信箱
                            </div>
                            <div class="sys_message">
                                系统消息
                            </div>
                        </div>
                    </div>
                    <div class="mail_body">
                        <div id="getmsg"><div class="mail_message">
                            <span>title:</span><span><a style="text-decoration: none;color:white;" href="${ctx}/rtUser/MailMessage.do?id=1">23123</a></span><br>
                            <span>收件人:</span><span>tl</span><br>
                            <span>发送人:</span><span>小勇子</span><br>
                        </div></div>
                        <div id="send" style="display: none;"><div class="mail_message">
                            <span>title:</span><span>23123</span><br>
                            <span>收件人:</span><span>tl</span><br>
                            <span>发送人:</span><span>小勇子</span><br>
                        </div></div>
                        <div id="sys_message" style="display: none;"><div class="mail_message">
                            <span>title:</span><span>23123</span><br>
                            <span>收件人:</span><span>tl</span><br>
                            <span>发送人:</span><span>小勇子</span><br>
                        </div></div>
                    </div>
                </div>
            </div>
            <div id="wdxm_son">
                <div>
                    <div class="pro_list_box">
                        <div class=no_sc" style="margin:20px auto;color:rgb(204,153,102);font-size: 25px;text-align: center;">
                            还没有项目
                        </div>
                    </div>
                </div>
            </div>
            <div id="wdsc_son">
                <div>
                    <div>
                        <p style="margin:20px auto;color:rgb(204,153,102);font-size: 25px;text-align: center;">你还没有没有收藏</p>
                    </div>
                </div>
            </div>
            <div id="wdyq_son" style="display:none;">
                <div >
                    <div class="wdyq_son_top">
                        <div class="wdyq_son_top_choose">材料准备</div>
                        <div class="wdyq_son_top_choose">邀请进度</div>
                        <div class="wdyq_son_top_choose">点评详情</div>
                    </div>
                    <div >
                        <div class="wdyq_son_top_choose_body">材料准备</div>
                        <div class="wdyq_son_top_choose_body" style="display: none;">邀请进度</div>
                        <div class="wdyq_son_top_choose_body" style="display: none;">点评详情</div>
                    </div>
                </div>

            </div>
        </div>
        <%@include file="/jsp/personMessage/chooseLike.jsp"%>
        <div class="div1"></div>
    </div>
</body>
</html>
