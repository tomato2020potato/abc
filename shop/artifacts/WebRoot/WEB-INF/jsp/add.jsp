<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<title>添加商品</title>
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
		var isImage = false;     
		var isMarket_price = false;
		var isShop_price= false;
		var isPname = false;
         var isNum=false;
         var isPdesc=false;
         var isIs_hot=false;
         var isPdate=false;
         var isCsid=false;
	$(function() {
      $("#image").blur(function() {
			if ($(this).val().length == 0) { //没输入任何值
				zdalert("温馨提示","链接为空");
			}
			else {		
				isImage = true;
			}
		});
		$("#market_price").blur(function() {
			if ($(this).val().length == 0) { //没输入任何值
				zdalert("温馨提示","原价为空");
			}
			else {		
				isMarket_price = true;
			}
		});
		$("#shop_price").blur(function() {
			if ($(this).val().length == 0) { //没输入任何值
				zdalert("温馨提示","折扣价为空");
			}
			else {		
				isShop_price = true;
			}
		});
         $("#pname").blur(function() {
			if ($(this).val().length == 0) { //没输入任何值
				zdalert("温馨提示","名称为空");
			}
			else {		
				isPname = true;
			}
		});
		$("#num").blur(function() {
			if ($(this).val().length == 0) { //没输入任何值
				zdalert("温馨提示","数量为空");
			}
			else {		
				isNum = true;
			}
		});
		$("#pdesc").blur(function() {
			if ($(this).val().length == 0) { //没输入任何值
				zdalert("温馨提示","介绍为空");
			}
			else {		
				isPdesc = true;
			}
		});
         $("#is_hot").blur(function() {
			if ($(this).val().length == 0) { //没输入任何值
				zdalert("温馨提示","热点为空");
			}
			else {		
				isIs_hot = true;
			}
		});
         $("#csid").blur(function() {
			if ($(this).val().length == 0) { //没输入任何值
				zdalert("温馨提示","分类为空");
			}
			else {		
				isCsid = true;
			}
		});
		$("#pdate").blur(function() {
			if ($(this).val().length == 0) { //没输入任何值
				zdalert("温馨提示","日期为空");
			}
			else {		
				isPdate = true;
			}
		});
	});
	//提交前验证
	function onSubmitCheck() {
		if (isMarket_price && isImage && isShop_price && isPname && isNum && isPdesc && isIs_hot && isPdate && isCsid) {
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


				<h3 class="title" style="font-size: 15px; margin-bottom: 10px;">添加商品</h3>
				<div class="clear"></div>

				<div class="login-form">

					<s:form id="addForm" method="post" action="addproduct"
						namespace="/product" onsubmit="return onSubmitCheck()">
						<div class="product-pname">
							<label for="product"><i class="am-icon-envelope-o"
								style="margin-top: 12px; font-size: 17px;"></i></label>
							<s:textfield id="pname" name="pname" cssClass="input"
								maxlength="200" placeholder="请输入商品名称"></s:textfield>
						</div>
						<div class="product-market_price">
							<label for="product"><i class="am-icon-envelope-o"
								style="margin-top: 12px; font-size: 17px;"></i></label>
							<s:textfield id="market_price" name="market_price" cssClass="input"
								maxlength="200" placeholder="请输入原价"></s:textfield>
						</div>
						<div class="product-shop_price">
							<label for="product"><i class="am-icon-envelope-o"
								style="margin-top: 12px; font-size: 17px;"></i></label>
							<s:textfield id="shop_price" name="shop_price" cssClass="input"
								maxlength="200" placeholder="请输入折扣价"></s:textfield>
						</div>
						<div class="product-image">
							<label for="product"><i class="am-icon-envelope-o"
								style="margin-top: 12px; font-size: 17px;"></i></label>
							<s:textfield id="image" name="image" cssClass="input"
								maxlength="200" placeholder="请输入图片链接"></s:textfield>
						</div>
						<div class="product-num">
							<label for="product"><i class="am-icon-envelope-o"
								style="margin-top: 12px; font-size: 17px;"></i></label>
							<s:textfield id="num" name="num" cssClass="input"
								maxlength="200" placeholder="请输入商品数量"></s:textfield>
						</div>
						<div class="product-pdesc">
							<label for="product"><i class="am-icon-envelope-o"
								style="margin-top: 12px; font-size: 17px;"></i></label>
							<s:textfield id="pdesc" name="pdesc" cssClass="input"
								maxlength="200" placeholder="请输入商品介绍"></s:textfield>
						</div>
						<div class="product-is_hot">
							<label for="product"><i class="am-icon-envelope-o"
								style="margin-top: 12px; font-size: 17px;"></i></label>
							<s:textfield id="is_hot" name="is_hot" cssClass="input"
								maxlength="200" placeholder="商品热点"></s:textfield>
						</div>
						<div class="product-pdate">
							<label for="product"><i class="am-icon-envelope-o"
								style="margin-top: 12px; font-size: 17px;"></i></label>
							<s:textfield id="pdate" name="pdate" cssClass="input"
								maxlength="200" placeholder="输入添加时间"></s:textfield>
						</div>
						<div class="product-csid">
							<label for="product"><i class="am-icon-envelope-o"
								style="margin-top: 12px; font-size: 17px;"></i></label>
							<s:textfield id="csid" name="csid" cssClass="input"
								maxlength="200" placeholder="请输入种类"></s:textfield>
						</div>
						
				</div>


				<div class="login-links">
					<label for="remember-me"> <input id="reader-me"
						type="checkbox"> 点击表示您同意商城《服务协议》 </label>
				
				</div>
				<div class="am-cf">
					<input type="submit" name="" value="提交"
						class="am-btn am-btn-primary am-btn-sm am-fl">
				</div>
				</s:form>
			</div>
		</div>
	</div>


	<jsp:include page="foot.jsp" />
</body>
</html>