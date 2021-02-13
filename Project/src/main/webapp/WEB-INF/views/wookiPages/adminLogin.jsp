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
	<div class="container loginBox">
        <h2>로그인</h2>
        <form action="adminLogin.wooki" method="post">
        	<table>
        		<tbody>
        			<tr>
        				<td>아이디</td>
        				<td>
				            <input type="text" name="email" id="email">
        				</td>
        			</tr>
        			<tr>
        				<td>비밀번호</td>
        				<td>
				            <input type="password" name="password" id="password">
        				</td>
        			</tr>
        			<tr>
        				<td colspan="2">
							<input type="button" value="로그인하기" id="loginBtn" onclick="fn_login(this.form)">
        				</td>
        			</tr>
        		</tbody>
        	</table>
        </form>
	</div>
</body>
</html>