<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
</head>
<body>
	<h2>게시물 작성</h2>
	
	<form action="doWrite" method="post">
		<div>
			<div>제목 : <input type="text" name="title" placeholder="제목을 입력해주세요." /></div>
			<div>내용 : <textarea name="body"></textarea></div>
		</div>
		<button>작성</button>
		<a href="list">취소</a>
	</form>	
</body>
</html>