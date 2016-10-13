<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>后台</title>
<link href="css/back_all.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-3.1.0.js"></script>
<!-- <script src="js/side.js" type="text/javascript"></script> -->
</head>
<!-- <frameset cols="250px,*" border="0">
	<frame src="left.do" name="left">
	<frameset rows="87px,*" border="0">
		<frame src="header.do" name="header" noresize scrolling="no" >
		<frame src="contentindex.do" name="content" >
	</frameset>
</frameset> -->
<frameset rows="87px,*" border="0">
	<frame src="header.do" name="header" noresize scrolling="no">
	<frameset cols="250px,*" border="0">
		<frame src="left.do" name="left">
		<frame src="contentindex.do" name="content">
	</frameset>
</frameset>
</html>