<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/back_all.css" rel="stylesheet" type="text/css" />
<link href="css/contentindex.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-3.1.0.js"></script>
</head>
<body>
	<div class="box">
		<a href="myarticles.do"><div class="disp articleCount">文章总数<br/><div class="count"><span>${articleCount }</span>篇</div></div></a>
		<a href="allleaveword.do"><div class="disp leavewordCount">留言总数<br/><div class="count"><span>${leavewordCount }</span>条</div></div></a>
		<a href="unreadleaveword.do"><div class="disp leaveWordUnread">未读留言<br/><div class="count"><span>${leaveWordUnread }</span>条</div></div></a>
		<a href="allcomment.do"><div class="disp commentCount">评论总数<br/><div class="count"><span>${commentCount }</span>条</div></div></a>
		<a href="unreadcomment.do"><div class="disp commentUnread">未读评论<br/><div class="count"><span>${commentUnread }</span>条</div></div></a>
		<a href="recyclebin.do"><div class="disp recycleCount">回收站<br/><div class="count"><span>${recycleCount }</span>篇</div></div></a>
	</div>
</body>
</html>