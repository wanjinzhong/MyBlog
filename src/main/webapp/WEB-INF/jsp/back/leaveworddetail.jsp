<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/back_all.css" rel="stylesheet" type="text/css" />
<link href="css/leaveworddetail.css" rel="stylesheet"
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
			<li>留言详情</li>
		</ul>
	</div>
	<div class="content">
		<table class="leaveword_info">
			<tr>
				<td width="100px">留言ID</td>
				<td width="250px">${leaveword.leaveWordId }</td>
				<td width="100px">留言者</td>
				<td width="250px">${leaveword.userName }</td>
			</tr>
			<tr>
				<td>留言时间</td>
				<td><fmt:formatDate value="${leaveword.time }"
						pattern="yyyy-MM-dd HH:mm:ss" /></td>
			</tr>
		</table>
		<div class="leaveword_content">${leaveword.content }</div>
	</div>
</body>
</html>