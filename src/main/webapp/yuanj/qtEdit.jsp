<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/core.jsp"%>
<html>
<head>
    <title>修改题目</title>
    <script>
        layui.use(["form","layer"], function () {
            var form = layui.form;
            var layer = layui.layer;
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

            //表单初始赋值
            form.val('myform', {
                "qtbType": "${questionBank.qtbType}"
                , "qtbSub": "${questionBank.qtbSub}"
                , "qtbContent": "${questionBank.qtbContent}"
                /*,"interest": 1 下拉框用的value*/
                /*  ,"like[write]": true //复选框选中状态*/
                , "qtbResult": "${questionBank.qtbResult}"
                , "answer1":"border-left-width:<值>"
                , "answer2":"border-top-width:<值>"
                , "answer3":"border-left:<值>"
                , "answer4":"border-top-width：<值>"

            });

            //监听提交
            form.on('submit(tj)', function (data) {
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
                    parent.layer.msg("操作成功", {icon: 6});
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
    <form lay-filter="myform" class="layui-form" action="/insert.do" method="get">
        <input type="hidden" name="qtbId" value="${questionBank.qtbId}">
        <input type="hidden" name="method" value="update">
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
                    <input name="answer1" class="layui-input" type="text" placeholder="请输入选项内容" autocomplete="off" lay-verify="title">
                    <input name="answer2" class="layui-input" type="text" placeholder="请输入选项内容" autocomplete="off" lay-verify="title">
                    <input name="answer3" class="layui-input" type="text" placeholder="请输入选项内容" autocomplete="off" lay-verify="title">
                    <input name="answer4" class="layui-input" type="text" placeholder="请输入选项内容" autocomplete="off" lay-verify="title">
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
                <button class="layui-btn" id="submit" lay-submit="" lay-filter="tj">提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>
