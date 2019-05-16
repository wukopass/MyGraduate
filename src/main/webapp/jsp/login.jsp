<%--
  Created by IntelliJ IDEA.
  User: tl
  Date: 2018/11/10
  Time: 12:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页面</title>
</head>
<body>
<div style="margin: auto">
    登入界面
    <form action="/sys/login.do">
        用户名：<input type="text" name="username">
        密码：<input type="password" name="password">
        <input type="submit">
    </form>

</div>


</body>
</html>
