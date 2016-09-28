<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../header.jsp" %>
<title>Insert title here</title>
</head>
<body>
${user.userId }<br/>
${user.loginName }<br/>
${user.password }<br/>
${user.realName }<br/>
${user.birthday }<br/>
${user.sex }<br/>
${user.email }<br/>
${user.tel }<br/>
</body>
</html>