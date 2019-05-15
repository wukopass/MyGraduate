<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/core.jsp"%>
<html>
<head>
    <title>名师指路</title>
    <style>
        *{
            box-sizing:border-box;
        }
        body{
            overflow-x: hidden;
            background-color: black;
        }
        div{
            display: block;
        }
        a{
            color:white;
            text-decoration: none;
        }
        p{
            margin: 0px 0px 10px;
        }
        ul{
            list-style-type: none;
            display: inline-block;
            margin: 0px;
        }
        li{
            display: inline-block;
            list-style-type: none;
            border-radius: 2px;
            float: left;
            height: 28px;
            line-height: 26px;
            font-size: 14px;
            text-align: center;
            margin-right: 18px;
            font-weight: normal;
        }
        img{
            border-width: 0px;
        }
        .daka_banner{
            width:100%;
            min-height: 427px;
            background-color: #e9e9e9;
            background-size: 100% 100%;
        }
        .ms_img{
            display: inline-block;
            width: 80%;
            height:100%;
            background: url(${ctx}/images/guidance/left_banner1.png);
            background-size: 100% 100%;
        }
        .ms_nar{
            position: relative;
            display: inline-block;
            float: right;
            width: 19%;
            height: 100%;
        }
        .ms_nar1{
            display: inline-block;
            width: 100%;
            height: 32%;
            background: url(${ctx}/images/guidance/right_1.png);
            background-size: 100% 100%;
        }
        .ms_nar2{
            margin-top: 2%;
            display: inline-block;
            width: 100%;
            height: 32%;
            background: url(${ctx}/images/guidance/right_2.png);
            background-size: 100% 100%;
        }
        .ms_nar3{
            display: inline-block;
            width: 100%;
            height: 32%;
            background: url(${ctx}/images/guidance/right_31.png);
            background-size: 100% 100%;
            position: absolute;
            bottom: 0;
            right: 0;
        }

        #daka_main {
            font-family: 'MicrosoftYaHei';
            margin: 0;
            padding: 0;
            background-color: black;
        }
        .daka_listFrame {
            width: 1300px;
            margin: 0 auto;
            overflow: hidden;
            padding-top: 20px;
            box-sizing: border-box;
        }
        .daka_list{
            background-color: rgb(47,47,47);
            margin-bottom:20px;
            padding:0px 60px 0px 30px;
            overflow: hidden;
        }
        .daka_list .list_img{
            width: 190px;
            height: 190px;
            background-color: rgb(198,153,111);
            float: left;
            position: relative;
            cursor: pointer;
        }
        .daka_list .list_img img{
            height: 100%;
            width: 100%;
        }
        .daka_list .list_img .list_imgTitle{
            position: absolute;
            bottom: 0px;
            width: 100%;
            text-align: center;
            line-height: 38px;
            font-size: 16px;
            color: rgb(255,255,255);
            z-index: 2;
            margin: 0px;
        }
        .daka_list .list_img .list_imgBg  {
            position: absolute;
            bottom: 0px;
            width: 100%;
            height: 38px;
            background-color: rgba(0, 0, 0, 0.8);
            z-index: 1;
        }

        .daka_list .list_info{
            position: relative;
            margin-left: 220px;
        }
        .list_info .list_head{
            overflow: hidden;
        }
        .list_info .my_title{
            display: inline-block;
            margin-top: 22px;
            margin-bottom: 0px;
            font-weight: bold;
            font-size: 18px;
            line-height: 18px;
            font-stretch: normal;
            letter-spacing: 0px;
            color:rgb(255,255,255);
        }
        .list_info .list_head .my_money{
            float: right;
            margin-top: 22px;
            font-size: 14px;
            color: rgb(202,155,97);
        }
        .daka_resume_hr3{
            margin-top: 12px;
            margin-bottom: 16px;
            border-bottom:1px solid rgba(255,255,255,0.2);
        }
        .list_info .my_info {
            line-height: 20px;
            text-overflow: ellipsis;
            white-space: nowrap;
            margin: 18px 0px;
            overflow: hidden;
        }
        .list_info .list_info_title {
            font-size: 14px;
            color: rgb(255, 255, 255);
            font-weight: bold;
        }
        .list_info .my_advantage {
            margin: 0px;
            overflow: hidden;
        }
        .list_info .my_experience {
            margin-top: 8px;
        }
        .daka_list_btn1 {
            width: 150px;
            height: 35px;
            line-height: 35px;
            font-size: 14px;
            position: absolute;
            right: 0px;
            bottom: 5px;
            background-color: rgb(202, 155, 97);
            text-align: center;
            cursor: pointer;
            color: rgb(255, 255, 255) !important;
            border-radius: 2px;
            text-decoration: none;
        }
        .list_info .my_advantage li.cur {
            color: rgb(202, 155, 97);
            border-width: 1px;
            border-style: solid;
            border-color: rgb(202, 155, 97);
            border-image: initial;
            padding: 0px 8px;
        }
    </style>
</head>
<body>
<div class="daka_banner" style="height:408.89px;">
    <div style="width: 75%;height:100%;margin:0 auto;">
        <span class="ms_img"></span>
        <div class="ms_nar">
            <a href="javascript:;" class="ms_nar1" target="_blank"></a>
            <a href="javascript:;" class="ms_nar2" target="_blank"></a>
            <a href="javascript:;" class="ms_nar3" target="_blank"></a>
        </div>
    </div>
</div>
<div id="daka_main">
<form action="/tutor/search.do" method="post">
    <c:forEach var="list" items="${tutor}">
    <div class="daka_listFrame daka_div">
        <div class="daka_list">
            <div class="list_img">
                <img src="${ctx}/${list.photo}">
                <p class="list_imgTitle">邀请名师点评</p>
                <div class="list_imgBg"></div>
            </div>
            <div class="list_info">
                <div class="list_head">
                    <p class="my_title">
                        <a href="/tutor/searchOne.do?id=${list.id}"><span id="tutorName">${list.name}</span></a>&nbsp;&nbsp;
                        <span style="font-size: 16px">${list.company}</span>
                    </p>
                    <span class="my_money">
                    <del>${list.charge}</del>
                    <span style="color: red;">&nbsp;&nbsp;&nbsp;免费</span>
                    </span>
                </div>
                <hr class="daka_resume_hr3">
                <p class="list_info_title my_info">
                    个人简介
                    <span  style="font-weight: normal;">${list.introduction}</span>
                </p>
                <div class="list_info_title my_advantage">
                    <span style="float: left;">擅长领域</span>
                    <ul style="position: relative;right:33px;">
                        <c:forEach var="goodFields" items="${list.goodFields}">
                                <li class="cur">${goodFields}</li>
                        </c:forEach>
                    </ul>
                </div>
                <p class="list_info_title my_experience">
                    从业经验
                    <span style="font-weight: normal">${list.experience}年</span>
                </p>
                <a class="daka_list_btn1 clickBtn1" href="javascript:;">
                    已点评项目
                    <i style="color: red">(0)</i>
                </a>
            </div>
        </div>
    </div>
    </c:forEach>
</form>
</div>
</body>
</html>
