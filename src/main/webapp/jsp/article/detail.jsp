<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Map<String, Object> articleMap = (Map<String, Object>) request.getAttribute("articleMap");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
</head>
<body>
	<div>
		<div><a href="<%= request.getContextPath() %>/home/main">메인</a></div>
	</div>
	
	<h1>상세보기</h1>
	<div>번호: <%= articleMap.get("id") %></div>
	<div>작성일: <%= articleMap.get("regDate") %></div>
	<div>수정일: <%= articleMap.get("updateDate") %></div>
	<div>제목: <%= articleMap.get("title") %></div>
	<div>내용: <%= articleMap.get("body") %></div>
	
	<div>
		<a href="list">목록</a>
		<a href="modify?id=<%= articleMap.get("id") %>">수정</a>
		<a href="delete?id=<%= articleMap.get("id") %>" onclick="return confirm('삭제하시겠습니까?');">삭제</a>
	</div>
</body>
</html>