<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link type="text/css" rel="stylesheet" href="resources/style/soo/trainerDetailPage.css" >
<!DOCTYPE html>

<jsp:include page="../template/header.jsp">
	<jsp:param value="트레이너 상세 페이지" name="title"/>
</jsp:include>

<!-- 질문 작성완료 클릭 시 form정보를 보내 줄 ajax -->
<script>
	$(document).ready(function(){
		writeQuestion();
		closeModal();
	});
	
	function writeQuestion() {
		$('#writeQuestion').click(function() {
			var question_user_no = 11; /* 일단 임시로 작성자 번호는 11로 둠 */
			var trainer_user_no = $('input[name="trainer_user_no"]').val();
			var trainer_qna_title = $('input[name="trainer_qna_title"]').val();
			var trainer_qna_content = $('input[name="trainer_qna_content"]').val();
			var is_published = $('input[name="is_published"]').val();
			// ${trainer_user_no} 이렇게도 될까 ?

			var sendObj = {
				"question_user_no" : question_user_no,	
				"trainer_user_no" : trainer_user_no,
				"trainer_qna_title" : trainer_qna_title,
				"trainer_qna_content" : trainer_qna_content,
				"is_published" : is_published
			};
			$.ajax({
				url: 'writeQnA.plitche',
				type: 'post',
				data: JSON.stringify(sendObj),
				contentType: 'application/json; charset=UTF-8',
				dataType: 'json',
				success: function(responseObj) {
					if (responseObj.result) {
						alert('질문이 등록되었습니다.');
						$('#qnaList').empty();
						$.each(responseObj.qnaList, function(idx, qna){
							$('<tr>')
							.append( $('<td>').html(qna.trainer_qna_no) )
							.append( $('<td>').html(qna.trainer_qna_title) )
							.append( $('<td>').html(qna.trainer_qna_content) )
							.append( $('<td>').html(qna.question_user_no) )
							.append( $('<td>').html(qna.created_at) )
							.appendTo('#qnaList');
						});
					} else {
						alert('질문이 등록되지 않았습니다.');
					}
				},
				error: function(){alert('실패');}
			});
		});
	}
	function closeModal() {
		$('#writeQuestion').click(function() {
			$('#modal').attr("style", "display:none");
		});
	}
</script>

	트레이너 사진 파일 이름: ${trainerTemDto.profile_photo} <br/>
	트레이너 닉네임 : ${trainerTemDto.user_nickname} <br/>
	상태 메세지 : ${trainerTemDto.user_message} <br/>
	트레이너 경력 : ${trainerTemDto.career}년 <br/>
	트레이너 활동 센터 : ${trainerTemDto.employment} <br/>
	트레이너 프로필 : ${trainerTemDto.profile} <br/>
<br/>
<div>
	<div>${trainerTemDto.user_nickname} 트레이너의 프로그램</div>
	총 : ##개  &nbsp;&nbsp;&nbsp;&nbsp; <a href="goCreateMeetingPage.plitche">새 프로그램 등록하기</a> <br/>
	<table border="1">
		<thead>
			<tr>
				<td>코스번호</td>
				<td>제목</td>
				<td>내용</td>
				<td>최대 참가 인원</td>
				<td>일시</td>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty meetingDto}">
				<tr>
					<td colspan="5">개설된 프로그램이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty meetingDto}">
				<c:forEach var="list" items="${meetingDto}">
					<tr>
						<td>${list.meeting_no}</td>
						<td>${list.meeting_title}</td>
						<td>${list.meeting_content}</td>
						<td>${list.meeting_max}</td>
						<td>${list.meeting_date}</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
</div>
<br/>
<div>
	<div>${trainerTemDto.user_nickname} 트레이너가 받은 리뷰</div>
	총 : ##개  &nbsp;&nbsp;&nbsp;&nbsp; <a href="">새 리뷰 등록하기</a> <br/>	
	<table border="1">
		<thead>
			<tr>
				<td>리뷰번호</td>
				<td>점수</td>
				<td>작성자</td>
				<td>내용</td>
				<td>일시</td>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty reviewDto}">
				<tr>
					<td colspan="4">작성된 리뷰가 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty reviewDto}">
				<c:forEach var="list" items="${reviewDto}">
					<tr>
						<td>${list.review_no}</td>
						<td>${list.score}</td>
						<td>${list.writer_user_no}</td>
						<td>${list.content}</td>
						<td>${list.created_at}</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
</div>
<br/>
<div>
	<div>${trainerTemDto.user_nickname} 트레이너에게 질문</div>
	총 : ##개  &nbsp;&nbsp;&nbsp;&nbsp; <button type="button" id="openQNAModal">새 질문 등록하기</button> 
  	<div id="modal">
  		<div class="modal_content">
		    <button id="closeQNAModal">X</button>
		    <form>
		    	<input type="text" id="title" name="trainer_qna_title" placeholder="제목을 입력하세요."/><br/>
		    	<input type="text" id="content" name="trainer_qna_content" placeholder="질문내용을 입력하세요."/><br/>
		    	<input type="checkbox" name="is_published" value="1"/>비밀글로 작성하기 <br/>
		    	<input type="hidden" name="trainer_user_no" value="${trainer_user_no}"/>
		    	<input type="button" value="작성완료" id="writeQuestion"/>
		    </form>
	    </div>
	    <div class="modal_layer"></div>
  	</div>
  	
	<br/>
	<table border="1">
		<thead>
			<tr>
				<td>질문번호</td>
				<td>질문제목</td>
				<td>질문내용</td>
				<td>작성자</td>
				<td>일시</td>
			</tr>
		</thead>
		<tbody id="qnaList">
			<c:if test="${empty trainer_qnaDto}">
				<tr>
					<td colspan="4">작성된 질문이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty trainer_qnaDto}">
				<c:forEach var="list" items="${trainer_qnaDto}">
					<tr>
						<td>${list.trainer_qna_no}</td>
						<td>${list.trainer_qna_title}</td>
						<td>${list.trainer_qna_content}</td>
						<td>${list.question_user_no}</td>
						<td>${list.created_at}</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
</div>
<script>
	$('#openQNAModal').click(function() {
		$('#modal').attr("style", "display:block");
	});
	$('#closeQNAModal').click(function() {
		$('#modal').attr("style", "display:none");
	});
	/* 
	document.getElementById("openQNAModal").onclick = function() {
	    document.getElementById("modal").style.display="block";
	}
	
	document.getElementById("closeQNAModal").onclick = function() {
	    document.getElementById("modal").style.display="none";
	}   
	 */
</script>
<%@ include file="../template/footer.jsp" %>