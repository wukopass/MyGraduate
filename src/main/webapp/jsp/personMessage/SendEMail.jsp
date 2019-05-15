<%--
  Created by IntelliJ IDEA.
  User: tl
  Date: 2018/11/16
  Time: 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/core.jsp"%>
<html>
<head>
    <title>邮件发送</title>
</head>
<body>
<div style="margin: 200px auto;width:800px;height: 400px;">
    <form action="${ctx}/rtUser/insertMail.do" method="post" id = "send_fm">
        <input type="hidden" name=reciverId value="${reciverID}">
        <input type="hidden" id="hidden_context" name="context" value="">
        邮件title:<br><input type="text" name="title" style="width:800px" value="${MailMessage.title}"><br>
        信息内容:
        <div contenteditable="true" id="context" style="width:800px;height: 400px;border:1px black solid;">${MailMessage.context}</div>
        <c:if test="${empty tip}">
            <a href="javascript:;" id="send_mail"  style="color:black;text-decoration: none;">发送</a>
        </c:if>
    </form>
</div>
    <script>
        $("#send_mail").click(function () {
            var ss = $("#context").html();
            $("#hidden_context").val(ss);
            $("#send_fm").submit();
        });
    </script>
</body>
</html>
