<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<jsp:include page="../template/header.jsp">
	<jsp:param value="모임 VIEW 페이지" name="title"/>
</jsp:include>

<style>
	table, tr, td {
		border: 1px solid;
	}
</style>

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
			$('<tr>')
			.append( $('<td>').html(meeting.meeting_no) )
			.append( $('<td>').html('<a href="#" onclick="fn_showMeeting(' + meeting.meeting_no + '); return false;">' + meeting.meeting_title + '</a>') )
			.append( $('<td>').html(meeting.meeting_date) )
			.append( $('<td>').html(meeting.created_at) )
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
			$('<tr>')
			.append( $('<td>').html(meeting.meeting_no) )
			.append( $('<td>').html('<a href="#" onclick="fn_showMeeting(' + meeting.meeting_no + '); return false;">' + meeting.meeting_title + '</a>') )
			.append( $('<td>').html(meeting.meeting_date ) )
			.append( $('<td>').html(meeting.user_nickname ) )
			.append( $('<td>').html(meeting.created_at ) )			
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
	});	
	
	// 가져온 뎃글 목록을 직접 append처리 해주기 위한 서브 함수
	function commentListTable(list) {
		$('#commentContent').empty();
		$.each(list, function(idx, comment){
			$('<tr>')
			.append( $('<td>').html(comment.comment_no) )
			.append( $('<td>').html(comment.user_no) )
			.append( $('<td>').html(comment.comment_content) )
			.append( $('<td>').html(comment.created_at) )
			.append( $('<input type="hidden" name="comment_no"/>').val(comment.comment_no) )
			.append( $('<td>').html('<input type="button" value="수정" onclick="fn_updateComment" />') )
			.append( $('<td>').html('<input type="button" value="삭제" onclick="fn_deleteComment(' + comment.comment_no + ')" />') )
			.appendTo('#commentContent');
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

<br/>
<br/> 제목 : ${meetingDto.meeting_title}
<br/> 일정 : ${meetingDto.meeting_date}
<br/> 장소 : ${meetingDto.location1_no}, ${meetingDto.location2_no} 
<br/> 총 모집 인원 : ${meetingDto.meeting_max}
<br/> 최소 모집 인원 : ${meetingDto.meeting_min}
<br/> 현재 신청 인원 : ???
<br/> 준비물 : 
	  <c:forEach var="list" items="${materialList}">
	  	  ${list.materials_name} &nbsp;
      </c:forEach>

<br/> 상세 내용 : ${meetingDto.meeting_content}
<br/><br/>

<br/> 작성자 정보 : 
<!-- to-do : 작성자가 일반 유져도 생각해야 할까? -->
<br/> 사진 : ??
<br/> 닉네임 : ${usersDto.user_nickname}
<br/> 이름 : ${trainer_infoDto.trainer_name}
<br/> 한줄메세지 : ${usersDto.user_message} 
<br/> 활동 센터 : ${trainer_infoDto.employment}
<br/> 활동 지역 : ${usersDto.location1_no}, ${usersDto.location2_no}<br/> 

<input type="button" value="수정하기"/>
<input type="button" value="삭제하기" onclick=""/>
<input type="button" value="신청하기"/>
<input type="button" value="트레이너에게 질문하기"/>

<br/><br/><br/> 이 호스트의 다른 인기 모임
<table>
	<thead>
		<tr>
			<td>코스번호</td>
			<td>제목</td>
			<td>모임일</td>
			<td>작성날짜</td>
		</tr>
	</thead>
	<tbody id=otherMeeting></tbody>
</table>

<br/><br/> 이런 소셜링은 어때요?
<table>
	<thead>
		<tr>
			<td>코스번호</td>
			<td>제목</td>
			<td>모임일</td>
			<td>작성자</td>
			<td>작성날짜</td>
		</tr>
	</thead>
	<tbody id=otherHostMeeting></tbody>
</table>

<br/><br/><br/> 댓글
<table>
	<thead>
		<tr>
			<td>뎃글 번호</td>
			<td>뎃글 작성자</td>
			<td>내용</td>
			<td>작성일</td>
			<td colspan="2">수정/삭제</td>
		</tr>
	</thead>
	<tbody id="commentContent"></tbody>
</table>	

<form>
	<textarea rows="5" cols="100" name="comment_content" placeholder="내용을 입력하시오"></textarea>
	<input type="button" value="작성완료" id="addComment"/>
</form>



<%@ include file="../template/footer.jsp" %>