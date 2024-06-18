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
	
	<%@ include file="/jsp/common/topbar.jsp" %>
	
	<div>
		<div><a href="<%= request.getContextPath() %>/article/list">게시물 리스트</a></div>
	</div>
	
</body>
</html>