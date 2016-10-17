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
<link href="css/articletypes.css" rel="stylesheet">
</head>
<script type="text/javascript">
$(function(){
	$(".userHeadPic").css("background","url(" + $("#url").val() + ") no-repeat");
	$(".userHeadPic").css("background-size","130px 130px");
})
</script>
<body>
	<!-- 头部 -->
	<%@include file="header.jsp"%>
	<!-- Banner -->
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
		<div class="left">
			<c:forEach items="${types }" var="type" varStatus="loop">
					<a href="articletypecontent.shtml?typeId=${type.typeId }"><div class="typeDiv">
						<p class="name">${type.typeName }</p>
						<p class="description">${type.description }</p>
						<p class="count"><span class="countNum">${articleCount[loop.index] }</span>篇</p>
					</div></a>
				</c:forEach> 
		</div>
		<%@ include file="right.jsp"%>
	</div>
	<%@ include file="footer.jsp"%>
	<script src="js/silder.js"></script>
</body>
</html>