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
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
</head>

<body>
	<div class="place">
		<ul class="placeul">
			<li>当前位置：</li>
			<li><a href="contentindex.do">首页</a></li>
			<li>></li>
			<li><a href="articletypelist.do">文章类型</a></li>
			<li>></li>
			<li>修改文章类型</li>
		</ul>
	</div>
	<div class="content">
		<form action="savearticletype.do" id="save" method="post" enctype="multipart/form-data">
			<table class="article_info">
				<tr>
					<td width="100px">类别ID</td>
					<td width="250px">${type.typeId }<input type="hidden" value="${type.typeId }" name="typeId"/></td>
					<td width="100px">类别名称</td>
					<td width="250px"><input type="text"
						value="${type.typeName }" name="typeName"/></td>
				</tr>
				<tr>
					<td width="100px">创建时间</td>
					<td width="250px"><fmt:formatDate value="${type.publishTime }" pattern="yyyy-MM-dd HH:mm:ss"/><input type="hidden" value="${type.publishTime }" name="publishTime" /></td>
					<td width="100px">上次更新时间</td>
					<td width="250px"><fmt:formatDate value="${type.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				</tr>
				<tr>
					<td width="100px">描述</td>
					<td><textarea style="width: 100%; height: 100%" name="description">${type.description }</textarea></td>
					<td width="100px">是否默认</td>
					<td width="250px">
						<input type="radio" name="default" value="true"  <c:if test="${type.isDefault == 1 }">checked="checked"</c:if>/>是
						<input type="radio" name="default" value="false"  <c:if test="${type.isDefault != 1 }">checked="checked"</c:if>/>否
					</td>
				</tr>
			</table>
			<input type="submit" name="submit" value="保存" class="save"  />
		</form>
	</div>
</body>
</html>