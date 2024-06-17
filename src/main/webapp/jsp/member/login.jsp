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
	
	<script>
	  const loginFormSubmit = function(form) {
	    let loginId = form.loginId.value.trim();
	    if (loginId.length == 0) {
	      alert( '아이디를 입력해주세요.' );
	      form.loginId.focus();
	      return;
	    }
	    
	    let loginPw = form.loginPw.value.trim();
	    if (loginPw.length == 0) {
	      alert( '비밀번호를 입력해주세요.' );
	      form.loginPw.value = "";
	      form.loginPw.focus();
	      return;
	    }
	    
	    form.submit();
	  }
	</script>
	
	<form action="doLogin" method="post" onsubmit="loginFormSubmit(this); return false;">
		<div>
			<div>
				<div>아이디 : <input type="text" name="loginId" placeholder="아이디를 입력해주세요."/></div>
				<div>비밀번호 : <input type="password" name="loginPw" placeholder="비밀번호를 입력해주세요." size="40"/></div>
			</div>
			
			<div>
				<button>로그인</button>
				<a href="<%= request.getContextPath() %>/member/join">회원가입</a>
				<a href="<%= request.getContextPath() %>/home/main">취소</a>
			</div>
		</div>
	</form>	
</body>
</html>