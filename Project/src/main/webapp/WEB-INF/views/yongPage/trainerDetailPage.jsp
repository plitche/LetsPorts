<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link type="text/css" rel="stylesheet" href="resources/style/soo/trainerDetailPage.css" >
<script src="resources/style/soo/trainerDetailPage.js"></script>
<!DOCTYPE html>

<jsp:include page="../template/header.jsp">
	<jsp:param value="트레이너 상세 페이지" name="title"/>
</jsp:include>


<!-- 트레이너 모임 관련 ajax -->
<script>
	/* 페이지 로드 */
	$(document).ready(function() {
		trainerMeetingListTable();
		getTrainerMeetingList();
	});

	/* 불러온 모임 list를 토대로 append 해주기 위한 function */
	function trainerMeetingListTable(list, trainerInfo) {
		$('#trainerMeetingList').empty();
		$.each(list, function(idx, meeting){
			$('<a href="#" onclick="fn_showMeeting(' + meeting.meeting_no + '); return false;">')
			.append( $('<div>').addClass('trainerMeeting') 
			.append( $('<div>').html('이미지') )
			.append( $('<p>').html(meeting.meeting_title) )
			.append( $('<p>').html('최소: ' + meeting.meeting_min + '명 / 최대: ' + meeting.meeting_max + '명')  )
			.append( $('<p>').html('일시: ' + meeting.meeting_date) )
			.append( $('<p>').html('작성자: ' + trainerInfo.user_nickname) )
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
					$('<div>')
					.append( $('<p>').html('총 :' + responseObj.totalMeetingCount + '개') )
					.appendTo('#totalMeeting');
					trainerMeetingListTable(responseObj.meetingList, responseObj.trainerTemDto);
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

<!-- 트레이너 리뷰 관련 ajax -->
<script>
	/* 페이지로드 이벤트 */
	$(document).ready(function(){
		getReviewList();
		openReviewPopUp();
		closeReviewModal();
	});
	
	function reivewListTable(list) {
		$('#trainerReviewList').empty();
		$.each(list, function(idx, review) {
			$('#reviewList')
			.append( $('<div>') 
				.append( $('<div>').html('닉네임') )
				.append( $('<div>').html('평점') )
			)
			.append( $('<div>').html('모임 제목, 모임 날짜, 종목') )
			.append( $('<div>').html('리뷰 내용')
				.append( $('<div>').html('to ~~ 트레이너') )
				.append( $('<div>').html('날짜') )
			)
		});
	}
	
	/* 현재 페이지로 이동시 트레이너에게 달린 리뷰를 자동으로 가져오는 ajax함수 */
	function getReviewList() {
		var user_no = ${trainerTemDto.user_no};
		$.ajax({
			url: 'getReviewList.plitche/' + user_no,
			type: 'get',
			contentType: 'json',
			success: function(responseObj) {
				if(responseObj.result) {
					$('<div>')
					.append( $('<p>').html('총 :' + responseObj.reviewCount + '개') )
					.appendTo('#totalReview');
					reivewListTable(responseObj.reviewList);
				} else {
					$('<div>')
					.append( $('<p>').html('총 :' + responseObj.reviewCount + '개') )
					.appendTo('#totalReview');
				}
			},
			error: function(){alert('리뷰 ajax 실패');}
		});	
	}
	
	/* 리뷰 등록하기 버튼 클릭시 리뷰를 작성할 수 있는 모달창을 띄워주기 위한 함수 */
	function openReviewPopUp() {
		$('#openReviewModal').click(function() {
			if( '${loginUser.user_no}' == '' ) {
				if (confirm('로그인이 필요한 기능입니다. 로그인 페이지로 이동하시겠습니까?')) {
					location.href='usersLoginPage.hey';
				} 
			} else {
				$('#qnaDetail').empty();
				$('#qnaDetail')
				.append( $('<div>').html('작성자 : ${loginUser.user_nickname}') )
				.append( $('<form>')
					.append( $('<div>')
						.append( $('<select>')
							.append( $('<option value="">').html('함께 했던 모임 리스트1') )		
							.append( $('<option value="">').html('함께 했던 모임 리스트2') )		
							.append( $('<option value="">').html('함께 했던 모임 리스트3') )		
						)
						.append( $('<input type="text" placeholder="평점 입력">') )
					)
					.append( $('<textarea rows="10" cols="50" placeholder="리뷰 내용을 작성하세요.">') )
					.append( $('<input type="button" value="작성완료" id="writeReview" onclick="" />'))
				)
				$('#modal').attr("style", "display:block");
			}
		});
	}
	
	/* 작성완료 눌렀을 때 모달창을 닫아주는 함수 */
	function closeReviewModal() {
		$(document).on('click', '#writeReview', function() {
			$('#modal').attr("style", "display:none");
		});
	}

</script>
<!-- 트레이너 질문 관련 ajax -->
<script>
	// 페이지 로드
	$(document).ready(function(){
		getTrainerQnAList();
		writeQuestion();
		closeModal();
		openQnAPopUp();
	});
	
	// 해당 트레이너에게 달린 질문 data를 append하는 서브함수
	function trainerQnAListTable(list, trainerInfo) {
		$('#qnaList').empty();
		$.each(list, function(idx, qna){
			if (qna.is_answered==0) {
				$('<tr>')
				.append( $('<td name="qnA_no">').html(qna.trainer_qna_no) )
				.append( $('<td>').html('<a href="#" onclick="fn_showQnA(' + qna.trainer_qna_no + '); return false;">' + qna.trainer_qna_title + '</a>') )
				.append( $('<td>').html('<a href="#" onclick="fn_showQnA(' + qna.trainer_qna_no + '); return false;">' + qna.trainer_qna_content + '</a>') )
				.append( $('<td>').html(trainerInfo.user_nickname) )
				.append( $('<td>').html(qna.created_at) )
				.append( $('<input type="hidden" name="' + qna.trainer_qna_no + '" value="' + idx + '"/>') )
				.append( $('<td name="isAnswered">').addClass('isAnswered').html('미답변') )
				.appendTo('#qnaList');
			} else {
				$('<tr>')
				.append( $('<td name="qnA_no">').html(qna.trainer_qna_no) )
				.append( $('<td>').html('<a href="#" onclick="fn_showQnA(' + qna.trainer_qna_no + '); return false;">' + qna.trainer_qna_title + '</a>') )
				.append( $('<td>').html('<a href="#" onclick="fn_showQnA(' + qna.trainer_qna_no + '); return false;">' + qna.trainer_qna_content + '</a>') )
				.append( $('<td>').html(trainerInfo.user_nickname) )
				.append( $('<td>').html(qna.created_at) )
				.append( $('<td name="isAnswered">').addClass('isAnswered').html('답변완료') )
				.appendTo('#qnaList');
			}
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
				if (responseObj.result) {
					$('#totalQnA').empty();
					$('<div>')
					.append( $('<p>').html('총 :' + responseObj.totalQnACount + '개') )
					.appendTo('#totalQnA');
					trainerQnAListTable(responseObj.qnaList, responseObj.trainerTemDto);
				} else {
					$('<tr>')
					.append( $('<td colspan="6">').html('등록된 질문이 없습니다. 첫 번째 질문을 등록해 주세요.') )
					.appendTo('#qnaList');
				}
			},
			error: function(){alert('답변 가져오기 실패');}
		});
	}

	// 트레이너 디테일 페이지에서 새 질문 작성하기 작성 때마다 알맞은 폼을 생성해줄 함수
	function openQnAPopUp() {
		$('#openQnAModal').click(function() {
			if( '${loginUser.user_no}' == '' ) {
				if (confirm('로그인이 필요한 기능입니다. 로그인 페이지로 이동하시겠습니까?')) {
					location.href='usersLoginPage.hey';
				}
			} else {
				$('#qnaDetail').empty();
				$('<form>')
				.append( $('<input type="text" id="title" name="trainer_qna_title" placeholder="제목을 입력하세요."/>') )
				.append( $('<input type="text" id="content" name="trainer_qna_content" placeholder="질문내용을 입력하세요."/>')  )
				.append( $('<br/>') )
				.append( $('<input type="checkbox" name="is_published" id="is_published" value="1"/>') )
				.append( $('<label for="is_published">').html('비밀글 처리하기') )		
				.append( $('<input type="button" value="작성완료" id="writeQuestion"/>') )
				.appendTo('#qnaDetail');
			}
		});
	}
	
	// 작성된 질문내용을 처리하는 ajax 함수
	function writeQuestion() {
		$(document).on("click", "#writeQuestion", function() {
			var question_user_no = '${loginUser.user_no}'
			var trainer_user_no = ${trainerTemDto.user_no};
			var trainer_qna_title = $('input[name="trainer_qna_title"]').val();
			var trainer_qna_content = $('input[name="trainer_qna_content"]').val();
			var is_published = $('input[name="is_published"]').val();
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
					} else {
						alert('등록을 등록하지 못했습니다.');
					}
					getTrainerQnAList();
				},
				error: function(){alert('질문 작성하기 실패');}
			});
		});
	}
	
	// 질문 내용 클릭 시 상세 내용이 modal로 나오게 하기 위한 ajax
	function fn_showQnA(trainer_qna_no) {
		$.ajax ({
			url: 'showQnA.plitche/' + trainer_qna_no,
			type: 'get',
			dataType: 'json',
			success: function (responseObj) {
				if (responseObj.result) {
					if (responseObj.answer) {
						$('#modal').attr("style", "display:block");
						$('#qnaDetail').empty();
						$('<div>')
						.append( $('<p>').html('작성자: ' + responseObj.qna.question_user_no) )
						.append( $('<p>').html('질문 제목: ' + responseObj.qna.trainer_qna_title) )
						.append( $('<p>').html('질문 내용: ' + responseObj.qna.trainer_qna_content) )
						.append( $('<p>').html('작성일: ' + responseObj.qna.created_at) )
						.append( $('<p>').html('답변 내용: '+ responseObj.qna.trainer_qna_answered) )
						.append( $('<p>').html('답변 작성일: '+ responseObj.qna.answered_date) )
						.appendTo('#qnaDetail');
					} else {
						if ('${loginUser.user_no}' == ${trainerTemDto.user_no}) {
							$('#modal').attr("style", "display:block");
							$('#qnaDetail').empty();
							$('<div>')
							.append( $('<p>').html('작성자: ' + responseObj.qna.question_user_no) )
							.append( $('<p>').html('질문 제목: ' + responseObj.qna.trainer_qna_title) )
							.append( $('<p>').html('질문 내용: ' + responseObj.qna.trainer_qna_content) )
							.append( $('<p>').html('작성일: ' + responseObj.qna.created_at) )
							.append( $('<input type="button" value="답변 작성하기" onclick="fn_openAnswer('+ trainer_qna_no +')">') )
							.appendTo('#qnaDetail');
						} else {
							$('#modal').attr("style", "display:block");
							$('#qnaDetail').empty();
							$('<div>')
							.append( $('<p>').html('작성자: ' + responseObj.qna.question_user_no) )
							.append( $('<p>').html('질문 제목: ' + responseObj.qna.trainer_qna_title) )
							.append( $('<p>').html('질문 내용: ' + responseObj.qna.trainer_qna_content) )
							.append( $('<p>').html('작성일: ' + responseObj.qna.created_at) )
							.appendTo('#qnaDetail');
						}
						
					}
				}
			},
			error: function(){alert('선택한 질문 가져오기 실패');}
		});
	}
	
	// 질문 내용 클릭 후 modal창에서 답변 작성하기를 눌렀을 때 추가로 밑에 작성 란이 보이도록 하기위한 처리
	function fn_openAnswer(trainer_qna_no) {
		$('<div>')
		.append ( $('<form>')
			.append ( $('<textarea rows="10" cols="50" name="trainer_qna_answered" id="answerContent" >') )
			.append ( $('<input type="button" id="answerBtn" value="답변작성완료" onclick="fn_writeAnswer(' + trainer_qna_no + ')" >') )	
		)
		.appendTo('#qnaDetail');
	}
	
	// 질문 답변 작성 완료 후 답변작성 완료를 누르면 작동할 ajax함수
	function fn_writeAnswer(trainer_qna_no) {
		var trainer_qna_answered = $('textarea[name="trainer_qna_answered"]').val();
		var sendObj = {
			"trainer_qna_no": trainer_qna_no,
			"trainer_qna_answered": trainer_qna_answered
		};
		
		$.ajax({
			url: 'writeAnswer.plitche',
			type: 'post',
			data: JSON.stringify(sendObj),
			contentType: 'application/json; charset=utf-8',
			dataType: 'json',
			success: function (responseObj) {
				if (responseObj.result) {
					var index = $('input:hidden[name=' + trainer_qna_no + ']').val();
					$('#qnaList tr:eq(' + index + ') td:eq(5)').text('답변완료');
				} else {
					alert('답변이 작성되지 않았습니다.');
				}
			},
			error: function(){alert('답변 남기기 실패');}
		});
	}
	
	// ajax처리 후 modal창 닫아주는 함수
	function closeModal() {
		$(document).on("click", "#writeQuestion", function() {
			$('#modal').attr("style", "display:none");
		});
		$(document).on("click", "#answerBtn", function() {
			$('#modal').attr("style", "display:none");
		});
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
		<li data-id="meetingList" class="on">${trainerTemDto.user_nickname}의 모임들</li>
		<li data-id="reviewList">${trainerTemDto.user_nickname}에게 달린리뷰</li>
		<li data-id="QnAList">${trainerTemDto.user_nickname}에게 달린질문</li>
	</ul>
	<div id="meetingList" class="conBox on">
		<c:if test="${loginUser.user_no eq trainerTemDto.user_no}">
			<a href="goCreateMeetingPage.plitche">새 프로그램 등록하기</a>
		</c:if>
		<div id="totalMeeting"></div>
		<div id="trainerMeetingList"></div>
	</div>
	
	<div id="reviewList" class="conBox">
		<button type="button" id="openReviewModal">새 리뷰 등록하기</button>
		<div id="totalReview"></div>
		<div id="trainerReviewList"></div>
	</div>
		
	<div id="QnAList" class="conBox">
		<button type="button" id="openQnAModal">새 질문 등록하기</button>
		<div id="totalQnA"></div>
		<div id="trainerQnAList">
			<table id="questionList">
				<thead>
					<tr>
						<td class="questionNo">질문번호</td>
						<td class="questionTitle">질문제목</td>
						<td class="questionContent">질문내용</td>
						<td class="questionWriter">작성자</td>
						<td class="create_at">일시</td>
						<td class="answered">답변여부</td>
					</tr>
				</thead>
				<tbody id="qnaList"></tbody>
			</table>
		</div>
	</div>
</div>

<div>
  	<div id="modal">
  		<div class="modal_content">
		    <button id="closeQnAModal">X</button>
		    <div id="qnaDetail"></div>
	    </div>
	    <div class="modal_layer"></div>
  	</div>
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

<!-- 모달창 구현을 위한 script -->
<script>
	$('#openQnAModal').click(function() {
		$('#modal').attr("style", "display:block");
	});
	$('#closeQnAModal').click(function() {
		$('#modal').attr("style", "display:none");
		// $('#showModal').attr("style", "display:none");
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




