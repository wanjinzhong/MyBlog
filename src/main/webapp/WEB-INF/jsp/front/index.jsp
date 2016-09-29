<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="include.jsp"%>
<title>万进忠的博客</title>
<meta name="keywords" content="万进忠" />
<meta name="description" content="万进忠的博客" />
<link href="css/base.css" rel="stylesheet">
<link href="css/index.css" rel="stylesheet">

</head>
<body>
	<%@include file="header.jsp"%>
	<div class="banner">
		<section class="box">
			<!-- <ul class="texts"> -->
			<p>打了死结的青春，捆死一颗苍白绝望的灵魂。</p>
			<p>为自己掘一个坟墓来葬心，红尘一梦，不再追寻。</p>
			<p>加了锁的青春，不会再因谁而推开心门。</p>
			<!-- 	</ul> -->
			<div class="avatar">
				<a href="#"><span>爱代码</span></a>
			</div>
		</section>
	</div>
	<div class="template"></div>
	<article>
		<h2 class="title_tj">
			<p>
				文章<span>推荐</span>
			</p>
		</h2>
		<div class="bloglist left">
			<c:forEach items="${list }" var="article" varStatus="index">
				<div>
					<h3>${article.title }</h3>
					<figure>
						<img src="images/001.png">
					</figure>
					<ul>
						<p>
							<c:choose>
								<c:when test="${fn:length(article.content) > 100 }">
								${fn:substring(article.content, 0, 100)}...
							</c:when>
								<c:otherwise>
								${article.content }
							</c:otherwise>
							</c:choose>
						</p>
						<a href="article.do?id=${article.articleId }" class="readmore">阅读全文>></a>
					</ul>
					<p class="dateview">
						<span> <fmt:formatDate value="${article.updateTime }"
								pattern="yyyy-MM-dd" />
						</span><span>作者：${article.bloggerName }</span><span>个人博客：[<a
							href="/news/life/">程序人生</a>]
						</span>
						<span>阅读量：${article.reading }</span>
					</p>
				</div>
			</c:forEach>
		</div>
		<aside class="right">
			<div class="weather">
				<iframe width="250" scrolling="no" height="60" frameborder="0"
					allowtransparency="true"
					src="http://i.tianqi.com/index.php?c=code&id=12&icon=1&num=1"></iframe>
			</div>
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
				document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion="
						+ Math.ceil(new Date() / 3600000)
			</script>
			<!-- Baidu Button END -->
			<a href="/" class="weixin"> </a>
		</aside>
	</article>
	<footer>
		<p>
			Design by Aidaima&nbsp;<a href="http://www.miitbeian.gov.cn/"
				target="_blank">湘ICP备15013214号</a> <a href="/">网站统计</a>
		</p>
	</footer>
	<script src="js/silder.js"></script>
</body>
</html>