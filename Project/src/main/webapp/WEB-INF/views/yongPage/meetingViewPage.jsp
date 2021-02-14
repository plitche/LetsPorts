<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link type="text/css" rel="stylesheet" href="resources/style/soo/meetingViewPage.css" >
<!DOCTYPE html>

<jsp:include page="../template/header.jsp">
	<jsp:param value="모임 VIEW 페이지" name="title"/>
</jsp:include>

<script src="https://kit.fontawesome.com/6b75fdce2b.js" crossorigin="anonymous"></script>
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
<!-- 이 호스트의 다른 모임 list function-->
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
				.append( $('<div class="meetingContent">')
					.append( $('<div>').text(meeting.meeting_title) )
					.append( $('<div>')
						.append( $('<div>').text(meeting.exercise_name) )
						.append( $('<div>').text(meeting.meeting_min +'명 ~ ' + meeting.meeting_max+'명') )
					 )
					.append( $('<div>').html('<i class="fas fa-map-marker-alt"></i> '+meeting.location1_name + ' ' + meeting.location2_name + ' ∙ ' + meeting.meeting_date2) )
					.append( $('<div class="writerInfo">')
						.append( $('<span>').html('<img alt="'+meeting.profile_photo+'" src="resources/storage/'+meeting.profile_photo+'" />') )
						.append( $('<span>').text(meeting.user_nickname) )
					)
				)
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

	// 해당 게시물 삭제 (작성자 권한)
	function fn_TrainerClassViewDelete(f) {
		if (confirm('삭제하시겠습니까?')) {
			if ('${fromWhere}' == 'trainer') {
				f.action = 'TrainerClassDelete.plitche';
				f.submit();
			} else if ('${fromWhere}' == 'community') {
				f.action = 'TrainerClassViewDelete.leo';
				f.submit();
			}
		}
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
				.append( $('<div class="meetingContent">')
					.append( $('<div>').text(meeting.meeting_title) )
					.append( $('<div>')
						.append( $('<div>').text(meeting.exercise_name) )
						.append( $('<div>').text(meeting.meeting_min +'명 ~ ' + meeting.meeting_max+'명') )
					 )
					.append( $('<div>').html('<i class="fas fa-map-marker-alt"></i> '+meeting.location1_name + ' ' + meeting.location2_name + ' ∙ ' + meeting.meeting_date2) )
					.append( $('<div class="writerInfo">')
						.append( $('<span>').html('<img alt="'+meeting.profile_photo+'" src="resources/storage/'+meeting.profile_photo+'" />') )
						.append( $('<span>').text(meeting.user_nickname) )
					)
				)
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
	
	var commentPageNo = 1;
	// 가져온 댓글 목록을 직접 append처리 해주기 위한 서브 함수
	function commentListTable(list) {
		$('#commentContent').empty();
		$.each(list, function(idx, comment){
			if ('${loginUser.user_no}' == comment.user_no) {
				$('#commentContent')
				.append( $('<div class="comment-container" >')
					.append( $('<div class="profile">').html('<img alt="'+comment.profile_photo+'" src="resources/storage/'+comment.profile_photo+'">') )
					.append( $('<div class="comment-content">')
						.append( $('<p>').html(comment.user_nickname) )
						.append( $('<p class="'+comment.comment_no+'nthComment">').html(comment.comment_content) )
						.append( $('<p>').html(comment.created_at) )
					)
					.append( $('<div class="comment-btn">')
						.append( $('<div class="'+comment.comment_no+'nthBtn">').addClass('editComment')
							.append( $('<a href="#" class="btnClass" onclick="fn_updateComment(' + comment.comment_no + '); return false;" >').html('수정') )
							.append( $('<a href="#" class="btnClass" onclick="fn_deleteComment(' + comment.comment_no + '); return false;" >').html('삭제') )
						)
					)		
				);
			} else {
				$('#commentContent')
				.append( $('<div class="comment-container">')
					.append( $('<div class="profile">').html('<img alt="'+comment.profile_photo+'" src="resources/storage/'+comment.profile_photo+'">') )
					.append( $('<div class="comment-content">')
						.append( $('<p>').html(comment.user_nickname) )
						.append( $('<p>').html(comment.comment_content) )
						.append( $('<p>').html(comment.created_at2) )
					)
				);
			}
		});
	}	
	
	// 모임 View페이지로 이동시 자동으로 댓글 목록을 가져올 ajax함수
	function getCommentList() {
		var meeting_no = ${meetingDto.meeting_no};
		
		$.ajax ({
			url: 'getCommentList.plitche/'+meeting_no+'/commentPageNo/'+commentPageNo,
			type: 'get',
			dataType :'json',
			success: function(responseObj) {
				if(responseObj.result) {
					$('#totalCommentCount').empty();
					$('#totalCommentCount').html(responseObj.commentCount + '개');
					
					commentListTable(responseObj.commentList);
					
					var commentPagingHtml = '<a href="#" onclick="preCommentPage(); return false;"> 이전 <a/>';
					for (let i=1; i<=Math.ceil(responseObj.commentCount/10); i++) {
						commentPagingHtml += '<a href="#" onclick="changeCommentPage(' + i + '); return false;">' + i + '</a>';
					}
					commentPagingHtml += '<a href="#" onclick="nextCommentPage(' + Math.ceil(responseObj.commentCount/10) + '); return false;"> 다음 <a/>';
					
					$('#commentPaging').empty();
					$('#commentPaging').html(commentPagingHtml);
				} else {
					$('#commentContent').empty();
					$('#commentContent')
					.append( $('<div>').html('작성된 댓글이 없습니다. 첫번째 댓글을 작성해주세요.') );	
				}
			},
			error: function(){alert('실패');}
		});
	};

	/* 댓글 페이지 숫자 클릭시 처리할 function */
	function changeCommentPage(goCommentPage_no) {
		commentPageNo = goCommentPage_no;
		getCommentList();
	}
	
	/* 댓글 페이지 이전 클릭시 처리할 function */
	function preCommentPage() {
		if (commentPageNo != 1) {
			commentPageNo -= 1;
		}
		getCommentList();
	}
	
	/* 댓글 페이지 다음 클릭시 처리할 function */
	function nextCommentPage(lastCommentPage) {
		if (commentPageNo != lastCommentPage) {
			commentPageNo += 1;
		}
		getCommentList();
	}

	// 댓글 작성 완료 버튼 클릭시 작동할 ajax함수
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
							alert('새로운 댓글이 작성되었습니다.');
							getCommentList();
							document.getElementById("comment_content").value='';
						} else {
							alert('댓글이 작성되지 않았습니다.');
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
	
	// 댓글 수정 버튼을 눌렸을 때 내용을 input으로 바꿔줄 function
	function fn_updateComment(comment_no) {
		var commentContent = $('p[class="'+comment_no+'nthComment"]').text();
		$('.'+comment_no+'nthComment').empty();
		$('.'+comment_no+'nthComment')
		.append( $('<input type="text" name="changeContent" value="'+commentContent+'" >') );
		// 수정하고자 하는 댓글 input에 포커스 주기
		$('input[name="changeContent"]').focus();
		
		$('.'+comment_no+'nthBtn').empty();
		$('.'+comment_no+'nthBtn')
		.append( $('<a href="#" class="btnClass" onclick="fn_updateCommentDone(' + comment_no + '); return false;" >').html('수정완료') )
		.append( $('<a href="#" class="btnClass" onclick="getCommentList(); return false;" >').html('수정취소') );
	}
	
	/* 댓글 수정 완료 버튼 클릭시 작동할 ajax함수 */
	function fn_updateCommentDone(comment_no) {
		var comment_content = $('input[name="changeContent"').val();
		var sendObj = {
			"comment_no": comment_no,
			"comment_content": comment_content
		};
	
		$.ajax({
			url: 'updateQnAComment.plitche',
			type: 'post',
			data: JSON.stringify(sendObj),
			contentType: 'application/json; charset=utf-8',
			dataType: 'json',
			success: function(responseObj) {
				if(responseObj.result) {
					Swal.fire('댓글 수정이 완료되었습니다.', '더 많은 댓글 달아주실꺼죠!?^^', 'success');
					getCommentList();
				} else {
					alert('댓글이 수정되지 않았습니다.');
				}
			},
			error: function(){alert('실패');}
		});
		
	}
	
	// 댓글 삭제 버튼을 눌렸을때 작동할 ajax함수
	function fn_deleteComment(comment_no) {
		swal.fire({
			title: '작성한 댓글이 삭제됩니다.', 	text: '정말 삭제하시겠습니까?',
			icon: 'warning',     			showCancelButton: true,
			confirmButtonColor: 'red',		cancelButtonColor: 'green',
			confirmButtonText: '삭제하기',		cancelButtonText: '취소하기'
		}).then((result)=> {
			if (result.isConfirmed) {
				$.ajax({
					url: 'deleteComment.plitche/'+ comment_no,
					type: 'get',
					dataType: 'json',
					success: function(responseObj) {
						if (responseObj.result) {
							Swal.fire('댓글이 삭제되었습니다.', '더 많은 댓글 달아주실꺼죠!?^^', 'success');
							getCommentList();
						} else {
							alert('댓글이 삭제되지 않았습니다.');
						}
					},
					error: function(){alert('실패');}
				});
			}
		});
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
				$('#qnaDetail').css('width', '400px');
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
<!-- 위시 리스트 관련 script -->
<script>
	/* 페이지 로드 이벤트 */
	$(document).ready(function(){
		fn_isInWishList();
		fn_addToWishList();
	});
	
	/* 모임 View페이지로 이동 시 위시 리스트에 저장된 모임인지 아닌지 판단하여 append해줄 부분 */
	function fn_isInWishList() {
		if('${loginUser.user_no}' == '') {
			$('#wishList')
			.append( $('<a href="#" onclick="return false;" id="addScrapBtn">')
			.html('<i class="far fa-heart"></i>위시 리스트에 저장하기<i class="far fa-heart"></i>') );
		} else {
			var user_no = '${loginUser.user_no}';
			var meeting_no = ${meetingDto.meeting_no};
			$.ajax({
				url: 'isInWishList.plitche/'+ user_no +'/meeting_no/' + meeting_no,
				type: 'get',
				dataType: 'json',
				success: function(responseObj) {
					if (responseObj.result) {
						$('#wishList').html('<i class="fas fa-heart"></i>위시 리스트에 저장된 모임<i class="fas fa-heart"></i>');
					} else {
						$('#wishList')
						.append( $('<a href="#" onclick="return false;" id="addScrapBtn">')
						.html('<i class="far fa-heart"></i>위시 리스트에 저장하기<i class="far fa-heart"></i>') );
					}
				},
				error: function(){alert('실패');}
			});
		}
	}
	
	function fn_addToWishList() {
		$(document).on('click', '#addScrapBtn', function() {
			if ('${loginUser.user_no}' == '') {
				loginAlert();
			} else {
				var scrap_referer_no = ${meetingDto.meeting_no};
				var user_no = ${meetingDto.user_no};
				var sendObj = {
		  			   "scrap_referer_no": scrap_referer_no,
		  			   "user_no": user_no,
		   	    }
		   	   
				$.ajax({
					url: 'addToWishList.plitche',
					type: 'post',
					data: JSON.stringify(sendObj),
					contentType: 'application/json; charset=utf-8',
					dataType: 'json',
					success: function (responseObj) {
						if (responseObj.result) {
							Swal.fire('찜 리스트에 저장되었습니다!', '찜 목록은 마이페이지에서 확인하세요.', 'success');
							$('#wishList').emtpy();
							fn_isInWishList();
						} else {
							alert('찜리스트 삽입에 실패하였습니다.');
						}
					},
					error: function(){alert('실패');}
				});		
			}
		});
		
	};
	
</script>

<div id="meeting">
	<div id="meetingHeader">
		<p id="meetingTitle"> &lt; ${meetingDto.meeting_title} &gt; </p>
		<div id="wishList"></div>
	</div>
	<div id="meetingBody">
		<div id="leftSide">
			<div id="meetingDetail">
				<div class="subTitle" style="margin-top: auto;">소셜링 소개</div>
				<div class="title">자세한 정보를 알려드릴게요</div>
				<div class="info_row">
					<i class="fas fa-user-friends"></i>
					<span>최소 ${meetingDto.meeting_min}명 ~ 최대 ${meetingDto.meeting_max}명</span>
				</div>
				<div class="info_row">
					<i class="far fa-calendar-alt"></i>
					<span>약속일 : ${meetingDto.meeting_date2}</span>
				</div>
				<div class="info_row">
					<i class="fas fa-hourglass-half"></i>
					<span>모집 기간: ${meetingDto.start_gather_date2} ~ ${meetingDto.end_gather_date2}</span>
				</div>
				<div class="info_row">
					<i class="fas fa-map-marked-alt"></i>
					<span>${meetingDto.location1_name} ${meetingDto.location2_name}</span>
				</div>
				<div id="map" style="width:500px;height:200px;"></div>
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=74162e293be31e9dc5e8e7b8c8e0be9c"></script>
				<script>
					var detailLocation = '${meetingDto.detail_location}';
					var locationIdx = detailLocation.indexOf('/');
					var lat = detailLocation.substring(0, locationIdx);
					var lng = detailLocation.substring(locationIdx+1);
					
					var container = document.getElementById('map');
					var options = {
						center: new kakao.maps.LatLng(lat, lng),
						level: 4
					};
					
					var map = new kakao.maps.Map(container, options);
					
					// 마커가 표시될 위치입니다 
					var markerPosition  = new kakao.maps.LatLng(lat, lng); 
				
					// 마커를 생성합니다
					var marker = new kakao.maps.Marker({
					    position: markerPosition
					});
				
					// 마커가 지도 위에 표시되도록 설정합니다
					marker.setMap(map);
					
					function relayout() {    
					    // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
					    // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
					    // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
					    map.relayout();
					}
					// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
				    var mapTypeControl = new kakao.maps.MapTypeControl();
	
				    // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
				    // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
				    map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
				    // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
				    var zoomControl = new kakao.maps.ZoomControl();
				    map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
				</script>
				<div class="subTitle">준비사항</div>
				<div class="title">함께 준비하면 좋아요</div>
				<i class="fas fa-american-sign-language-interpreting"></i>
				<span class="info_row">준비물 : 
					<c:forEach var="list" items="${materialList}">
				  		${list.materials_name} &nbsp;
			    	</c:forEach>
				</span>
			</div>
		</div>
		<div id="rightSide">
			<div id="mainImg">
				<img alt="${meetingDto.photo_filename}" src="resources/storage/${meetingDto.photo_filename}">
			</div>
		</div>
	</div>

	<div class="meetingfooter">
		<div class="subTitle">안내사항</div>
		<div class="title">어떤 소셜링인가요?</div>
		<div id="meetingContent">
			<div>${meetingDto.meeting_content}</div>
		</div>
		<div class="btns">
			<form method="post">
				<input type="hidden" name="meeting_no" value="${meetingDto.meeting_no}" /> 
				<input type="hidden" name="user_no" value="${trainerTemDto.user_no}" /> 
				<c:if test="${loginUser.user_no eq trainerTemDto.user_no}">
					<input type="button" value="수정하기" />
					<input type="button" value="삭제하기" onclick="fn_TrainerClassViewDelete(this.form)" />
				</c:if>
				<c:if test="${loginUser.user_no ne trainerTemDto.user_no}">
					<input type="button" value="신청하기" id="applyMeeting" />
					<input type="button" value="질문하기" id="questionToTrainer"/>
				</c:if>
			</form>
		</div>
	</div>
</div>

<div class="subTitle">호스트소개</div>
<div class="title">우리 반갑게 만나요!</div>
<div id="host">
	<c:if test="${trainerTemDto.user_separator eq 0}"> <!-- 모임 작성자가 일반 유져일 떄 -->
		
	</c:if>
	<c:if test="${trainerTemDto.user_separator eq 1}"> <!-- 모임 작성자가 트레이너 일 때 -->
		<div id="infoHost">
			<div id="hostImage">
				<img alt="${trainerTemDto.profile_photo}" src="resources/storage/${trainerTemDto.profile_photo}">
			</div>
			<div>
				<div>트레이너</div>
				<div id="hostNick">${trainerTemDto.user_nickname}[${trainerTemDto.trainer_name}]</div>
			</div>
		</div>
		<div>
			<span>${trainerTemDto.location1_name} ${trainerTemDto.location2_name}</span>
			<span>${trainerTemDto.employment}</span>
		</div>
		<div>
			<c:forEach var="interestList" items="${interestList}">
				<span>${interestList}</span>
			</c:forEach>
		</div>
		<div>${trainerTemDto.user_message}</div>
	</c:if>
</div>

<div class="subTitle newMeetings">이런 소셜링은 어때요?</div>
<div class="title">현재 호스트와 다양한 모임을!</div>
<div id="otherMeeting"></div>

<div class="subTitle newMeetings">이런 소셜링은 어때요?</div>
<div class="title">새로운 사람과 같은 운동을!</div>
<div id="otherHostMeeting"></div>

<div id="comment"> 
	<div id="commentHeader">
		<span style="color: black"><i class="far fa-comment-dots fa-2x"></i></span>
		<div style="font-weight: 800; margin: 0 10px;">댓글</div>
		<div id="totalCommentCount"></div>
		<div style="margin-left: 87%"><i class="fas fa-link fa-2x"></i></div>
	</div>
	<div id="commentContent"></div>
	<div id="commentPaging"></div>
	<form>
		<div id="writeComment">
			<p style="font-weight: bold; font-size: 1.5rem;">${loginUser.user_nickname}</p>
			<textarea rows="5" cols="100" id="comment_content" name="comment_content" placeholder="댓글을 남겨보세요"></textarea><br/>
			<input type="button" value="작성완료" id="addComment"/>
		</div>
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

