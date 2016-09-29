<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="gb2312">
<title>${article.title }</title>
<link href="css/base.css" rel="stylesheet">
<link href="css/new.css" rel="stylesheet">
</head>
<body>
	<%@ include file="header.jsp" %>
	<article class="blogs">
		<h1 class="t_nav">
			<span>您当前的位置：<a href="/index.html">文章</a>&nbsp;&gt;&nbsp;<a
				href="/news/s/"></a>&nbsp;&gt;&nbsp;<a href="/news/s/">日记</a></span><a
				href="/" class="n1">网站首页</a><a href="/" class="n2">日记</a>
		</h1>
		<div class="index_about">
			<h2 class="c_titile">${article.title }</h2>
			<p class="box_c">
				<span class="d_time">发布时间：
					<fmt:formatDate value="${article.publishTime }" pattern="yyyy-MM-dd"/>
				</span>
				<span class="d_time">最后修改时间：
					<fmt:formatDate value="${article.updateTime }" pattern="yyyy-MM-dd"/>
				</span>
				<span>作者：${article.bloggerName }</span>
				<span>阅读量：${article.reading }</span>
			</p>
			<ul class="infos">
				${article.content }
			</ul>
			<div class="keybq">
				<p>
					<span>关键词</span>：${article.keyword }
				</p>

			</div>
			<div class="ad"></div>
			<div class="nextinfo">
				<p>
					上一篇：${prev }
				</p>
				<p>
					下一篇：${next }
				</p>
			</div>
			<div class="otherlink">
				<h2>相关文章</h2>
				<ul>
					<li><a href="/news/s/2013-07-25/524.html" title="现在，我相信爱情！">现在，我相信爱情！</a></li>
					<li><a href="/newstalk/mood/2013-07-24/518.html"
						title="我希望我的爱情是这样的">我希望我的爱情是这样的</a></li>
					<li><a href="/newstalk/mood/2013-07-02/335.html"
						title="有种情谊，不是爱情，也算不得友情">有种情谊，不是爱情，也算不得友情</a></li>
					<li><a href="/newstalk/mood/2013-07-01/329.html"
						title="世上最美好的爱情">世上最美好的爱情</a></li>
					<li><a href="/news/read/2013-06-11/213.html"
						title="爱情没有永远，地老天荒也走不完">爱情没有永远，地老天荒也走不完</a></li>
					<li><a href="/news/s/2013-06-06/24.html" title="爱情的背叛者">爱情的背叛者</a></li>
				</ul>
			</div>
		</div>
		<aside class="right">
			<!-- Baidu Button BEGIN -->
			<div id="bdshare" class="bdshare_t bds_tools_32 get-codes-bdshare">
				<a class="bds_tsina"></a><a class="bds_qzone"></a><a class="bds_tqq"></a><a
					class="bds_renren"></a><span class="bds_more"></span><a
					class="shareCount"></a>
			</div>
			<script type="text/javascript" id="bdshare_js"
				data="type=tools&amp;uid=6574585"></script>
			<script type="text/javascript" id="bdshell_js"></script>
			<script type="text/javascript">
document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + Math.ceil(new Date()/3600000)
</script>
			<!-- Baidu Button END -->
			<div class="blank"></div>
				<div class="news">
				<h3>
					<p>
						最新<span>文章</span>
					</p>
				</h3>
			 	<ul class="rank">
					<c:forEach items="${newest }" var="news" varStatus="index">
						<li><a href="article.do?id=${news.articleId }">${news.title }</a></li>
					</c:forEach>
				</ul>
				<h3 class="ph">
					<p>
						最热<span>文章</span>
					</p>
				</h3>
				<ul class="paih">
					<c:forEach items="${hotest }" var="hots" varStatus="index">
						<li><a href="article.do?id=${hots.articleId }">${hots.title }</a></li>
					</c:forEach>
				</ul>
				<h3 class="links">
					<p>
						友情<span>链接</span>
					</p>
				</h3>
				<ul class="website">
					<li><a href="/">个人博客</a></li>
					<li><a href="/">谢泽文个人博客</a></li>
					<li><a href="/">3DST技术网</a></li>
					<li><a href="/">思衡网络</a></li>
				</ul>
			</div>
			<div class="visitors">
				<h3>
					<p>最近访客</p>
				</h3>
				<ul>
				</ul>
			</div>
		</aside>
	</article>
	<footer>
  <p>Design by Aidaima <a href="http://www.miitbeian.gov.cn/" target="_blank">湘ICP备15013214号</a> <a href="/">网站统计</a></p>
</footer>
<script src="js/silder.js"></script>
</body>
</html>