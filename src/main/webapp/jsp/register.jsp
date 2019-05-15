<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/core.jsp"%>
<html>
<head>
    <title>注册页面</title>
    <style>
        html,body{
            padding: 0px;
            margin: 0px auto;

        }
        html{
            height: 1020px;
            overflow: hidden;
        }
        body{
            width: 1920px;
            background: url("${ctx}/images/sys/liebiao_bg.png") no-repeat center ;
            /*background-size: 80%;*/
        }
        input{
            border: #e9e9e9;
            border-radius: 2px;
            height: 30px;
            width: 150px;
            outline: 0px;
            margin-top: 15px;
            color: white;
            background: rgba(255,255,255,0);
        }
        span{
            color: white;
            cursor: pointer;
        }
        ul,li{
            margin:0px;
            padding:0px;
            list-style-type: none;
        }
        .loginMenu{
            line-height: 50px;
            width: 680px;

            position: absolute;
            top: 20px;
            left: 20px;
        }
        .loginMenu li{
            margin-bottom: 15px;
            height: 80px;
            position: relative;
        }
        .underLine{
            border-bottom:1px solid #999999;
            width: 680px;
        }
        .hidipt{
            border:0px !important;
            outline: 0px !important;
            width: 400px;
            height: 50px;
            color: white;
        }
        #borderbox{
            position: relative;
            width: 710px;
            height: 420px;
            background: url("${ctx}/images/sys/kuang.png");

        }
        .getcCode{
            float: right;
            display: inline-block;
            height: 50px;
            margin-right: 20px;
            background-color: cornflowerblue;
        }
        .wxLogin{
            float: right;
            margin-right: 20px;
        }
        .centerBtn{
            margin-left: 35%;
        }
        #goBack{
            position: fixed;
            top:20px;
            right: 20px;
            display: inline-block;
            height: 30px;
            width: 50px;
            background-color: lightblue;
        }
        canvas {
           /* position: absolute;*/
            top: 0;
            bottom: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(255,255,255,0);
            overflow: hidden;
         /*   pointer-events: none;*/
     /*       z-index: 1000;*/
        }
        #lgFm,#jobFm{
            position: absolute;
            top:100px;
            left: 50%;
            margin-left: -300px;
            z-index: 100;
            pointer-events:none;
        }
    </style>
    <script>
        $(document).ready(function () {
            /*$("#jobMsg").hide();*/
            $("#showBtn").click(function () {
                $("#loginMsg").hide();
                $("#jobMsg").show();
                $("#lgFm").submit();
            });
            $("#submitBtn").click(function () {
                $("#jobFm").submit();
            });
        });
    </script>
</head>
<body>
<canvas>
</canvas>
<c:if test="${empty rtUser.tel}">
<form id="lgFm" action="${ctx}/sys/login.do">

    <div id="loginMsg" style="margin:150px auto;">
        <div id="borderbox">
            <ul class="loginMenu">
                <li class="underLine">
                    <input class="hidipt" name="tel" placeholder="电话号码" style="pointer-events:auto;">
                </li>
                <li class="underLine">

                    <input class="hidipt" name="code" placeholder="验证码" style="pointer-events:auto;">
                    <span class="getcCode">获取验证码</span></li>
                <li><span>密码登录</span><span class="wxLogin">微信登录</span></li>
                <li><input id="showBtn" class="centerBtn" type="button" style="pointer-events:auto;" value="登录"></li>
            </ul>
        </div>
    </div>
</form>
</c:if>
<c:if test="${not empty rtUser.tel}">
    <form id="jobFm" action="${ctx}/sys/setName.do">
        <div  id="jobMsg" style="margin:150px auto;display: none;">
            <a  id="goBack" href="${ctx}/index.jsp" style="pointer-events:auto;">返回</a>
            <ul>
                <input type="hidden" name="id" value="${rtUser.id}">
                <li><input name="rtUserName" placeholder="用户姓名" style="pointer-events:auto;"></li>
                <li><input name="companyName" placeholder="公司名字" style="pointer-events:auto;"></li>
                <li><input name="department" placeholder="所在部门" style="pointer-events:auto;"></li>
                <li><input name="jobName" placeholder="职位" style="pointer-events:auto;"></li>
                <li><input id="submitBtn" type="button" value="提交信息" style="pointer-events:auto;"></li>
            </ul>
        </div>
    </form>
</c:if>


<script>
    (function() {

        var canvas, ctx, circ, nodes, mouse, SENSITIVITY, SIBLINGS_LIMIT, DENSITY, NODES_QTY, ANCHOR_LENGTH, MOUSE_RADIUS;

        // how close next node must be to activate connection (in px)
        // shorter distance == better connection (line width)
        SENSITIVITY = 100;
        // note that siblings limit is not 'accurate' as the node can actually have more connections than this value that's because the node accepts sibling nodes with no regard to their current connections this is acceptable because potential fix would not result in significant visual difference
        // more siblings == bigger node
        SIBLINGS_LIMIT = 10;
        // default node margin
        DENSITY = 50;
        // total number of nodes used (incremented after creation)
        NODES_QTY = 0;
        // avoid nodes spreading
        ANCHOR_LENGTH = 20;
        // highlight radius
        MOUSE_RADIUS = 200;

        circ = 2 * Math.PI;
        nodes = [];

        canvas = document.querySelector('canvas');
        resizeWindow();
        mouse = {
            x: canvas.width / 2,
            y: canvas.height / 2
        };
        ctx = canvas.getContext('2d');
        if (!ctx) {
            alert("Ooops! Your browser does not support canvas :'(");
        }

        function Node(x, y) {
            this.anchorX = x;
            this.anchorY = y;
            this.x = Math.random() * (x - (x - ANCHOR_LENGTH)) + (x - ANCHOR_LENGTH);
            this.y = Math.random() * (y - (y - ANCHOR_LENGTH)) + (y - ANCHOR_LENGTH);
            this.vx = Math.random() * 2 - 1;
            this.vy = Math.random() * 2 - 1;
            this.energy = Math.random() * 100;
            this.radius = Math.random();
            this.siblings = [];
            this.brightness = 0;
        }

        Node.prototype.drawNode = function() {
            var color = "rgba(255, 255, 255, " + this.brightness + ")";
            ctx.beginPath();
            ctx.arc(this.x, this.y, 2 * this.radius + 2 * this.siblings.length / SIBLINGS_LIMIT, 0, circ);
            ctx.fillStyle = color;
            ctx.fill();
        };

        Node.prototype.drawConnections = function() {
            for (var i = 0; i < this.siblings.length; i++) {
                var color = "rgba(255, 255, 255, " + this.brightness + ")";
                ctx.beginPath();
                ctx.moveTo(this.x, this.y);
                ctx.lineTo(this.siblings[i].x, this.siblings[i].y);
                ctx.lineWidth = 1 - calcDistance(this, this.siblings[i]) / SENSITIVITY;
                ctx.strokeStyle = color;
                ctx.stroke();
            }
        };

        Node.prototype.moveNode = function() {
            this.energy -= 2;
            if (this.energy < 1) {
                this.energy = Math.random() * 100;
                if (this.x - this.anchorX < -ANCHOR_LENGTH) {
                    this.vx = Math.random() * 2;
                } else if (this.x - this.anchorX > ANCHOR_LENGTH) {
                    this.vx = Math.random() * -2;
                } else {
                    this.vx = Math.random() * 4 - 2;
                }
                if (this.y - this.anchorY < -ANCHOR_LENGTH) {
                    this.vy = Math.random() * 2;
                } else if (this.y - this.anchorY > ANCHOR_LENGTH) {
                    this.vy = Math.random() * -2;
                } else {
                    this.vy = Math.random() * 4 - 2;
                }
            }
            this.x += this.vx * this.energy / 100;
            this.y += this.vy * this.energy / 100;
        };

        function initNodes() {
            ctx.clearRect(0, 0, canvas.width, canvas.height);
            nodes = [];
            for (var i = DENSITY; i < canvas.width; i += DENSITY) {
                for (var j = DENSITY; j < canvas.height; j += DENSITY) {
                    nodes.push(new Node(i, j));
                    NODES_QTY++;
                }
            }
        }

        function calcDistance(node1, node2) {
            return Math.sqrt(Math.pow(node1.x - node2.x, 2) + (Math.pow(node1.y - node2.y, 2)));
        }

        function findSiblings() {
            var node1, node2, distance;
            for (var i = 0; i < NODES_QTY; i++) {
                node1 = nodes[i];
                node1.siblings = [];
                for (var j = 0; j < NODES_QTY; j++) {
                    node2 = nodes[j];
                    if (node1 !== node2) {
                        distance = calcDistance(node1, node2);
                        if (distance < SENSITIVITY) {
                            if (node1.siblings.length < SIBLINGS_LIMIT) {
                                node1.siblings.push(node2);
                            } else {
                                var node_sibling_distance = 0;
                                var max_distance = 0;
                                var s;
                                for (var k = 0; k < SIBLINGS_LIMIT; k++) {
                                    node_sibling_distance = calcDistance(node1, node1.siblings[k]);
                                    if (node_sibling_distance > max_distance) {
                                        max_distance = node_sibling_distance;
                                        s = k;
                                    }
                                }
                                if (distance < max_distance) {
                                    node1.siblings.splice(s, 1);
                                    node1.siblings.push(node2);
                                }
                            }
                        }
                    }
                }
            }
        }

        function redrawScene() {
            resizeWindow();
            ctx.clearRect(0, 0, canvas.width, canvas.height);
            findSiblings();
            var i, node, distance;
            for (i = 0; i < NODES_QTY; i++) {
                node = nodes[i];
                distance = calcDistance({
                    x: mouse.x,
                    y: mouse.y
                }, node);
                if (distance < MOUSE_RADIUS) {
                    node.brightness = 1 - distance / MOUSE_RADIUS;
                } else {
                    node.brightness = 0;
                }
            }
            for (i = 0; i < NODES_QTY; i++) {
                node = nodes[i];
                if (node.brightness) {
                    node.drawNode();
                    node.drawConnections();
                }
                node.moveNode();
            }
            requestAnimationFrame(redrawScene);
        }

        function initHandlers() {
            document.addEventListener('resize', resizeWindow, false);
            canvas.addEventListener('mousemove', mousemoveHandler, false);
        }

        function resizeWindow() {
            canvas.width = window.innerWidth;
            canvas.height = window.innerHeight;
        }

        function mousemoveHandler(e) {
            mouse.x = e.clientX;
            mouse.y = e.clientY;
        }

        initHandlers();
        initNodes();
        redrawScene();

    })();</script>
</body>
</html>
