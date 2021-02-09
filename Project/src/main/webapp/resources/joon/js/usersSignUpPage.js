/*정규식 체크
	//모든 공백 체크 정규식
	var empJ = /\s/g;
	// 비밀번호 정규식
	var pwJ = /^[A-Za-z0-9]{8,16}$/; 
	// 이메일 검사 정규식
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
*/	


//닉네임 유효성 검사(1 = 중복 / 0 != 중복)

// 페이지 로드 이벤트
   $(document).ready(function() {
      nickCheck();    
      emailCheck();
      emailAuth();
      pwCheck();
      rePwCheck();
      setBirthDate();
   });


function nickCheck() {
	//닉네임 정규식
	var nickJ = /^[a-zA-Z0-9가-힣]{2,15}$/;
	// 닉네임 키업 체크
	$("#user_nickname").keyup(function() {
		
		var user_nickname = $('#user_nickname').val();
		var obj = {"user_nickname" : user_nickname};

		$.ajax({
			url : 'nickCheck.hey',
			type : "post",
			data : JSON.stringify(obj),
			contentType : "application/json",
			dataType : "json",
			success : function(data) {
				console.log("true = 사용불가 / false = 사용가능 : "+ data);						
				
				if (data.result == 1) {
						// 1 : 닉네임이 중복되는 문구
						$("#nick_check").text("이미 사용중인 닉네임입니다.");
						$("#nick_check").css('color', 'red');
						console.log("닉네임중복");
					} else {
						
						// 0 : 닉네임 길이 / 문자열 검사
						if(nickJ.test(user_nickname)){
							$("#nick_check").text("사용가능한 닉네임입니다.");
							$("#nick_check").css('color', 'green');
							console.log("정규식 통과");
				
						}  else {
							$('#nick_check').text("닉네임은 한글, 영어, 숫자 이용 2-15자 사용 가능합니다.");
							$('#nick_check').css('color', 'red');
							console.log("특수문자 안돼");
						}
						
					}
				}, error : function() {
						console.log("실패");
				}
			});
		});
	
}



function emailCheck() {
	// 이메일 정규식
	var regEmail = /^[a-z][a-z0-9-_]+@[a-zA-Z0-9]{3,}(\.[a-zA-Z]{2,6}){1,2}$/;
	
	// 이메일 키업 체크
	$("#email").keyup(function(){
	var email = $("#email").val();
	var status = $("#authEmail").css('display'); // status 변수에 ID가 authEmail인 요소의 display의 속성을 '대입'
	var obj = {"email" : email};
	
		$.ajax({
			url : 'emailCheck.hey',
			type : 'post',
			data : JSON.stringify(obj),
			contentType : "application/json",
			dataType : "json",
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
	var obj = {"email" : email};
	/* 0 = 메일 전송 전, 1=메일 전송 됨*/
	
	$.ajax({
		url : "emailAuth.hey",
		type : "post",
		data : JSON.stringify(obj),
		contentType : "application/json",
		dataType : "json",
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

// 비밀번호
function pwCheck(){
	var empJ = /\s/g;
	var pwJ = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#%&_])[A-Za-z0-9!@#%&_]{8,16}$/;
    var checkHangul = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;

	$('#password').keyup(function(){
		var password = $('#password').val();
		console.log("0 = 사용가능/ 1 = 사용불가한 비밀번호");
		
		if(pwJ.test(password)){
			$('#pw_check').text("사용가능한 비밀번호입니다.");
			$('#pw_check').css('color', 'green');
			console.log("사용가능한 비밀번호");
			
			
		} else if(empJ.test(password) || checkHangul.test(password) || !pwJ.test(password)) {
			$('#pw_check').text("영문, 숫자, 특수문자(!@#%&_) 조합 8~16자 이내에서 사용 가능합니다.");
			$('#pw_check').css('color', 'red');
			console.log("영문, 숫자, 특 조합 실패");
			
		}
	});
}

// 비밀번호 재확인 
function rePwCheck(){
	$('#re_password').keyup(function(){
		var pw = $('#password').val();
		var re_pw = $('#re_password').val();
		console.log("0 = 일치/ 1 = 일치X");
		if(pw == "") {
			alert('못들어와 ㅠㅠ');
		}
		console.log(pw);
		console.log(re_pw);
		if(pw == re_pw){
			$('#pw_reCheck').text("비밀번호 일치합니다.");
			$('#pw_reCheck').css('color', 'green');
			console.log("사용가능한 비밀번호");
		} else {
			$('#pw_reCheck').text("비밀번호를 확인해주세요.");
			$('#pw_reCheck').css('color', 'red');
			console.log("사용불가한 비밀번호");
			
		}
	});
}



// 생년월일 for문
   // setBirthDate 년, 월, 일 표시
   function setBirthDate(){
       var date = new Date();
       var birth_year;
       
       $("#birth_year").append("<option value=''>년</option>");
       // 1900 ~ 2021년도
       for(var y = 1900; y <= 2021; y++){
           $("#birth_year").append("<option value='"+ y +"'>"+ y +"</option>");
       }
       // 1 ~ 12월
       var birth_month;
       $("#birth_month").append("<option value=''>월</option>");
       for(var m = 1; m <= 12; m++){
           $("#birth_month").append("<option value='"+ m +"'>"+ m +"</option>");
       }
       var birth_day;
       $("#birth_day").append("<option value=''>일</option>");
       for(var d = 1; d <= 31; d++){
       	$("#birth_day").append("<option value='"+ d +"'>"+ d +"</option>");
       }
   }

   
// 주소 (select문 서울 선택하면 서울 관련 구만 보여주기)
   $(document).ready(function () {
		$('#location1').change(function() {
			var state = $('#location1 option:selected').val();
			if ( state ==  '0') {
				$('#location2').empty();
				$('#location2')
				.append( $('<option value="">').html('시군구') )
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
				.append( $('<option value="">').html('시군구') )
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
				.append( $('<option value="">').html('시군구') )
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
		});
	});
