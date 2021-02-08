<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link type="text/css" rel="stylesheet" href="resources/joon/css/myPage_commonPart.css" >
<!DOCTYPE html>
<!-- 헤더 인클루드 -->
<jsp:include page="../template/header.jsp" />

<script type="text/javascript">
<!-- 모달창 만들기 위함 -->
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
</script >

<script type="text/javascript">
<!-- 정보수정 전 본인 확인 -->
$(document).ready(function() {
	userAuth();
});

function userAuth(){
	
$("#updateInfo_btn").click(function(){
	var userAuthPw = $("userAuthPw").val();
	if(userAuthPw == ${usersDto.password}) {
		location.href = "hyePages/usersInfoUpdatePage.hey";
	} else {
		alert('비밀번호 다시 입력해주세요!');
	}
});

}
</script>


<div class="myPageHeader" >
		<h3>마이페이지</h3>
	<div class="userImage">
		트레이너 사진 파일 이름:<br/>
		<a id="uploadIcon" href="#"><i class="fas fa-camera fa-lg"></i></a>
	</div>
	<div class="myPageInfo">
		<br/>
		별점
		<br/>
		닉네임님
			<!-- 모달 창으로 본인 인증 -->
		 
		<p><a href="#" id="modal_btn">정보 수정</a></p><br/>
			<div class="black_bg"></div>
			<div class="modal_wrap">
				<p class="modal_close" ><a href="#">X</a></p>
				<div id="verification_content">
					<h3>회원 정보 수정을 위한 인증</h3>
					<input type="password" id="userAuthPw" placeholder="비밀번호 입력"><br/><br/>
				  	<input type="button" id="updateInfo_btn" value="내 정보 수정하러 가기">
				</div>
			</div>
	</div>
		
		<!-- 각각 페이지 따로 만들 것! -->
	<div class="interestBtns">
		<a href="#"><i class="fas fa-heart fa-lg"></i><br/>관심모임</a>
		<a href="#"><i class="fas fa-id-badge fa-lg"></i><br/>관심 트레이너</a>
		<a href="#"><i class="far fa-file-alt fa-lg"></i><br/>관심 노하우</a>
	</div>
</div>
		
<div class="statusMsg">
	상태 메세지<br/>
	<textarea rows="3" cols="100" placeholder="상태 메세지를 입력해주세요."></textarea>
	<input type="button" value="수정하기" id="updateBtn" />
</div>

<!-- 탭 이동 형식 -->
<div class="tabBars">
	<ul>
		<li><a href="myPage_meeting.hey">모임</a></li>
		<li><a href="myPage_posted.hey">게시물</a></li>
		<li><a href="myPage_review.hey">리뷰관리</a></li>
		<li><a href="myPage_qna.hey">질의응답</a></li>
	</ul>
	<div class="barsBox">
	<!-- 하,, 페이지 이동은 보기 좋지 않으므로 ajax 사용할 예정.. -->
	</div>
</div>

<%@ include file="../template/footer.jsp" %>