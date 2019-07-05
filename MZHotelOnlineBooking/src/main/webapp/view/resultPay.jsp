<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		

	<h2><%= request.getAttribute("msg").toString() %></h2>
	<a href="../index.jsp">返回主页</a>
</body>
</html>