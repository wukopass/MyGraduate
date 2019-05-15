<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div style="width:100%;height:100px;background: #1b1b1b;position: fixed;z-index:99998;">
        <div class="top">
            <div class="top_left">
                <a href="#">
                    <img src="${ctx}/images/zhuzi/rt_logo.png">
                </a>
            </div>
            <div class="top_right">
                <ul id="top_right_li">
                    <li><a href="/index.jsp">首页</a></li>
                    <li><a href="/tutor/search.do">名师指路</a></li>
                    <li class="fabu">发布中心
                        <ul class="fabu_menu">
                            <li><a href="${ctx}/jsp/invest.jsp"> 发布投资需求</a></li>
                           <%-- <li><a href="#">发布融资需求</a></li>--%>
                            <li><a href="${ctx}/jsp/coop.jsp">发布合作需求</a></li>
                            <li><a href="${ctx}/jsp/asset.jsp">发布资产交易</a></li>
                            <li><a href="${ctx}/jsp/stock.jsp">发布股权转让</a></li>
                        </ul>
                    </li>
                    <li class="chazhao">查找中心
                        <ul class="chazhao_menu">
                            <li><a href="${ctx}/jsp/searchInvest.jsp">找资金</a></li>
                           <%-- <li><a href="#">找项目</a></li>--%>
                            <li><a href="${ctx}/jsp/findCoop.jsp">找合作</a></li>
                            <li><a href="${ctx}/jsp/findAsset.jsp">找企业</a></li>
                            <li><a href="${ctx}/jsp/findStock.jsp">找资产</a></li>
                        </ul>
                    </li>
                    <li><a href="https://www.rtworld.com/article/page?index=1&type=1">大讲堂</a></li>
                    <%--这两个要做权限控制--%>
                    <li><a href="${ctx}/rtUser/myMessage.do">${RtUserAll.rtUserName}</a></li>
                    <%--        <li><a href="#">登入/退出</a></li>--%>
                    <li><a href="#">退出</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="adtop">
        <img src="${ctx}/images/zhuzi/grzx_banner.jpg" alt="" srcset="">
    </div>
</body>
</html>
