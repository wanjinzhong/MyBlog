<%@page import="com.blog.util.PageUtil"%>
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
<%
	int count = Integer.parseInt(request.getAttribute("count").toString());
	int curPage = Integer.parseInt(request.getAttribute("curPage").toString());
	PageUtil pageUtil = new PageUtil(count, curPage, 10, "allcomment.do?");
%>
<script type="text/javascript">
function deletecomment(id){
	if (confirm("确定要删除该评论吗？这将不可恢复！")){
		window.location = "deletecomment.do?commentId=" + id;
	}
}
</script>
<body>
	<div class="place">
		<ul class="placeul">
			<li>当前位置：</li>
			<li><a href="contentindex.do">首页</a></li>
			<li>></li>
			<li>未读评论</li>
		</ul>
	</div>
	<div class="content">
		<table>
			<thead>
				<tr>
					<th width="80px">编号</th>
					<th width="80px">文章Id</th>
					<th>文章标题</th>
					<th>内容</th>
					<th width="150px">评论人</th>
					<th width="180px">评论时间</th>
					<th width="180px">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${fn:length(comments) != 0}">
					<c:forEach items="${comments }" var="comment" varStatus="loop">
						<tr>
							<td>${(curPage - 1 ) * 10 + loop.count }</td>
							<td>${comment.articleId }</td>
							<td>${comment.articleTitle }</td>
							<td>${comment.commentContent }</td>
							<td>${comment.userName }</td>
							<td><fmt:formatDate value="${comment.time }"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td><a
								href="commentdetail.do?commentId=${comment.commentId }"><img
									src="images/detail.png" width="15px" />查看</a>&nbsp;&nbsp;<a
								href="commentignore.do?curPage=${curPage }&commentId=${comment.commentId }"><img
									src="images/detail.png" width="15px" />忽略</a>&nbsp;&nbsp;<a
								href="javascript:void(0)"
								onclick="deletecomment(${comment.commentId })"><img
									src="images/delete.png" width="15px" />删除</a></td>
					</c:forEach>
				</c:if>
				<c:if test="${fn:length(comments) == 0}">
					<tr>
						<td colspan="7">你暂时还没有未读评论</td>
					</tr>
				</c:if>
			</tbody>
		</table>
		<c:if test="${fn:length(comments) != 0}">
		<div><%=pageUtil.pcontroller()%></div>
		</c:if>
	</div>
</body>
</html>