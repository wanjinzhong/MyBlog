<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录界面</title>

<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/login_reg_style.css" />

<script src="js/jquery-3.1.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		$('#login').click(function() {
			var name_state = $('#name');
			var psd_state = $('#psd');
			var name = $('#name').val();
			var psd = $('#psd').val();
			if (name == '') {
				name_state.parent().next().next().css("display", "block");
				return false;
			} else if (psd == '') {
				name_state.parent().next().next().css("display", "none");
				psd_state.parent().next().next().css("display", "block");
				return false;
			} else {
				name_state.parent().next().next().css("display", "none");
				psd_state.parent().next().next().css("display", "none");
				$('.login').submit();
			}
			$.ajax({
				type : "post",
				url : "check.shtml",
				data : "name=" + name + "&password=" + psd,
			});
		});
		$('#register').click(
				function() {
					var name_r_state = $('#name_r');
					var psd_r_state = $('#psd_r');
					var affirm_psd_state = $('#affirm_psd');
					var name_r = $('#name_r').val();
					var psd_r = $('#psd_r').val();
					var affirm_psd = $('#affirm_psd').val();
					var checked = $("#checkbox").prop("checked");
					var blogger_name = $("#bloggerName").val();
					if (name_r == '') {
						alert("请输入用户名");
						return false;
					} else if (psd_r == '') {
						alert("请输入密码");
						return false;
					} else if (affirm_psd == '') {
						alert("请输入确认密码");
						return false;
					} else if (psd_r != affirm_psd) {
						alert("两次密码不一致");
						return false;
					} else if (checked && blogger_name == ""){
						alert("博客名不能为空");
						return false;
					}
					else {
						$('.register').submit();
					}
				})
		$("#checkbox").on("change", function() {
			if ($(this).prop("checked"))
				$(".moreInfo").fadeIn(1000);
			else
				$(".moreInfo").fadeOut(500);
		});
		$("#login_back").click(function(){
			var name_state = $('#name');
			var psd_state = $('#psd');
			var name = $('#name').val();
			var psd = $('#psd').val();
			if (name == ""){
				alert("用户名不能为空");
				return;
			} else if(psd == ""){
				alert("密码不能为空");
				return;
			} else{
				$(".login").attr("action","login_back.do");
				$(".login").submit();
			}
		});
	})

	function ok_or_errorBylogin(l) {
		var content = $(l).val();
		if (content != "") {
			$(l).parent().next().next().css("display", "none");
		}
	}

	function ok_or_errorByRegister(r) {
		var affirm_psd = $("#affirm_psd");
		var psd_r = $("#psd_r");
		var affirm_psd_v = $("#affirm_psd").val();
		var psd_r_v = $("#psd_r").val();
		var content = $(r).val();
		if (content == "") {
			$(r).parent().next().next().css("display", "block");
			return false;
		} else {
			$(r).parent().next().css("display", "block");
			$(r).parent().next().next().css("display", "none");
			if (psd_r_v == "") {
				$(psd_r).parent().next().css("display", "none");
				$(psd_r).parent().next().next().css("display", "none");
				$(psd_r).parent().next().next().css("display", "block");
				return false;
			}
			if (affirm_psd_v == "") {
				$(affirm_psd_v).parent().next().css("display", "none");
				$(affirm_psd_v).parent().next().next().css("display", "none");
				$(affirm_psd_v).parent().next().next().css("display", "block");
				return false;
			}
			if (psd_r_v == affirm_psd_v) {
				$(affirm_psd).parent().next().css("display", "none");
				$(affirm_psd).parent().next().next().css("display", "none");
				$(psd_r).parent().next().css("display", "none");
				$(psd_r).parent().next().next().css("display", "none");
				$(affirm_psd).parent().next().css("display", "block");
				$(psd_r).parent().next().css("display", "block");
			} else {
				$(affirm_psd).parent().next().css("display", "none");
				$(affirm_psd).parent().next().next().css("display", "none");
				$(psd_r).parent().next().css("display", "none");
				$(psd_r).parent().next().next().css("display", "none");
				$(psd_r).parent().next().css("display", "block");
				$(affirm_psd).parent().next().next().css("display", "block");
				return false;
			}
		}
	}

	function barter_btn(bb) {
		$(bb).parent().parent().fadeOut(500);
		$(bb).parent().parent().siblings().fadeIn(1000);
		$(".moreInfo").css("display", "none");
	}
</script>
</head>

<body class="login_body">

	<div class="login_div">
		<div class="col-xs-12 login_title">登录</div>
		<form action="check.shtml" class="login" method="post">
			<div class="nav">
				<div class="login_nav">
					<span class="login_username">用户名:</span> <input type="text"
						name="name" id="name" />
					<div class="col-xs-1 ok_gou">√</div>
					<div class="col-xs-1 error_cuo">×</div>
				</div>
				<div class="login_psdNav">
					<span class="login_password">密&nbsp;&nbsp;&nbsp;码:</span> <input
						type="password" name="password" id="psd" />
					<div class="col-xs-1 ok_gou">√</div>
					<div class="col-xs-1 error_cuo">×</div>
				</div>
				<div class="col-xs-12 login_btn_div">
					<input type="submit" class="sub_btn" value="登录前台" id="login_front" />&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="登陆后台" class="sub_btn" id="login_back"_/>
				</div>
			</div>
		</form>

		<div class="col-xs-12 barter_btnDiv">
			<button class="barter_btn" onClick="javascript:barter_btn(this)">没有账号?前往注册</button>
		</div>
	</div>

	<div class="register_body">
		<div class="col-xs-12 register_title">注册</div>
		<form action="register.shtml" class="register" method="post">
			<div class="nav">
				<div class="register_nav">
					<span class="login_username">用户名:</span>
						<input type="text" name="name_r" id="name_r"/>
					<div class="col-xs-1 ok_gou">√</div>
					<div class="col-xs-1 error_cuo">×</div>
				</div>
				<div class="register_psdnav">
					<span class="password">密&nbsp;&nbsp;&nbsp;码:</span> <input
						type="password" name="psd_r" id="psd_r"/>
					<div class="col-xs-1 ok_gou">√</div>
					<div class="col-xs-1 error_cuo">×</div>
				</div>
				<div class="register_affirm">
					<span class="repassword">确认密码:</span> <input type="password"
						name="affirm_psd" id="affirm_psd" />
					<div class="col-xs-1 ok_gou">√</div>
					<div class="col-xs-1 error_cuo">×</div>
				</div>
				<div class="openBlog">
					<input type="checkbox" id="checkbox" name="checkbox"/>&nbsp;&nbsp;同时开通博客
				</div>
				<div class="moreInfo">
					博客名：<input type="text" display="none" id="bloggerName" name="bloggerName" />
				</div>
				<div class="col-xs-12 register_btn_div">
					<input type="submit" class="sub_btn" value="注册" id="register" />
				</div>
			</div>
		</form>
		<div class="col-xs-12 barter_register">
			<button class="barter_registerBtn"
				onClick="javascript:barter_btn(this)" style="">已有帐号?返回登录</button>
		</div>
	</div>
</body>
</html>