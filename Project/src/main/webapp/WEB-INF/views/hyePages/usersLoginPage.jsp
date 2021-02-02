<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 페이지</title>

<style type="text/css">
</style>
<script>
// 모달창 테스트를 위한 스크립트!
</script>
<script type="text/javascript">
	// EL 태그는 if, script 안에서는 '' 안에 꼭 넣어줄것
	if('${loginResult}' == '0') {	// 숫자에도 ''표 붙여줘라!!
		alert('로그인 실패~!');
	} else if('${loginResult}' == '1') {
		alert('로그인 성공하셨습다.');
		location.href='../project';
	} else if('${loginUser}' != '') {
		alert('이미 로그인');
		location.href='../project';	// common controller를 이용한다.!
	
	function fn_loginCheck(f) {
		f.action = 'usersLogin.hey';
		f.submit();
	}
		
</script>
</head>
<body>
		<h3>로그인</h3>

		<form method="post">
			<input type="text" class="login_text" name="email" id="email" placeholder="E-MAIL" /><br/>
			<input type="password" class="login_text" name="password" id="password" placeholder="PASSWORD" /><br/>
			<input type="button" class="login_btns" value="로그인" id="loginBtn" onclick="fn_loginCheck(this.form)"><br/>
		</form>
				<!-- Button -->
		  <a id="openQNAModal"href="#">비밀번호 찾기</a>
		  
				<!-- 모달 창 테스트 -->
		  <!-- 
		<div id="modal">
	  		<div class="modal_content">
			    <button id="closeQNAModal">X</button>
			    <form>
			    	<input type="text" placeholder="E-MAIL" /><br/>
			    	<input type="button" >
			    </form>
		    </div>
	  	</div>
				
		   -->
		<div>
			아직 계정이 없으신가요? <br/>
			<a href="signUpChoicePage.hey">회원가입하기</a>
		</div>
		<div>
			<hr/>
			<input type="button" class="login_btns" value="페이스북으로 로그인"><br/>
			<input type="button" class="login_btns" value="카카오톡으로 로그인"><br/>
			<hr/>
		</div>
		<div>
			<a href="#">혹시 로그인이 안 되시나요?</a><br/>
		</div>
	
</body>
</html>