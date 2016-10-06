<%@page import="com.blog.util.PageUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="include.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="gb2312">
<title>${article.title }</title>
<!-- <script type="text/javascript" src="ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="ueditor/ueditor.all.min.js"></script>
建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败
这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文
<script type="text/javascript" charset="utf-8"
	src="ueditor/lang/zh-cn/zh-cn.js"></script> -->
<link href="css/base.css" rel="stylesheet">
<link href="css/article.css" rel="stylesheet">
</head>
<%
	int count = Integer.parseInt(request.getAttribute("count").toString());
	int curPage = Integer.parseInt(request.getAttribute("curPage").toString());
	int id = Integer.parseInt(request.getParameter("id"));
	PageUtil pageUtil = new PageUtil(count, curPage, 8, "article.do?id=" + id + "&");
	//获取本页url
	String url = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath()
			+ request.getServletPath().substring(0, request.getServletPath().lastIndexOf("/") + 1);
	if (request.getQueryString() != null) {
		url += "?" + request.getQueryString();
	}
%>

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
					<div class="noComment">暂时还没有评论哦，快来评论吧~</div>
				</c:if>
				<c:if test="${commentList ne null && !commentList.isEmpty()}">
					<c:forEach items="${commentList }" var="comment" varStatus="index">
						<div class="comment">
							<div class="comment_title">
								<span class="comment_name">${comment.userName}</span> <span
									class="comment_time"> &nbsp;&nbsp;(<fmt:formatDate
										value="${comment.time }" pattern="yyyy-MM-dd HH:mm:ss" />)
								</span> <span class="comment_index">${(curPage - 1) * 8 + index.count }#</span>
							</div>
							<hr />
							<div class="comment_content">${comment.commentContent }</div>
						</div>
					</c:forEach>
					<div class="page"><%=pageUtil.pcontroller()%></div>
				</c:if>
			</div>
			<div style="position: relative;">
				<c:if test="${userName eq null }">
					<div class="mask">
						<a href="login.do">登陆</a>后评论
					</div>
				</c:if>
				<form action="addcomment.do" method="post">
					<div class="my_comment">
						<textarea id="comment_input" name="comment_content"></textarea>
						<input type="submit" id="submit" value="提交" />
					</div>
				</form>
			</div>
			<!-- <textarea name="myComment" id="myEditor"></textarea>
			<script type="text/javascript">
				var editor = new UE.ui.Editor({
					initialFrameWidth : 715
				});
				editor.render("myEditor");
				//1.2.4以后可以使用以下代码实例化编辑器
				/* UE.getEditor('myEditor'); */
			</script> -->
		</div>
		<%@ include file="right.jsp"%>
		<%-- <%@ include file="footer.jsp"%> --%>
	</div>
</body>
</html>