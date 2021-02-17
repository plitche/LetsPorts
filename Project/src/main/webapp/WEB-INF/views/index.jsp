<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="template/header.jsp" />
<script src="https://kit.fontawesome.com/6b75fdce2b.js" crossorigin="anonymous"></script>

	<!-- 스크롤 이벤트 감지 script -->
	<script>
	
	
	</script>
	<!-- main화면에 표시해줄 정보들 관련 script -->
	<script>
		$(document).ready(function() {
			getMeeting();
			getTrainer();
			getQnA();
		});
	
		/* 마감이 임박한 모임정보를 가져오기 위한 ajax */
		function getMeeting() {
			$.ajax({
				url: 'getMeeting.plitche',
				type: 'get',
				dataType: 'json',
				success: function(responseObj) {
					if (responseObj.result) {
						mainMeetingList(responseObj.meetingList);
					} else {

					}
				},
				error: function(){alert('모임 정보 가져오기 실패');}
			});
		}

		/* 가져온 모임 list를 append해주기 위한 서브함수 */
		function mainMeetingList(meetingList) {
			$('#meetingList').empty();
			$.each(meetingList, function(idx, meeting) {
				var showProfile = null;
				if (meeting.profile_photo == null) {
					showProfile = $('<span>').html('<img alt="blank-profile-picture" src="resources/images/blank-profile-picture.png">');
				} else {
					showProfile = $('<span>').html('<img alt="'+meeting.profile_photo+'" src="resources/storage/profile_photo/'+meeting.profile_photo+'">');		
				}
				
				$('<a href="#" onclick="fn_showMeeting(' + meeting.meeting_no + '); return false;">')
				.append( $('<div>').addClass('trainerMeeting') 
					.append( $('<div>').html('<img alt="' + meeting.photo_filename + '" src="resources/storage/' + meeting.photo_filename + '" >') )
					.append( $('<div class="meetingContent">')
						.append( $('<div>').text(meeting.meeting_title) )
						.append( $('<div>')
							.append( $('<div>').text(meeting.exercise_name) )
							.append( $('<div>').text(meeting.meeting_min +'명 ~ ' + meeting.meeting_max+'명') )
						 )
						.append( $('<div>').html('<i class="fas fa-map-marker-alt"></i> '+meeting.location1_name + ' ' + meeting.location2_name + ' ∙ ' + meeting.meeting_date2) )
						.append( $('<div class="writerInfo">')
							.append(showProfile)
							.append( $('<span>').text(meeting.user_nickname) )
						)
					)
				)
				.appendTo('#meetingList');
			});
			
		}
		
		/* 모임 제목을 클릭하면 해당모임 View페이지로 이동할 함수 */
		function fn_showMeeting(meeting_no) {
			location.href = 'meetingViewPage.plitche?meeting_no='+meeting_no;
		}
		
		/* 인기 트레이너 정보를 가져오기 위한 ajax */
		function getTrainer() {
			$.ajax({
				url: 'getTrainer.plitche',
				type: 'get',
				dataType: 'json',
				success: function(responseObj) {
					if (responseObj.result) {
						fn_mainQnAList(responseObj.trainerList);
					} else {

					}
				},
				error: function(){alert('트레이너 정보 가져오기 실패');}
			});
		}
		
		/* 가져온 트레이너 list를 append해주기 위한 서브함수 */
		function fn_mainQnAList(trainerList) {
			$('#trainer-list').empty();
			$.each(trainerList, function(idx, trainer) {
				$('#trainer-list')
				.append( $('<a href="goTrainerDetail.plitche?user_no='+ trainer.user_no +'">') 
					.append( $('<div>').addClass('trainer')
						.append( $('<div>').addClass('trainer-picture')
							.append( $('<div>').addClass('overlay')
								.append( $('<div style="bottom: 60px;">').html('<i class="fas fa-check-circle"></i> 활동센터 : '+trainer.employment) )
								.append( $('<div style="bottom: 30px;">').html('<i class="fas fa-check-circle"></i> 활동경력 : '+trainer.career+'년') )
								.append( $('<div style="bottom: 0px;">').html('<i class="fas fa-check-circle"></i> '+trainer.user_message) )
							)
							.append( $('<img alt="'+ trainer.profile_photo +'" src="resources/storage/profile_photo/'+ trainer.profile_photo +'" >') )
						)
						.append( $('<div>').addClass('trainer-info') 
							.append( $('<div>').text(trainer.trainer_name) )
							.append( $('<div>').text(trainer.user_nickname) )
							.append( $('<div>')
								.append( $('<span>').html('<i class="fas fa-star"></i> '+ trainer.score +'점') )
								.append( $('<span>').html('<i class="far fa-comments"></i> '+ trainer.reviews +'개') )
							)
						)
					)
				)

			});
			
		}
		
		/* 최근 질의응답 정보를 가져오기 위한 ajax */
		function getQnA() {
			$.ajax({
				url: 'getQnA.plitche',
				type: 'get',
				dataType: 'json',
				success: function(responseObj) {
					if (responseObj.result) {
						mainQnAList(responseObj.data);
					}
				},
				error: function(){alert('댓글 정보 가져오기 실패');}
			});
		}
		
		/* 가져온 질의응답 list를 append해주기 위한 서브함수 */
		function mainQnAList(qnaList) {
			$('#mainQnAList').empty();
			$.each(qnaList, function(idx, qna){
				var isSolved = null
				if (qna.is_resolved == '0') {
					isSolved = '<td style="color:orangered;">미 해결</td>';
				} else {
					isSolved = '<td style="color:green;">해결완료</td>';
				}
				
				var board_qna_title = qna.board_qna_title;
				if (board_qna_title.length > 16) {
					board_qna_title = board_qna_title.substring(0, 16);
					board_qna_title += '...';
				}
				
				$('#mainQnAList')
				.append( $('<tr>').html('<td><a href="goQnAViewPage.plitche?board_qna_no='+qna.board_qna_no+'&page=1"> ⊙'+ board_qna_title +'</a></td>')
					.append( $(isSolved) )
					.append( $('<td>'+ qna.user_nickname +'</td>') )
				)
			});
		}
		
	</script>


	<div>이미지</div>
	
	<div id="container">
		<div id="meeting">
			<h3>Last! Community</h3>
			<span><a href="TrainerClassListPage.leo"> 전체 모임 리스트 보기 ></a></span>
			<div id="meetingList"></div>
		</div>
		<div id="qna">
			<h3>Recent! Q&A</h3>
			<span><a href="goQnAPage.plitche"> 전체 질문 보기 ></a></span>
			<div>
				<table>
					<colgroup>
						<col width="300">
						<col width="100">
						<col width="150">
					</colgroup>
					<thead>
						<tr>
							<td colspan="3">Today's Question</td>
						</tr>
					</thead>
					<tbody id="mainQnAList"></tbody>
				</table>
			</div>
		</div>
		<div id="trainer">
			<h3>Hit! Trainer</h3>
			<span><a href="goTrainerList.plitche">전체 트레이너 목록 보기 ></a></span>
			<div id="trainer-list"></div>
		</div>
	</div>


<%@ include file="template/footer.jsp" %>