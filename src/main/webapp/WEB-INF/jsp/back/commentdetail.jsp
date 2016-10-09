<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/blog/css/back_all.css" rel="stylesheet" type="text/css" />
<link href="/blog/css/commentdetail.css" rel="stylesheet"
	type="text/css" />
<title>Insert title here</title>
<%@ include file="../include.jsp"%>
</head>

<body>
	<div class="place">
		<ul class="placeul">
			<li>当前位置：</li>
			<li><a href="contentindex.do">首页</a></li>
			<li>></li>
			<li>评论详情</li>
		</ul>
	</div>
	<div class="content">
		<table class="article_info">
			<tr>
				<td width="100px">评论ID</td>
				<td width="250px">${comment.commentId }</td>
				<td width="100px">评论人</td>
				<td width="250px">${comment.userName }</td>
			</tr>
			<tr>
				<td>评论文章</td>
				<td>${comment.articleTitle }</td>
				<td>评论时间</td>
				<td><fmt:formatDate value="${comment.time }"
						pattern="yyyy-MM-dd HH:mm:ss" /></td>
			</tr>
		</table>
		<div class="comment_content">${comment.commentContent }</div>
	</div>
</body>
</html>