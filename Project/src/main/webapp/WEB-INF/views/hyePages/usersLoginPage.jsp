<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- jQuery --%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>
<%-- sweetalert --%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<link type="text/css" rel="stylesheet" href="resources/joon/css/usersLoginPage.css" >
<script src="resources/joon/js/usersLoginPage.js"></script>



<title>로그인 페이지</title>


<script type="text/javascript">
// EL 태그는 if, script 안에서는 '' 안에 꼭 넣어줄것
if('${loginResult}' == '0') {	// 숫자에도 ''표 붙여줘라!!
	alert('로그인 정보가 일치하지 않습니다. 다시 확인해주세요.');
} else if('${loginResult}' == '1') {
	alert('환영합니다!');
	location.href='../project';
} else if('${loginUser}' != '') {
	alert('이미 로그인 상태입니다.');
	location.href='../project';	// common controller를 이용한다.!
}

function fn_loginCheck(f) {
	f.action = 'usersLogin.hey';
	f.submit();
}

// 이 페이지에서 스윗 알람 안되고 있음,,,
</script>


</head>
<body>
		<h3>로그인</h3>

		<form method="post">
			<input type="text" class="login_text" name="email" id="email" placeholder="E-MAIL" /><br/>
			<input type="password" class="login_text" name="password" id="password" placeholder="PASSWORD" /><br/>
			<input type="button" class="login_btns" value="로그인" id="loginBtn" onclick="fn_loginCheck(this.form)"><br/>
		</form>
				<!-- 모달 창으로 비밀번호 확인 -->
		<p><a href="#" id="modal_btn">비밀번호 찾기</a></p><br/>
			<div class="black_bg"></div>
			<div class="modal_wrap">
				<p class="modal_close" ><a href="#">X</a></p>
				<div id="verification_content">
					<h3>임시 비밀번호 발급</h3>
					<input type="text" id="regEmail" name="email" placeholder="가입한 이메일 주소 입력"><br/>
					<!-- emailCheck은 발송확인 메세지를 위함 -->
					<div class="check_font" id="email_check"></div>
				  	<input type="button" id="sendTempPw" value="임시 비밀번호 발송"><br/><br/>
				</div>
			</div>
		
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