//<!-- 모달창 만들기 위함 -->
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


//페이지 로드
$(document).ready(function(){
	userCheck();
	sendTempPw();
});
function userCheck() {
	
	// 이메일 키업 체크
	$("#regEmail").keyup(function(){
	var email = $('#regEmail').val();
	var obj = {"email" : email};
	
		$.ajax({
			url : "emailCheck.hey",
			type : "post",
			data : JSON.stringify(obj),
			contentType : "application/json",
			dataType : "json",
			success : function(data) {
				console.log("1 = 사용불가 / 0 = 사용가능 : "+ data);
				
				if (data.result == 1) {
					$("#email_check").text("회원이시네요.");
					$("#email_check").css('color', 'green');
					console.log("회원임");
					
					
				} else {
					
						$("#email_check").text("등록된 정보가 없습니다.");
						$("#email_check").css('color', 'red');
						console.log("정보 없음");
			
				}
					
			},error : function() {
					console.log("실패");
			}
			
		});
	});
}

	// 임시비번 보내기
function sendTempPw(){
	$(document).on("click", "#sendTempPw", function() {
		// alert('이메일 인증 시작!');
		var email = $('#regEmail').val();
		var obj = {"email" : email};
		var tempPw; // 임시비번
		/* 0 = 메일 전송 전, 1=메일 전송 됨*/
		
		$.ajax({
			url : "sendTempPw.hey",
			type : "post",
			data : JSON.stringify(obj),
			contentType : "application/json",
			dataType : "json",
			success : function(data) {
				alert('임시 비밀번호 발송! 메일을 확인해주세요.');
				tempPw = data.result;
				console.log(tempPw);
					
			}, error : function() {
					console.log("뭐가 그리 문제야 say something!");
			}
			
		}); // ajax
		
	});
}