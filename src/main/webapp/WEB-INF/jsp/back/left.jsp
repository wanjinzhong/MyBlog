<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/back_all.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-3.1.0.js"></script>
</head>
<style>
html, body{height: 100%}
</style>
<body>
	<div class="wrap_left" id="frmTitle" name="fmTitle">
		<div id="Logo">
			<img alt="" src="images/logo.png">
		</div>
		<script>
			$(function() {
				$(".menu_list dd a").click(function() {
					$("dd a").removeClass("active");
					$(this).addClass("active");
				});
				$(".menu_list dt").click(function() {
					$(this).toggleClass("open").next().slideToggle("fast");
				});
			});
		</script>
		<div class="menu_list">
			<dl>
				<dt>
					<span>文章</span>
				</dt>
				<dd>
					<a href="myarticles.do" target="content">文章列表</a> <a
						href="publisharticle.do" target="content">发表文章</a> <a
						href="recyclebin.do" target="content">回收站</a><a
						href="articletypelist.do" target="content">文章类别</a>
				</dd>
			</dl>
			<dl>
				<dt>
					<span>评论</span>
				</dt>
				<dd>
					<a href="unreadcomment.do" target="content">未读评论</a>
					<a href="allcomment.do" target="content">所有评论</a>
				</dd>
			</dl>
			<dl>
				<dt>
					<span>留言</span>
				</dt>
				<dd>
					<a href="unreadleaveword.do" target="content">未读留言</a> <a
						href="allleaveword.do" target="content">所有留言</a>
				</dd>
			</dl>
			<dl>
				<dt>
					<span>我的</span>
				</dt>
				<dd>
					<a href="info.do" target="content">我的信息</a>
				</dd>
			</dl>
		</div>
	</div>
</body>
</html>