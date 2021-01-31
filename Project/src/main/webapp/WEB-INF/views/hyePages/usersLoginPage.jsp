<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 페이지</title>
<!-- 로그인 및 비밀번호 찾기 모달창 -->

<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Montserrat:400,700);
	
	html, body {
	  width: 100%;
	  height: 100%;
	  margin: 0;
	}
	
	.page-wrapper {
	  width: 100%;
	  height: 100%;
	  background: url(https://goo.gl/OeVhun) center no-repeat;
	  background-size: cover;
	}
	
	.blur-it {
	  filter: blur(4px);
	}
	
	a.btn {
	  width: 200px;
	  padding: 18px 0;
	  position: absolute;
	  top: 50%; 
	  left: 50%;
	  transform: translate(-50%, -50%);
	  font-family: 'Montserrat', Arial, Helvetica, sans-serif;
	  font-weight: 700;
	  text-align: center;
	  text-decoration: none;
	  text-transform: uppercase;
	  color: #fff;
	  border-radius: 0;
	  background: #e2525c;
	}
	
	.modal-wrapper {
	  width: 100%;
	  height: 100%;
	  position: fixed;
	  top: 0; 
	  left: 0;
	  background: rgba(41, 171, 164, 0.8);
	  visibility: hidden;
	  opacity: 0;
	  transition: all 0.25s ease-in-out;
	}
	
	.modal-wrapper.open {
	  opacity: 1;
	  visibility: visible;
	}
	
	.modal {
	  width: 600px;
	  height: 400px;
	  display: block;
	  margin: 50% 0 0 -300px;
	  position: relative;
	  top: 50%; 
	  left: 50%;
	  background: #fff;
	  opacity: 0;
	  transition: all 0.5s ease-in-out;
	}
	
	.modal-wrapper.open .modal {
	  margin-top: -200px;
	  opacity: 1;
	}
	
	.head { 
	  width: 90%;
	  height: 32px;
	  padding: 12px 30px;
	  overflow: hidden;
	  background: #e2525c;
	}
	
	.btn-close {
	  font-size: 28px;
	  display: block;
	  float: right;
	  color: #fff;
	}
	
	.content {
	  padding: 10%;
	}
	
	.good-job {
	  text-align: center;
	  font-family: 'Montserrat', Arial,       Helvetica, sans-serif;
	  color: #e2525c;
	}
	.good-job .fa-thumbs-o-up {
	  font-size: 60px;
	}
	.good-job h1 {
	  font-size: 45px;
	}
</style>
<script type="text/javascript">
$( document ).ready(function() {
	  $('.trigger').on('click', function() {
	     $('.modal-wrapper').toggleClass('open');
	    $('.page-wrapper').toggleClass('blur-it');
	     return false;
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
			
				
				
				
				<!-- 모달 창 테스트 -->
				
				<!-- Button -->
		<div class="page-wrapper">
		  <a class="btn trigger" href="#">click me</a>
		</div>
		
		<!-- Modal -->
		<div class="modal-wrapper">
		  <div class="modal">
		    <div class="head">
		      <a class="btn-close trigger" href="#">
		        <i class="fa fa-times" aria-hidden="true"></i>
		      </a>
		    </div>
		    <div class="content">
		        <div class="good-job">
		          <i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
		          <h1>Good Job!</h1>
		        </div>
		    </div>
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