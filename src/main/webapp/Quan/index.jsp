<%@ include file="/core.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh" xmlns:th="http://www.thymeleaf.org" xmlns:shiro="http://www.pollix.at/thymeleaf/shiro">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>天上金会员管理系统</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <script src="../layui/layui.js"></script>
    <style src="../layui/layui.all.js"></style>
    <style>
        iframe{
            border: 0 !important;
        }
    </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">RBAC管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <!--<ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="/other/consoleTest.html">控制台</a></li>
            <li class="layui-nav-item"><a href="">商品管理</a></li>
            <li class="layui-nav-item"><a href="">用户</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>-->
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="../images/default_avatar.jpg" class="layui-nav-img">
                    <span th:if="${currentUser}" th:text="${currentUser.username}"></span>
                    <span th:unless="${currentUser}">未登录</span>
                </a>
                <dl class="layui-nav-child">
                    <dd th:if="${currentUser}"><a href="javascript:;">查看资料</a></dd>
                    <dd th:unless="${currentUser}"><a href="/register.html">注册</a></dd>
                    <dd th:unless="${currentUser}"><a href="/login.html">登录</a></dd>
                    <dd th:if="${currentUser}"><a href="javascript:;">退出登录</a></dd>
                </dl>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item"><a tab-id="000" href="javascript:;">主页</a></li>
                <li class="layui-nav-item layui-nav-itemed" th:each="catalog : ${catalogList}">
                    <a class="" href="javascript:;" th:text="${catalog.permissionName}"></a>
                    <dl class="layui-nav-child" th:if="${catalog.perms} == system">
                        <dd th:each="systemMenu : ${systemMenuList}">
                            <a href="javascript:;" th:text="${systemMenu.permissionName}"
                               th:attr="tab_id=${systemMenu.permissionId},data_url=${systemMenu.url}">没有菜单项</a>
                        </dd>
                    </dl>
                    <dl class="layui-nav-child" th:if="${catalog.perms} == monitor">
                        <dd th:each="monitorMenu : ${monitorMenuList}">
                            <a href="javascript:;" th:text="${monitorMenu.permissionName}"
                               th:attr="tab_id=${monitorMenu.permissionId},data_url=${monitorMenu.url}">没有菜单项
                            </a>
                        </dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div class="layui-tab" lay-filter="mytab" lay-allowClose="true" style="margin-top: 0 !important;">
            <ul class="layui-tab-title" id="wy-tab-title">
                <li lay-id="000" class="layui-this">
                    <i class="layui-icon">
                        &#xe68e;
                        <cite>主页</cite>
                    </i>
                </li>
            </ul>
            <div class="layui-tab-content" style="min-height: 800px;border: none" id="wy-tab-content">
                <div class="layui-tab-item layui-show">
                    <iframe src="../mainPage.html"></iframe>
                </div>
                <!--<div class="layui-tab-item" th:each="systemMenu : ${systemMenuList}" th:attr="content_id=${systemMenu.permissionId}">
                    <iframe th:src="${systemMenu.url}"></iframe>
                </div>
                <div class="layui-tab-item">3</div>
                <div class="layui-tab-item">4</div>
                <div class="layui-tab-item">5</div>
                <div class="layui-tab-item">6</div>-->
            </div>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        Copyright &copy; 2018 小夏会员管理 1379028478@qq.com All rights reserved.
    </div>
    <input type="hidden" id="currentUserId" th:value="${currentUser.userId}">
</div>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var $ = layui.jquery;
        var element = layui.element;
        $(document).on('click', 'a', function () {
            if (!$(this)[0].hasAttribute("tab_id") || $(this).attr("tab_id") === '') {
                return;
            }
            var layid = $(this).attr("tab_id");
            var text = $(this).text();
            var dataurl = $(this).attr("data_url");
            /*alert(layid);*/
            var tabs = $(".layui-tab-title").children();
            var msg = true;
            $.each(tabs, function (i, item) {
                var tabid = $(item).attr("lay-id");
                /*alert('遍历' + tabid);*/
                if (tabid === layid) {
                    /*alert('相等了');*/
                    msg = false;
                    return false;
                }

            });
            /*alert('msg' + msg);*/
            if (msg) {
                element.tabAdd('mytab', {
                    title: text,
                    content: "<iframe frameborder='0' width='100%' height='100%' src='" + dataurl + "'></iframe>",
                    id: layid
                });
            }
            resize();
            element.tabChange('mytab', layid);


        });

        function resize() {
            var $content = $(".layui-tab-content");
            $content.height($(this).height() - 200);
            $content.find('iframe').each(function () {
                $(this).height($content.height());
                $(this).width("100%")

            })

        }

        $(window).on('resize', function () {
            var $content = $(".layui-tab-content");
            $content.height($(this).height() - 200);
            $content.find('iframe').each(function () {
                $(this).height($content.height());
                $(this).width("100%")

            });

        });
        $(window).on('load', function () {
            var $content = $(".layui-tab-content");
            $content.height($(this).height() - 200);
            $content.find('iframe').each(function () {
                $(this).height($content.height());
                $(this).width("100%")

            });

        })

    });
</script>
</body>
</html>！