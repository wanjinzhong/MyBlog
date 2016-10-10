<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="../include.jsp" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/back_all.css" rel="stylesheet" type="text/css" />
<link href="css/back_header.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript">
function logout(){
	if(confirm("确定要退出登陆吗？")){
		window.top.location = "logout_back.do";
	}
}
</script>
<body>
	<div id="Header">
		<div class="user">
			<div>
				<span>欢迎登录，${bloggerName_back }</span>
				<a href="javascript:void(0)" onclick="logout()"><img src="images/common/ico07.gif" width="20"
					height="20" alt="退出登陆" title="退出登陆"></a>
			</div>
		</div>
		<div id="Navi">
			
			<ul>
				<li class="nav">
					<a href="myarticles.do" target="content">
						<img alt="文章" src="images/icon/blog.png">
						<span>文章</span>
					</a>			
				</li>
				<li class="nav">
					<a href="allcomment.do" target="content">
						<img alt="评论" src="images/icon/comment.png">
						<span>评论</span>
					</a>			
				</li>
				<li class="nav">
					<a href="allleaveword.do" target="content">
						<img alt="留言" src="images/icon/leaveword.png">
						<span>留言</span>
					</a>			
				</li>
				<li class="nav">
					<a href="info.do" target="content">
						<img alt="我的" src="images/icon/me.png">
						<span>我的</span>
					</a>			
				</li>
			</ul>
		</div>
	</div>
</body>
</html>