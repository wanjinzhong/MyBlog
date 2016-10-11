<%@page import="com.blog.util.PageUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="width: 100%;height: 100%">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/back_all.css" rel="stylesheet" type="text/css" />
<title>Insert title here</title>
<%@ include file="../include.jsp"%>
</head>
<%
	int count = Integer.parseInt(request.getAttribute("count").toString());
	int curPage = Integer.parseInt(request.getAttribute("curPage").toString());
	PageUtil pageUtil = new PageUtil(count, curPage, 5, "articletypelist.do?");
%>
<script type="text/javascript">
function deletearticleType(curPage, id){
	if(confirm("确定要删除这个文章分类吗？这个分类下的文章将被移到你的默认分类下"))
		window.location = "deletearticleType.do?curPage=" + curPage + "&typeId=" + id;
}
function displayAddDiv(){
	$("#mask, #addDiv").fadeIn(500);
}
function hideAddDiv(){
	$("#mask, #addDiv").fadeOut(500);
}
</script>
<body >
	<div class="place">
		<ul class="placeul">
			<li>当前位置：</li>
			<li><a href="contentindex.do">首页</a></li>
			<li>></li>
			<li>文章类型</li>
		</ul>
		<input type="button" value="添加类别" onclick="displayAddDiv()" style="margin-top: 10px;float: right; margin-right: 10px"/>
	</div>
	<div class="content">
		<table class="tablelist">
			<thead>
				<tr>
					<th width="50px">序号</th>
					<th width="100px">类别id</th>
					<th width="140px">类别名称</th>
					<th>描述</th>
					<th>创建时间</th>
					<th>修改时间</th>
					<th>是否默认</th>
					<th width="180px">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${fn:length(articleType) != 0}">
					<c:forEach items="${articleType }" var="type" varStatus="loop">
						<tr>
							<td>${(curPage - 1 ) * 5 + loop.count }</td>
							<td>${type.typeId }</td>
							<td>${type.typeName }</td>
							<td>${type.description }</td>
							<td><fmt:formatDate value="${type.publishTime }"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td><fmt:formatDate value="${type.updateTime }"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td><c:if test="${type.isDefault == 1 }">是</c:if>
							<c:if test="${type.isDefault == 0 }">否</c:if></td>
							<td><a href="articleTypeUpdate.do?articleId=${type.typeId }"><img
									src="images/update.png" width="15px" />修改</a> <c:if
									test="${type.isDefault != 1 }">
									&nbsp;&nbsp; <a href="javascript:void(0)"
										onclick="deletearticleType(${curPage},${type.typeId })"><img
										src="images/delete.png" width="15px" />删除</a>
								</c:if></td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${fn:length(articleType) == 0}">
					<tr>
						<td colspan="7">你暂时还没有创建文章分类</td>
					</tr>
				</c:if>
			</tbody>
		</table>
		<c:if test="${fn:length(articleType) != 0}">
			<div><%=pageUtil.pcontroller()%></div>
		</c:if>
	</div>
	<div id="mask" style="position: absolute;width: 100%; height: 100%; background-color: black; opacity: 0.4;left:0; top:0; display: none"></div>
	<div id="addDiv"
		style="background-color: white; position: absolute; width: 400px; height: 200px; left: 50%; top: 50%; margin-left: -200px; margin-top: -300px; box-shadow: 5px 5px 20px rgba(50, 50, 50, 0.8); display: none">
		<div style="height: 30px; width: 390px; background-color: #55a9cd; line-height: 30px; color: white; padding: 5px;">添加类别<a  style="float: right; margin: 5px 10px" href="javascript:void(0);" onclick="hideAddDiv()"><img alt="关闭" src="images/delete.png" onclick="closeAddDiv()" /></a></div>
		<form action="addarticletype.do" method="POST">
			<table  style="border: none;margin:0 20px;margin-top: 30px;width: 360px">
			<tr>
				<td>类别名称</td>
				<td><input type="text" name="typeName" style="width: 100%" /></td>
			</tr>
			<tr style="margin-top: 10px; height: 50px">
				<td>类别描述</td>
				<td><textarea name="descript" style="width: 100%; height: 100%"></textarea></td>
			</tr>
		</table>
		<div style="text-align: right;margin-top: 20px; margin-right: 20px">
			<input type="submit" value="确定"/>&nbsp;&nbsp;&nbsp;<input type="button" value="取消" onclick="hideAddDiv()"/>
		</div>
		</form>
	</div>
</body>
</html>