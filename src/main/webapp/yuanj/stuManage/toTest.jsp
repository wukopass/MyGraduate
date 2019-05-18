<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/core.jsp" %>
<html>
<head>
    <title>试卷</title>
    <script>

        layui.use(["laydate","form","layer"], function () {
            var laydate = layui.laydate;
            var form = layui.form;

            //监听提交
            form.on('submit(formDemo)', function (data) {
                //  提交
                parent.table.reload('pageTable', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                });
                return true;
            });

            $("#submit").click(function(){
                parent.table.reload('pageTable', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                });
                parent.transfer(2);
                if(parent.i==2){
                    parent.layer.msg("提交成功", {icon: 6});
                    parent.$("#toTest").css("style('color:red') disabled");
                    parent.$("#history").css("style('color:green')");
                }
                var index = parent.layer.getFrameIndex(window.name);
                parent.layer.close(index);
            });

        });
    </script>
</head>
<body>
<br>
<form action="" method="post">
<div style="margin: auto;padding: 0px;width: 700px">
    <h1 style="text-align: center;font-family: 楷体;font-weight: bold;">${test.testName}</h1>
    <br>
    <div style="float: right;width: 500px"><span>命题人：${test.userName}&nbsp;&nbsp;&nbsp;考试时间：${test.testDate}分钟&nbsp;&nbsp;&nbsp;试卷总分：${test.testVal}分</span></div>
    <% int  i = 1;%>
    <c:forEach items="${creatTests}" varStatus="i" var="creattests">
        <br>
        <div style="width: 700px;">
            <br>
            <div style="font-size: 18px;"><%=i++ %>、${creattests.qtbContent}</div>
            <c:forEach items="${qtbOptions}" varStatus="i" var="qtboptions">
                <c:if test="${creattests.qtbId == qtboptions.qtb_id and creattests.qtbType == '单选' }">
                    <br>
                    <div id = "danx">
                        <input type="radio" name="dxt<%=i%>"> ${qtboptions.opt_option}<br>
                    </div>
                </c:if>
                <c:if test="${creattests.qtbId == qtboptions.qtb_id and creattests.qtbType == '多选' }">
                    <br>
                    <div id = "danx">
                        <input type="checkbox" name="dxt<%=i%>"> ${qtboptions.opt_option}<br>
                    </div>
                </c:if>
            </c:forEach>
            <c:if test="${creattests.qtbType == '判断' }">
                <br>
                <div id = "danx">
                    <input type="radio" name="pdt<%=i%>"> 是<br><br>
                    <input type="radio" name="pdt<%=i%>"> 否
                </div>
            </c:if>
            <c:if test="${creattests.qtbType == '主观' }">
                <br>
                <div id = "danx">
                    <textarea name="zgt" id="" cols="80" rows="10"></textarea><br>
                </div>
            </c:if>
        </div>
    </c:forEach>
    <br><br><br>
</div>
    <div class="layui-form-item" style="margin-left: 400px">
        <div class="layui-input-block">
            <button class="layui-btn" id="submit" lay-submit="" lay-filter="formDemo">提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
</body>
</html>
