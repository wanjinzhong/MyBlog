<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>关于我-万进忠的博客</title>
<meta name="keywords" content="万进忠的博客" />
<meta name="description" content="万进忠的博客" />
<link href="css/base.css" rel="stylesheet">
<link href="css/about.css" rel="stylesheet">

</head>
<body>
	<%@include file="header.jsp"%>
	<h1 class="t_nav">
		<span>现在正是黎明前的黑暗，马上就迎来阳光</span><a href="/" class="n1">网站首页</a><a
			href="/" class="n2">关于我</a>
	</h1>
	<div class="about_c">
		<p>姓名：${user.realName }</p>
		<p>
			生日：
			<fmt:formatDate value="${user.birthday }" pattern="yyyy-MM-dd" />
		</p>
		<p>性别：${user.sex }</p>
		<p>邮箱：${user.email }</p>
		<p>电话：${user.tel }</p>
		<p>所在地：${user.place }</p>
		<p>QQ：${user.qq }</p>
		<p>自我介绍：${user.introduce }</p>
		<p>发表文章数：${article_count }</p>
		<p>留言总数：${leave_word_count }</p>
	</div>
</body>
</html>