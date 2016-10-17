<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="../include.jsp"%>
<script type="text/javascript">
$(function(){
	$("#search").click(function(){
		window.location = "search.shtml?word=" + $("#search_word").val();
	});
});
</script>
<body>
	<div style="margin-bottom: 20px">
		<input type="text" placeholder="search..." id="search_word"
			style="width: 200px; height: 20px; border-radius: 5px; border: solid #bbb 1px;" value="${word }"/>
		<img alt="搜索" src="images/search.jpg"
			style="width: 20px; height: 20px; padding-top: 2px"
			id="search" />
	</div>
</body>
</html>