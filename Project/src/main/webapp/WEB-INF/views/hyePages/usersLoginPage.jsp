<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="resources/joon/css/usersLoginPage.css" >

<title>로그인 페이지</title>


<script>
<!-- 모달창 만들기 위함 -->
    window.onload = function() {
 
    function onClick() {
        document.querySelector('.modal_wrap').style.display ='block';
        document.querySelector('.black_bg').style.display ='block';
    }   
    function offClick() {
        document.querySelector('.modal_wrap').style.display ='none';
        document.querySelector('.black_bg').style.display ='none';
    }
 
    document.getElementById('modal_btn').addEventListener('click', onClick);
    document.querySelector('.modal_close').addEventListener('click', offClick);
 
};
</script>
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
					<input type="text" id="email" placeholder="가입한 이메일 주소 입력"><br/><br/>
				  	<input type="button" value="임시 비밀번호 발송"><br/><br/>
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