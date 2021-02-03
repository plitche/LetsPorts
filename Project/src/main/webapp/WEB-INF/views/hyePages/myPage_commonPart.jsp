<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<jsp:include page="../template/header.jsp" />
<!-- flush = false 를 할경우 모든 jsp 페이지가 동시에 부러우저에 도착해 모든 헤더의 정보를 받는다. -->
<style>
	a {
		display: block;
		text-decoration: none;
	}
	#interestBtns {
		display: flex;
	}
	#interestBtns a {
		margin-right: 50px;
		text-align: center;
	}
	#tabBars {
		position: absolute;
	}
	#tabBars a {
		text-align: center;
		width: 160px;
		height: 40px;
		line-height: 40px;
		background: silver;
		border-left: 1px solid black;
		border-right: 1px solid black;
	}
	ul {
		margin: 0;
		padding: 0;
	}
	ul li {
		float: left;
		margin: 0;
		padding: 0;
	}
	#barsBox {
		border: 1px solid silver;
		width: 640px;
		height: 250px;
	}
</style>
<div id="myPageHeader" >
		<h3>마이페이지</h3>
	<div id="userImage">
		트레이너 사진 파일 이름:<br/>
		<a id="uploadIcon" href="#"><i class="fas fa-camera fa-lg"></i></a>
	</div>
	<div id="myPageInfo">
		<br/>
		별점
		<br/>
		닉네임님<a href="#">정보수정</a><br>
		<div id="interestBtns">
			<a href="#"><i class="fas fa-heart fa-lg"></i><br/>관심모임</a>
			<a href="#"><i class="fas fa-id-badge fa-lg"></i><br/>관심 트레이너</a>
			<a href="#"><i class="far fa-file-alt fa-lg"></i><br/>관심 노하우</a>
		</div>
	</div>
	<div id="statusMsg">
		상태 메세지<br/>
		<textarea rows="3" cols="100" placeholder="상태 메세지를 입력해주세요."></textarea>
		<input type="button" value="수정하기" id="updateBtn" />
	</div>
	<div id="tabBars">
		<ul>
			<li><a  href="myPage_meeting.hey">모임</a></li>
			<li><a  href="myPage_posted.hey">게시물</a></li>
			<li><a  href="myPage_review.hey">리뷰관리</a></li>
			<li><a  href="myPage_qna.hey">질의응답</a></li>
		</ul>
		<div id="barsBox">
			<!-- 하,, 페이지 이동은 보기 좋지 않으므로 ajax 사용할 예정.. -->
		</div>
	</div>
</div>

<%@ include file="../template/footer.jsp" %>