<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- jQuery --%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

<script src="resources/joon/js/users.js"></script>

<!-- 회원가입을 위한 ajax 모임 -->
<script type="text/javascript">

/*정규식 체크
	//모든 공백 체크 정규식
	var empJ = /\s/g;
	//닉네임 정규식
	// 비밀번호 정규식
	var pwJ = /^[A-Za-z0-9]{8,16}$/; 
	// 이메일 검사 정규식
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
*/	

// 페이지 로드
$(document).ready(function() {
	nickCheck();
});

// 

//닉네임 유효성 검사(1 = 중복 / 0 != 중복)
	var nickJ = /^[a-zA-Z0-9가-힣]{1,14}$/;
	$("#user_nickname").keyup(function() {
		// id = "id_reg" / name = "userId"
		var user_nickname = $('#user_nickname').val();
		$.ajax({
			url : 'nickCheck.hey=user_nickname?' + user_nickname,
			type : 'get',
			dataType : 'json',
			success : function(data.result) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data.result == 1) {
						// 1 : 닉네임이 중복되는 문구s
						$("#nick_check").text("이미 사용중인 닉네임입니다.");
						$("#nick_check").css("color", "red");
						$("#reg_submit").attr("disabled", 1);
					} else {
						
						if(nickJ.test(user_nickname)){
							// 0 : 닉네임 길이 / 문자열 검사
							$("#nick_check").text("");
							$("#signUpSubmit").attr("disabled", 0);
				
						} else if(user_nickname == ""){
							
							$('#nick_check').text('닉네임을 입력해주세요 :)');
							$('#nick_check').css('color', 'red');
							$("#signUpSubmit").attr("disabled", 1);				
							
						} else {
							
							$('#nick_check').text("닉네임은 한글, 영어, 숫자만 가능합니다 :) :)");
							$('#nick_check').css('color', 'red');
							$("#signUpSubmit").attr("disabled", 1);
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
				<input type="button" value="메일 인증" onclick="confirm_email()"/><br/>
			</div>
			<div class="form-group">
				<label for=""></label><br/>
			</div>
		<!-- 비밀번호 -->
			<div class="form-group">
				<label for="password">비밀번호 *</label><br/>
				<input type="password" class="form-control" id='password' name="password" placeholder="비밀번호 입력(영문 숫자 조합 8~16자)"><br/>
			</div>
			<div class="form-group">
				<label for="re_password">비밀번호 확인 *</label><br/>
				<input type="password" class="form-control" id="re_password" name="re_password" placeholder="비밀번호 입력(영문 숫자 조합 8~16자)"><br/>
			</div>
			
			<!-- 생년월일을 select을 이용할 지, 유저가 직접 입력하게 할 지,,? -->
			<div class="form-group">
				<label for="password">생년월일</label><br/>
				 <select name="birth_year" id="birth_year" title="년도" class="select_birth"></select>   
				 <select name="birth_month" id="birth_month" title="월" class="select_birth"></select>
				 <select name="birth_day" id="birth_day" title="일" class="sselect_birth"></select>
			</div>
			<br/>
			
			
			<!-- 어떻게 할 지 고민 중임,, -->
			<div class="form-group">
				주소 *<br/>
				<select name="location1">
					<option id="0" label="서울특별시">서울특별시</option>
					<option id="1" label="인천광역시">인천광역시</option>
					<option id="2" label="경기도">경기도</option>
				</select>
				<select name="location2">
					<optgroup label="서울특별시">
						<option>강남구</option>
						<option>강동구</option>
						<option>강북구</option>
						<option>강서구</option>
						<option>관악구</option>
						<option>광진구</option>
						<option>구로구</option>
						<option>금천구</option>
						<option>노원구</option>
						<option>도봉구</option>
						<option>동대문구</option>
						<option>동작구</option>
						<option>마포구</option>
						<option>서대문구</option>
						<option>서초구</option>
						<option>성동구</option>
						<option>성북구</option>
						<option>송파구</option>
						<option>양천구</option>
						<option>영등포구</option>
						<option>용산구</option>
						<option>은평구</option>
						<option>종로구</option>
						<option>중구</option>
						<option>중랑구</option>
					</optgroup>
					<optgroup label="인천광역시">
						<option>계양구</option>
						<option>남구</option>
						<option>남동구</option>
						<option>동구</option>
						<option>부평구</option>
						<option>서구</option>
						<option>연수구</option>
						<option>중구</option>
						<option>강화군</option>
						<option>옹진군</option>
					
					</optgroup>
				</select><br/>
			</div>
			
			<hr/>
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
			
			<input type="button" id="signUpSubmit" value="회원가입하기" onclick="location.href='마이페이지로 이동'">
			
		</form>
	</div>
	
	
	
</body>
</html>