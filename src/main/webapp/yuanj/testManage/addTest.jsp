<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/core.jsp"%>
<html>
<head>
    <title>建立试卷</title>
    <style>
        input{
            height: 30px !important;
        }
    </style>
    <script>
        layui.use(["laydate","form","layer"], function () {
            var laydate = layui.laydate;
            var form = layui.form;
            laydate.render({
                elem: '#startTimeStr',
                type: 'datetime'
            });
            laydate.render({
                elem: '#endTimeStr',
                type: 'datetime'
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
                    parent.layer.msg("操作成功", {icon: 6});
                }
                var index = parent.layer.getFrameIndex(window.name);
                parent.layer.close(index);
            });

        });


    </script>
</head>
<body>
<div style="margin-left:120px;">
    <div style="color: red; font-family: '楷体'; font-weight: bold">
        <span style="font-size: 22px">出卷前,请您注意:</span><br>
        <span style="font-size: 18px">
            1、试卷名不得超过20个字符<br>
            2、除最早开考与最晚开考试卷两场，其他均必须先择或填写，不能为空<br>
            3、最早开考时间、最晚开考时间未选择时，会使用默认时间<br>
        </span>
    </div>
    <br><br>
    <form class="layui-form" action="/test.do" method="post">
        <input type="hidden" name="userName" value="${sessionScope.user.username}">
        <input type="hidden" name="method" value="init">
        <div style="float: left">
            <div class="layui-form-item">
                <label class="layui-form-label">试卷名称：</label>
                <div class="layui-input-block" style="width: 190px">
                    <input type="text" name="testName" required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">考试时间：</label>
                <div class="layui-input-inline" style="width: 40px">
                    <input  type="text" name="testDate" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">分钟</div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label" style="width: 90px">最早开考时间: </label>
                <div class="layui-inline">
                    <input readonly id="startTimeStr" name="testStardate" placeholder="" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="height: 250px">
                <label class="layui-form-label" style="width: 90px">最晚开考时间: </label>
                <div class="layui-inline">
                    <input readonly id="endTimeStr" name="testEnddate" placeholder="" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div style="float: left">
            <div class="layui-form-item">
                <label class="layui-form-label">单选题：</label>
                <div class="layui-input-inline" style="width: 30px">
                    <input  type="text" name="testRanum" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">题，每题</div>
                <div class="layui-input-inline" style="width: 30px">
                    <input  type="text" name="raGrade" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">分</div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">多选题：</label>
                <div class="layui-input-inline" style="width: 30px">
                    <input  type="text" name="testChnum" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">题，每题</div>
                <div class="layui-input-inline" style="width: 30px">
                    <input  type="text" name="chGrade" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">分</div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">判断题：</label>
                <div class="layui-input-inline" style="width: 30px">
                    <input  type="text" name="testJunum" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">题，每题</div>
                <div class="layui-input-inline" style="width: 30px">
                    <input  type="text" name="juGrade" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">分</div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">主观题：</label>
                <div class="layui-input-inline" style="width: 30px">
                    <input  type="text" name="testSubnum" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">题，每题</div>
                <div class="layui-input-inline" style="width: 30px">
                    <input  type="text" name="subGrade" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">分</div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block" style="margin-left: -70px;width: 200px;">
                    <button id="submit" class="layui-btn" lay-submit lay-filter="formDemo">创建</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </div>

    </form>
</div>
</body>
</html>
