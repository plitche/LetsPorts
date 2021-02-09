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

<script src="resources/joon/js/signUp.js"></script>

<style type="text/css">
	#authEmail {
		display: none;
	}
</style>

<script type="text/javascript">
//이메일 중복확인
//페이지 로드 이벤트
	$(document).ready(function(){
		emailCheck();
		emailAuth();
	});
	
	function emailCheck() {
		// 이메일 정규식
		var regEmail = /^[a-z][a-z0-9-_]+@[a-zA-Z0-9]{3,}(\.[a-zA-Z]{2,6}){1,2}$/;
		
		// 이메일 키업 체크
		$("#email").keyup(function(){
		var email = $("#email").val();
		var status = $("#authEmail").css('display'); // status 변수에 ID가 authEmail인 요소의 display의 속성을 '대입'
		
			$.ajax({
				url : 'emailCheck.hey',
				type : 'post',
				data : email,
				dataType : 'json',
				contentType : 'text/plain',
				success : function(data) {
					console.log("1 = 사용불가 / 0 = 사용가능 : "+ data);
					
					if (data.result == 1) {
						$("#email_check").text("이미 사용중인 이메일입니다.");
						$("#email_check").css('color', 'red');
						console.log("이메일중복");
						
						if(status == 'none'){ // status가 none 상태일경우 
							$("#authEmail").hide(); // ID가 authEmail인 요소를 hide();
						}
						
					} else {
						
						if(regEmail.test(email)){
							$("#email_check").text("사용가능한 이메일입니다.");
							$("#email_check").css('color', 'green');
							console.log("정규식 통과");
							
							if(status == 'none'){ // status가 none 상태일경우 
								$('#authEmail').show(); // ID가 authEmail인 요소를 show();
							}
				
						} else {
							$("#email_check").text('이메일 정보를 다시 확인하세요.');
							$("#email_check").css('color', 'red');
							console.log("이메일 정보 이상");
							
							if(status == 'none'){ // status가 none 상태일경우 
								$("#authEmail").hide(); // ID가 authEmail인 요소를 hide();
							}
							
						}
						
					}
				}, error : function() {
						console.log("실패");
				}
				
			})
		});
	}
	
	
//이메일 인증 전송
function emailAuth(){
	$(document).on("click", "#sendAuth_btn", function() {
		// alert('이메일 인증 시작!');
		var email = $("#email").val();
		
		var authKey; // 인증키
		/* 0 = 메일 전송 전, 1=메일 전송 됨*/
		
		$.ajax({
			url : "emailAuth.hey",
			type : "post",
			data : email,
			dataType : "json",
			contentType : "text/plain",
			success : function(data) {
				alert('인증번호 발송! 회원가입을 위해 꼭 인증 해주세요.');
				authKey = data.authKey;
				console.log(authKey);
					
			}, error : function() {
					console.log("뭐가 그리 문제야 say something!");
			}
			
		}); // ajax
		
		$("#successAuth_btn").click(function(){
			var authNum = $("#authNum").val();
			
			if(authNum != authKey) {
				alert('다시 인증 해주세요.');
				return;
				
			} else {
				alert('인증이 완료되었습니다.');
				$('#successAuth').text('인증 완료');
				$('#successAuth').css('color', 'green');
			}
			
		}); // keyup
		
	});
}
</script>
<!-- 생년월일 -->
<script type="text/javascript">
	
</script>
<!-- 주소 -->
<script type="text/javascript">
	
</script>
<!-- 관심분야 -->
<script type="text/javascript">

</script>

<!-- 회원가입하기! -->
<script type="text/javascript">
	function fn_signUpSubmit(f) {
		f.action='insertJoin.hey',
		f.submit();
	}
</script>

<title>회원가입 입력</title>
</head>
<body>

	<h3>회원가입</h3>

	<br />
	<br />
	<!-- wrapper는 나중에 css 작업에 용이하게 하기 위함 -->
	<div id="signUpWrapper">
		<form method="post">
			<!-- 닉네임 -->
			<div class="form-group">
				<label for="user_nickname">닉네임</label><br /> <input type="text"
					class="form-control" id="user_nickname" name="user_nickname"
					placeholder="닉네임 입력" required /><br />
				<div class="check_font" id="nick_check"></div>
				<br />
			</div>

			<!-- 이메일 -->
			<div class="form-group">
				<label for="email">이메일</label><br /> 
				<input type="text"	class="form-control" id="email" name="email" placeholder="이메일 주소 입력 (예: abcd123@domain.com)" /><br />
				<!-- emailCheck은 인증 완료 메세지를 위함 -->
				<div class="check_font" id="email_check"></div>
				<br />
			</div>
			<div class="check_font" id="authEmail">
				<label for="email">이메일 인증</label><br /> 
				<input type="text" id="authNum" placeholder="인증번호 입력" />
				<input type="button" id="sendAuth_btn" value="발송" />
				<input type="button" id="successAuth_btn" value="확인" />
				<!-- successAuth은 인증 완료 메세지를 위함 -->
				<div class="check_font" id="successAuth"></div><br />
			</div>


		<!-- 비밀번호 -->
			<div class="form-group">
				<label for="password">비밀번호 </label><br/>
				<input type="text" class="form-control" id='password' name="password" placeholder="비밀번호 입력(영문, 숫자, 특수문자(!@#%&_) 조합 8~16자)"><br/>
				<div class="check_font" id="pw_check"></div>
			</div>
			
		<!-- 비밀번호 확인 -->
			<div class="form-group">
				<label for="re_password">비밀번호 확인 </label><br/>
				<input type="text" class="form-control" id="re_password" name="re_password" placeholder="비밀번호 입력(영문, 숫자, 특수문자(!@#%&_) 조합 8~16자)"><br/>
				<div class="check_font" id="pw_reCheck"></div>
			</div>
			
			<!-- 생년월일 -->
			<div class="form-group">
				<label for="password">생년월일</label><br/>
				 <select name="birth_year" id="birth_year" title="년도" class="select_birth"></select>   
				 <select name="birth_month" id="birth_month" title="월" class="select_birth"></select>
				 <select name="birth_day" id="birth_day" title="일" class="sselect_birth"></select>
			</div>
			<br/>
			
			<!-- 주소 -->
			<div class="form-group">
				<label for="address">주소 </label><br/>
				<select id="location1" name="location1_no">
					<option id="none" value="">시/도 선택</option>
					<option id="seoul" value="0">서울특별시</option>
					<option id="incheon" value="1">인천광역시</option>
					<option id="gyeongi" value="2">경기도</option>
				</select>
				<select id="location2" name="location2_no">
					
				</select> 
			</div>
			
			<hr/>
			<!-- 관심분야 -->
			<div class="form-group">
				관심분야 <br/>
				<label><input type="checkbox" name="exercise_no" value="0">족구</label>
				<label><input type="checkbox" name="exercise_no" value="1">축구</label>
				<label><input type="checkbox" name="exercise_no" value="2">농구</label>
				<label><input type="checkbox" name="exercise_no" value="3">볼링</label><br/>
				<label><input type="checkbox" name="exercise_no" value="4">크로스핏</label>
				<label><input type="checkbox" name="exercise_no" value="5">스피닝</label>
				<label><input type="checkbox" name="exercise_no" value="6">댄스</label>
				<label><input type="checkbox" name="exercise_no" value="7">요가</label><br/>
				<label><input type="checkbox" name="exercise_no" value="8">명상</label>
			</div>
			<hr />

			<div>
				<input type="radio" id="이용약관" />(필수)
			</div>
			<br />
			<div>
				<input type="radio" id="개인정보처리방침" />(필수)<br /> <br />
			</div>

			<input type="button" id="signUpSubmit" value="회원가입하기" onclick="fn_signUpSubmit(this.form)">

		</form>
	</div>



</body>
</html>