<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Map<String, Object>> articleListMap = (List<Map<String, Object>>) request.getAttribute("articleListMap");
	int totalPageCnt = (int) request.getAttribute("totalPageCnt");
	int cPage = (int) request.getAttribute("cPage");
	int from = (int) request.getAttribute("from");
	int end = (int) request.getAttribute("end");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 리스트</title>
</head>
<body>
	<div>
		<div><a href="<%= request.getContextPath() %>/home/main">메인</a></div>
		<div><a href="write">글쓰기</a></div>
	</div>
	<h1>리스트</h1>
	
	<table border='1'>
		<colgroup>
			<col width="100" />
			<col width="200" />
			<col width="300" />
		</colgroup>
		<tr>
			<th>번호</th>
			<th>작성일</th>
			<th>제목</th>
		</tr>
		<% 
		for (Map<String, Object> articleMap : articleListMap){ 
		%>
			<tr>
				<td><%= articleMap.get("id") %></td>
				<td><%= articleMap.get("regDate") %></td>
				<td><a href="detail?id=<%= articleMap.get("id") %>">  <%= articleMap.get("title") %></a></td>
			</tr>
		<% } %>
	</table>
	
	<style type="text/css">
		.red {
			color: red;
			font-size: 1.5rem;
		}
	</style>
	
	<div>
		<%
		if (from != 1) {
		%>
			<a href="?page=1">&lt;&lt;</a>
			<a href="?page=<%= from - 1 %>">◀</a>
		<%
		}
		%>
		<%
		if (end > totalPageCnt) {
			end = totalPageCnt;
		}
		%>
		<% 
		for (int i = from; i <= end; i++) {
		%>
			<a class="<%= cPage == i ? "red" : "" %>" href="?page=<%= i %>"><%= i %></a>
		<%
		}
		%>
		<%
		if (end != totalPageCnt) {
		%>
			<a href="?page=<%= end + 1 %>">▶</a>
			<a href="?page=<%= totalPageCnt %>">&gt;&gt;</a>
		<%
		}
		%>
	</div>	
</body>
</html>

