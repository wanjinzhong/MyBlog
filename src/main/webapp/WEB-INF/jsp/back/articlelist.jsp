<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/blog/css/back_all.css" rel="stylesheet" type="text/css" />
<%@ include file="../include.jsp"%>
<title>Insert title here</title>
</head>
<body>
	<table class="tablelist">
		<thead>
			<tr>
				<th>文章id</th>
				<th>文章标题</th>
				<th width="150px">封面图</th>
				<th>发表时间</th>
				<th>修改时间</th>
				<th>阅读量</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${articles }" var="article" varStatus="loop">
				<tr>
					<td>${article.articleId }</td>
					<td>${article.title }</td>
					<td><c:if test="${article.coverPic ne null }">
							<img alt="" src="${article.coverPic }"
								style="width: 150px; height: 100px">
						</c:if>
						<c:if test="${article.coverPic eq null }">没有封面</c:if></td>
					<td><fmt:formatDate value="${article.publishTime }"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td><fmt:formatDate value="${article.updateTime }"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td>${article.reading }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>