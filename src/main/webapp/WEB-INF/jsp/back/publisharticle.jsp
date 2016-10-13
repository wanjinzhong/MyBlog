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
		$("#submittype")
				.click(
						function() {
							$("#contentText").val(editor.getContent());
							$
									.ajax({
										type : "GET",
										url : "ajaxaddarticletype.do",
										data : $("#form").serialize(),
										dataType : "json",
										success : function(json) {
											var select = "";
											var types = json.types;
											$
													.each(
															types,
															function(idx, obj) {
																select += "<option value=" + obj.typeId +
							">"
																		+ obj.typeName
																		+ "</option>";
															})
											$("#type").html(select);
										}
									});
							hideAddDiv()
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
	function check() {
		$("#contentText").val(editor.getContent());
		var title = $("#title").val();
		var content = $("#contentText").val();
		if ($.trim(title) == "") {
			alert("标题不能为空");
			return;
		} else if ($.trim(content) == "") {
			alert("内容不能为空");
			return;
		} else {
			$("#upload").submit();
		}
	}

	function displayAddDiv() {
		$("#mask, #addDiv").fadeIn(500);
	}
	function hideAddDiv() {
		$("#mask, #addDiv").fadeOut(500);
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
			<li>发表文章</li>
		</ul>
	</div>
	<div class="content">
		<form action="savenewarticle.do" id="upload" method="post"
			enctype="multipart/form-data">
			<table class="article_info">
				<tr>
					<td width="100px">文章标题</td>
					<td width="250px"><input type="text" name="title" id="title" /></td>
					<td width="100px">关键词</td>
					<td width="250px"><input type="text" name="keyword" /></td>
				</tr>
				<tr>

					<td>文章类型</td>
					<td><select name="type" id="type">
							<c:forEach items="${articleTypes }" var="type" varStatus="loop">
								<option value="${type.typeId }"
									<c:if test="${type.isDefault == 1 }">selected="selected"</c:if>>${type.typeName }</option>
							</c:forEach>
					</select> <img alt="添加文章类型" onclick="displayAddDiv()"
						style="margin-bottom: -7px" src="images/add.png" /></td>
					<td>封面图</td>
					<td><img alt="封面图" id="coverPic"
						style="width: 150px; height: 100px;"> <input type="file"
						name="file" onchange="changePic(this)" /></td>
				</tr>
			</table>
			<input type="hidden" id="contentText" name="content" />
			<textarea name="myComment" id="myEditor"
				style="margin: 20px; z-index: -1">${article.content }</textarea>
			<script type="text/javascript">
				var editor = new UE.ui.Editor({});
				editor.render("myEditor");
				//1.2.4以后可以使用以下代码实例化编辑器
				/* UE.getEditor('myEditor'); */
			</script>
			<input type="button" value="发布" onclick="check()"
				class="comfirm_publish" style="width: 60px; height: 35px;float: right;margin-right:20px">
		</form>
	</div>
	<%@ include file="addtype.jsp"%>
</body>
</html>