<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link type="text/css" rel="stylesheet" href="resources/style/soo/meetingViewPage.css" >
<!DOCTYPE html>

<jsp:include page="../template/header.jsp">
	<jsp:param value="모임 VIEW 페이지" name="title"/>
</jsp:include>

<!-- sweetalert -->
<script>
	/* 로그인 alert을 위한 function */
	var loginAlert = function() {
						swal.fire({
							title: '로그인이 필요한 기능입니다!', 	text: '로그인 페이지로 이동하시겠습니까?',
							icon: 'warning',     			showCancelButton: true,
							confirmButtonColor: 'green',	cancelButtonColor: 'red',
							confirmButtonText: '이동하기',		cancelButtonText: '머물기'
						}).then((result)=> {
							if (result.isConfirmed) {
								Swal.fire('로그인 페이지로 이동합니다.', '로그인 후 더 많은 정보를 확인하세요!^^', 'success').then((result)=> {
										location.href='usersLoginPage.hey';	
									}
								);
							}
						});
					}
</script>

<!-- 이 호스트의 다른 모임 list ajax-->
<script>
	/* 페이지 로드 */
	$(document).ready(function() {
		getOtherMeetingList();
	});
	
	/* 불러온 모임 list를 토대로 append 해주기 위한 function */
	function getOtherMeetingTable(list) {
		$('#otherMeeting').empty();
		$.each(list, function(idx, meeting){
			$('<a href="#" onclick="fn_showMeeting(' + meeting.meeting_no + '); return false;">')
			.append( $('<div>').addClass('trainerMeeting') 
			.append( $('<div>').html('<img alt="' + meeting.photo_filename + '" src="resources/storage/' + meeting.photo_filename + '" >') )
			.append( $('<p>').html(meeting.meeting_title) )
			.append( $('<p>').html('모임 주제: ' + meeting.exercise_name) )
			.append( $('<p>').html('최소: ' + meeting.meeting_min + '명 / 최대: ' + meeting.meeting_max + '명')  )
			.append( $('<p>').html('일시: ' + meeting.meeting_date) )
			.append( $('<p>').html('작성자: ' + meeting.user_nickname) )
			)
			.appendTo('#otherMeeting');
		});
	}
	
	/* 트레이너 디테일페이지에서 모임View페이지로 이동시 자동으로 실행 될 함수(모임 리스트 불러오기용) */
	/* 현재 보고 있는 모임 제외하고 같은 작성자의 다른 모임들을 불러와야 함. */
	function getOtherMeetingList() {
		var user_no = ${meetingDto.user_no};
		var meeting_no = ${meetingDto.meeting_no};
		var sendObj = {
			"user_no": user_no,
			"meeting_no": meeting_no
		};
		
		$.ajax({
			url: 'getOtherMeeting.plitche',
			type: 'post',
			data: JSON.stringify(sendObj),
			contentType: 'application/json; charset=UTF-8',
			dataType: 'json',
			success: function(responseObj) {
				if (responseObj.result == true) {
					getOtherMeetingTable(responseObj.meetingList);
				} else {
					$('<tr>')
					.append( $('<td colspan="4">').html('다른 모임 게시글이 없습니다.') )
					.appendTo('#otherMeeting');
				}
			},
			error: function(){alert('실패');}
		});
		
	}

	/* 트레이너의 다른 모임 제목을 클릭하면 해당모임 View페이지로 이동할 함수 */
	function fn_showMeeting(meeting_no) {
		location.href = 'meetingViewPage.plitche?meeting_no='+meeting_no;
	}
</script>

<!-- 다른 호스트의 같은 운동 모임 list ajax -->
<script>
	/* 페이지로드 */
	$(document).ready(function() {
		getOtherHostMeetingList();
	});
	
	/* 다른 호스트의 같은 운동종목 모임을 만들어주는, 서브 함수 */
	function otherHostMeetingTable(list) {
		$('#otherHostMeeting').empty();
		$.each(list, function(idx, meeting){
			$('<a href="#" onclick="fn_showMeeting(' + meeting.meeting_no + '); return false;">')
			.append( $('<div>').addClass('trainerMeeting') 
			.append( $('<div>').html('<img alt="' + meeting.photo_filename + '" src="resources/storage/' + meeting.photo_filename + '" >') )
			.append( $('<p>').html(meeting.meeting_title) )
			.append( $('<p>').html('모임 주제: ' + meeting.exercise_name) )
			.append( $('<p>').html('최소: ' + meeting.meeting_min + '명 / 최대: ' + meeting.meeting_max + '명')  )
			.append( $('<p>').html('일시: ' + meeting.meeting_date) )
			.append( $('<p>').html('작성자: ' + meeting.user_nickname) )
			)
			.appendTo('#otherHostMeeting');
		});
	}
	
	/* 트레이너 View페이지에서 모임View페이지로 넘어올 때 자동으로 실행될 ajax 함수 */
	function getOtherHostMeetingList() {
		var user_no = ${meetingDto.user_no};
		var exercise_no = ${meetingDto.exercise_no};
		var sendObj = {
			"user_no": user_no,
			"exercise_no": exercise_no
		};
	
		$.ajax ({
			url: 'getOtherHostMeeting.plitche',
			type: 'post',
			data: JSON.stringify(sendObj),
			contentType: 'application/json; charset=UTF-8',
			dataType: 'json',
			success: function(responseObj) {
				if (responseObj.result) {
					otherHostMeetingTable(responseObj.meetingList);
				} else {
					$('<tr>')
					.append( $('<td colspan="5">').html('같은 운동종목의 다른 모임이 없습니다.') )
					.appendTo('#otherHostMeeting');
				}
			},
			error: function(){alert('실패3');}
		});
	}
	
	/* 트레이너의 다른 모임 제목을 클릭하면 해당모임 View페이지로 이동할 함수 */
	function fn_showMeeting(meeting_no) {
		location.href = 'meetingViewPage.plitche?meeting_no='+meeting_no;
	}
	
</script>

<!-- 댓글을 위한 ajax  -->
<script>
	$(document).ready(function() {
		getCommentList();
		addComment();
		showBtns()
	});	
	
	// 가져온 뎃글 목록을 직접 append처리 해주기 위한 서브 함수
	function commentListTable(list) {
		$('#commentContent').empty();
		$.each(list, function(idx, comment){
			if ('${loginUser.user_no}' == comment.user_no) {
				$('<div class="comment-container">')
				.append( $('<div class="profile">').html('<img alt="프로필" src="">') )
				.append( $('<div class="comment-content">')
					.append( $('<p>').html('닉네임: ' + comment.user_nickname) )
					.append( $('<p>').html('내용: ' + comment.comment_content) )
					.append( $('<p>').html('작성일: ' + comment.created_at) )
				)
				.append( $('<div class="comment-btn">').html('<input type="button" class="btnsBtn" value="[버튼]" />')
					.append( $('<a href="#" class="btnClass" onclick="fn_commentUpdate(' + comment.comment_no + '); return false;" >').html('수정') )
					.append( $('<a href="#" class="btnClass" onclick="fn_commentDelete(' + comment.comment_no + '); return false;" >').html('삭제') )		
				)
				.appendTo('#commentContent');
			} else {
				$('<div class="comment-container">')
				.append( $('<div class="profile">').html('<img alt="프로필" src="">') )
				.append( $('<div class="comment-content">')
					.append( $('<p>').html('닉네임: ' + comment.user_nickname) )
					.append( $('<p>').html('내용: ' + comment.comment_content) )
					.append( $('<p>').html('작성일: ' + comment.created_at) )
				)
				.appendTo('#commentContent');
			}
		});
	}	
	
	// 모임 View페이지로 이동시 자동으로 뎃글 목록을 가져올 ajax함수
	function getCommentList() {
		var meeting_no = ${meetingDto.meeting_no};
		
		$.ajax ({
			url: 'getCommentList.plitche/'+ meeting_no,
			type: 'get',
			dataType :'json',
			success: function(responseObj) {
				if(responseObj.result) {
					commentListTable(responseObj.commentList);	
				} else {
					$('#commentContent').empty();
					$('<tr>')
					.append( $('<td colspan="6">').html('작성된 comment가 없습니다. 첫번째 뎃글을 작성해주세요.') )
					.appendTo('#commentContent');
				}
			},
			error: function(){alert('실패');}
		});
	};


	// 뎃글 작성 완료 버튼 클릭시 작동할 ajax함수
	function addComment() {
		$('#addComment').click(function(){
			if ( '${loginUser.user_no}' == '' ) {
				loginAlert();
			} else {
				var meeting_no = ${meetingDto.meeting_no};
				var user_no = '${loginUser.user_no}';
				var comment_content = $('textarea[name="comment_content"]').val();
				var board_user_no = ${trainerTemDto.user_no}
				var sendObj = {
					"comment_referer_no": meeting_no,
					"user_no": user_no,
					"comment_content": comment_content,
					"board_user_no": board_user_no
				};
				
				$.ajax({
					url: 'addComment.plitche',
					type: 'post',
					dataType: 'json',
					data: JSON.stringify(sendObj),
					contentType: 'application/json; charset=utf-8',
					success: function(responseObj) {
						if(responseObj.result) {
							alert('새로운 뎃글이 작성되었습니다.');
							getCommentList();
							document.getElementById("comment_content").value='';
						} else {
							alert('뎃글이 작성되지 않았습니다.');
						}
					},
					error: function(){alert('실패');}
				});
			}
		});
	}
	
	// 버튼 클릭 시 하위 수정, 삭제 버튼이 나오게 하기위한 function
	function showBtns() {
		$(document).on('click', '.btnsBtn', function() {
			if ( $('.btnClass').css('display') == 'none') {
				$(this).parent('div').find('a').show();
			} else {
				$(this).parent('div').find('a').hide();
			}
		});
	}
	
	// 뎃글 삭제 버튼을 눌렸을때 작동할 ajax함수
	function fn_deleteComment(comment_no) {
		if (confirm('뎃글을 삭제하시겠습니까?')) {
			$.ajax({
				url: 'deleteComment.plitche/'+ comment_no,
				type: 'get',
				dataType: 'json',
				success: function(responseObj) {
					if (responseObj.result) {
						alert('뎃글이 삭제되었습니다.');
						getCommentList();
					} else {
						alert('뎃글이 삭제되지 않았습니다.');
					}
				},
				error: function(){alert('실패');}
			});
		}
	}
</script>

<!-- 신청하기 버튼 클릭시 작동 -->
<script>
	$(document).ready(function() {
		applyMeeting();
	});
	
	function applyMeeting() {
		$(document).on('click', '#applyMeeting', function() {
			if( '${loginUser.user_no}' == '' ) {
				loginAlert();
			} else {
				alert('구현해야됨');
				location.href='';
			}
			
		});
	}
</script>

<!-- 트레이너에게 질문하기 버튼 클릭시 작동-->
<script>
	$(document).ready(function() {
		goQuesionToTrainer();
		writeQuestion();
	});
	
	function goQuesionToTrainer() {
		$('#questionToTrainer').click(function () {
			if( '${loginUser.user_no}' == '' ) {
				loginAlert();
			} else {
				$('#qnaDetail').empty();
				$('<form>')
				.append( $('<input type="text" id="title" name="trainer_qna_title" placeholder="제목을 입력하세요."/>') )
				.append( $('<input type="text" id="content" name="trainer_qna_content" placeholder="질문내용을 입력하세요."/>')  )
				.append( $('<br/>') )
				.append( $('<div>') 
					.append( $('<input type="checkbox" name="is_published" id="is_published" value="1"/>') )
					.append( $('<label for="is_published">').html(' 비밀글 처리하기') )		
					.append( $('<input type="button" value="작성완료" id="writeQuestion"/>') )
				)
				.appendTo('#qnaDetail');
				$('#modal').attr("style", "display:block");
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
						if (confirm('작성된 질문을 확인하러 이동하시겠습니까?')) {
							location.href='goTrainerDetail.plitche?user_no='+trainer_user_no;
						}
					} else {
						alert('등록을 등록하지 못했습니다.');
					}
					getTrainerQnAList();
				},
				error: function(){alert('질문 작성하기 실패');}
			});
		});
	}

</script>

<div id="meeting">
	<div id="meetingHeader">
		<p id="meetingTitle"> ${meetingDto.meeting_title} </p>
		<a href="#"> 관심 모임으로 등록하기 </a>
	</div>
	<div id="meetingInfo">
		<div id="meetingDetail">
			<p>모임일 : ${meetingDto.meeting_date}</p>
			<p>지역 : ${meetingDto.location1_name} ${meetingDto.location2_name} </p>
			<p>총 모집 인원 : ${meetingDto.meeting_max}</p>
			<p>최소 모집 인원 : ${meetingDto.meeting_min}</p>
			<p>현재 신청 인원 : ???</p>
			<p>준비물 : 
				<c:forEach var="list" items="${materialList}">
			  		${list.materials_name} &nbsp;
		    	</c:forEach>
			</p>
		</div>
		<div id="mainImg">
			<img alt="대표사진" src="" id="">
		</div>
	</div>
	<div id="meetingContent">
		<pre>상세 내용 : ${meetingDto.meeting_content}</pre>
	</div>
</div>

<p style="font-weight: 800; font-size: 1.5rem; margin-top: 20px;">작성자 정보</p>
<div id="host">
	<c:if test="${trainerTemDto.user_separator eq 0}"> <!-- 모임 작성자가 일반 유져일 떄 -->
		
	</c:if>
	<c:if test="${trainerTemDto.user_separator eq 1}"> <!-- 모임 작성자가 트레이너 일 때 -->
		<div id="hostHeader">
			<div id="hostWrap">
				<div id="hostImage">
					<img alt="작성자사진" src="">
				</div>
				<div id="hostDetail">
					<p>닉네임 : ${trainerTemDto.user_nickname}</p>
					<p>이름 : ${trainerTemDto.trainer_name}</p>
				</div>
			</div>
			<p>한줄메세지 : ${trainerTemDto.user_message} </p>
			<p>활동 센터 : ${trainerTemDto.employment}</p>
			<p>활동 지역 : ${trainerTemDto.location1_name} ${trainerTemDto.location2_name}</p>
		</div>
	</c:if>
	<div class="btns">
		<c:if test="${loginUser.user_no eq trainerTemDto.user_no}">
			<input type="button" value="수정하기" />
			<input type="button" value="삭제하기" />
		</c:if>
		<c:if test="${loginUser.user_no ne trainerTemDto.user_no}">
			<input type="button" value="신청하기" id="applyMeeting" />
			<input type="button" value="트레이너에게 질문하기" id="questionToTrainer"/>
		</c:if>
	</div>
</div>

<div class="otherMeeting">
	<p style="font-weight: 800; font-size: 1.5rem; margin-top: 20px;">이 호스트의 다른 인기 모임</p>
	<div id="otherMeeting"></div>
	
	<p style="font-weight: 800; font-size: 1.5rem; margin-top: 20px;">이런 소셜링은 어때요?</p>
	<div id="otherHostMeeting"></div>
</div>

<div id="comment"> 
	<p style="font-weight: 800; font-size: 1.5rem; margin-top: 20px;">댓글</p>
	<div id="commentContent"></div>
	<form>
		<div id="writeComment">
			<p>${loginUser.user_nickname}</p>
			<textarea rows="5" cols="100" id="comment_content" name="comment_content" placeholder="내용을 입력하시오"></textarea><br/>
		</div>
		<input type="button" value="작성완료" id="addComment"/>
	</form>
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

<script>
	$('#closeQnAModal').click(function() {
		$('#modal').attr("style", "display:none");
	});
</script>

<%@ include file="../template/footer.jsp" %>