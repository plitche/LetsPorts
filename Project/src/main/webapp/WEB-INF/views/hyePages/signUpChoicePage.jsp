<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="resources/joon/css/signUpChoicePage.css" >
<title>회원가입 선택</title>
</head>
<body>
	
	<div id="signUpChoice">
		<h3>회원가입</h3>
		<br/>
		<input type="button" value="일반 회원가입" class="choiceBtn1" onclick="location.href='usersSignUpPage.hey'"><br/>
		<button class="choiceBtns2"><img alt="kakaoLogo" src="resources/images/joon/kakao.png">카카오톡으로 가입</button><br/>
		<button class="choiceBtns3"><img alt="facebookLogo" src="resources/images/joon/facebook.png">페이스북으로 가입</button><br/>
		<br/>
		이미 회원이신가요?
		<a href="usersLoginPage.hey">로그인 하러가기</a>
	</div>

</body>
</html>