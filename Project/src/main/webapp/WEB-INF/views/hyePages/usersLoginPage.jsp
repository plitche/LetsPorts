<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 페이지</title>
<!-- 로그인 및 비밀번호 찾기 모달창 -->

<style type="text/css">
	#modal_Tofind_pw {
		display:none; 
		position:relative;
	}
	#modal_Tofind_pw .modalContent {
		width:440px; 
		height:200px; 
		padding:20px; 
		border:1px solid #ccc; 
		position:fixed; 
		left:50%; 
		top:50%; 
		z-index:11; 
		background:#fff;
	}
	#modal_Tofind_pw .modalContent button {
		position:absolute; 
		right:0; 
		top:0; 
		cursor:pointer;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
	  var modal_Tofind_pw = $("#modal_Tofind_pw");
	  var modalLink = $(".modalLink");
	  var modalCont = $(".modalContent");
	  var marginLeft = modalCont.outerWidth()/2;
	  var marginTop = modalCont.outerHeight()/2; 

	  modalLink.click(function(){
	    modal_Tofind_pw.fadeIn("slow");
	    modalCont.css({"margin-top" : -marginTop, "margin-left" : -marginLeft});
	    $(this).blur();
	    $(".modalContent > a").focus(); 
	    return false;
	  });

	  $(".modalContent > button").click(function(){
	    modal_Tofind_pw.fadeOut("fast");
	    modalLink.focus();
	  });		
	});
</script>
</head>
<body>

	<form method="post">
		<h3>로그인</h3>
		<div>
			<input type="text" class="login_text" placeholder="E-MAIL" /><br/>
			<input type="text" class="login_text" placeholder="PW" /><br/>
			
			<a href="#modal_Tofind_pw" class="modalLink">비밀번호 찾기</a>
				<div id="modal_Tofind_pw">
				  <div class="modalContent">
				    <a href="#">모달창 테스트</a> 
				    <button type="button">닫기</button>	
				  </div>
				</div>
				
			<input type="button" class="login_btns" value="로그인"><br/>
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
	</form>
	
</body>
</html>