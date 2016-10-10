<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/back_all.css" rel="stylesheet" type="text/css" />
<link href="css/info.css" rel="stylesheet" type="text/css" />
<title>Insert title here</title>
<%@ include file="../include.jsp"%>
</head>
<script type="text/javascript">
function edit(){
	window.location="infoupdate.do";
}
</script>
<body>
	<div class="place">
		<ul class="placeul">
			<li>当前位置：</li>
			<li><a href="contentindex.do">首页</a></li>
			<li>></li>
			<li>我的信息</li>
		</ul>
	</div>
	<div class="content">
		<table class="article_info">
			<tr>
				<td width="100px">用户ID</td>
				<td width="250px">${blogger.userId }</td>
				<td width="100px">用户名</td>
				<td width="250px">${blogger.loginName }</td>
			</tr>
			<tr>
				<td width="100px">博主ID</td>
				<td width="250px">${blogger.bloggerId }</td>
				<td width="100px">博客名</td>
				<td width="250px">${blogger.bloggerName }</td>
			</tr>
			<tr>
				<td width="100px">真实姓名</td>
				<td width="250px">${blogger.realName }</td>
				<td width="100px">性别</td>
				<td width="250px"><c:if test="${blogger.sex == 1 }">男</c:if> <c:if
						test="${blogger.sex == 0 }">女</c:if></td>
			</tr>
			<tr>
				<td width="100px">电话</td>
				<td width="250px">${blogger.tel }</td>
				<td width="100px">电子邮箱</td>
				<td width="250px">${blogger.email}</td>
			</tr>
			<tr>
				<td width="100px">QQ</td>
				<td width="250px">${blogger.qq }</td>
				<td width="100px">生日</td>
				<td width="250px"><fmt:formatDate value="${blogger.birthday}" pattern="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<td width="100px">头像</td>
				<td width="250px"><img alt="头像" src="${blogger.imageUrl}" style="width: 100px; height: 100px"></td>
				<td width="100px">自我介绍</td>
				<td width="250px">${blogger.introduce}</td>
			</tr>
		</table>
		<input type="button" value="编辑" class="edit" onclick="edit();"/>
	</div>
</body>
</html>