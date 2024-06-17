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
<title>게시물 수정</title>
</head>
<body>
	<div>
		<div><a href="<%= request.getContextPath() %>/home/main">메인</a></div>
	</div>
	<h2>게시물 수정</h2>
	<form action="doModify" method="post">
		<input type="hidden" name="id" value="<%= articleMap.get("id") %>"/>
		<div>
			<div>
				<div>번호: <%= articleMap.get("id") %></div>
				<div>작성일: <%= articleMap.get("regDate") %></div>
				<div>수정일: <%= articleMap.get("updateDate") %></div>
				<div>작성자: <%= articleMap.get("writerName") %></div>
				<div>제목 : <input type="text" name="title" placeholder="제목을 입력해주세요." value="<%= articleMap.get("title") %>"/></div>
				<div>내용 : <textarea name="body"><%= articleMap.get("body") %></textarea></div>
			</div>
			
			<div>
				<button>수정</button>
				<a href="detail?id=<%= articleMap.get("id") %>">취소</a>
				<a href="delete?id=<%= articleMap.get("id") %>" onclick="return confirm('삭제하시겠습니까?');">삭제</a>
			</div>
		</div>
	</form>	
</body>
</html>