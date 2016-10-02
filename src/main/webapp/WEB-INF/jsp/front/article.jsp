<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="include.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="gb2312">
<title>${article.title }</title>
<link href="css/base.css" rel="stylesheet">
<link href="css/article.css" rel="stylesheet">
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="content" style="margin-top: 30px">
		<h1 class="t_nav">
			<span>您当前的位置：<a href="/index.html">文章</a>&nbsp;&gt;&nbsp;<a
				href="/news/s/"></a>&nbsp;&gt;&nbsp;<a href="/news/s/">日记</a></span><a
				href="/" class="n1">网站首页</a><a href="/" class="n2">日记</a>
		</h1>
		<div class="left">
			<h2 class="c_titile">${article.title }</h2>
			<p class="box_c">
				<span class="d_time">发布时间： <fmt:formatDate
						value="${article.publishTime }" pattern="yyyy-MM-dd" />
				</span> <span class="d_time">最后修改时间： <fmt:formatDate
						value="${article.updateTime }" pattern="yyyy-MM-dd" />
				</span> <span>作者：${article.bloggerName }</span> <span>阅读量：${article.reading }</span>
			</p>
			<div class="blog_article">${article.content }</div>
			<div class="keybq">
				<p>
					<span>关键词</span>：${article.keyword }
				</p>

			</div>
			<div class="ad"></div>
			<div class="nextinfo">
				<p>上一篇：${prev }</p>
				<p>下一篇：${next }</p>
			</div>
			<div class="comments">
				<div class="commentsTitle">
					文章评论
					<div class="commentsTitleLine"></div>
				</div>
				<c:if test="${commentList eq null || commentList.isEmpty() }">
				<div class="noComment">暂时还没有评论哦，快来评论吧~</div></c:if>
				<c:if test="${commentList ne null && !commentList.isEmpty()}">
					<c:forEach items="${commentList }" var="comment" varStatus="index">
					<div class="comment">
						<div class="comment_title">
							<span class="comment_name">${comment.userName}</span> 
							<span class="comment_time">
							&nbsp;&nbsp;(<fmt:formatDate value="${comment.time }" pattern="yyyy-MM-dd HH:mm:ss"/>)</span>
							<span class="comment_index">${index.count }#</span>
						</div>
						<hr />
						<div class="comment_content">${comment.commentContent }</div>
					</div>
				</c:forEach>
				</c:if>
			</div>
		</div>
		<%@ include file="right.jsp"%>
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>