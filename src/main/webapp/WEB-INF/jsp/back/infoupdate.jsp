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
<script type="text/javascript">
function changePic(file){
	/* var oMyForm = new FormData();
	oMyForm.append("file", $('#pic')[0].files[0]);
	$.ajax({
		type:"post",
		contentType:"multipart/form-data",
		url:"getPic.do",
		cache: false,
	    data: oMyForm,
	    processData: false,
	    contentType: false,
	    async: false,
		success:function(picUrl){
			$("#userPic").attr("src", picUrl);
		}
	}); */
		var prevImg = document.getElementById('userPic');
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
			<li>我的信息</li>
		</ul>
	</div>
	<div class="content">
		<form action="saveinfo.do" id="save" method="post" enctype="multipart/form-data">
			<table class="article_info">
				<tr>
					<td width="100px">用户ID</td>
					<td width="250px">${blogger.userId }<input type="hidden" value="${blogger.userId }" name="userId"/></td>
					<td width="100px">用户名</td>
					<td width="250px"><input type="text"
						value="${blogger.loginName }" name="loginName"/></td>
				</tr>
				<tr>
					<td width="100px">博主ID</td>
					<td width="250px">${blogger.bloggerId }<input type="hidden" value="${blogger.bloggerId }" name="bloggerId" /></td>
					<td width="100px">博客名</td>
					<td width="250px"><input type="text"
						value="${blogger.bloggerName }" name="bloggerName"/></td>
				</tr>
				<tr>
					<td width="100px">真实姓名</td>
					<td width="250px"><input type="text"
						value="${blogger.realName }" name="realName"/></td>
					<td width="100px">性别</td>
					<td width="250px"><input type="radio" name="sex" value="male"
						<c:if test="${blogger.sex == 1 }">checked="checked"</c:if> />男 <input
						type="radio" name="sex" value="famale"
						<c:if test="${blogger.sex == 0 }">checked="checked"</c:if> />女</td>
				</tr>
				<tr>
					<td width="100px">电话</td>
					<td width="250px"><input type="text" value="${blogger.tel }" name="tel"/></td>
					<td width="100px">电子邮箱</td>
					<td width="250px"><input type="text" value="${blogger.email}" name="email"/></td>
				</tr>
				<tr>
					<td width="100px">QQ</td>
					<td width="250px"><input type="text" value="${blogger.qq }" name="qq"/></td>
					<td width="100px">生日</td>
					<td width="250px"><input type="text" id="datepicker"
						onclick="WdatePicker()" name="birthday" value='<fmt:formatDate value="${blogger.birthday }" pattern="yyyy-MM-dd"/>'/></td>
				</tr>
				<tr>
					<td width="100px">头像</td>
					<td width="250px"><img alt="头像" src="${blogger.imageUrl}"
						id="userPic" style="width: 100px; height: 100px"><input type="file" name="file" id="pic" onchange="changePic(this)"/></td>
					<td width="100px">自我介绍</td>
					<td width="250px"><textarea name="introduce">${blogger.introduce}</textarea></td>
				</tr>
			</table>
			<input type="submit" name="submit" value="保存" class="save"  />
		</form>
	</div>
</body>
</html>