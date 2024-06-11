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
<title>detail</title>
</head>
<body>
	<div><a href="/article/list">main</a></div>
	<h1>detail</h1>
	<ul>
		<li>번호: <%= articleMap.get("id") %></li>
		<li>작성일: <%= articleMap.get("regDate") %></li>
		<li>수정일: <%= articleMap.get("updateDate") %></li>
		<li>제목: <%= articleMap.get("title") %></li>
		<li>내용: <%= articleMap.get("body") %></li>
	</ul>
</body>
</html>