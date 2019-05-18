<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/core.jsp" %>
<html>
<head>
    <title>用户编辑</title>
    <script>
        var layer;
        layui.use(['form', 'layedit', 'laydate','upload'], function () {
            var form = layui.form
                , layedit = layui.layedit
                , laydate = layui.laydate
                ,layer = layui.layer
                ,upload=layui.upload;

            <c:if test="${code == 2}">
            layer.msg("操作成功", {icon: 6});
            // 得到user界面,更改之后重新渲染
            var user = $("iframe[data-frameid=3]",top.document)[0].contentWindow;
            user.table.reload('pageTable');
            </c:if>
            //监听指定开关
            form.on('switch(switchTest)', function (data) {
                // layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
                //     offset: '6px'
                // })
                //layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)

                //alert(JSON.stringify(data));
            });

            //监听提交
            form.on('submit(tj)', function (data) {
                // layer.alert(JSON.stringify(data.field), {
                //     title: '最终的提交信息'
                // })
                return true;
            });
            //表单初始赋值
            form.val('myform', {
                "username": "${reqUser.username}" // "name": "value"
                , "age": "${reqUser.age}"
                ,"register":"${reqUser.timeStamp}"
                , "gender": "${reqUser.gender}"
            })
        });
    </script>
</head>
<body>

<form lay-filter="myform" class="layui-form layui-form-pane">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input readonly name="username" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
        <label class="layui-form-label">年龄</label>
        <div class="layui-input-inline">
            <input readonly lay-verify="required" type="text" name="age" autocomplete="off" class="layui-input">
        </div>
        </div>
    </div>

    <div class="layui-inline">
        <label class="layui-form-label">注册时间</label>
        <div class="layui-input-inline">
            <input readonly lay-verify="required" type="text" name="register" autocomplete="off" class="layui-input">
        </div>
    </div>
    
    <div class="layui-form-item" pane="">
        <label class="layui-form-label">单选框</label>
        <div class="layui-input-block">
            <input  type="radio" disabled name="gender" value="1" title="男">
            <input  type="radio" disabled name="gender" value="0" title="女">
        </div>
    </div>


    

    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">头像</label>
        <div class="layui-input-block">
            <div class="layui-inline">
                <img style="border-radius:50%;width:100px;height:100px;"
                     onerror="this.src='${ctx}/images/default.gif'"
                     src="${ctx}/chat.do?method=initFace&face=${reqUser.face}" class="layui-upload-img" id="faceImg">
            </div>
        </div>
    </div>
</form>

</body>
</html>
