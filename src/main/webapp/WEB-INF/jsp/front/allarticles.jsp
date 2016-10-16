<%@page import="com.blog.util.PageUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include.jsp"%>
<title>${bloggerName }的博客</title>
<meta name="keywords" content="万进忠" />
<meta name="description" content="万进忠的博客" />
<link href="css/base.css" rel="stylesheet">
<link href="css/index.css" rel="stylesheet">
</head>
<%
	int count = Integer.parseInt(request.getAttribute("count").toString());
	int curPage = Integer.parseInt(request.getAttribute("curPage").toString());
	PageUtil pageUtil = new PageUtil(count, curPage, 8, "allarticles.shtml?");
%>
<script type="text/javascript">
$(function(){
	$(".userHeadPic").css("background","url(" + $("#url").val() + ") no-repeat");
	$(".userHeadPic").css("background-size","130px 130px");
})
</script>
<body>
	<!-- 头部 -->
	<%@include file="header.jsp"%>
	<!-- <!-- Banner -->
	<div class="banner">
		<input type="hidden" value="${blogger.imageUrl }" id="url"/>
		<div class="box" style="position: relative;">
		<p class="introduce">
			<c:if test="${blogger.introduce eq null || blogger.introduce == ''}">这家伙很懒，什么都没有说</c:if>
			<c:if test="${blogger.introduce ne null }">${blogger.introduce }</c:if>
		</p>
			<div class="avatar">
				<a class="userHeadPic" href="#" style="background-size: 130px 130px"><span>${bloggerName }</span></a>
			</div>
		</div>
	</div>
	<div class="content">
		<%@ include file="search.jsp"%>
		<div class="left">
			<h2 class="bloglistleft">
				<span class="keynote">所有</span>文章

			</h2>
			<div class="bloglist">
				<c:forEach items="${list }" var="article" varStatus="index">
					<div class="ablog">
						<h3>
							<a href="article.shtml?id=${article.articleId }">${article.title }</a>
						</h3>
						<div class="blog_img">
							<c:if test="${article.coverPic eq null }">
								<img src="images/001.png">
							</c:if>
							<c:if test="${article.coverPic ne null }">
								<img src="${article.coverPic}"
									style="width: 175px; height: 120px">
							</c:if>
						</div>
						<p class="preview">${article.content }...</p>
						<a href="article.shtml?id=${article.articleId }" class="readmore">阅读全文>></a>
						<p class="dateview">
							<span> <fmt:formatDate value="${article.updateTime }"
									pattern="yyyy-MM-dd" />
							</span><span>作者：${article.bloggerName }</span> </span> <span>阅读量：${article.reading }</span>
						</p>
					</div>
				</c:forEach>
			</div>
			<div class="page"><%=pageUtil.pcontroller()%></div>
		</div>
		<%@ include file="right.jsp"%>
	</div>
	<%@ include file="footer.jsp"%>
	<script src="js/silder.js"></script>
</body>
</html>