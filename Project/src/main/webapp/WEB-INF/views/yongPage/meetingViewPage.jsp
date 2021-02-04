<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link type="text/css" rel="stylesheet" href="resources/style/soo/meetingViewPage.css" >
<!DOCTYPE html>

<jsp:include page="../template/header.jsp">
	<jsp:param value="모임 VIEW 페이지" name="title"/>
</jsp:include>


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
			.append( $('<div>').html('이미지') )
			.append( $('<p>').html(meeting.meeting_title) )
			.append( $('<p>').html('최소: ' + meeting.meeting_min + '명 / 최대: ' + meeting.meeting_max + '명')  )
			.append( $('<p>').html('일시: ' + meeting.meeting_date) )
			.append( $('<p>').html('작성자: ' + meeting.user_no) )
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
			.append( $('<div>').html('이미지') )
			.append( $('<p>').html(meeting.meeting_title) )
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
			$('<div class="comment-container">')
			.append( $('<div class="profile">').html('<img alt="프로필" src="">') )
			.append( $('<div class="comment-content">')
				.append( $('<p>').html('닉네임: ' + comment.user_no) )
				.append( $('<p>').html('내용: ' + comment.comment_content) )
				.append( $('<p>').html('작성일: ' + comment.created_at) )
			)
			.append( $('<div class="comment-btn">').html('<input type="button" class="btnsBtn" value="[버튼]" />')
				.append( $('<a href="#" class="btnClass" onclick="fn_commentUpdate(' + comment.comment_no + '); return false;" >').html('수정') )
				.append( $('<a href="#" class="btnClass" onclick="fn_commentDelete(' + comment.comment_no + '); return false;" >').html('삭제') )		
			)
			.appendTo('#commentContent');
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
			var meeting_no = ${meetingDto.meeting_no};
			var user_no = 11;
			var comment_content = $('textarea[name="comment_content"]').val();
			var sendObj = {
				"comment_referer_no": meeting_no,
				"user_no": user_no,
				"comment_content": comment_content
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


<div id="meeting">
	<div id="meetingHeader">
		<p id="meetingTitle"> ${meetingDto.meeting_title} </p>
		<a href="#"> 관심 모임으로 등록하기 </a>
	</div>
	<div id="meetingInfo">
		<div id="meetingDetail">
			<p>모임일 : ${meetingDto.meeting_date}</p>
			<p>장소 : ${meetingDto.location1_no}, ${meetingDto.location2_no} </p>
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
	<c:if test="${usersDto.user_separator eq 0}"> <!-- 모임 작성자가 일반 유져일 떄 -->
		
	</c:if>
	<c:if test="${usersDto.user_separator eq 1}"> <!-- 모임 작성자가 트레이너 일 때 -->
		<div id="hostHeader">
			<div id="hostWrap">
				<div id="hostImage">
					<img alt="작성자사진" src="">
				</div>
				<div id="hostDetail">
					<p>닉네임 : ${usersDto.user_nickname}</p>
					<p>이름 : ${trainer_infoDto.trainer_name}</p>
				</div>
			</div>
			<p>한줄메세지 : ${usersDto.user_message} </p>
			<p>활동 센터 : ${trainer_infoDto.employment}</p>
			<p>활동 지역 : ${usersDto.location1_no}, ${usersDto.location2_no}</p>
		</div>
		<div class="btns">
			<input type="button" value="수정하기"/>
			<input type="button" value="삭제하기" onclick=""/>
			<br/><br/>
			<input type="button" value="신청하기"/>
			<input type="button" value="트레이너에게 질문하기"/>
		</div>
	</c:if>
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
			<p>${usersDto.user_nickname}</p>
			<textarea rows="5" cols="100" id="comment_content" name="comment_content" placeholder="내용을 입력하시오"></textarea><br/>
		</div>
		<input type="button" value="작성완료" id="addComment"/>
	</form>
</div>


<%@ include file="../template/footer.jsp" %>