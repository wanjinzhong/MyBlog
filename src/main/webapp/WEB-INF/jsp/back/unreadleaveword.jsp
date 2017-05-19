<%@page import="com.blog.util.PageUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/back_all.css" rel="stylesheet" type="text/css" />
<%@ include file="../include.jsp"%>
<title>Insert title here</title>
</head>
<%
	int count = Integer.parseInt(request.getAttribute("count").toString());
	int curPage = Integer.parseInt(request.getAttribute("curPage").toString());
	PageUtil pageUtil = new PageUtil(count, curPage, 10, "unreadleaveword.do?");
%>
<script type="text/javascript">
function deleteleaveword(id){
	if (confirm("确定要删除该评论吗？这将不可恢复！")){
		window.location = "deleteleaveword.do?leaveWordId=" + id;
	}
}
</script>
<body>
	<div class="place">
		<ul class="placeul">
			<li>当前位置：</li>
			<li><a href="contentindex.do">首页</a></li>
			<li>></li>
			<li>未读留言</li>
		</ul>
	</div>
	<div class="content">
		<table>
			<thead>
				<tr>
					<th width="80px">编号</th>
					<th width="80px">留言Id</th>
					<th width="150px">留言者</th>
					<th width="150px">时间</th>
					<th>内容</th>
					<th width="180px">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${fn:length(leavewords) != 0}">
					<c:forEach items="${leavewords }" var="leaveword" varStatus="loop">
						
							<tr>
						<td>${(curPage - 1 ) * 10 + loop.count }</td>
						<td>${leaveword.leaveWordId }</td>
						<td>${leaveword.userName }</td>
						<td><fmt:formatDate value="${leaveword.time }"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td>${leaveword.content }</td>
						<td><a
							href="leaveworddetail.do?leaveWordId=${leaveword.leaveWordId }"><img
								src="images/detail.png" width="15px" />查看</a>&nbsp;&nbsp;<a
								href="leavewordignore.do?curPage=${curPage }&leaveWordId=${leaveword.leaveWordId }"><img
									src="images/detail.png" width="15px" />忽略</a>&nbsp;&nbsp;<a
							href="javascript:void(0)"
							onclick="deleteleaveword(${leaveword.leaveWordId })"><img
								src="images/delete.png" width="15px" />删除</a></td>
					</c:forEach>
				</c:if>
				<c:if test="${fn:length(leavewords) == 0}">
					<tr>
						<td colspan="7">你暂时还没有未读留言</td>
					</tr>
				</c:if>
			</tbody>
		</table>
		<div><%=pageUtil.pcontroller()%></div>
	</div>
</body>
</html>