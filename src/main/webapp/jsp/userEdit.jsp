<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/core.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script>
        $(document).ready(function () {
            $("#pass").click(function () {
                $("#fm").submit();
            });
            $("#unPass").click(function () {
                $("#fm").action="${ctx}/sys/emptyEx.do";
                $("#fm").submit();
            });
            $("#update").click(function () {
                $("#fm").action="${ctx}/sys/updateEx.do";
                $("#fm").submit();
            });

        });
    </script>
    <title>Title</title>
</head>
<body>
<div>
    <form id="fm" action="${ctx}/sys/passEx.do">
        <input type="hidden" name="id" value="${rtUser.id}">
        用户名：<input readonly name="rtUserName" value="${rtUser.rtUserName}"><br>
        角色：<select name="rtRole.rtRoleName" value="${rtUser.rtRole.rtRoleName}">
        <option value="">请选择</option>
        <c:forEach var="role" items="${rtRoles}">
            <c:if test="${role.id == rtUser.rtRole.id}">
                <option selected value="${role.id}">${role.rtRoleName}</option>
            </c:if>
            <c:if test="${role.id != rtUser.rtRole.id}">
                <option value="${role.id}">${role.rtRoleName}</option>
            </c:if>
        </c:forEach>
    </select><br>
        电话号码：<input readonly name="tel" value="${rtUser.tel}"><br>
        公司名称:<input name="companyName" value="${rtUser.companyName}"><br>
        <c:if test="${rtUser.rtUserEx.msgChecking eq '49'}">
            <input id="pass" type="button" value="确认核实">
            <input id="unPass" type="button" value="信息有误，驳回">
        </c:if>
        <c:if test="${rtUser.rtUserEx.msgChecking eq '48'|| rtUser.rtUserEx.msgChecking eq null}">
            <input id="update" type="button" value="确认修改">
        </c:if>
    </form>
</div>

</body>
</html>
