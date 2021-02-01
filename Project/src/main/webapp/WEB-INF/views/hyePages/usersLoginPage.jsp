<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 페이지</title>
<!-- 로그인 및 비밀번호 찾기 모달창 -->

<style type="text/css">
</style>

</head>
<body>

	<form method="post">
		<h3>로그인</h3>
		<div>
			<input type="text" class="login_text" placeholder="E-MAIL" /><br/>
			<input type="text" class="login_text" placeholder="PW" /><br/>
			
				
				
				
				<!-- 모달 창 테스트 -->
				
				<!-- Button -->
		  <a class="btn trigger" href="#">비밀번호 찾기</a>
		<div id="modal">
	  		<div class="modal_content">
			    <button id="closeQNAModal">X</button>
			    <form>
			    	<input type="text" placeholder="E-MAIL" /><br/>
			    	<input type="button" >
			    </form>
		    </div>
		    <div class="modal_layer"></div>
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