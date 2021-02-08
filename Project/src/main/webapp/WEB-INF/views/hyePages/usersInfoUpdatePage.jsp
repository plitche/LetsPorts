<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 수정 페이지</title>
<script type="text/javascript">
	
</script>
</head>
<body>
	<h3>회원정보 수정</h3>
	닉네임<br/>
	<input type="text" value="닉네임 체크" onclick="fn_nickCheck(this.form)"><br/>
	
	이메일<br/>
	본인 이메일** <br/>
	
	변경할 비밀번호<br/>
	<input type="password" id="password" name="password" placeholder="비밀번호 입력(영문 숫자 조합 8~16자)" ><br/>
	변경할 비밀번호<br/>
	<input type="password" id="password" name="password" placeholder="비밀번호 입력(영문 숫자 조합 8~16자)" ><br/>
	
	생년월일<br/>
	본인 생년월일 **<br/>
	
	주소<br/>
	<select name="location1_no">
		<option value="0">서울특별시</option>
		<option value="1">인천광역시</option>
		<option value="2">경기도</option>
	</select>	
	<select name="location2_no">
		<option value="" selected>군/구</option>
		<option value="0">강남구</option>
		<option value="1">강동구</option>
		<option value="2">강북구</option>
		<option value="3">강서구</option>
		<option value="4">관악구</option>
		<option value="5">광진구</option>
		<option value="6">구로구</option>
		<option value="7">금천구</option>
		<option value="8">노원구</option>
		<option value="9">도봉구</option>
		<option value="10">동대문구</option>
		<option value="11">동작구</option>
		<option value="12">마포구</option>
		<option value="13">서대문구</option>
		<option value="14">서초구</option>
		<option value="15">성동구</option>
		<option value="16">성북구</option>
		<option value="17">송파구</option>
		<option value="18">양천구</option>
		<option value="19">영등포구</option>
		<option value="20">용산구</option>
		<option value="21">은평구</option>
		<option value="22">종로구</option>
		<option value="23">중구</option>
		<option value="24">중랑구</option>
	</select>
	<select name="location2_no">
		<option value="" selected>군/구</option>
		<option value="25">계양구</option>
		<option value="26">남구</option>
		<option value="27">남동구</option>
		<option value="28">동구</option>
		<option value="29">부평구</option>
		<option value="30">서구</option>
		<option value="31">연수구</option>
		<option value="32">중구</option>
		<option value="33">강화군</option>
		<option value="34">옹진군</option>
	</select>
	<select name="location2_no">
		<option value="" selected>시/군</option>
		<option value="35">고양시</option>
		<option value="36">과천시</option>
		<option value="37">광명시</option>
		<option value="38">광주시</option>
		<option value="39">구리시</option>
		<option value="40">군포시</option>
		<option value="41">김포시</option>
		<option value="42">남양주시</option>
		<option value="43">동두천시</option>
		<option value="44">부천시</option>
		<option value="45">성남시</option>
		<option value="46">수원시</option>
		<option value="47">시흥시</option>
		<option value="48">안산시</option>
		<option value="49">안성시</option>
		<option value="50">안양시</option>
		<option value="51">양주시</option>
		<option value="52">오산시</option>
		<option value="53">용인시</option>
		<option value="54">의왕시</option>
		<option value="55">의정부시</option>
		<option value="56">이천시</option>
		<option value="57">파주시</option>
		<option value="58">평택시</option>
		<option value="59">포천시</option>
		<option value="60">하남시</option>
		<option value="61">화성시</option>
		<option value="62">가평군</option>
		<option value="63">양평군</option>
		<option value="64">여주군</option>
		<option value="65">연천군</option>
	</select>
	<hr/>
		관심 분야<br/>
		<div id="interest">
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
	<input type="button" value="회원탈퇴" id="deleteAccount" onclick=""> 
	<input type="button" value="수정완료" id="updateAccount" onclick=""> 
	<input type="button" value="돌아가기" id="backMyPage" onclick="location.href='myPage_commonPart.hey'"> 
	
	
</body>
</html>