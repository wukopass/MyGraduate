<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/core.jsp"%>
<html>
<head>
    <title>Title</title>
    <script>
        $(document).ready(function () {
            alert(${msg});
            $(".all_box").hide();
            $(".bind").hide();
            var size=$("input[name=pageSize]").val();

            $("select[name = pageSize] option").each(function (i,o) {
                if($(this).val()==size){
                    $(this).attr("selected",true);
                }
            });
           $("select[name = pageSize]").change(function () {
              var num = $(this).val();
              $("input[name = pageSize]").val(num);
              $("#queryFm").submit();
           });
           $("a[name = show]").each(function (i,o) {
            $(this).click(function () {
                $(".all_box").show();
                $(".bind").show();
                $.get("/sys/real.do",{id:$(this).attr("num")},function (r) {
                    $("input[name = id]").val(r.id);
                    $("input[name = realName]").val(r.realName);
                    $("input[name = isChecking]").val(r.isChecking);
                    $("input[name = identity]").val(r.identity);
                    var img1 = r.frontCardImg;
                    var img2 = r.backCardImg;
                    var img3 = r.handCardImg;
                    var str1 = "${ctx}/imgGet.do?fileName="+img1;
                    var str2 = "${ctx}/imgGet.do?fileName="+img2;
                    var str3 = "${ctx}/imgGet.do?fileName="+img3;
                    $("#frontImg").src = str1;
                    $("#backImg").src = str2;
                    $("#handImg").src = str3;
                },"json");

            });
            $("input[name=closeBtn]").click(function () {
                $(".all_box").hide();
                $(".bind").hide();
            });
            $("#passBtn").click(function () {
                $("input[name = isChecking]").val(1);
                $("#realMsg").submit();
            });
            $("#unPassBtn").click(function () {
                $("input[name = isChecking]").val(0);
                $("#realMsg").submit();
            });
           });
            $("[name=deleteOne]").each(function (i,o) {
            $(this).click(function () {
                $.get("/sys/delete.do",{id:$(this).attr("num"),isEffective:1},function (r) {
                    //Ajax夭折
                    $("#queryFm").submit();
                    $(r.beans).each(function (i,o1) {
                            o1.each(function (i2,o2){
                                /*var msgChecking ;
                                var isCertify;
                                var isChecking;
                                var opration;
                                if(o2.rtUserEx.msgChecking == '1'){
                                    msgChecking = "用户信息已确认";
                                }else {
                                    msgChecking = "用户信息未确认";
                                }
                                if(o2.rtUserEx.isChecking == '1'){
                                    isChecking = "实名已审核";
                                }else {
                                    isChecking = "实名待审核";
                                }
                                if(o2.rtUserEx.isCertify == '1'){
                                    isCertify = "实名认证已提交"
                                    opration = "<a id=\"show\" name=\"relMsg\" href=\"${ctx}/sys/real.do?id="+o2.id+"\">真实身份信息</a>"
                                }else{
                                    isCertify = "实名认证未提交";
                                    isChecking = "暂未实名";
                                }
                                alert(isChecking);
                                alert(isCertify);
                                alert(msgChecking);
                                var op = "<a num=\"${rtUser.id}\" href=\"${ctx}/sys/getOne.do?id="+o2.id+"\">修改</a>\n" +
                                    "                        <a id=\"deleteOne\" num=\""+o2.id+"\" href=\"javascript:;\">删除</a>";
                                var str = "<tr>"+"<td>"+o2.rtUserName+"</td>"+
                                    "<td>"+o2.rtPassword+"</td>" +
                                    "<td>"+o2.companyName+ "</td>" +
                                    "<td> <img src=\"${ctx}/imgGet.do?fileName="+o2.rtfaceimg+"\"></td>"+
                                        "<td width=\"150\">"+o2.mail+"</td>"+
                                        "<td>"+o2.rtRole.rtRoleName+"</td>"+
                                        "<td>"+ msgChecking +"</td>"+
                                        "<td>"+isCertify+"</td>"+
                                        "<td>"+isChecking+"</td>"+
                                        "<td>"+opration+op+"</td>"+
                                        "<td>"+
                                    "</tr>";
                                $("#tbody").append(str);*/
                            })
                    })
                },"json");
                location.reload();
            });
        });
        });
    </script>
    <style>
        .tal{
            background-color: black;
            padding: 0px;
            border: 0.5px;
            margin: auto;
        }
        th,td{
            background-color: white;
        }
        .bind{
            border:1px solid yellow;
            position: absolute;
            width: 700px;
            height: 400px;
            top: 100px;
            left: 300px;
            background-color: white;
            margin-top: 10px;
            margin-left:25px ;
            z-index: 9;
        }
        .all_box{
            position: absolute;
            top:0px;
            left: 0px;
            width: 100%;
            height: 100%;
            opacity: 0.8;
            background-color: gray;
            z-index: 8;
        }
    </style>
</head>
<body>
    <div style="margin: 150px 0 0 200px;width: 1000px">
        <form id="queryFm" action="${ctx}/sys/query.do">
            <input type="hidden" name="pageSize" value="${page.pageSize}">
            姓名：<input name="rtUserName">
            电话号码：<input name="tel">
             公司名:<input name="companyName">
            角色：<select name="rtRole.rtRoleName">
                <option value="">请选择</option>
            <c:forEach var="role" items="${rtRoles}">
                <option value="${role.id}">${role.rtRoleName}</option>
            </c:forEach>
        </select>
            <input type="submit" value="提交">
        </form>
        <table class="tal">
            <thead>
            <tr>
                <td>用户名</td>
                <td>密码</td>
                <td>电话号码</td>
                <td>所在公司</td>
                <td>头像</td>
                <td>邮箱</td>
                <td>角色名</td>
                <td>账号审核状态</td>
                <td>用户实名认证</td>
                <td>实名审核状态</td>
                <td>操作</td>
            </tr>
            </thead>
            <tbody id="tbody">
            <c:forEach  var="rtUser" items="${page.beans}">
                <tr>
                    <td>${rtUser.rtUserName}</td>
                    <td>${rtUser.rtPassword}</td>
                    <td>${rtUser.tel}</td>
                    <td>${rtUser.companyName}</td>
                    <td >
                        <img onerror="this.src='${ctx}/images/zhuzi/grzx.png'" src="${ctx}/imgGet.do?fileName=${rtUser.rtfaceimg}"alt="" width="40" height="25">
                    </td>
                    <td width="150">${rtUser.mail}</td>
                    <td >${rtUser.rtRole.rtRoleName}</td>
                    <td>
                        <c:if test="${rtUser.rtUserEx.msgChecking  eq '49'}">
                            用户信息已确认
                        </c:if>
                        <c:if test="${rtUser.rtUserEx.msgChecking eq '48' || rtUser.rtUserEx.msgChecking eq null}">
                            用户信息未确认
                        </c:if>
                    </td>
                    <td>
                        <c:if test="${rtUser.realMsg.isCertify  eq '49'}">
                            已提交认证
                        </c:if>
                        <c:if test="${rtUser.realMsg.isCertify eq '48' || rtUser.realMsg.isCertify eq null}">
                            未提交认证
                        </c:if>
                    </td>
                    <td>
                        <c:if test="${rtUser.realMsg.isChecking  eq '49'}">
                            实名已审核
                        </c:if>
                        <c:if test="${rtUser.realMsg.isChecking  eq '48' || rtUser.realMsg.isChecking  eq null}">
                            实名待审核
                        </c:if>
                    </td>
                    <td width="150">
                        <c:if test="${rtUser.realMsg.isCertify  eq '49'}">
                            <a name="show" num="${rtUser.id}" href="javascript:;">真实身份信息</a>
                        </c:if>
                        <a num="${rtUser.id}" href="${ctx}/sys/getOne.do?id=${rtUser.id}">修改</a>
                        <a  href="/sys/delete.do?isEffective=1&id=${rtUser.id}">删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="11">
                        <a href="/sys/query.do?pageNum=1">首页</a>
                        <c:if test="${page.pageNum > 1}">
                            <a href="/sys/query.do?pageNum=${page.pageNum-1}">上一页</a>
                        </c:if>
                        <c:if test="${page.pageNum < page.pageSum}">
                            <a href="/sys/query.do?pageNum=${page.pageNum+1}">下一页</a>
                        </c:if>
                        <a href="${ctx}/sys/query.do?pageNum=${page.pageSum}">尾页</a>
                        每页显示<select name="pageSize">
                        <option value="">请选择</option>
                        <c:forEach var="count"  begin="1" end="10"  >
                            <option value="${count}">${count}</option>
                        </c:forEach>
                    </select>条,当前${page.pageNum}页,共${page.pageSum}页
                    </td>
                </tr>
            </tfoot>
        </table>
    <a href="${ctx}/index.jsp">返回用户界面</a>
    </div>
    <div class="all_box">

    </div>
<div id="hid_box" class="bind">
    <form id="realMsg" action="/sys/realMsg.do">
        <input type="hidden" name="id" value="">
        <input type="hidden" name="isChecking" value="">
        <label style="margin-left: 50px;margin-top: 20px">真实姓名:</label><input style="margin-top: 20px"  type="text" name="realName"><br>
        <label style="margin-left: 50px;margin-top: 20px">证件号码:</label><input style="margin-top: 20px" name="identity"><br>
        <input style="margin-left: 50px;margin-top: 20px;" id="passBtn" name="closeBtn" type="button" value="真实，通过">
        <input style="margin-left: 50px;margin-top: 20px" id="unPassBtn" name="closeBtn" type="button" value="有误，驳回">
    </form>

    正面:<img id="frontImg" src="" alt="">
    反面:<img id="backImg" src="" alt="">
    手持:<img id="handImg" src="" alt="">
</div>
</body>
</html>
