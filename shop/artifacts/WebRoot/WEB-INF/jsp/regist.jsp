<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<title>用户注册</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="format-detection" content="telephone=no">
	<meta name="renderer" content="webkit">
	<meta http-equiv="Cache-Control" content="no-siteapp" />

	<link rel="stylesheet" href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.min.css" />
	<link href="${pageContext.request.contextPath}/css/dlstyle.css"
					rel="stylesheet" type="text/css">
	<script src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/Virtual pop-up.js"></script>
	<script type="text/javascript">
		var isLoginName = false;
		var isPassword = false;
		var isRePassword = false;
		var isEmail = false;
         var isuserName=false;
	$(function() {

		$("#loginName").blur(function() {
		if ($(this).val().length == 0) { //没输入任何值
				
				zdalert("温馨提示","账号不能为空");

			}else
						{	var param = {
								"loginName" : $(this).val(),
								"time" : new Date().getTime().toLocaleString()
							};
							$(this)
									.load(
											"${pageContext.request.contextPath}/register_checkUserName",
											param,
											function(data) {

												if (data == "true") {
											
													isLoginName = true;
												} else {zdalert("温馨提示","用户名已存在");
											
														
												}
											});
						}});

		$("#email").blur(function() {
		var a= document.getElementById("email").value; //获取邮箱地址
		
if ($(this).val().length == 0) { //没输入任何值
				zdalert("温馨提示","邮箱不能为空");
			

			}else if(!/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(a)) 
			{ zdalert("温馨提示","邮箱格式错误");

 } else 
						{	var param = {
								"email" : $(this).val(),
								"time" : new Date().getTime().toLocaleString()
							};
							$(this)
									.load(
											"${pageContext.request.contextPath}/register_checkUserEmail",
											param,
											function(data) {

												if (data == "true") {
													
														
													isEmail = true;
												} else {zdalert("温馨提示","邮箱已存在");
											
													
															
												}

											});
						}});
			
      $("#userName").blur(function() {

			if ($(this).val().length == 0) { //没输入任何值
				zdalert("温馨提示","昵称为空");
				

			}
			else {
				
				isuserName = true;
			}

		});
		$("#password").blur(function() {

			if ($(this).val().length == 0) { //没输入任何值
				zdalert("温馨提示","密码为空");
				

			}
			else {
				
				isPassword = true;
			}

		});

		$("#rePassword").blur(function() {

			if ($(this).val().length == 0) { //没输入任何值
			zdalert("温馨提示","确认不能为空");
				
			
			} else {

				if ($(this).val() == $("#password").val()) { //密码相等
					isRePassword = true;
				} else {
					zdalert("温馨提示","两次密码不一致");
				}

			}

		});

	});
	//提交前验证
	function onSubmitCheck() {

		if (isLoginName && isPassword && isRePassword && isEmail && isuserName) {
			return true;
			
		} else {
			return false;
		}
	}
</script>
</head>
<body>


	<div class="login-boxtitle">
		<s:a action="index" namespace="">
			<img alt="logo"
				src="${pageContext.request.contextPath}/images/logobig.png" />
		</s:a>
	</div>

	<div class="res-banner">
		<div class="res-main">
			<div class="login-banner-bg">
				<span></span><img
					src="${pageContext.request.contextPath}/images/big.jpg" />
			</div>
			<div class="login-box">


				<h3 class="title" style="font-size: 15px; margin-bottom: 10px;">注册</h3>
				<div class="clear"></div>

				<div class="login-form">

					<s:form id="registerForm" method="post" action="user_regist"
						namespace="/user" onsubmit="return onSubmitCheck()">
						<div class="user-email">
							<label for="email"><i class="am-icon-envelope-o"
								style="margin-top: 12px; font-size: 17px;"></i></label>
							<s:textfield id="email" name="email" cssClass="input"
								maxlength="200" placeholder="请输入邮箱账号"></s:textfield>
						</div>
						<div class="user-name">
							<label for="user"><i class="am-icon-user"
								style="margin-top: 12px; font-size: 17px;"></i></label>
							<s:textfield id="loginName" name="loginName" cssClass="input"
								maxlength="20" placeholder="登录名"></s:textfield>
						</div>
						<div class="user-name">
							<label for="user"><i class="am-icon-user"
								style="margin-top: 12px; font-size: 17px;"></i></label>
							<s:textfield id="userName" name="userName" cssClass="input"
								maxlength="20" placeholder="昵称/姓名"></s:textfield>
						</div>
						<div class="user-pass">
							<label for="password"><i class="am-icon-lock"
								style="margin-top: 12px; font-size: 17px;"></i></label>
							<s:password id="password" name="password" cssClass="input"
								maxlength="20" placeholder="设置密码"></s:password>
						</div>
						<div class="user-pass">
							<label for="passwordRepeat"><i class="am-icon-lock"
								style="margin-top: 12px; font-size: 17px;"></i></label>
							<s:password id="rePassword" cssClass="input"
								maxlength="20" placeholder="确认密码"></s:password>
						</div>
				</div>


				<div class="login-links">
					<label for="remember-me"> <input id="reader-me"
						type="checkbox"> 点击表示您同意商城《服务协议》 </label>
					<s:a action="login" namespace=""
						cssClass="zcnext am-fr am-btn-default">登录</s:a>
					<br />
				</div>
				<div class="am-cf">
					<input type="submit" name="" value="注册"
						class="am-btn am-btn-primary am-btn-sm am-fl">
				</div>
				</s:form>
			</div>
		</div>
	</div>


	<jsp:include page="foot.jsp" />
</body>
</html>