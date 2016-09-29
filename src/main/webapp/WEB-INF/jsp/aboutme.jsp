<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>关于我-万进忠的博客</title>
<meta name="keywords" content="万进忠的博客" />
<meta name="description"
	content="万进忠的博客" />
<link href="css/base.css" rel="stylesheet">
<link href="css/about.css" rel="stylesheet">

</head>
<body>
	<%@include file="header.jsp" %>
	<article class="aboutcon">
	<h1 class="t_nav">
		<span>像“草根”一样，紧贴着地面，低调的存在，冬去春来，枯荣无恙。</span><a href="/" class="n1">网站首页</a><a
			href="/" class="n2">关于我</a>
	</h1>
	<div class="about left">
		<h2>Just about me</h2>
		<ul>
			<p>爱代码为开发者提供优秀轻量级网站模板网页代码为开发者节省时间让开发变得轻松自如</p>
		</ul>
		<h2>About my blog</h2>
		<p>
			域 名：www.Aidaima.com 创建于2011年01月12日 <a href="/" class="blog_link"
				target="_blank">注册域名</a>
		</p>
		<p>
			服务器：阿里云服务器<a href="/" class="blog_link" target="_blank">购买空间</a>
		</p>
		<p>备案号：湘ICP备15013214号</p>
		<p>程 序：Aidaima</p>
	</div>
	<aside class="right">
	<div class="about_c">
		<!-- <p>
			网名：<span>Aidaima</span> | 即步非烟
		</p> -->
		<p>姓名：${user.realName } </p>
		<p>生日：
			<fmt:formatDate value="${user.birthday }" pattern="yyyy-MM-dd"/>
		</p>
		<p>性别：${user.sex }</p>
		<p>邮箱：${user.email }</p>
		<p>电话：${user.tel }</p>
		<!-- <p>籍贯：湖南省―郴州市</p>
		<p>现居：湖南</p>
		<p>职业：网站设计、网站制作</p>
		<p>喜欢的书：《红与黑》《红楼梦》</p>
		<p>喜欢的音乐：《burning》《just one last dance》《相思引》</p> -->
		<a target="_blank"
			href="http://wp.qq.com/wpa/qunwpa?idkey=d4d4a26952d46d564ee5bf7782743a70d5a8c405f4f9a33a60b0eec380743c64">
			<img src="http://pub.idqqimg.com/wpa/images/group.png"
			alt="爱代码个人博客网站" title="爱代码个人博客网站">
		</a> <a target="_blank"
			href="http://mail.qq.com/cgi-bin/qm_share?t=qm_mailme&amp;email=HHh9cn95b3F1cHVye1xtbTJ-c3E"><img
			src="http://rescdn.qqmail.com/zh_CN/htmledition/images/function/qm_open/ico_mailme_22.png"
			alt="爱代码个人博客网站"></a>
	</div>
	</aside> </article>
	<footer>
	<p>
		Design by Aidaima <a href="http://www.miitbeian.gov.cn/"
			target="_blank">湘ICP备15013214号</a> <a href="/">网站统计</a>
	</p>
	</footer>
	<script src="js/silder.js"></script>
</body>
</html>