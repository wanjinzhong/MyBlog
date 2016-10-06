<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="include.jsp"%>
<title>${bloggerName }的博客</title>
<meta name="keywords" content="万进忠" />
<meta name="description" content="万进忠的博客" />
<link href="css/base.css" rel="stylesheet">
<link href="css/index.css" rel="stylesheet">
</head>
<body>
	<!-- 头部 -->
	<%@include file="header.jsp"%>
	<!-- Banner -->
	<div class="banner">
		<div class="box">
			<div class="avatar">
				<a href="#"><span>万进忠</span></a>
			</div>
		</div>
	</div>
	<div class="content">
		<div class="left">
			<h2 class="bloglistleft">
					文章<span class="keynote">推荐</span>
					
			</h2>
			<div class="bloglist">
				<c:forEach items="${list }" var="article" varStatus="index">
					<div class="ablog">
						<h3>
							<a href="article.do?id=${article.articleId }">${article.title }</a>
						</h3>
						<div class="blog_img">
							<c:if test="${picList[index.count - 1] eq null }"><img src="images/001.png"></c:if>
							<c:if test="${picList[index.count - 1] ne null }"><img src="${picList[index.count - 1] }" style="width:175px;height:120px"></c:if>
						</div>
						<p class="preview">${article.content }...</p>
						<a href="article.do?id=${article.articleId }" class="readmore">阅读全文>></a>
						<p class="dateview">
							<span> <fmt:formatDate value="${article.updateTime }"
									pattern="yyyy-MM-dd" />
							</span><span>作者：${article.bloggerName }</span>
							</span> <span>阅读量：${article.reading }</span>
						</p>
					</div>
				</c:forEach>
			</div>
		</div>
	<%@ include file="right.jsp" %>
	<%@ include file="footer.jsp"%>
	<script src="js/silder.js"></script>
</body>
</html>