<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}/Quan" />

<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<script src="/js/jquery-2.1.1.min.js"></script>
<link rel="stylesheet" href="/layui/css/layui.css">
<link rel="stylesheet" href="/emoji/lib/css/jquery.mCustomScrollbar.min.css"/>
<link rel="stylesheet" href="/emoji/dist/css/jquery.emoji.css"/>
<script src="/emoji/lib/script/jquery.mCustomScrollbar.min.js"></script>
<script src="/emoji/src/js/jquery.emoji.js"></script>
<script src="/js/jquery.serializejson.min.js"></script>
<script src="/layui/layui.js"></script>

<style>
    .layui-table-cell .layui-form-checkbox[lay-skin="primary"]{
        top: 50%;
        transform: translateY(-50%);
    }
</style>