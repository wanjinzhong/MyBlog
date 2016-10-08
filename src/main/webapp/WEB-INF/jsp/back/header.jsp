<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="../include.jsp" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/back_all.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div id="Header">
		<div class="user">
			<div>
				<p>欢迎登录，${bloggerName_back }</p>
				<a href="#"><span>8</span><img src="images/common/ico02.gif"
					width="20" height="20" alt=""></a> <a href="#"><img
					src="images/common/ico03.gif" width="20" height="20" alt=""></a>
				<a href="#"><img src="images/common/ico04.gif" width="20"
					height="20" alt=""></a> <a href="#"><img
					src="images/common/ico05.gif" width="20" height="20" alt=""></a>
				<a href="#"><img src="images/common/ico06.gif" width="20"
					height="20" alt=""></a> <a href="#"><img
					src="images/common/ico07.gif" width="20" height="20" alt=""></a>
			</div>
			<div class="search_box">
				<input name="" type="image"
					src="CN_HTML5/images/common/btn_search.gif"><input
					name="" type="text" class="box" placeholder="Search...">
			</div>
		</div>

		<nav>
		<div id="Navi">
			<div class="btn_menu">
				<img src="images/common/btn_menu.gif" width="45" height="30"
					alt="主页管理">
			</div>
			<ul>
				<li class="nav01"><a href="" title="主页管理">主页管理</a></li>
				<li class="nav02"><a href="" title="系统管理">系统管理</a></li>
				<li class="active nav03"><a href="" title="合同信息">合同信息</a></li>
				<li class="nav04"><a href="" title="基础数据">基础数据</a></li>
				<li class="nav05"><a href="" title="预算管理">预算管理</a></li>
				<li class="nav06"><a href="" title="项目管理">项目管理</a></li>
				<li class="nav07"><a href="" title="资金支付-发票">资金支付-发票</a></li>
				<li class="nav08"><a href="" title="产品管理信息">产品管理信息</a></li>
			</ul>
		</div>
		</nav>
	</div>
</body>
</html>