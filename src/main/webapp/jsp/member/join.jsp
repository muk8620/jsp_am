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
	  const joinFormSubmit = function(form) {
	    let loginId = form.loginId.value.trim();
	    if (loginId.length == 0) {
	      alert( '아이디를 입력해주세요.' );
	      form.loginId.focus();
	      return;
	    }
	    
	    let loginPw = form.loginPw.value.trim();
	    if (loginPw.length == 0) {
	      alert( '비밀번호를 입력해주세요.' );
	      form.loginPw.focus();
	      return;
	    }
	    
	    let loginPwChk = form.loginPwChk.value.trim();
	    if (loginPw != loginPwChk) {
	      alert('비밀번호를 확인해주세요.');
	      form.loginPw.value = "";
	      form.loginPwChk.value = "";
	      form.loginPw.focus();
	      return;
	    }
	    
	    let name = form.name.value.trim();
	    if (name.length == 0) {
	      alert( '이름을 입력해주세요.' );
	      return;
	    }
	    
	    form.submit();
	  }
	</script>
	
	<form action="doJoin" method="post" onsubmit="joinFormSubmit(this); return false;">
		<div>
			<div>
				<div>아이디 : <input type="text" name="loginId" placeholder="아이디를 입력해주세요."/></div>
				<div>비밀번호 : <input type="password" name="loginPw" placeholder="비밀번호를 입력해주세요." size="40"/></div>
				<div>비밀번호 확인 : <input type="password" name="loginPwChk" placeholder="비밀번호 확인을 입력해주세요." size="40"/></div>
				<div>이름 : <input type="text" name="name" placeholder="이름을 입력해주세요."/></div>
			</div>
			
			<div>
				<input type="submit" value="가입"/>
				<a href="<%= request.getContextPath() %>/home/main">취소</a>
			</div>
		</div>
	</form>	
</body>
</html>