<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>
<title>登录注册页</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="${ctx }/css/sign/bootstrap.min.css" />
<link rel="stylesheet" href="${ctx }/css/sign/matrix-login.css" />
<link rel="stylesheet" href="${ctx }/css/sign/font-awesome.css" />
<script type="text/javascript" src="${ctx }/static/login/js/jquery-1.5.1.min.js"></script>

 <style type="text/css">
   body{
   		background-image: url("${ctx }/img/4.jpg");
    }
      .cavs{
    	z-index:1;
    	position: fixed;
    	width:95%;
    	margin-left: 20px;
    	margin-right: 20px;
    }
  </style>
  <script>
  		//window.setTimeout(showfh,3000); 
  		var timer;
		function showfh(){
			fhi = 1;
			//关闭提示晃动屏幕
			timer = setInterval(xzfh2, 10); 
		};
		var current = 0;
		function xzfh(){
			current = (current)%360;
			document.body.style.transform = 'rotate('+current+'deg)';
			current ++;
			if(current>360){current = 0;}
		};
		var fhi = 1;
		var current2 = 1;
		function xzfh2(){
			if(fhi>50){
				document.body.style.transform = 'rotate(0deg)';
				clearInterval(timer);
				return;
			}
			current = (current2)%360;
			document.body.style.transform = 'rotate('+current+'deg)';
			current ++;
			if(current2 == 1){current2 = -1;}else{current2 = 1;}
			fhi++;
		};
	</script>

<script src="js/home/jquery-1.11.3.min.js"></script>
<script src="js/home/bootstrap.min.js"></script>
<script src="js/home/swiper.min.js"></script>
<script src="js/home/main.js"></script>
</head>
<body>
<jsp:include page="header.jsp" flush="true"></jsp:include>
	<div style="width:100%;text-align: center;margin: 0 auto;position: absolute; margin-top: 5%">
		<!--登录 -->
		<div id="windows1">
		<div id="loginbox" >
			<form action="${ctx }/user/loginController" method="post" name="loginForm" id="loginForm">
				<div class="control-group normal_text">
					<h3>
					
						<img src="${ctx }/img/logo.png" alt="Logo" />
						
					</h3>
					<span style="font-size:12px;color:red">${errormessage }</span>
				</div>
				
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
						
							<span class="add-on bg_lg">
							
							<i><img height="37" src="${ctx }/img/user.png" /></i>
							</span><input type="text" name="email" id="loginname" value="" placeholder="请输入邮箱 " />
						</div>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_ly">
							<i><img height="37" src="${ctx }/img/suo.png" /></i>
							</span><input type="password" name="password" id="password" placeholder="请输入密码" class="keypad" keypadMode="full" allowKeyboard="true" value=""/>
						</div>
					</div>
				</div>
				<div class="form-actions">
					<div style="width:86%;padding-left:8%;">

						<!-- div style="float: left;padding-top:2px;">
							<i><img src="img/yan.png" /></i>
						</div>				
						<div style="float: left;" class="codediv">
						<input type="text" name="code" id="code" class="login_code"
								style="height:16px; padding-top:4px;">
						</div>   
						
						<div style="float: left;">
							<i><img style="height:22px;" id="codeImg" alt="点击更换" title="点击更换" src="" /></i>
						</div-->
						
						<span class="pull-right" style="width:13.55%;height:30.1px;background-color: green;color:white;border-color:green;font-size: 1em;"><a href="javascript:changepage(1);" style="color: white;">注册</a></span>
						<span class="pull-right"><a onclick="severCheck();"  id="to-recover"><input style="width:55px;height:30.1px;background-color: green;color:white;opacity: 0.65;border-color:green;" type="submit" value="登录"></a></span>
					</div>
				</div>
			</form>
			
		</div>
		</div>
		<!-- 注册 -->
		<div id="windows2" style="display: none;">
		<div id="loginbox">
			<form action="${ctx }/user/registController" method="post" name="loginForm" id="loginForm">
				<div class="control-group normal_text">
					<h3>
						<img src="${ctx }/img/logo.png" alt="Logo" />
					</h3>
				</div>
				
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_lg">
							<i>用户</i>
							</span><input type="text" name="username" id="USERNAME" value="" placeholder="请输入用户名"/>
						</div>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_lg">
							<i>邮箱</i>
							</span><input type="text" name="email" id="EMAIL" value="" placeholder="请输入邮箱" />
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_ly">
							<i>密码</i>
							</span><input type="password" name="password" id="PASSWORD" placeholder="请输入密码" class="keypad" keypadMode="full" allowKeyboard="true" value=""/>
						</div>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_ly">
							<i>重输</i>
							</span><input type="password" name="chkpwd" id="chkpwd" placeholder="请重新输入密码" class="keypad" keypadMode="full" allowKeyboard="true" value=""/>
						</div>
					</div>
				</div>
				
				
				<div class="form-actions">
					<div style="width:86%;padding-left:8%;">
						<span class="pull-right" style="width:13.55%;height:30.1px; background-color: green;color:white;border-color:green;font-size: 15px;"><a href="javascript:changepage(2);"style="color: white;">取消</a></span>
						
						<span class="pull-right"><input style="width:55px;height:30.1px;background-color: green;color:white;opacity: 0.65;border-color:green" onclick="return rcheck()" type="submit" value="注册"> </span>					
					</div>
				</div>
			</form>
			
		</div>
		</div>
	</div>
	<script type="text/javascript">
		//服务器校验
		function severCheck(){
			if(check()){
				var loginname = $("#loginname").val();
				var password = $("#password").val();
				var code = loginname+","+password+","+$("#code").val();
				$.ajax({
					type: "POST",
					url: 'login_login',
			    	data: {KEYDATA:code,tm:new Date().getTime()},
					dataType:'json',
					cache: false,
					success: function(data){
						if("success" == data.result){
							saveCookie();
							
						}else if("usererror" == data.result){
							$("#loginname").tips({
								side : 1,
								msg : "用户名或密码有误",
								bg : '#FF5080',
								time : 15
							});
							showfh();
							$("#loginname").focus();
						}else if("codeerror" == data.result){
							$("#code").tips({
								side : 1,
								msg : "验证码输入有误",
								bg : '#FF5080',
								time : 15
							});
							showfh();
							$("#code").focus();
						}else{
							$("#loginname").tips({
								side : 1,
								msg : "缺少参数",
								bg : '#FF5080',
								time : 15
							});
							showfh();
							$("#loginname").focus();
						}
					}
				});
			}
		}
	
		$(document).ready(function() {
			changeCode1();
			$("#codeImg").bind("click", changeCode1);
			$("#zcodeImg").bind("click", changeCode2);
		});

		$(document).keyup(function(event) {
			if (event.keyCode == 13) {
				$("#to-recover").trigger("click");
			}
		});

		function genTimestamp() {
			var time = new Date();
			return time.getTime();
		}

		function changeCode1() {
			$("#codeImg").attr("src", "code.do?t=" + genTimestamp());
		}
		function changeCode2() {
			$("#zcodeImg").attr("src", "code.do?t=" + genTimestamp());
		}

		//客户端校验
		function check() {

			if ($("#loginname").val() == "") {
				$("#loginname").tips({
					side : 2,
					msg : '用户名不得为空',
					bg : '#AE81FF',
					time : 3
				});
				showfh();
				$("#loginname").focus();
				return false;
			} else {
				$("#loginname").val(jQuery.trim($('#loginname').val()));
			}
			if ($("#password").val() == "") {
				$("#password").tips({
					side : 2,
					msg : '密码不得为空',
					bg : '#AE81FF',
					time : 3
				});
				showfh();
				$("#password").focus();
				return false;
			}
			if ($("#code").val() == "") {
				$("#code").tips({
					side : 1,
					msg : '验证码不得为空',
					bg : '#AE81FF',
					time : 3
				});
				showfh();
				$("#code").focus();
				return false;
			}
			$("#loginbox").tips({
				side : 1,
				msg : '正在登录，请稍后 ...',
				bg : '#68B500',
				time : 10
			});

			return true;
		}

		function savePaw() {
			if (!$("#saveid").attr("checked")) {
				$.cookie('loginname', '', {
					expires : -1
				});
				$.cookie('password', '', {
					expires : -1
				});
				$("#loginname").val('');
				$("#password").val('');
			}
		}

		function saveCookie() {
			if ($("#saveid").attr("checked")) {
				$.cookie('loginname', $("#loginname").val(), {
					expires : 7
				});
				$.cookie('password', $("#password").val(), {
					expires : 7
				});
			}
		}
		
		jQuery(function() {
			var loginname = $.cookie('loginname');
			var password = $.cookie('password');
			if (typeof(loginname) != "undefined"
					&& typeof(password) != "undefined") {
				$("#loginname").val(loginname);
				$("#password").val(password);
				$("#saveid").attr("checked", true);
				$("#code").focus();
			}
		});
		
		//登录注册页面切换
		function changepage(value) {
			if(value == 1){
				$("#windows1").hide();
				$("#windows2").show();
				changeCode2();
			}else{
				$("#windows2").hide();
				$("#windows1").show();
				changeCode1();
			}
		}
		
	//注册
	function rcheck(){
		if($("#USERNAME").val()==""){
			$("#USERNAME").tips({
				side:3,
	            msg:'输入用户名',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#USERNAME").focus();
			$("#USERNAME").val('');
			return false;
		}else{
			$("#USERNAME").val(jQuery.trim($('#USERNAME').val()));
		}
		if($("#PASSWORD").val()==""){
			$("#PASSWORD").tips({
				side:3,
	            msg:'输入密码 ',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PASSWORD").focus();
			return false;
		}
		if($("#PASSWORD").val()!=$("#chkpwd").val()){
			$("#chkpwd").tips({
				side:3,
	            msg:'两次密码不相同',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#chkpwd").focus();
			console.log("false");
			return false;
		}
		if($("#name").val()==""){
			$("#name").tips({
				side:3,
	            msg:'输入名字',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#name").focus();
			return false;
		}
		if($("#EMAIL").val()==""){
			$("#EMAIL").tips({
				side:3,
	            msg:'输入邮箱',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#EMAIL").focus();
			return false;
		}else if(!ismail($("#EMAIL").val())){
			$("#EMAIL").tips({
				side:3,
	            msg:'邮箱格式不正确',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#EMAIL").focus();
			return false;
		}
		if ($("#rcode").val() == "") {
			$("#rcode").tips({
				side : 1,
				msg : '验证码不得为空',
				bg : '#AE81FF',
				time : 3
			});
			$("#rcode").focus();
			return false;
		}
		return true;
	}
	
	
	
	//邮箱格式校验
	function ismail(mail){
		return(new RegExp(/^(?:[a-zA-Z0-9]+[_\-\+\.]?)*[a-zA-Z0-9]+@(?:([a-zA-Z0-9]+[_\-]?)*[a-zA-Z0-9]+\.)+([a-zA-Z]{2,})+$/).test(mail));
	}
	//js  日期格式
	</script>
	<script src="${ctx }/js/sign/bootstrap.min.js"></script>
	<script src="${ctx }/js/sign/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="${ctx }/js/sign/jQuery.md5.js"></script>
	<script type="text/javascript" src="${ctx }/js/sign/jquery.tips.js"></script>
</body>

</html>