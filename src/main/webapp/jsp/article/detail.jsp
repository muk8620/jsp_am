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
		<div><a href="<%= request.getContextPath() %>/home/main">main</a></div>
		<div><a href="<%= request.getContextPath() %>/article/list">list</a></div>
		<div><a href="<%= request.getContextPath() %>/article/delete?id=<%= articleMap.get("id") %>">delete</a></div>
	</div>
	
	<h1>상세보기</h1>
	<ul>
		<li>번호: <%= articleMap.get("id") %></li>
		<li>작성일: <%= articleMap.get("regDate") %></li>
		<li>수정일: <%= articleMap.get("updateDate") %></li>
		<li>제목: <%= articleMap.get("title") %></li>
		<li>내용: <%= articleMap.get("body") %></li>
	</ul>
</body>
</html>