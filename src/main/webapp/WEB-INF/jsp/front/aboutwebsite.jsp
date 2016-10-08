<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>关于${bloggerName }</title>
<meta name="keywords" content="万进忠的博客" />
<meta name="description" content="万进忠的博客" />
<link href="css/base.css" rel="stylesheet">
<link href="css/about.css" rel="stylesheet">
<link href="css/aboutwebsite.css" rel="stylesheet">

</head>
<body>
	<%@include file="header.jsp"%>

	<div class="about">
		<h1 class="t_nav">
			<span>现在正是黎明前的黑暗，马上就迎来阳光</span><a href="/" class="n1">网站首页</a><a
				href="/" class="n2">关于我</a>
		</h1>
		<div class="info">
			<p>网站建设者：万进忠</p>
			<p>始建日期：2016年9月30日</p>
			<p>网站将不定期更新</p>
		</div>
		<div class="right">
			<p>向我资助</p>
			<img alt="支付宝" src="images/zhifubao.jpg" class="alibaba">
			<img alt="微信" src="images/weixin.png" class="wechat">
		</div>
	</div>
</body>
</html>