<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8" />
	<title>관리자 로그인</title>
	<!-- jquery, fontawesome -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://kit.fontawesome.com/07b67006ce.js"></script>
	
	<!-- css파일 및 js파일 -->
	<link rel="stylesheet" href="resources/wooki/css/common.css">
	<script src="resources/wooki/js/common.js"></script>
	<script>
		if('${loginUser}' != '' && fn_adminCheck(${loginUser.user_separator})) {
			location.href = 'adminIndex.wooki';
		}
		fn_loginCehck(${loginResult});
	</script>
	
</head>
<body>
	<div class="container border center">
        로그인<br/><br/>
        <form action="adminLogin.wooki" method="post">
            아이디<br/>
            <input type="text" name="email" id="email"><br/><br/>
            비밀번호<br/>
            <input type="password" name="password" id="password"><br/><br/>
			<input type="button" value="로그인하기" id="loginBtn" onclick="fn_login(this.form)">
        </form>
	</div>
</body>
</html>