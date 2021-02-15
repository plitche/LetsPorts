<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../template/header.jsp">
	<jsp:param value="회원정보 수정 페이지" name="title"/>
</jsp:include>
<link type="text/css" rel="stylesheet" href="resources/joon/css/userUpdate.css" >

<!-- css 파일에 적용이 되지 않아 style에 지정함 -->
<style>
h3 {
	font-size: 30px;
	text-align: center;
}
.contentsName {
	font-size: 18px;
	color: #343a40;
}
#userUpdateWrapper {
	height: 800px;
	width: 500px;
    transform: translate(55%, 10%);
}
form {
	padding: 10px;
}
hr{
	width: 480px;
}
input[type=text]{
	width: 475px;
	height: 30px;
	color: #6c757d;
	font-weight: 500;
	font-size: 15px;
	padding:6px 12px;
	margin-top: 10px;
	border: 0.5px solid silver;
	appearance: textfield;
}
input[type=password]{
	width: 475px;
	height: 30px;
	color: #6c757d;
	font-weight: 500;
	font-size: 15px;
	padding:6px 12px;
	margin-top: 10px;
	border: 0.5px solid silver;
	appearance: textfield;
}
input[type=checkbox]{
	color: #6c757d;
	font-weight: 500;
	font-size: 15px;
	padding:6px 12px;
	margin-top: 10px;
}

input:focus {
	outline:1px solid #ff6600;
	
}
.check_font {
	font-size: 12px;
}

.select_birth{
	width: 110px;
	height: 30px;
	color: #6c757d;
	font-weight: 500;
	font-size: 15px;
	padding:5px;
	border: 1px solid silver;
}
select {
	width: 150px;
	height: 30px;
	color: #6c757d;
	font-weight: 500;
	font-size: 15px;;
	padding:5px;
	margin-top: 10px;
	border: 1px solid silver;
}
select:focus {
	outline:1px solid #ff6600;
}
button {
	text-align: center;
}
#updateSubmit {
	width: 200px;
	height: 50px;
	font-size: 16px;
	font-weight: bold;
	border: none;
	background: #ff6600;
	color: #ffffff;
}
#updateSubmit:hover {
	background: #fd3114ed;
}
#cancelUpdate {
	width: 200px;
	height: 50px;
	font-size: 16px;
	font-weight: bold;
	border: none;
	background: #d12957;
	color: #ffffff;
}
#cancelUpdate:hover {
	background: #a10e1c;
}
#submitBtns {
	text-align: center;
}
</style>
<script>
	let is_passed = false;
	function nickCheck() {
		//닉네임 정규식
		var nickJ = /^[a-zA-Z0-9가-힣]{2,15}$/;
	
		// 닉네임 키업 체크
		$('#user_nickname').keyup(function() {
			var user_nickname = $('#user_nickname').val();
			var obj = {"user_nickname" : user_nickname};
			
			$.ajax({
				url : 'updateNickCheck.hey',
				type : "post",
				data : JSON.stringify(obj),
				contentType : "application/json",
				dataType : "json",
				success : function(data) {
					if (data.result == 1) {
							// 1 : 닉네임이 중복되는 문구
							$("#nick_check").text("이미 사용중인 닉네임입니다.");
							$("#nick_check").css('color', 'red');
							is_passed = false;
					} else {
						// 0 : 닉네임 길이 / 문자열 검사
						if(nickJ.test(user_nickname)){
							$("#nick_check").text("사용가능한 닉네임입니다.");
							$("#nick_check").css('color', 'green');
							is_passed = true;
						}  else {
							$('#nick_check').text("닉네임은 한글, 영어, 숫자 이용 2-15자 사용 가능합니다.");
							$('#nick_check').css('color', 'red');
							is_passed = false;
						}
					}
				},
				error : function() {
					console.log("실패");
					is_passed = false;
				}
			});
		});
	}
	// 비밀번호 확인
	function pwCheck(){
		var empJ = /\s/g;
		var pwJ = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#%&_])[A-Za-z0-9!@#%&_]{8,16}$/;
		var checkHangul = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;

		$('#password').keyup(function() {
			var password = $('#password').val();
			
			if(pwJ.test(password)){
				$('#pw_check').text("사용가능한 비밀번호입니다.");
				$('#pw_check').css('color', 'green');
				$('#signUpSubmit').attr("disabled", 0);
				is_passed = true;
				
				
			} else if(empJ.test(password) || checkHangul.test(password) || !pwJ.test(password)) {
				$('#pw_check').text("영문, 숫자, 특수문자(!@#%&_) 조합 8~16자 이내에서 사용 가능합니다.");
				$('#pw_check').css('color', 'red');
				$('#signUpSubmit').attr("disabled", 1);
				is_passed = false;
			}
		});
	}
	
	//비밀번호 재확인 
	function rePwCheck(){
		$('#re_password').keyup(function(){
			var pw = $('#password').val();
			var re_pw = $('#re_password').val();
			if(pw == "") {
			}
			console.log(pw);
			console.log(re_pw);
			if(pw == re_pw){
				$('#pw_reCheck').text("비밀번호 일치합니다.");
				$('#pw_reCheck').css('color', 'green');
				$('#signUpSubmit').attr("disabled", 0);
				console.log("사용가능한 비밀번호");
			} else {
				$('#pw_reCheck').text("비밀번호를 확인해주세요.");
				$('#pw_reCheck').css('color', 'red');
				$('#signUpSubmit').attr("disabled", 1);
				console.log("사용불가한 비밀번호");
				
			}
		});
	}
	
	function locationOptionChange() {
		var state = $('#location1 option:selected').val();
		if ( state ==  '0') {
			$('#location2').empty();
			$('#location2')
			.append( $('<option value="0">').html('강남구') )
			.append( $('<option value="1">').html('강동구') )
			.append( $('<option value="2">').html('강북구') )
			.append( $('<option value="3">').html('강서구') )
			.append( $('<option value="4">').html('관악구') )
			.append( $('<option value="5">').html('광진구') )
			.append( $('<option value="6">').html('구로구') )
			.append( $('<option value="7">').html('금천구') )
			.append( $('<option value="8">').html('노원구') )
			.append( $('<option value="9">').html('도봉구') )
			.append( $('<option value="10>').html('동대문구') )
			.append( $('<option value="11">').html('동작구') )
			.append( $('<option value="12">').html('마포구') )
			.append( $('<option value="13">').html('서대문구') )
			.append( $('<option value="14">').html('서초구') )
			.append( $('<option value="15">').html('성동구') )
			.append( $('<option value="16">').html('성북구') )
			.append( $('<option value="17">').html('송파구') )
			.append( $('<option value="18">').html('양천구') )
			.append( $('<option value="19">').html('영등포구') )
			.append( $('<option value="20">').html('용산구') )
			.append( $('<option value="21">').html('은평구') )
			.append( $('<option value="22">').html('종로구') )
			.append( $('<option value="23">').html('중구') )
			.append( $('<option value="24">').html('중랑구') )
		} else if ( state == '1' ) {
			$('#location2').empty();
			$('#location2')
			.append( $('<option value="25">').html('계양구') )
			.append( $('<option value="26">').html('남구') )
			.append( $('<option value="27">').html('남동구') )
			.append( $('<option value="28">').html('동구') )
			.append( $('<option value="29">').html('부평구') )
			.append( $('<option value="30">').html('서구') )
			.append( $('<option value="31">').html('연수구') )
			.append( $('<option value="32">').html('중구') )
			.append( $('<option value="33">').html('강화군') )
			.append( $('<option value="34">').html('옹진궁') )
		} else if ( state == '2') {
			$('#location2').empty();
			$('#location2')
			.append( $('<option value="35">').html('고양시') )
			.append( $('<option value="36">').html('과천시') )
			.append( $('<option value="37">').html('광명시') )
			.append( $('<option value="38">').html('광주시') )
			.append( $('<option value="39">').html('구리시') )
			.append( $('<option value="40">').html('군포시') )
			.append( $('<option value="41">').html('김포시') )
			.append( $('<option value="42">').html('남양주시') )
			.append( $('<option value="43">').html('동두천시') )
			.append( $('<option value="44">').html('부천시') )
			.append( $('<option value="45">').html('성남시') )
			.append( $('<option value="46">').html('수원시') )
			.append( $('<option value="47">').html('시흥시') )
			.append( $('<option value="48">').html('안산시') )
			.append( $('<option value="49">').html('안성시') )
			.append( $('<option value="50">').html('안양시') )
			.append( $('<option value="51">').html('양주시') )
			.append( $('<option value="52">').html('오산시') )
			.append( $('<option value="53">').html('용인시') )
			.append( $('<option value="54">').html('의왕시') )
			.append( $('<option value="55">').html('의정부시') )
			.append( $('<option value="56">').html('이천시') )
			.append( $('<option value="57">').html('파주시') )
			.append( $('<option value="58">').html('평택시') )
			.append( $('<option value="59">').html('포천시') )
			.append( $('<option value="60">').html('하남시') )
			.append( $('<option value="61">').html('화성시') )
			.append( $('<option value="62">').html('가평군') )
			.append( $('<option value="63">').html('양평군') )
			.append( $('<option value="64">').html('여주군') )
			.append( $('<option value="65">').html('연천군') )
		} else {
			$('#location2').empty();
			$('#location2')
			.append( $('<option value="">').html('시군구') )
		}
	}
	
	function user_interest() {
		let before = $('#user_interest').val().split(',');
		$('input[name="user_interest"]').each(function() {
			for(let i = 0; i < before.length; i++) {
				if(this.value == before[i]) {
					this.checked = true;
				}
			}
		});
	}
	
	function fn_update(f) {
		if(f.user_nickname.value == '${updateUser.user_nickname}' && f.password.value == '') {
			is_passed = true;
		}
		if(!is_passed) {
			return;
		}
		if(f.password.value != '') {
			if(f.confirmPw.value != f.password.value) {
				Swal.fire('비밀번호가 일치하지 않습니다.');
				return;
			}
		}
		let interest_list = '';
		
		$('input[type="checkbox"]:checked').each(function() {
			interest_list += ',';
			interest_list += this.value;
		});
		interest_list = interest_list.substring(1);
		$('#interest_list').val(interest_list);
		
		f.submit();
	}
	
	$(document).ready(function() {
		$('#location1').val('${updateUser.location1_no}').prop("selected", true);
		locationOptionChange();
		setTimeout(function() {
			$('#location2').val('${updateUser.location2_no}').prop("selected", true);
		}, 300);
		$('#location1').change(function() {
			locationOptionChange();
		});
		user_interest();
		nickCheck();
		pwCheck();
		rePwCheck();
	});
</script>
<div id="userUpdateWrapper">

	<h3>회원정보 수정</h3>
		<input type="hidden" id="user_interest" value="${updateUser.interest_list}" />
		<br/>
		<br/>
		<br/>
	<form method="post" action="userUpdate.wooki">
		<input type="hidden" name="user_no" value="${updateUser.user_no}" />
		
		<div class="contentsName">닉네임</div>
		<input type="text" name="user_nickname" id="user_nickname" value="${updateUser.user_nickname}"><br/>
		<span class="font-check" id="nick_check"></span><br/>
		
		<div class="contentsName">비밀번호</div>
		<input type="password" name="password" id="password"><br/>
		<span class="font-check" id="pw_check"></span><br/>
	
		<div class="contentsName">비밀번호 확인</div>
		<input type="password" name="confirmPw" id="re_password"><br/>
		<span class="font-check" id="pw_reCheck"></span><br/>
		
		<div class="contentsName">주요 활동지역</div>
		<select id="location1" name="location1_no">
			<option id="none" value="">시/도 선택</option>
			<option id="seoul" value="0">서울특별시</option>
			<option id="incheon" value="1">인천광역시</option>
			<option id="gyeongi" value="2">경기도</option>
		</select>
		<select id="location2" name="location2_no">
			<option>구/군 선택</option>
		</select><br/>
		
		<input type="hidden" name="interest_list" id="interest_list" />
		<br/>
		<hr/>
		<div class="contentsName">관심 분야</div>
		<label><input type="checkbox" name="user_interest" value="0">족구</label>
		<label><input type="checkbox" name="user_interest" value="1">축구</label>
		<label><input type="checkbox" name="user_interest" value="2">농구</label>
		<label><input type="checkbox" name="user_interest" value="3">볼링</label>
		<label><input type="checkbox" name="user_interest" value="4">크로스핏</label>
		<label><input type="checkbox" name="user_interest" value="5">스피닝</label>
		<label><input type="checkbox" name="user_interest" value="6">댄스</label>
		<label><input type="checkbox" name="user_interest" value="7">요가</label>
		<label><input type="checkbox" name="user_interest" value="8">명상</label>
		<hr/>
		<br/><br/>
		<div id="submitBtns">
			<input type="button" id="updateSubmit" value="수정하기" onclick="fn_update(this.form)" />
			<input type="button" id="cancelUpdate" value="돌아가기" onclick="location.href='myPage_commonPart.hey'" />
		</div>
	</form>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
</div>

<%@ include file="../template/footer.jsp" %>