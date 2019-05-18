<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/core.jsp"%>
<html>
<head>
    <title>新建题目</title>
    <script>
        var table;
        layui.use(["form","layer"], function () {
            var form = layui.form;
            var layer = layui.layer;
            <c:if test="${not empty sessionScope.msg}">
                layer.msg("${sessionScope.msg}",{icon:6});
            </c:if>
            <c:remove var="msg" scope="session"></c:remove>
            form.on('select(test)', function(data){
                if((data.value) == "主观" || (data.value) == "判断"){
                    $("input[name = answer]").hide();
                } else if((data.value) == "多选" || (data.value) == "单选"){
                    $("input[name = answer]").show();
                }
            });

            $("#addinput").click(function () {
                $("#inputs").append("<input name=answer class=layui-input placeholder=请输入选项内容 autocomplete=off lay-verify=title>")
            });
            $("#delinput").click(function () {
                $("#inputs input:last-child").remove();
            });

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
                    parent.layer.msg("增加成功", {icon: 6});
                }
                var index = parent.layer.getFrameIndex(window.name);
                parent.layer.close(index);
            });

        });
    </script>
</head>
<body>
<div>
    <br>
    <form class="layui-form" action="/insert.do" method="get">
        <input type="hidden" name="method" value="insert">
        <div class="layui-inline">
            <label class="layui-form-label">题目类型:</label>
        </div>
        <div class="layui-form layui-inline">
            <select name="qtbType" lay-search lay-filter="test">
                <option value="">--请选择--</option>
                <option value="单选">单选题</option>
                <option value="多选">多选题</option>
                <option value="判断">判断题</option>
                <option value="主观">主观题</option>
            </select>
        </div>
            <br><br>
        <div class="layui-inline">
            <label class="layui-form-label">科目:</label>
        </div>
        <div class="layui-form layui-inline">
            <select name="qtbSub" lay-search>
                <option value="">--请选择--</option>
                <option value="CSS">CSS</option>
                <option value="HTML">HTML</option>
                <option value="JS">JS</option>
                <option value="JQUERY">JQUERY</option>
                <option value="JAVA">JAVA</option>
                <option value="AJAX">AJAX</option>
                <option value="SQL">SQL</option>
            </select>
        </div>
            <br><br>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">题目内容：</label>
            <div class="layui-input-block" style="width: 800px">
                <textarea name="qtbContent" placeholder="请输入内容" class="layui-textarea"></textarea>
            </div>
        </div>

        <div id="change">

            <input type="button" class="layui-btn layui-btn-xs" id="addinput" style="margin-left: 110px;background-color: #33ABA0;color: white" value="增加选项"></input>
            <input type="button" class="layui-btn layui-btn-xs" id="delinput" style="background-color: #33ABA0;color: white" value="减少选项"></input><br><br>
            <div class="layui-form-item" style="width: 800px;">
                <div id="inputs" class="layui-input-block">
                    <input name="answer" class="layui-input" type="text" placeholder="请输入选项内容" autocomplete="off" lay-verify="title">
                    <input name="answer" class="layui-input" type="text" placeholder="请输入选项内容" autocomplete="off" lay-verify="title">
                    <input name="answer" class="layui-input" type="text" placeholder="请输入选项内容" autocomplete="off" lay-verify="title">
                    <input name="answer" class="layui-input" type="text" placeholder="请输入选项内容" autocomplete="off" lay-verify="title">
                </div>
            </div>
        </div>

        <div class="layui-form-item" >
            <label class="layui-form-label">题目答案：</label>
            <div class="layui-input-block" style="width: 200px">
                <input type="text" name="qtbResult" required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" id="submit" lay-submit="" lay-filter="formDemo">提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>
