<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link type="text/css" rel="stylesheet" href="resources/style/soo/trainerDetailPage.css" >
<script src="resources/style/soo/trainerDetailPage.js"></script>
<!DOCTYPE html>

<jsp:include page="../template/header.jsp">
	<jsp:param value="트레이너 상세 페이지" name="title"/>
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
<!-- 트레이너 모임 관련 ajax -->
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
			.append( $('<div>').html('<img alt="' + meeting.photo_filename + '" src="resources/storage/' + meeting.photo_filename + '" >') )
			.append( $('<p>').html(meeting.meeting_title) )
			.append( $('<p>').html('모임 주제: ' + meeting.exercise_name) )
			.append( $('<p>').html('최소: ' + meeting.meeting_min + '명 / 최대: ' + meeting.meeting_max + '명')  )
			.append( $('<p>').html('일시: ' + meeting.meeting_date) )
			.append( $('<p>').html('작성자: ' + meeting.user_nickname) )
			)
			.appendTo("#trainerMeetingList");
		});
	}
	
	
	/* 트레이너 리스트페이지에서 트레이너 디테일 페이지로 이동시 자동으로 실행 될 함수(모임 리스트 불러오기용) */
	
	var meetingPageNo = 1;
	function getTrainerMeetingList() {
		var user_no = ${trainerTemDto.user_no};
		$.ajax ({
			url: 'getTrainerMeetingList.plitche/' + user_no + '/meetingPageNo/' + meetingPageNo,
			type: 'get',
			dataType: 'json',
			success: function(responseObj) {
				if (responseObj.result) {
					$('#totalMeeting').empty();
					$('<div>')
					.append( $('<p>').html('총 :' + responseObj.totalMeetingCount + '개') )
					.appendTo('#totalMeeting');
					
					trainerMeetingListTable(responseObj.meetingList);
					
					var meetingPagingHtml = '<a href="#" onclick="preMeetingPage(); return false;"> 이전 </a>';
					for(let i=1; i<=Math.ceil(responseObj.totalMeetingCount/6); i++) {
						meetingPagingHtml += '<a href="#" onclick="changeMeetingPage(' + i + ') ; return false;">' + i + '</a>'; 
					}
					meetingPagingHtml += '<a href="#" onclick="nextMeetingPage('+Math.ceil(responseObj.totalMeetingCount/6)+'); return false;"> 다음 </a>';
					$('#trainerMeetingFooter').html(meetingPagingHtml);
					
				} else {
					$('<div>')
					.append( $('<p>').html('등록된 모임 정보가 없습니다.') )
					.appendTo('#trainerMeetingList');
				}
			},
			error: function(){alert('실패');}
		});
	}
	
	/* 모임 페이징 숫자 클릭시 해당 페이징에 맞게 이동할 function */
	function changeMeetingPage(goMeetingPage_no) {
		meetingPageNo = goMeetingPage_no;
		getTrainerMeetingList();
	}
	
	/* 모임 페이지 이전 클릭시 처리할 function */
	function preMeetingPage() {
		if (meetingPageNo != 1) {
			meetingPageNo -= 1;
		}
		getTrainerMeetingList();
	}
	
	/* 모임 페이지 다음 클릭시 처리할 function */
	function nextMeetingPage(lastMeetingPage) {
		if (meetingPageNo != lastMeetingPage) {
			meetingPageNo += 1;
		}
		getTrainerMeetingList();
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
		showMoreReviews();
		foldReviews();
		fn_writeReview();
		closeReviewModal();
	});
	
	/* 리뷰 리스트를 만들어주는 function */
	function reivewListTable(list) {
		$('#reviewListWrap').empty();
		$.each(list, function(idx, review) {
			$('#reviewListWrap')
			.append( $('<div class="eachReview review' + idx + 'nth" >' )
				.append( $('<div class="reviewHeader">') 
					.append( $('<div>').html('작성자: ' + review.user_nickname) )
					.append( $('<div>').html('평점: ' + review.score) )
				)
				.append( $('<div>').html(review.meeting_title + ' / ' + review.exercise_name + ' / ' + review.location1_name + ' ' + review.location2_name) )
				.append( $('<div class="reviewContent reviewContent' + review.review_no + 'nth">').html('<a href="#" onclick="fn_showAllReviewContent(' + review.review_no + '); return false;">' + review.content + '</a>') )
				.append( $('<div class="reviewFooter">')
					.append( $('<div>').text('to ${trainerTemDto.user_nickname}') )
					.append( $('<div>').html('작성일: ' + review.created_at) )
				)
			)
		});
	}
	
	/* 리뷰 내용 클릭 시 전체 내용이 모두 표시해주기 위한 ajax */
	function fn_showAllReviewContent(review_no) {
		$.ajax({
			url: 'showAllReviewContent.plitche/'+review_no,
			type: 'get',
			dataType: 'json',
			success: function(responseObj) {
				if (responseObj.result) {
					$('.reviewContent'+review_no+'nth').empty();
					$('.reviewContent'+review_no+'nth')
					.append( $('<a href="#" onclick="fn_shortReviewContent(' + review_no + '); return false;">').html(responseObj.allReviewContent) )
				}
			},
			error: function(){alert('리뷰 내용 전체 가져오기 ajax 실패');}
		});
	}
	
	/* 전체 표시된 리뷰 내용을 다시 클릭하면 다시 줄어들게 하기위한 ajax */
	function fn_shortReviewContent(review_no) {
		$.ajax({
			url: 'shortReviewContent.plitche/'+review_no,
			type: 'get',
			dataType: 'json',
			success: function(responseObj) {
				$('.reviewContent'+review_no+'nth').empty();
				$('.reviewContent'+review_no+'nth')
				.append( $('<a href="#" onclick="fn_showAllReviewContent(' + review_no + '); return false;">').html(responseObj.shortReviewContent) )	
			},
			error: function(){alert('리뷰 내용 다시 줄이기 ajax 실패');}
		});
	}
	
	
	/* 현재 페이지로 이동시 트레이너에게 달린 리뷰를 자동으로 가져오는 ajax함수 */
	function getReviewList() {
		var user_no = ${trainerTemDto.user_no};
		$.ajax({
			url: 'getTrainerReviewList.plitche/' + user_no,
			type: 'get',
			dataType: 'json',
			success: function(responseObj) {
				if(responseObj.result) {
					$('#totalReview').empty();
					$('<div>')
					.append( $('<p id="totalReviewCount">').text('총 : ' + responseObj.reviewCount + '개') )
					.appendTo('#totalReview');
					
					reivewListTable(responseObj.reviewList);
					
					if(responseObj.reviewCount > 5) {
						$('#reviewShowCutBtn')
						.append('<input type="button" value="더보기" id="showMoreReviews" />')
						.append('<div id="foldBtn">');
					}
				} else {
					$('#totalReview').empty();
					$('<div>')
					.append( $('<p id="totalReviewCount">').text('총 : ' + responseObj.reviewCount + '개') )
					.appendTo('#totalReview');
				}
			},
			error: function(){alert('리뷰 가져오기 ajax 실패');}
		});	
	}
	
	/* 더 보기 버튼을 클릭할 때 마다 none처리된 리뷰들을 보여주는 함수 */
	var reviewIndex = 5;
	function showMoreReviews() {
		$(document).on('click', '#showMoreReviews', function() {
			var totalReviewCount = $('#totalReviewCount').text().substring(4, 5);
			for (let i=0; i<5; i++) {
				$('.review'+(reviewIndex+i)+'nth').css('display', 'block');
			}
			reviewIndex += 5;
			
			if (Math.ceil(totalReviewCount/5) == reviewIndex/5) {
				$('#showMoreReviews').hide();
			}
			
			$('#foldBtn').empty();
			$('#foldBtn')
			.append('<input type="button" value="접기" id="foldReviews" />');
		});
	}
	
	/* 접기 버튼 클릭시 리뷰 5개만 표기해주고 나머지 다 접기 */
	function foldReviews() {
		$(document).on('click', '#foldReviews', function() {
			$('.review4nth').nextAll().css('display', 'none');
			$('#showMoreReviews').show();
			$('#foldBtn').empty();
			reviewIndex = 5;
		});
	}
	
	/* 리뷰 등록하기 버튼 클릭시 리뷰를 작성할 수 있는 모달창을 띄워주기 위한 함수 */
	function openReviewPopUp() {
		$('#openReviewModal').click(function() {
			var trainer_user_no = ${trainerTemDto.user_no};
			var login_user_no = '${loginUser.user_no}';
			
			if( '${loginUser.user_no}' == '' ) {
				loginAlert();
			} else {
				var sendData = {
					"target_user_no" : trainer_user_no,
					"writer_user_no" : login_user_no
				}
				$.ajax({
					url: 'findJoinMeetingList.plitche',
					type: 'post',
					data: JSON.stringify(sendData),
					contentType: 'application/json; charset=utf-8',
					dataType: 'json',
					success: function (responseObj) {
						
						var reviewSelectHtml = '<select name="meeting_no">';
						$.each(responseObj.joinMeetingList, function(idx, meeting){
							reviewSelectHtml += '<option value="' + meeting.meeting_no + '">' + meeting.meeting_title + '</option>';
						});
						reviewSelectHtml += '</select>';
						
						if(responseObj.result) {
							$('#modalDetail').empty();
							$('#modalDetail')
							.append( $('<div>').html('작성자 : ${loginUser.user_nickname}') )
							.append( $('<form>')
								.append( $('<div>')
									.append(reviewSelectHtml)
									.append( $('<input type="text" name="score" placeholder="평점 입력">') )
								)
								.append( $('<textarea rows="10" cols="50" name="content" placeholder="리뷰 내용을 작성하세요.">') )
								.append( $('<input type="button" id="writeReview" value="작성완료"/>') )
							)
							$('#modal').attr("style", "display:block");
						} else {
							swal.fire('리뷰를 작성할 수 없습니다.', '트레이너와 함께 한 모임이 없습니다. 다양한 활동 후 많은 리뷰를 남겨주세요!^^', 'error')
						}
					},
					error: function(){alert('리뷰 버튼 클릭시 ajax 실패');}	
				});
			}
		});
	}
	
	/* 작성완료를 눌럿을 때 실행 될 함수 */
	function fn_writeReview() {
		$(document).on('click', '#writeReview', function() {
			var meeting_no =  $('select[name="meeting_no"]').val();
			var score = $('input[name="score"]').val();
			var content = $('textarea[name="content"]').val();
			var trainer_user_no = ${trainerTemDto.user_no};
			var login_user_no = '${loginUser.user_no}';
			
			var sendObj = {
				"meeting_no": meeting_no,
				"score": score,
				"content": content,
				"target_user_no": trainer_user_no,
				"writer_user_no": login_user_no
			};
			
			$.ajax({
				url: 'writeReview.plitche',
				type: 'post',
				data: JSON.stringify(sendObj),
				contentType: 'application/json; charset=utf-8',
				dataType: 'json',
				success: function(responseObj) {
					if (responseObj.result) {
						getReviewList();
					} else {
						alert('리뷰작성 insert 실패');
					}
				},
				error: function(){alert('리뷰 작성 ajax 실패');}	
			});
			
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
	
	var qnaPageNo = 1;
	// 해당 트레이너에게 달린 질문 data를 append하는 서브함수
	function trainerQnAListTable(list, trainerInfo) {
		$('#qnaList').empty();
		$('#currentPage').empty();
		$('#currentPage').text('현재 ' +  qnaPageNo  + ' 페이지');
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
			url: 'getTrainerQnAList.plitche/'+user_no+'/qnaPageNo/'+qnaPageNo,
			type: 'get',
			dataType: 'json',
			success: function(responseObj) {
				if (responseObj.result) {
					$('#totalQnA').empty();
					$('<div>')
					.append( $('<p>').html('총 :' + responseObj.totalQnACount + '개') )
					.appendTo('#totalQnA');
					
					trainerQnAListTable(responseObj.qnaList, responseObj.trainerTemDto);
					
					var qnaPagingHtml = '<a href="#" onclick="preQnAPage(); return false;"> 이전 </a>';
					for(let i=1; i<=Math.ceil(responseObj.totalQnACount/10); i++) {
						qnaPagingHtml += '<a href="#" onclick="changeQnAPage(' + i + '); return false;">' + i + '</a>'; 
					}
					qnaPagingHtml += '<a href="#" onclick="nextQnAPage(' + Math.ceil(responseObj.totalQnACount/10) + '); return false;"> 다음 </a>';
					$('#qnaPaging').empty();
					$('#qnaPaging').html(qnaPagingHtml);
				} else {
					$('<tr>')
					.append( $('<td colspan="6">').html('등록된 질문이 없습니다. 첫 번째 질문을 등록해 주세요.') )
					.appendTo('#qnaList');
				}
			},
			error: function(){alert('질문 가져오기 실패');}
		});
	}

	/* 질문 페이지 숫자 클릭시 처리할 function */
	function changeQnAPage(goQnaPage_no) {
		qnaPageNo = goQnaPage_no;
		getTrainerQnAList();
	}
	
	/* 질문 페이지 이전 클릭시 처리할 function */
	function preQnAPage() {
		if (qnaPageNo != 1) {
			qnaPageNo -= 1;
		}
		getTrainerQnAList();
	}
	
	/* 질문 페이지 다음 클릭시 처리할 function */
	function nextQnAPage(lastQnaPage) {
		if (qnaPageNo != lastQnaPage) {
			qnaPageNo += 1;
		}
		getTrainerQnAList();
	}
	
	// 트레이너 디테일 페이지에서 새 질문 작성하기 작성 때마다 알맞은 폼을 생성해줄 함수
	function openQnAPopUp() {
		$('#openQnAModal').click(function() {
			if( '${loginUser.user_no}' == '' ) {
				loginAlert();
			} else {
				$('#modalDetail').empty();
				$('<form>')
				.append( $('<input type="text" id="title" name="trainer_qna_title" placeholder="제목을 입력하세요."/>') )
				.append( $('<input type="text" id="content" name="trainer_qna_content" placeholder="질문내용을 입력하세요."/>')  )
				.append( $('<br/>') )
				.append( $('<div>') 
					.append( $('<input type="checkbox" name="is_published" id="is_published" value="1"/>') )
					.append( $('<label for="is_published">').html(' 비밀글 처리하기') )		
					.append( $('<input type="button" value="작성완료" id="writeQuestion"/>') )
				)
				.appendTo('#modalDetail');
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
						qnaPageNo=1;
						getTrainerQnAList();
					} else {
						alert('등록을 등록하지 못했습니다.');
					}
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
						$('#modalDetail').empty();
						$('<div>')
						.append( $('<p>').html('작성자: ' + responseObj.qna.question_user_no) )
						.append( $('<p>').html('질문 제목: ' + responseObj.qna.trainer_qna_title) )
						.append( $('<p>').html('질문 내용: ' + responseObj.qna.trainer_qna_content) )
						.append( $('<p>').html('작성일: ' + responseObj.qna.created_at) )
						.append( $('<p>').html('답변 내용: '+ responseObj.qna.trainer_qna_answered) )
						.append( $('<p>').html('답변 작성일: '+ responseObj.qna.answered_date) )
						.appendTo('#modalDetail');
					} else {
						if ('${loginUser.user_no}' == ${trainerTemDto.user_no}) {
							$('#modal').attr("style", "display:block");
							$('#modalDetail').empty();
							$('<div>')
							.append( $('<p>').html('작성자: ' + responseObj.qna.question_user_no) )
							.append( $('<p>').html('질문 제목: ' + responseObj.qna.trainer_qna_title) )
							.append( $('<p>').html('질문 내용: ' + responseObj.qna.trainer_qna_content) )
							.append( $('<p>').html('작성일: ' + responseObj.qna.created_at) )
							.append( $('<input type="button" value="답변 작성하기" onclick="fn_openAnswer('+ trainer_qna_no +')">') )
							.appendTo('#modalDetail');
						} else {
							$('#modal').attr("style", "display:block");
							$('#modalDetail').empty();
							$('<div>')
							.append( $('<p>').html('작성자: ' + responseObj.qna.question_user_no) )
							.append( $('<p>').html('질문 제목: ' + responseObj.qna.trainer_qna_title) )
							.append( $('<p>').html('질문 내용: ' + responseObj.qna.trainer_qna_content) )
							.append( $('<p>').html('작성일: ' + responseObj.qna.created_at) )
							.appendTo('#modalDetail');
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
		.appendTo('#modalDetail');
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
		<p style="font-size: 1rem; font-weight: 600;">이름 : ${trainerTemDto.trainer_name} </p>
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
		<div id="trainerMeetingFooter" style=""></div>
	</div>
	
	<div id="reviewList" class="conBox">
		<button type="button" id="openReviewModal">새 리뷰 등록하기</button>
		<div id="totalReview"></div>
		<div id="trainerReviewList">
			<div id="reviewListWrap"></div>
			<div id="reviewShowCutBtn"></div>
		</div>
	</div>
		
	<div id="QnAList" class="conBox">
		<button type="button" id="openQnAModal">새 질문 등록하기</button>
		<div id="totalQnA"></div>
		<div id="currentPage" style="text-align: center;"></div>
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
				<tfoot>
					<tr style="text-align: center;">
						<td colspan="6" id="qnaPaging"></td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
</div>

<div>
  	<div id="modal">
  		<div class="modal_content">
		    <button id="closeModalBtn">X</button>
		    <div id="modalDetail"></div>
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
	$('#closeModalBtn').click(function() {
		$('#modal').attr("style", "display:none");
		// $('#showModal').attr("style", "display:none");
	});
	/* 
	document.getElementById("openQNAModal").onclick = function() {
	    document.getElementById("modal").style.display="block";
	}
	
	document.getElementById("closeModalBtn").onclick = function() {
	    document.getElementById("modal").style.display="none";
	}   
	 */
</script>



<%@ include file="../template/footer.jsp" %>




