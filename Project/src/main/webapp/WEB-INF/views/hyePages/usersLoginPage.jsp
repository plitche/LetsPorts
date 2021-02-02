<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 페이지</title>

<style type="text/css">
</style>
<script>
// 모달창 테스트를 위한 스크립트!
	$('#openQNAModal').click(function() {
		$('#modal').attr("style", "display:block");
	});
	$('#closeQNAModal').click(function() {
		$('#modal').attr("style", "display:none");
	});
</script>
</head>
<body>

	<form method="post">
		<h3>로그인</h3>
		<form action="" method="post">
			<input type="text" class="login_text" placeholder="E-MAIL" /><br/>
			<input type="text" class="login_text" placeholder="PW" /><br/>
			<input type="button" class="login_btns" value="로그인"><br/>
		</form>
				<!-- Button -->
		  <a id="openQNAModal"href="#">비밀번호 찾기</a>
		  
				<!-- 모달 창 테스트 -->
		  <!-- 
		<div id="modal">
	  		<div class="modal_content">
			    <button id="closeQNAModal">X</button>
			    <form>
			    	<input type="text" placeholder="E-MAIL" /><br/>
			    	<input type="button" >
			    </form>
		    </div>
	  	</div>
				
		   -->
		<div>
			아직 계정이 없으신가요? <br/>
			<a href="signUpChoicePage.hey">회원가입하기</a>
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