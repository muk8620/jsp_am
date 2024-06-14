<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<h2>회원가입</h2>
	<form action="doJoin" method="post">
		<div>
			<div>
				<div>아이디 : <input type="text" name="loginId" placeholder="아이디를 입력해주세요."/></div>
				<div>비밀번호 : <input type="password" name="loginPw" placeholder="비밀번호를 입력해주세요." size="40"/></div>
				<div>비밀번호 확인 : <input type="password" name="loginPwChk" placeholder="비밀번호 확인을 입력해주세요." size="40"/></div>
				<div>이름 : <input type="text" name="name" placeholder="이름을 입력해주세요."/></div>
			</div>
			
			<div>
				<button>가입</button>
				<a href="<%= request.getContextPath() %>/home/main">취소</a>
			</div>
		</div>
	</form>	
</body>
</html>