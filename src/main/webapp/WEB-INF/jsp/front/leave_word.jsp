<%@page import="com.blog.util.PageUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../include.jsp"%>
<link href="css/base.css" rel="stylesheet">
<link href="css/leave_word.css" rel="stylesheet">
<title>${bloggerName }的留言板</title>
</head>
<%
	int count = Integer.parseInt(request.getAttribute("count").toString());
	int curPage = Integer.parseInt(request.getAttribute("curPage").toString());
	PageUtil pageUtil = new PageUtil(count, curPage, 15, "leave_word.shtml?");
%>
<body>
	<!-- 头部 -->
	<%@include file="header.jsp"%>
	<div class="content" style="margin-top: 30px">
		<h1 class="t_nav">
			<span>您当前的位置：<a href="/index.html">留言板</a></span><a href="index.shtml"
				class="n1">网站首页</a><a href="leave_word.shtml" class="n2">留言板</a>
		</h1>
		<div class="left">
			<c:if test="${!list.isEmpty() }">
				<c:forEach items="${list }" var="word" varStatus="index">
					<div class="leave_word">
						<div class="leave_word_info">
						<img alt="头像" src="${word.userPic }" class="userpic">
							<div class="user_name">${word.userName }</div>
							<fmt:formatDate value="${word.time }"
								pattern="yyyy-MM-dd HH:mm:ss" />
							<div class="floor">${(curPage-1)*15 + index.count}#</div>
						</div>
						<div class="leave_word_content">${word.content }</div>
						<div style="clear: both;"></div>
					</div>
				</c:forEach>
				<div class="page"><%=pageUtil.pcontroller()%></div>
			</c:if>
			<c:if test="${list.isEmpty() }">
				<div class="noLeaveWord">名气不够，暂时还没有留言哦～</div>
			</c:if>
			<div style="position: relative;">
				<c:if test="${userName eq null }">
					<div class="mask" style="width: 100%">
						<a href="login.shtml">登陆</a>后评论
					</div>
				</c:if>
				<form action="addleaveword.shtml" method="post">
					<div class="my_leaveword"  style="width: 100%">
						<textarea id="leaveword_input" name="leaveword_content"  style="width: 100%"></textarea>
						<input type="submit" id="submit" value="提交" />
					</div>
				</form>
			</div>
		</div>
	</div>

	<%-- <%@ include file="footer.jsp"%> --%>
</body>
</html>