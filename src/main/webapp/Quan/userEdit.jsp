<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/core.jsp" %>
<html>
<head>
    <title>用户编辑</title>
    <script>
        var layer;
        layui.use(['form', 'upload'], function () {
            var form = layui.form
                /*, layedit = layui.layedit
                , laydate = layui.laydate
                ,layer=layui.layer*/
                ,upload=layui.upload
                ,layer = layui.layer;

            <c:if test="${code == 2}">
            layer.msg("操作成功", {icon: 6});
            // 得到user界面
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
                ,"age":"${reqUser.age}"
                ,"class":"${reqUser.stuclass}"
                /*,"interest": 1 下拉框用的value*/
                /*  ,"like[write]": true //复选框选中状态*/
                 //开关状态
                , "gender": "${reqUser.gender}"
            })


            //点击上传头像,9,14 16:00新加
            var uploadInst=upload.render({
                elem:'#uploadBtn'
                ,accept:'images'
                ,auto:false
                ,size:1024*1024*2
                ,choose:function(obj){
                    obj.preview(function(index,file,result){
                        $("#faceImg").attr('src',result);
                        $(":hidden[name=face]").val(result);
                    });
                }

            });
        });
    </script>
</head>
<body>

<form lay-filter="myform" class="layui-form layui-form-pane" method="post" action="${ctx}/user.do">
    <input type="hidden" name="method" value="update">
    <input type="hidden" name="userId" value="${reqUser.userId}">
    <input type="hidden" name="face"   value="${reqUser.face}">

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input readonly name="username" autocomplete="off" class="layui-input">
            </div>
        </div>

    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">年龄</label>
            <div class="layui-input-block">
                <input name="age" autocomplete="off" class="layui-input">
            </div>
        </div>

    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">班级</label>
            <div class="layui-input-block">
                <input  name="class" autocomplete="off" class="layui-input">
            </div>
        </div>

    </div>

 <%--   <div class="layui-form-item" pane="">
        <label class="layui-form-label">是否有效</label>
        <div class="layui-input-block">
            <input value="1" lay-text="ON|OFF" type="checkbox" name="valid" lay-skin="switch" lay-filter="switchTest">
        </div>
    </div>--%>


    <div class="layui-form-item" pane="">
        <label class="layui-form-label">单选框</label>
        <div class="layui-input-block">
            <input type="radio" name="gender" value="1" title="男">
            <input type="radio" name="gender" value="0" title="女">
        </div>
    </div>

    <div class="layui-form-item" pane="">
        <label class="layui-form-label">角色</label>
        <div class="layui-input-block">
            <c:forEach var="role" items="${roles}" varStatus="i">
                <input type="checkbox" name="roles" title="${role.roleName}" value="${role.roleId}">
            </c:forEach>
            <script>
                <c:forEach var="myrole" items="${reqUser.roles}">
                $(":checkbox[value=${myrole.roleId}]").prop("checked", true);
                </c:forEach>
            </script>
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">头像</label>
        <div class="layui-input-block">
            <div class="layui-inline">
                <button type="button" class="layui-btn" id="uploadBtn">上传图片</button>
            </div>
            <div class="layui-inline">
                <img style="border-radius:50%; width:100px;height:100px;" onerror="this.src='${ctx}/images/default.ico'" src="${ctx}/user.do?method=initFace&face=${reqUser .face}" class="layui-upload-img" id="faceImg">
            </div>

        </div>
    </div>

    <div class="layui-form-item">
        <button class="layui-btn" lay-submit="" lay-filter="tj">提交</button>
    </div>
</form>

</body>
</html>
