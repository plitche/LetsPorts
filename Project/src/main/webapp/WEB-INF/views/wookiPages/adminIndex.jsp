<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8" />
	<title>어드민 페이지</title>
	<!-- jquery, fontawesome -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://kit.fontawesome.com/07b67006ce.js"></script>
	
	<!-- css파일 및 js파일 -->
	<link rel="stylesheet" href="resources/wooki/css/common.css">
	<script src="resources/wooki/js/common.js"></script>
	<script>
		fn_adminCheck(${loginUser.user_separator});
		$(document).ready(function() {
			fn_selectBtn();
			fn_main();
			$('.user').click(function() {
				fn_user(1);
			});
			$('.main').click(function() {
				fn_main();
			});
		});
	</script>
</head>
<body>
	<div class="container">
		<div class="top-container space-between vw">
			<div>LetsSports</div>
			<div>
				<input type="button" value="로그아웃" onclick="fn_logout()" />
			</div>
		</div>
		<div class="nav-container flex vw">
			<div class="nav-btn main">메인페이지</div>
			<div class="nav-btn user">일반회원관리</div>
			<div class="nav-btn admin">관리자등록</div>
			<div class="nav-btn trainer">트레이너관리</div>
			<div class="nav-btn trainer_qna">트레이너Q&amp;A</div>
			<div class="nav-btn photo">사진관리</div>
			<div class="nav-btn knowhow">노하우게시판</div>
			<div class="nav-btn qna">질문과답변게시판</div>
			<div class="nav-btn comment">댓글관리</div>
			<div class="nav-btn review">리뷰관리</div>
		</div>
		<div class="content-container vw scroll">내용</div>
	</div>
</body>
</html>