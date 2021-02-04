<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="resources/joon/js/users.js"></script>

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
				<label for="user_nickname">닉네임 *</label>
					<input type="text" class="user_nickname" id="user_nickname" name="user_nickname" placeholder="닉네임 입력" required/>
					<div class="check_font" id="nick_check"></div>
			</div>
							
		<!-- 이메일 -->
			이메일 *<br/>
			<input type="text" name="email" placeholder="이메일 주소 입력 (예: abcd123@domain.com)" />
			<input type="button" value="메일 인증" /><br/>
			
		<!-- 비밀번호 -->
			비밀번호 *<br/>
			<input type="password" name="password" placeholder="비밀번호 입력(영문 숫자 조합 8~16자)"><br/>
			비밀번호 확인 *<br/>
			<input type="password" name="re_password" placeholder="비밀번호 입력(영문 숫자 조합 8~16자)"><br/>
			
			<!-- 생년월일을 select을 이용할 지, 유저가 직접 입력하게 할 지,,? -->
			생년월일
			<br/>
			
			
			<!-- 어떻게 할 지 고민 중임,, -->
			주소 *<br/>
			<select name="location1">
				<option label="서울특별시">서울특별시</option>
				<option label="인천광역시">인천광역시</option>
				<option label="경기도">경기도</option>
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
			
			<hr/>
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
			<hr/>
			
			<input type="radio" id="이용약관" />(필수)<br/>
			<input type="radio" id="개인정보처리방침" />(필수)<br/><br/>
			
			<input type="button" value="회원가입하기" onclick="location.href='마이페이지로 이동'">
			
		</form>
	</div>
	
	
	
</body>
</html>