<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include.jsp"%>
<!DOCTYPE html >
<div class="right">
	<div class="weather">
		<iframe width="250" scrolling="no" height="60" frameborder="0"
			allowtransparency="true"
			src="http://i.tianqi.com/index.php?c=code&id=12&icon=1&num=1"></iframe>
	</div>
	<div class="news">
		<h3>
				最新<span>文章</span>
		</h3>
		<ul class="newest">
			<c:forEach items="${newest }" var="news" varStatus="index">
				<li><a href="article.shtml?id=${news.articleId }">${news.title }</a></li>
			</c:forEach>
		</ul>
		<h3>
				文章<span>分类</span>
		</h3>
		<ul class="hot">
			<c:forEach items="${types }" var="type" varStatus="index">
				<li><a href="articletypecontent.shtml?typeId=${type.typeId }">${type.typeName }</a></li>
			</c:forEach>
			<c:if test="${typeCount > 5 }"><li><a href="articletypes.shtml">更多</a></c:if>
		</ul>
		<h3 class="links">
				友情<span>链接</span>
		</h3>
		<ul class="website">
			<li><a href="http://www.baidu.com" target="_blank">百度一下</a></li>
			<li><a href="http://www.swpu.edu.cn" target="_blank">西南石油大学</a></li>
			<li><a href="http://jquery.cuishifeng.cn/" target="_blank">JQueryAPI</a></li>
		</ul>
	</div>
	<!-- 分享 -->
	<!-- <div id="bdshare" class="bdshare_t bds_tools_32 get-codes-bdshare">
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
			</script> -->
	<!-- <a href="/" class="weixin"> </a> -->
</div>
</div>