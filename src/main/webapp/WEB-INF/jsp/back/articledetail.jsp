<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/blog/css/back_all.css" rel="stylesheet" type="text/css" />
<link href="/blog/css/articledetail.css" rel="stylesheet"
	type="text/css" />
<title>Insert title here</title>
<%@ include file="../include.jsp"%>
<!-- ueditor代码高亮 -->
<link href="ueditor/third-party/SyntaxHighlighter/shCoreDefault.css" rel="stylesheet" type="text/css" />  
<script type="text/javascript" src="ueditor/third-party/SyntaxHighlighter/shCore.js"></script>  
<script type="text/javascript">      
	SyntaxHighlighter.all();       
</script>
</head>

<body>
	<div class="place">
		<ul class="placeul">
			<li>当前位置：</li>
			<li><a href="contentindex.do">首页</a></li>
			<li>></li>
			<li><a href="myarticles.do">文章列表</a></li>
			<li>></li>
			<li>文章详情</li>
		</ul>
	</div>
	<div class="content">
		<table class="article_info">
			<tr>
				<td width="100px">文章ID</td>
				<td width="250px">${article.articleId }</td>
				<td width="100px">文章标题</td>
				<td width="250px">${article.title }</td>
			</tr>
			<tr>
				<td>发布时间</td>
				<td><fmt:formatDate value="${article.publishTime }"
						pattern="yyyy-MM-dd HH:mm:ss" /></td>
				<td>更新时间</td>
				<td><fmt:formatDate value="${article.updateTime }"
						pattern="yyyy-MM-dd HH:mm:ss" /></td>
			</tr>
			<tr>
				<td>文章类型</td>
				<td>${articleType}</td>
				<td>关键词</td>
				<td>${article.keyword }</td>
			</tr>
			<tr>
				<td>阅读量</td>
				<td>${article.reading}</td>
				<td colspan="2" style="text-align: right;"><a href="articleupdate.do?articleid=${article.articleId }"><img
						src="images/update.png" width="15px" />修改</a>&nbsp;&nbsp; <a
					href="articledelete.do?articleid=${article.articleId }"><img
						src="images/delete.png" width="15px" />删除</a></td>
			</tr>
			<tr>
				<td>封面图</td>
				<td>
					<img alt="封面图" src="${article.coverPic }" style="width: 150px; height: 100px">
				</td>
			</tr>
		</table>
		<div class="article_content">${article.content }</div>
	</div>
</body>
</html>