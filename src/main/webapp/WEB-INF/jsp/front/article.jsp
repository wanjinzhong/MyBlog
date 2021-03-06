<%@page import="com.blog.util.PageUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../include.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="gb2312">
<title>${article.title }</title>
<link href="css/base.css" rel="stylesheet">
<link href="css/article.css" rel="stylesheet">
<!-- ueditor代码高亮 -->
<link href="ueditor/third-party/SyntaxHighlighter/shCoreDefault.css" rel="stylesheet" type="text/css" />  
<script type="text/javascript" src="ueditor/third-party/SyntaxHighlighter/shCore.js"></script>  
<script type="text/javascript">      
	SyntaxHighlighter.all();       
</script>

</head>
<%
	int count = Integer.parseInt(request.getAttribute("count").toString());
	int curPage = Integer.parseInt(request.getAttribute("curPage").toString());
	int id = Integer.parseInt(request.getParameter("id"));
	PageUtil pageUtil = new PageUtil(count, curPage, 8, "article.shtml?id=" + id + "&");
	/* //获取本页url
	String url = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath()
			+ request.getServletPath().substring(0, request.getServletPath().lastIndexOf("/") + 1);
	if (request.getQueryString() != null) {
		url += "?" + request.getQueryString();
	} */
%>

<body>
	<%@ include file="header.jsp"%>
	<div class="content" style="margin-top: 30px">
	<%@ include file="search.jsp"%>
		<h1 class="t_nav">
			<span>您当前的位置：<a href="/index.html">文章</a>&nbsp;&gt;&nbsp;
			</span><a href="index.shtml" class="n1">网站首页</a><a href="allarticles.shtml"
				class="n2">文章</a>
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
					<div class="noComment">暂时还没有评论哦，快来评论吧~</div>
				</c:if>
				<c:if test="${commentList ne null && !commentList.isEmpty()}">
					<c:forEach items="${commentList }" var="comment" varStatus="index">
						<div class="comment">
							<div class="picDiv">
								<c:if test="${comment.userPic ne null }">
									<img alt="头像" src="${comment.userPic }" class="userPic">
								</c:if>
								<c:if test="${comment.userPic eq null }">
									<img alt="头像" src="images/defaultUserPic.gif" class="userPic">
								</c:if>
							</div>
							<div class="commentContentDiv">
								<div class="comment_title">
									<span class="comment_name">${comment.userName}</span> <span
										class="comment_time"> &nbsp;&nbsp;(<fmt:formatDate
											value="${comment.time }" pattern="yyyy-MM-dd HH:mm:ss" />)
									</span> <span class="comment_index">${(curPage - 1) * 8 + index.count }#</span>
								</div>
								<div class="comment_content">${comment.commentContent }</div>
							</div>
						</div>
						<div class="separates"></div>
					</c:forEach>
					<div><%=pageUtil.pcontroller()%></div>
				</c:if>
			</div>
			<div style="position: relative;">
				<c:if test="${userName eq null }">
					<div class="mask">
						<a href="login.shtml">登陆</a>后评论
					</div>
				</c:if>
				<form action="addcomment.shtml" method="post">
					<div class="my_comment">
						<textarea id="comment_input" name="comment_content"></textarea>
						<input type="submit" id="submit" value="提交" />
					</div>
				</form>
			</div>
			<textarea name="myComment" id="myEditor"></textarea>
			<!-- <script type="text/javascript">
				var editor = new UE.ui.Editor({
					initialFrameWidth : 715
				});
				editor.render("myEditor");
				//1.2.4以后可以使用以下代码实例化编辑器
				/* UE.getEditor('myEditor'); */
			</script>  -->
		</div>
		<%@ include file="right.jsp"%>
		<%-- <%@ include file="footer.jsp"%> --%>
	</div>
</body>
</html>