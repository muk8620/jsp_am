<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
</head>
<body>
	<h2>메인 페이지</h2>
	<div>
		<div><a href="<%= request.getContextPath() %>/home/main">main</a></div>
		<div><a href="<%= request.getContextPath() %>/article/list">list</a></div>
	</div>
</body>
</html>