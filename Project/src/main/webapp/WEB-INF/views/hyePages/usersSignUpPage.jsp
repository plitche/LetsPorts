<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- jQuery --%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

<script src="resources/joon/js/users.js"></script>
<script type="text/javascript">
// 회원가입 이메일 인증(1 = 인증 / 0 != 인증)
// 페이지 로드 이벤트
	$(document).ready(function(){
		
	});


	$(function(){
		$("#confirmEmail").click(function(){
			$.ajax({
				url : "",
				type : "POST",
				data : {
					id : $("#id").val(),
					email : $("#email").val()
				},
				success : function(result) {
					alert(result);
				},
			})
		});
	})

</script>
<script type="text/javascript">

// 비밀번호 영문, 숫자 조합 8-16자
// 비밀번호 정규식
//	var pwJ = /^[A-Za-z0-9]{8,16}$/; 
$(document).ready(function() {
	pwCheck();
});

function pwCheck(){
	var empJ = /\s/g;
	var pwJ = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#%&_])[A-Za-z0-9!@#%&_]{8,16}$/;
    var checkHangul = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;

	$('#password').keyup(function(){
		var password = $('#password').val();
		$.ajax({
			url : 'pwCheck.hey/' + password,
			type : 'post',
			dataType : 'json',
			success : function(data) {
				console.log("0 = 사용가능/ 1 = 사용불가한 비밀번호");
				if(data.result == 1) {
				if(pwJ.test(password)){
					$('#pw_check').text("사용가능한 비밀번호입니다.");
					$('#pw_check').css('color', 'green');
					$('#signUpSubmit').attr("disabled", 0);
					console.log("사용가능한 비밀번호");
					
				} else if(empJ.test(password)) {
					$('#pw_check').text("공백은 사용하실 수 없습니다.");
					$('#pw_check').css('color', 'red');
					$('#signUpSubmit').attr("disabled", 1);
					console.log("공백 실패");
					
				} else if(checkHangul.test(password)) {
					$('#pw_check').text("비밀번호에 한글을 사용 할 수 없습니다.");
					$('#pw_check').css('color', 'red');
					$('#signUpSubmit').attr("disabled", 1);
					console.log("한글 실패");
					
				} else {
					$('#pw_check').text("영문, 숫자, 특수문자(!@#%&_) 조합 8~16자 이내에서 사용 가능합니다.");
					$('#pw_check').css('color', 'red');
					$('#signUpSubmit').attr("disabled", 1);
					console.log("영문, 숫자, 특 조합 실패");
					
				}
					
				}
				
			}, error : function() {
				console.log("실패");
			}
	});
});

</script>

<title>회원가입 입력</title>
</head>
<body>

	<h3>회원가입</h3>
	
	*은 반드시 기재되어야 하는 항목입니다.
	<br/><br/>
	<!-- wrapper는 나중에 css 작업에 용이하게 하기 위함 -->
	<div id="signUpWrapper">
		<form method="post" >
		<!-- 닉네임 -->
			<div class="form-group">
				<label for="user_nickname">닉네임 *</label><br/>
					<input type="text" class="form-control" id="user_nickname" name="user_nickname" placeholder="닉네임 입력" required/><br/>
					<div class="check_font" id="nick_check"></div><br/>
			</div>
							
		<!-- 이메일 -->
			<div class="form-group">
				<label for="email">이메일 *</label><br/>
				<input type="text" class="form-control" id="email" name="email" placeholder="이메일 주소 입력 (예: abcd123@domain.com)" />
				<input type="button" value="인증번호 발송" id="confirmEmail" onclick="confirmEmail()"/><br/>
				
			</div>
			
		<!-- 비밀번호 -->
			<div class="form-group">
				<label for="password">비밀번호 *</label><br/>
				<input type="password" class="form-control" id='password' name="password" placeholder="비밀번호 입력(영문, 숫자, 특수문자(!@#%&_) 조합 8~16자)"><br/>
				<div class="check_font" id="pw_check"></div>
			</div>
		<!-- 비밀번호 확인 -->
			<div class="form-group">
				<label for="re_password">비밀번호 확인 *</label><br/>
				<input type="password" class="form-control" id="re_password" name="re_password" placeholder="비밀번호 입력(영문, 숫자, 특수문자(!@#%&_) 조합 8~16자)"><br/>
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
				<label for="address">주소 *</label><br/>
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
				<label><input type="checkbox" name="0" value="족구">족구</label>
				<label><input type="checkbox" name="1" value="축구">축구</label>
				<label><input type="checkbox" name="2" value="농구">농구</label>
				<label><input type="checkbox" name="3" value="볼링">볼링</label><br/>
				<label><input type="checkbox" name="4" value="크로스핏">크로스핏</label>
				<label><input type="checkbox" name="5" value="스피닝">스피닝</label>
				<label><input type="checkbox" name="6" value="댄스">댄스</label>
				<label><input type="checkbox" name="7" value="요가">요가</label><br/>
				<label><input type="checkbox" name="8" value="명상">명상</label>
				<label><input type="checkbox" name="9" value="다이어트정보">다이어트정보</label>
				<label><input type="checkbox" name="10" value="건강정보">건강정보</label>
				<label><input type="checkbox" name="11" value="식단정보">식단정보</label><br/>
			</div>
			<hr/>
			
			<div>
				<input type="radio" id="이용약관" />(필수)
			</div><br/>
			<div>
				<input type="radio" id="개인정보처리방침" />(필수)<br/><br/>
			</div>
			
			<input type="button" id="signUpSubmit" value="회원가입하기" onclick="fn_signUpSubmit(this.form)">
			
		</form>
	</div>
	
	
	
</body>
</html>