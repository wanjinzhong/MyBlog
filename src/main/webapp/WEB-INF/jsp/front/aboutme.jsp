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

</head>
<body>
	<%@include file="header.jsp"%>

	<div class="about">
		<h1 class="t_nav">
			<span>现在正是黎明前的黑暗，马上就迎来阳光</span><a href="/" class="n1">网站首页</a><a
				href="/" class="n2">关于我</a>
		</h1>
		<div class="info">
		<img alt="${blogger.realName }" src="${blogger.imageUrl }" style="width:100px;height:100px">
			<p>姓名：${blogger.realName }</p>
			<p>博客名：${blogger.bloggerName }</p>
			<p>
				生日：
				<fmt:formatDate value="${blogger.birthday }" pattern="yyyy-MM-dd" />
			</p>
			<p>性别：
			<c:if test="${blogger.sex == 0 }">女</c:if>
			<c:if test="${blogger.sex == 1 }">男</c:if>
			</p>
			<p>邮箱：${blogger.email }</p>
			<p>电话：${blogger.tel }</p>
			<p>所在地：${blogger.place }</p>
			<p>QQ：${blogger.qq }</p>
			<p>自我介绍：${blogger.introduce }</p>
			<p>发表文章数：${article_count }</p>
			<p>留言总数：${leave_word_count }</p>
		</div>
	</div>
</body>
</html>