<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link type="text/css" rel="stylesheet" href="resources/style/soo/trainerDetailPage.css" >
<!DOCTYPE html>

<jsp:include page="../template/header.jsp">
	<jsp:param value="트레이너 상세 페이지" name="title"/>
</jsp:include>

<script src="resources/style/soo/trainerDetailPage.js"></script>

<!-- 트레이너 모임 리스트를 불러오기 위한 ajax -->
<script>
	/* 페이지 로드 */
	$(document).ready(function() {
		trainerMeetingListTable();
		getTrainerMeetingList();
	});

	/* 불러온 모임 list를 토대로 append 해주기 위한 function */
	function trainerMeetingListTable(list) {
		$('#trainerMeetingList').empty();
		$.each(list, function(idx, meeting){
			$('<a href="#" onclick="fn_showMeeting(' + meeting.meeting_no + '); return false;">')
			.append( $('<div>').addClass('trainerMeeting') 
			.append( $('<div>').html('이미지') )
			.append( $('<p>').html(meeting.meeting_title) )
			.append( $('<p>').html('최소: ' + meeting.meeting_min + '명 / 최대: ' + meeting.meeting_max + '명')  )
			.append( $('<p>').html('일시: ' + meeting.meeting_date) )
			.append( $('<p>').html('작성자: ' + meeting.user_no) )
			)
			.appendTo("#trainerMeetingList");
		});
	}
	
	/* 트레이너 리스트페이지에서 트레이너 디테일 페이지로 이동시 자동으로 실행 될 함수(모임 리스트 불러오기용) */
	function getTrainerMeetingList() {
		var user_no = ${trainerTemDto.user_no};
		$.ajax ({
			url: 'getTrainerMeetingList.plitche/' + user_no,
			type: 'get',
			dataType: 'json',
			success: function(responseObj) {
				if (responseObj.result) {
					trainerMeetingListTable(responseObj.meetingList);
				} else {
					$('<div>')
					.append( $('<p>').html('등록된 모임 정보가 없습니다.') )
					.appendTo('#trainerMeetingList');
				}
			},
			error: function(){alert('실패');}
		});
	}
	
	/* 트레이너 모임 리스트의 제목이나 내용을 클릭하면 모임 View페이지로 이동할 함수 */
	function fn_showMeeting(meeting_no) {
		location.href = 'meetingViewPage.plitche?meeting_no='+meeting_no;
	}
</script>

<!-- 질문 작성완료 클릭 시 form정보를 보내 줄 ajax -->
<script>
	// 페이지 로드
	$(document).ready(function(){
		getTrainerQnAList();
		writeQuestion();
		closeModal();
	});
	
	// 해당 트레이너에게 달린 질문 data를 append하는 서브함수
	function trainerQnAListTable(list) {
		$('#qnaList').empty();
		$.each(list, function(idx, qna){
			$('<tr>')
			.append( $('<td>').html(qna.trainer_qna_no) )
			.append( $('<td>').html('<a href="#" onclick="fn_showQNA(' + qna.trainer_qna_no + '); return false;">' + qna.trainer_qna_title + '</a>') )
			.append( $('<input type="hidden" name="trainer_qna_no">').val(qna.trainer_qna_no) )
			.append( $('<td>').html(qna.trainer_qna_content) )
			.append( $('<td>').html(qna.question_user_no) )
			.append( $('<td>').html(qna.created_at) )
			.append( $('<td>').html('<a href="">답변달기</a>') )
			.appendTo('#qnaList');
		});
	}
	
	// 현재 패이지로 이동시 자동으로 뎃글 리스트를 불러올 ajax함수
	function getTrainerQnAList() {
		var user_no = ${trainerTemDto.user_no}
		$.ajax ({
			url: 'getTrainerQnAList.plitche/' + user_no,
			type: 'get',
			dataType: 'json',
			success: function(responseObj) {
				if (trainerQnA.result) {
					trainerQnAListTable(responseObj.qnaList);
				} else {
					alert('등록을 등록하지 못했습니다.');
					$('<p>').html('등록된 질문이 없습니다.')
					.appendTo('#qnaList');
				}
			},
			error: function(){alert('뎃글 가져오기 실패');}
		});
	}
	
	// 작성된 질문내용을 처리하는 ajax 함수
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
						trainerQnAListTable(responseObj.qnaList);
					} else {
						alert('등록을 등록하지 못했습니다.');
						$('<p>').html('등록된 질문이 없습니다.')
						.appendTo('#qnaList');
					}
				},
				error: function(){alert('실패');}
			});
		});
	}
	// ajax처리 후 modal창 닫아주는 함수
	function closeModal() {
		$('#writeQuestion').click(function() {
			$('#modal').attr("style", "display:none");
		});
	}
</script>
<!-- 질문 클릭 시 상세 내용이 modal로 나오게 하기 위한 ajax -->
<script>
	function fn_showQNA(no) {
		alert(no);
	}
</script>

<div id="trainerInfo">
	<div id="trainerSimple">
		<div id="trainerImage">
			트레이너 사진 파일 이름: ${trainerTemDto.profile_photo} <br/>
		</div>
		<p style="color: red;"> &lt; 트레이너 정보 &gt; </p>
		<p style="font-size: 1.5rem; font-weight: 800;">닉네임 : ${trainerTemDto.user_nickname}</p>
		<p style="font-size: 1rem; font-weight: 600">이름 : ${trainerTemDto.trainer_name} </p>
		<p>활동 센터 : ${trainerTemDto.employment} </p>		
		<p>상태 메세지 : ${trainerTemDto.user_message} </p>
	</div>
	<div id="trainerDetail">
		<p>* 트레이너 경력 : ${trainerTemDto.career}년</p>
		<pre>* 트레이너 프로필 : ${trainerTemDto.profile}
		 
		 저는 예전엔 120kg이 나가는 운동의 운자도 모르던
		 친구였었습니다..! 지금의 모습이 되기까지 미친듯한 다이어트가 도움됐다기보단 운동을 
		 즐기고 꾸준한 생활습관에서의 노력이 제모습들을 만들었다고 생각이 듭니다:)
		 
		 여러분 또한 버핏서울과 함께하며 운동이란 게 힘들고 어려운 게 아니라 충분히 즐겁고 내
		 삶의 일부가 될 수가 있다는 것을 느껴보셨으면 좋겠습니다. 우리가 함께 땀 흘리고 
		 즐기다 보면 어느새 내가 꿈꾸던 모습들에 한 발자국 더 다가갈 수 있지 않을까 라는 
		 생각이 듭니다!
		 
		 저 또한 옆에서 여러분들이 다치지 않고 재밌게 즐기실 수 있도록 최선을 다해 도와드리도록
		 하겠습니다!
	 	 버핏서울 화이팅.!!
	 	 </pre>
	</div>
</div>

<div id="tab">
	<ul>
		<li data-id="trainerMeetingList" class="on">${trainerTemDto.user_nickname}의 모임들</li>
		<li data-id="trainerReviewList2">${trainerTemDto.user_nickname}에게 달린리뷰</li>
		<li data-id="trainerQnAList2">${trainerTemDto.user_nickname}에게 달린질문</li>
	</ul>
	총 : ##개  &nbsp;&nbsp;&nbsp;&nbsp; <a href="goCreateMeetingPage.plitche">새 프로그램 등록하기</a> <br/>
	<div id=trainerMeetingList class="conBox on"></div>
	<div id=trainerReviewList2 class="conBox">1241242</div>
	<div id=trainerQnAList2 class="conBox">13512343</div>
</div>

<!-- tab형식 구현을 위한 script -->
<script>
	$(function() {
		$('#tab ul li').click(function(){
			$('#tab ul li').removeClass('on');
			$('#tab .conBox').removeClass('on');
			$(this).addClass('on');
			$('#'+$(this).data('id')).addClass('on');
		});
	});
	
</script>

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
</div><br/>
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
				<td>비고</td>
			</tr>
		</thead>
		<tbody id="qnaList"></tbody>
	</table>
</div>

<!-- 모달창 구현을 위한 script -->
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




