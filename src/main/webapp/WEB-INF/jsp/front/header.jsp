<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<style>
.header {
	width: 1000px;
	height: 80px;
	margin: 0 auto;
}
</style>

<div class="header">
	<div id="logo">
		<a href="/"><img alt="logo" src="images/logo.png" width="250px"></a>
	</div>
	<div class="login">
		<c:if test="${userName ne null }">${userName }&nbsp;&nbsp;<a href="logout.do">退出登陆</a></c:if>
		<c:if test="${userName eq null }"><a href="login.do">登陆</a></c:if>
	</div>
	<nav class="topnav" id="topnav">
		<a href="index.do"><span>首页</span><span class="en">Home</span></a> <a
			href="allarticles.do"><span>文章</span><span class="en">Artical</span></a>
		<!-- <a href="moodlist.html"><span>心情</span><span class="en">Mood</span></a> -->
		<a href="leave_word.do"><span>留言</span><span class="en">Word</span></a>
		<a href="aboutme.do"><span>关于我</span><span class="en">Me</span></a> <a
			href="aboutwebsite.do"><span>关于网站</span><span class="en">WebSite</span></a>
	</nav>
</div>