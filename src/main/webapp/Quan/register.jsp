<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/core.jsp"%>
<!DOCTYPE html>

<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>注册页面</title>

		<meta name="description" content="User login page" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="${ctx}/assets/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${ctx}/assets/font-awesome/4.2.0/css/font-awesome.min.css" />

		<!-- text fonts -->
		<link rel="stylesheet" href="${ctx}/assets/fonts/fonts.googleapis.com.css" />

		<!-- ace styles -->
		<link rel="stylesheet" href="${ctx}/assets/css/ace.min.css" />

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="assets/css/ace-part2.min.css" />
		<![endif]-->
		<link rel="stylesheet" href="${ctx}/assets/css/ace-rtl.min.css" />

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="${ctx}/assets/css/ace-ie.min.css" />
		<![endif]-->

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

		<!--[if lt IE 9]>
		<script src="${ctx}/assets/js/html5shiv.min.js"></script>
		<script src="${ctx}/assets/js/respond.min.js"></script>
		<![endif]-->
		<script>
            layui.use("layer",function(){
                <c:if test="${code == 4 }">
                layer.msg("用户名已经存在，请您更换一个!",{icon:2, anim:6});
                </c:if>
                <c:if test="${code == 5 }">
                layer.msg("该邮箱已经存在，请您更换一个!",{icon:2, anim:6});
                </c:if>
                <c:if test="${code == 2 }">
                layer.msg("注册成功!",{icon:1, anim:6});
                </c:if>
            });
            //登录用户名重复，密码被锁等警告
		 function registerCheck(){
             sub()
             var qian =  sub();
             //前端检查没问题检查后端
             if( qian = 1 ){
                 //提交表格
                  myAjax();
             }else{
                 layer.msg(data);
             }
		 }
		 function myAjax(){
		     $("#register").submit();
		 };

			//注册时的判断前台判断,5.17
            function sub(){
		        var success = 1;
                var op = $("#opassword").val();
                var np = $("#newpassword").val();
                var username = $("#username").val();
                var mail = $("#mail").val();
				if(username == ""){
                    layer.msg("输入的用户名不能为空");
				}
			    else if(op==""){
                    layer.msg("输入的密码不能为空");
				}
				else if(np==""){
                    layer.msg("请再次输入密码");
				} else  if(op!=np){
                    layer.msg("两次输入的密码不一致");
                } else if (mail == ""){
                    layer.msg("邮箱不能为空")
				}  else if(mail.split("@").length == 1 || mail.split(".").length == 1){
                    layer.msg("邮箱的格式不正确，必须包含@和.")
				} else{
				    return  success;
				}
            };
            function enable(){
                $("#registerBtn").attr("disabled",false);
			}
			function disable() {
				$("#registerBtn").attr("disabled",true);
            }
		</script>

	</head>

	<body class="login-layout light-login">
		<div class="main-container">
			<div class="main-content">
				<div class="row">
					<div class="col-sm-10 col-sm-offset-1">
						<div class="login-container">
							<div class="center">
								<h1>
									<span class="red"><img src="images/head_seecen.png"></span>
								</h1>
								<h4 class="blue" id="id-company-text">思诚科技有限公司<br></h4>
							</div>

							<div class="space-6"></div>

							<div class="position-relative">
								<div id="signup-box" class="signup-box widget-box visible no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header green lighter bigger">
												<i class="ace-icon fa fa-users blue"></i>
												用户注册
											</h4>

											<div class="space-6"></div>
											<p>填写信息: </p>

											<form id="register" name="register" method="post" action="/sys/register.do">
												<fieldset>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text"  id="username" name="username" class="form-control" placeholder="用户名" />
															<i class="ace-icon fa fa-user"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input  id="opassword" type="password"   name="password"    class="form-control" placeholder="密码" />
															<i class="ace-icon fa fa-lock"></i>
														</span>
													</label>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input id="newpassword" type="password"  name="confirmpassword" class="form-control" placeholder="确认密码"/>
															<i class="ace-icon fa fa-retweet"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input id="tel"   name="tel" class="form-control" placeholder="用户手机号"/>
															<i class="ace-icon fa fa-retweet"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input id="mail"   name="mail" class="form-control" placeholder="用户邮箱"/>
															<i class="ace-icon fa fa-retweet"></i>
														</span>
													</label>

													<label class="block" >
														<input onclick="if(this.checked) {enable()} else{disable()}" id="accept" type="checkbox" class="ace" />
														<span class="lbl">
															接受
															<a href="javascript:;">用户协议</a>
														</span>
													</label>
													
												<textarea  id=" textarea" style="height:100px;width:300px">
														这些条款可由思诚随时更新，且毋须另行通知。服务条款一旦发生变更, 思诚将在网页上公布修改内容。修改后的服务一旦在网页上公布即有效代替原来的服务条款。您可随时登陆思诚网站查阅最新版服务条款。用户如果不同意修改后的本协议的任何条款，可以主动取消已经获得的搜藏服务；如果用户继续选择享用则视为用户已经完全接受本协议及其修改。
													
												</textarea>
													<div class="space-24"></div>

													<div class="clearfix">
														<button type="reset" class="width-30 pull-left btn btn-sm">
															<i class="ace-icon fa fa-refresh"></i>
															<span class="bigger-110">重置</span>
														</button>

														<button type="button"   id="registerBtn" disabled="disabled" class="width-65 pull-right btn btn-sm btn-success" onclick="registerCheck();">


															<span class="bigger-110">注册</span>

															<i class="ace-icon fa fa-arrow-right icon-on-right"></i>
														</button>
													</div>
												</fieldset>
											</form>
										</div>

										<div class="toolbar center">
											<a href="/Quan/login.jsp" class="back-to-login-link">
												<i class="ace-icon fa fa-arrow-left"></i>
												返回登录
											</a>
										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.signup-box -->
							</div><!-- /.position-relative -->

							
						</div>
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div><!-- /.main-content -->
		</div><!-- /.main-container -->

		<!-- basic scripts -->

		<!--[if !IE]> -->
		<script src="${ctx}/assets/js/jquery.2.1.1.min.js"></script>

		<!-- <![endif]-->

		<!--[if IE]>
<script src="${ctx}/assets/js/jquery.1.11.1.min.js"></script>
<![endif]-->

		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='assets/js/jquery.min.js'>"+"<"+"/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='${ctx}/assets/js/jquery1x.min.js'>"+"<"+"/script>");
</script>
<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='${ctx}/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");

			
			
		</script>
	</body>
</html>
