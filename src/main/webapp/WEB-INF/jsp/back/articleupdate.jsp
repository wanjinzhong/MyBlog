<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/blog/css/back_all.css" rel="stylesheet" type="text/css" />
<link href="css/articleupdate.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="ueditor/ueditor.all.min.js"></script>
<!-- 建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败
这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文 -->
<script type="text/javascript" charset="utf-8"
	src="ueditor/lang/zh-cn/zh-cn.js"></script>
<%@ include file="../include.jsp"%>
<title>Insert title here</title>
</head>
<script type="text/javascript">
	$(function() {
		$(".comfirm_update").click(function() {
			$("#contentText").val(editor.getContent());
		});
	})
	function changePic(file) {
		var prevImg = document.getElementById('coverPic');
		if (file.files && file.files[0]) {
			var reader = new FileReader();
			reader.onload = function(evt) {
				prevImg.src = evt.target.result;
			}
			reader.readAsDataURL(file.files[0]);
		} else {
			prevImg.src = file.value;
		}

	}
</script>
<body>
	<div class="place">
		<ul class="placeul">
			<li>当前位置：</li>
			<li><a href="contentindex.do">首页</a></li>
			<li>></li>
			<li><a href="myarticles.do">文章列表</a></li>
			<li>></li>
			<li>修改文章</li>
		</ul>
	</div>
	<div class="content">
		<form action="articleupdatesave.do" method="post"
			enctype="multipart/form-data">
			<table class="article_info">
				<tr>
					<td width="100px">文章ID</td>
					<td width="250px">${article.articleId }<input type="hidden"
						value="${article.articleId }" name="articleId" /></td>
					<td width="100px">文章标题</td>
					<td width="250px"><input type="text" value="${article.title }"
						name="title" /></td>
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
					<td><select name="type">
							<c:forEach items="${articleTypes }" var="type" varStatus="loop">
								<option value="${type.typeId }"
									<c:if test="${type.isDefault == 1 }">selected="selected"</c:if>>${type.typeName }</option>
							</c:forEach>
					</select></td>
					<td>关键词</td>
					<td><input type="text" value="${article.keyword }"
						name="keyword" /></td>
				</tr>
				<tr>
					<td>阅读量</td>
					<td>${article.reading}</td>
					<td colspan="2" style="text-align: right;"><a
						href="articleupdate.do?articleid=${article.articleId }"><img
							src="images/update.png" width="15px" />修改</a>&nbsp;&nbsp; <a
						href="articledelete.do?articleid=${article.articleId }"><img
							src="images/delete.png" width="15px" />删除</a></td>
				</tr>
				<tr>
					<td>封面图</td>
					<td><c:if test="${article.coverPic != null }">
							<img alt="封面图" id="coverPic" src="${article.coverPic}"
								style="width: 150px; height: 100px;">
						</c:if> <input type="file" name="file" id="pic"
						onchange="changePic(this)" accept="image/*" /></td>
				</tr>
			</table>
			<input type="hidden" id="contentText" name="content" />
			<textarea name="myComment" id="myEditor" style="margin: 20px">${article.content }</textarea>
			<script type="text/javascript">
				var editor = new UE.ui.Editor({});
				editor.render("myEditor");
				//1.2.4以后可以使用以下代码实例化编辑器
				/* UE.getEditor('myEditor'); */
			</script>
			<input type="submit" value="确定修改" class="comfirm_update">
		</form>
	</div>
</body>
</html>