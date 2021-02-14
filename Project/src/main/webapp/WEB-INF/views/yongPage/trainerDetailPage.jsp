<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link type="text/css" rel="stylesheet" href="resources/style/soo/trainerDetailPage.css" >
<script src="https://kit.fontawesome.com/6b75fdce2b.js" crossorigin="anonymous"></script>
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
				.append( $('<div class="meetingContent">')
					.append( $('<div>').text(meeting.meeting_title) )
					.append( $('<div>')
						.append( $('<div>').text(meeting.exercise_name) )
						.append( $('<div>').text(meeting.meeting_min +'명 ~ ' + meeting.meeting_max+'명') )
					 )
					.append( $('<div>').html('<i class="fas fa-map-marker-alt"></i> '+meeting.location1_name + ' ' + meeting.location2_name + ' ∙ ' + meeting.meeting_date2) )
					.append( $('<div class="writerInfo">')
						.append( $('<span>').html('<img alt="${trainerTemDto.profile_photo}" src="resources/storage/${trainerTemDto.profile_photo}" />') )
						.append( $('<span>').text(meeting.user_nickname) )
					)
				)
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
					$('#totalMeeting').text(responseObj.totalMeetingCount);

					trainerMeetingListTable(responseObj.meetingList);
					
					var meetingPagingHtml = '<a href="#" onclick="preMeetingPage(); return false;"> 이전 </a>';
					for(let i=1; i<=Math.ceil(responseObj.totalMeetingCount/6); i++) {
						meetingPagingHtml += '<a href="#" onclick="changeMeetingPage(' + i + ') ; return false;">' + i + '</a>'; 
					}
					meetingPagingHtml += '<a href="#" onclick="nextMeetingPage('+Math.ceil(responseObj.totalMeetingCount/6)+'); return false;"> 다음 </a>';
					$('#trainerMeetingFooter').html(meetingPagingHtml);
					
				} else {
					$('#totalMeeting').empty();
					$('#totalMeeting').text('0');
					
					$('<div>').text('등록된 모임 정보가 없습니다.').css('text-align', 'center').css('margin-top', '20px').css('font-weight', 'bold')
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
		starClick();
	});
	
	/* 리뷰 리스트를 만들어주는 function */
	function reivewListTable(list, reviewCount) {
		$('#reviewListWrap').empty();
		$.each(list, function(idx, review) {
			var star = '<span class="starResult">';
			for (let i=0; i<review.score; i++) {
				star += '<i class="fas fa-star fa-1.5x"></i>'; 
			}
			star += '</span><span>';
			for (let i=0; i<5-review.score; i++) {
				star += '<i class="fas fa-star fa-1.5x"></i>';
			}
			star += '</span>';
			
			$('#reviewListWrap')
			.append( $('<div class="eachReview review' + idx + 'nth" >' )
				.append( $('<div class="reviewHeader">').html('<img alt="'+review.profile_photo+'" src="resources/storage/'+review.profile_photo+'" />')
					.append( $('<div>')
						.append( $('<span>').text(review.user_nickname) )
						.append( $('<span>').html(star) )
						.append( $('<span>').text(reviewCount-idx) )
						.append( $('<div>').text(review.meeting_title + ' / ' + review.exercise_name + ' / ' + review.location1_name + ' ' + review.location2_name) )
					)
				)
				.append( $('<div class="reviewContent reviewContent' + review.review_no + 'nth">').html('<a href="#" onclick="fn_showAllReviewContent(' + review.review_no + '); return false;">' + review.content + '</a>') )
				.append( $('<div class="reviewFooter">')
					.append( $('<div>').text('with ${trainerTemDto.user_nickname} 트레이너') )
					.append( $('<div>').html(review.created_at2) )
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
					.append( $('<a href="#" onclick="fn_shortReviewContent(' + review_no + '); return false;">'+responseObj.allReviewContent+'</a>') )
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
				if (responseObj.result) {
					$('.reviewContent'+review_no+'nth').empty();
					$('.reviewContent'+review_no+'nth')
					.append( $('<a href="#" onclick="fn_showAllReviewContent(' + review_no + '); return false;">' + responseObj.shortReviewContent + '</a>') )	
				}
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
					$('#totalReview').text(responseObj.reviewCount);
					
					reivewListTable(responseObj.reviewList, responseObj.reviewCount);
					
					if(responseObj.reviewCount > 5) {
						$('#reviewShowBtn').empty();
						$('#reviewShowBtn').html('<i class="fas fa-caret-down fa-3x"></i>');
					}
				} else {
					$('#totalReview').empty();
					$('#totalReview').text(responseObj.reviewCount);
					$('#reviewListWrap').text('작성된 리뷰 목록이 없습니다. 첫번째 리뷰 작성자가 되어주세요.^^')
					.css('text-align', 'center').css('padding-left', '11%').css('font-weight', 'bold');
				}
			},
			error: function(){alert('리뷰 가져오기 ajax 실패');}
		});	
	}
	
	/* 더 보기 버튼을 클릭할 때 마다 none처리된 리뷰들을 보여주는 함수 */
	var reviewIndex = 5;
	function showMoreReviews() {
		$(document).on('click', '#reviewShowBtn', function() {
			var totalReview = $('#totalReview').text();
			for (let i=0; i<5; i++) {
				$('.review'+(reviewIndex+i)+'nth').css('display', 'block');
			}
			reviewIndex += 5;

			if (Math.ceil(totalReview/5) == reviewIndex/5) {
				$('#reviewShowBtn').hide();
			}
			
			$('#reviewCutBtn').empty();
			$('#reviewCutBtn').html('<i class="fas fa-sort-up fa-3x"></i>');
		});
	}
	
	/* 접기 버튼 클릭시 리뷰 5개만 표기해주고 나머지 다 접기 */
	function foldReviews() {
		$(document).on('click', '#reviewCutBtn', function() {
			$('.review4nth').nextAll().css('display', 'none');
			$('#reviewShowBtn').show();
			$('#reviewCutBtn').empty();
			reviewIndex = 5;
		});
	}
	
	var starScore = 0;
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
						reviewSelectHtml += '<option value="">모임 선택</option>';
						$.each(responseObj.joinMeetingList, function(idx, meeting) {
							reviewSelectHtml += '<option value="' + meeting.meeting_no + '">' + (idx+1) + '. ' + meeting.meeting_title + '</option>';
						});
						reviewSelectHtml += '</select>';
						
						var star = '<div id="star_grade">';
						for (let i=1; i<=5; i++) {
							star += '<a href="#" onclick="fn_score('+i+'); return false;" ><i class="fas fa-star fa-2x"></i></a>'; 
						}
						star += '</div>';
						
						if(responseObj.result) {
							$('#modalDetail').empty();
							$('#modalDetail')
							.append( $('<div>').html('Writer : ${loginUser.user_nickname}') )
							.append( $('<form>')
								.append( $('<div>')
									.append(reviewSelectHtml)
									.append(star)
								)
								.append( $('<textarea rows="10" cols="50" name="content" placeholder="리뷰 내용을 작성하세요.">') )
								.append( $('<input type="button" id="writeReview" value="작성완료"/>') )
							)
							$('#modal').attr("style", "display:block");
						} else {
							if(responseObj.status) {
								swal.fire('리뷰를 작성할 수 없습니다.', '이미 해당 트레이너와 함께한 모든 모임에 리뷰를 작성하셨습니다!^^', 'info')
							} else {
								swal.fire('리뷰를 작성할 수 없습니다.', '트레이너와 함께 한 모임이 없습니다. 다양한 활동 후 많은 리뷰를 남겨주세요!^^', 'error')
							}
						}
					},
					error: function(){alert('리뷰 버튼 클릭시 ajax 실패');}	
				});
			}
		});
	}
	
	/* 별을 클릭한 만큼 값을 전해주기 위한 메소드 */
	function starClick() {
		$(document).on('click', '#star_grade a', function() {
	        $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
	        $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
	        return false;
	    });
	}
    function fn_score(i) {
    	starScore = i;
    }
    
	/* 작성완료를 눌럿을 때 실행 될 함수 */
	function fn_writeReview() {
		$(document).on('click', '#writeReview', function() {
			var meeting_no =  $('select[name="meeting_no"]').val();
			var score = starScore;
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
						Swal.fire('리뷰가 등록되었습니다!', '소중한 리뷰는 트레이너에게 힘이되요!', 'success');
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
		// closeModal();
		openQnAPopUp();
	});
	
	var qnaPageNo = 1;
	// 해당 트레이너에게 달린 질문 data를 append하는 서브함수
	function trainerQnAListTable(list, trainerInfo, totalQnACount) {
		$('#qnaList').empty();
		$('#currentPage').empty();
		$('#currentPage').text('현재 ' +  qnaPageNo  + ' 페이지');
		$.each(list, function(idx, qna){
			if (qna.is_answered==0) {
				$('<tr>')
				.append( $('<td name="qnA_no">').html( totalQnACount-((qnaPageNo-1)*10 + idx) ) )
				.append( $('<td>').html('<a href="#" onclick="fn_showQnA(' + qna.trainer_qna_no + '); return false;">' + qna.trainer_qna_title + '</a>') )
				.append( $('<td>').html(trainerInfo.user_nickname) )
				.append( $('<td>').html(qna.created_at2) )
				.append( $('<input type="hidden" name="' + qna.trainer_qna_no + '" value="' + idx + '"/>') )
				.append( $('<td name="isAnswered">').addClass('isAnswered').html('미답변').css('color', 'orangered').css('font-weight', 'bold') )
				.appendTo('#qnaList');
			} else {
				$('<tr>')
				.append( $('<td name="qnA_no">').html( totalQnACount-((qnaPageNo-1)*10 + idx) ) )
				.append( $('<td>').html('<a href="#" onclick="fn_showQnA(' + qna.trainer_qna_no + '); return false;">' + qna.trainer_qna_title + '</a>') )
				.append( $('<td>').html(trainerInfo.user_nickname) )
				.append( $('<td>').html(qna.created_at2) )
				.append( $('<td name="isAnswered">').addClass('isAnswered').html('답변완료').css('color', 'darkblue').css('font-weight', 'bold') )
				.appendTo('#qnaList');
			}
		});
	}
	
	// 현재 페이지로 이동시 자동으로 뎃글 리스트를 불러올 ajax함수
	function getTrainerQnAList() {
		var user_no = ${trainerTemDto.user_no}

		$.ajax ({
			url: 'getTrainerQnAList.plitche/'+user_no+'/qnaPageNo/'+qnaPageNo,
			type: 'get',
			dataType: 'json',
			success: function(responseObj) {
				if (responseObj.result) {
					$('#totalQnA').empty();
					$('#totalQnA').text(responseObj.totalQnACount);
					
					trainerQnAListTable(responseObj.qnaList, responseObj.trainerTemDto, responseObj.totalQnACount);
					
					var qnaPagingHtml = '<a href="#" onclick="preQnAPage(); return false;"> 이전 </a>';
					for(let i=1; i<=Math.ceil(responseObj.totalQnACount/10); i++) {
						qnaPagingHtml += '<a href="#" onclick="changeQnAPage(' + i + '); return false;">' + i + '</a>'; 
					}
					qnaPagingHtml += '<a href="#" onclick="nextQnAPage(' + Math.ceil(responseObj.totalQnACount/10) + '); return false;"> 다음 </a>';
					$('#qnaPaging').empty();
					$('#qnaPaging').html(qnaPagingHtml);
				} else {
					$('#totalQnA').empty();
					$('#totalQnA').text('0');
					
					$('<tr>')
					.append( $('<td colspan="5">').html('등록된 질문이 없습니다. 첫 번째 질문을 등록해 주세요.') )
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
				$('#modal').hide();
				loginAlert();
			} else {
				$('.modal_title').empty();
				$('.modal_title')
				.append( $('<div>').text('트레이너에게 질문을 남겨주세요~') )
				.append( $('<div>').text('작성한 질문은 수정/삭제를 할 수 없습니다. 신중히 작성해주세요!') );

				$('#modalDetail').empty();
				$('<form>')
				.append( $('<input type="text" id="title" name="trainer_qna_title" placeholder="질문 제목을 입력하세요."/>') )
				.append( $('<input type="text" id="content" name="trainer_qna_content" placeholder="질문 내용을 입력하세요."/>')  )
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
			if ($('input[name="trainer_qna_title"]').val() == '' || 
				$('input[name="trainer_qna_content"]').val() == '' ) {
				Swal.fire('정보가 전부 입력되지 않았습니다.', '질문 제목과 내용을 확인해주세요!', 'error');
				$('input[name="trainer_qna_title"]').focus();
			} else {
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
				
				$('#modal').attr("style", "display:none");
			}
			
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
						$('.modal_title').empty();
						$('.modal_title')
						.append( $('<div>').text('답변 작성이 완료된 질문입니다^^') )
						.append( $('<div>').text('질문을 통해서 더 많은 정보를 확인하세요.') )
						
						$('#modalDetail').empty();
						$('<div>').addClass('questionContent')
						.append( $('<div>').text(responseObj.qna.trainer_qna_title) )
						.append( $('<div>').text(responseObj.qna.trainer_qna_content) )
						.append( $('<div>').text('질문자: ' + responseObj.qna.user_nickname) )
						.append( $('<div>').text('작성일: ' + responseObj.qna.created_at2) )
						.append( $('<div id="trainerAnswer">')
							.append( $('<h4>').text('${trainerTemDto.user_nickname}의 답변') )
							.append( $('<div id="answerContent">').text(responseObj.qna.trainer_qna_answered) )
							.append( $('<div>').text('답변일: '+ responseObj.qna.answered_date2) )		
						)
						.appendTo('#modalDetail');
					} else {
						if ('${loginUser.user_no}' == ${trainerTemDto.user_no}) {
							$('#modal').attr("style", "display:block");
							$('.modal_title').empty();
							$('#modalDetail').empty();
							$('<div>').addClass('questionContent')
							.append( $('<div>').text(responseObj.qna.trainer_qna_title) )
							.append( $('<div>').text(responseObj.qna.trainer_qna_content) )
							.append( $('<div>').text('질문자: ' + responseObj.qna.user_nickname) )
							.append( $('<div>').text('작성일: ' + responseObj.qna.created_at2) )
							.append( $('<input type="button" value="답변 작성하기" onclick="fn_openAnswer('+ trainer_qna_no +')">') )
							.appendTo('#modalDetail');
						} else {
							$('#modal').attr("style", "display:block");
							$('.modal_title').empty();
							$('#modalDetail').empty();
							$('<div>').addClass('questionContent')
							.append( $('<div>').text(responseObj.qna.trainer_qna_title) )
							.append( $('<div>').text(responseObj.qna.trainer_qna_content) )
							.append( $('<div>').text('질문자: ' + responseObj.qna.user_nickname) )
							.append( $('<div>').text('작성일: ' + responseObj.qna.created_at2) )
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
		$('.questionContent input[type="button"]').hide();
		$('<div id="qnaAnswer">')
		.append ( $('<form>')
			.append ( $('<textarea rows="10" cols="50" name="trainer_qna_answered" id="answerContent" >') )
			.append ( $('<input type="button" id="answerBtn" value="답변작성완료" onclick="fn_writeAnswer(' + trainer_qna_no + ')" >') )	
		)
		.appendTo('#modalDetail');
	}
	
	// 질문 답변 작성 완료 후 답변작성 완료를 누르면 작동할 ajax함수
	function fn_writeAnswer(trainer_qna_no) {
		if ($('#answerContent').val() == '') {
			Swal.fire('작성된 답변 내용이 없습니다!', '답변 내용을 확인해주세요.', 'error');
		} else {
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
						Swal.fire('답변이 작성되었습니다!', '친절한 답변 감사합니다.', 'success');
						getTrainerQnAList();
					} else {
						alert('답변이 작성되지 않았습니다.');
					}
				},
				error: function(){alert('답변 남기기 실패');}
			});
			
			$('#modal').attr("style", "display:none");
		}
	}
	
	// ajax처리 후 modal창 닫아주는 함수
	/*
	 	function closeModal() {
		$(document).on("click", "#writeQuestion", function() {
			$('#modal').attr("style", "display:none");
		});
		$(document).on("click", "#answerBtn", function() {
			$('#modal').attr("style", "display:none");
		});
	} */
	
	/* *********************************************************** 위시리스트 담기 시작점 *************************************************************/

	   $(document).ready(function() {
		   WishTrainerListInsert();
		   //WishTrainerDelete();
		});
	   
		function WishTrainerListInsert() {
			$('.WishTrainerBtn').click(function(){
 		   var scrap_referer_no = '${trainerTemDto.user_no}';
 		   var user_no = '${loginUser.user_no}';
		   	 
 		   $.ajax({
 			  url: 'WishTrainerInsert.leo',
 			  type: 'get',
 		      data: 'scrap_referer_no=' + scrap_referer_no + '&user_no=' +user_no,
		      dataType: 'json',
  			  success: function (responseObj) {
  				if (responseObj.result > 0) {
	    				$('#TrainerloveIcon').attr('stroke', '#FA5B4A');
	    				$('#TrainerloveIcon').attr('fill', '#FA5B4A');
	 	    		    $('.goWishTrainer').html('관심리스트 추가됨');
  				} else {
  					alert('관심트레이너리스트 삽입에 실패하였습니다.');
  				}
  			  },
  			  error: function(){alert('실패');}
 	  	   });
 		   
	  		});
			
		}
		
		
		/* 
		function WishTrainerDelete() {
 		$('.WishListBtn').click(function(){
 			 var meeting_no = '${trainerClassDto.meeting_no}';
 			 $.ajax({
		  			  url: 'WishClassDelete.leo',
		  			  type: 'get',
		  		      data: 'meeting_no=' + meeting_no,
				      dataType: 'json',
		   			  success: function (responseObj) {
		   				  if (responseObj.result > 0) {
		   					$('#loveIcon').attr('stroke', '#CED4DA');
	 	    				$('#loveIcon').attr('fill', 'none');
	 	 	    		    $('.goWishList').html('위시리스트에 담기');
	 	 	    		  	WishListTotal();
		   				  }
		   			  },
		   			  error: function(){alert('실패');}
		  	  	   });
			});
		}
		 */
		
		/* *********************************************************** 위시리스트 담기 끝점 ********************************************************** */
	
</script>

<div id="trainerInfo">
	<div id="trainerSimple">
		<div id="trainerImage">
			<img alt="${trainerTemDto.profile_photo}" src="resources/storage/${trainerTemDto.profile_photo}" >
		</div>
		<p style="font-size: 2rem; font-weight: bold; margin: 10px 0 0 0;">
			${trainerTemDto.user_nickname}
		</p>
		<p>${trainerTemDto.trainer_name} </p>
		<p>활동 센터 : ${trainerTemDto.employment} </p>		
		<p>활동 경력 : ${trainerTemDto.career}년</p>
		<p>상태 메세지 : ${trainerTemDto.user_message} </p>
	</div>
	<div id="trainerDetail" style="border-top: 2px solid #000; padding-top: 20px;">
		<div style="display: flex;">
			<div style="font-size: 32px; font-weight: 400;">트레이너 프로필</div>
			<div>
			<button type="button" class="WishTrainerBtn" style="margin-left:332px; border: 0.5px solid lightgray; width: 170px; height: 40px; background: white; font-size:12px; font-weight: 600">
		   		<svg class="WishTrainerIcon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
		   			<path id="TrainerloveIcon" fill="none" fill-rule="evenodd" stroke="#CED4DA" stroke-width="1.25" d="M15.876 4.625c1.205 0 2.41.46 3.33 1.379.918.92 1.378 2.124 1.378 3.33 0 1.204-.46 2.41-1.379 3.329h0l-7.1 7.1-7.101-7.1c-.92-.92-1.379-2.125-1.379-3.33s.46-2.41 1.379-3.329c.92-.92 2.124-1.379 3.33-1.379 1.204 0 2.41.46 3.329 1.379.161.162.309.332.442.51.133-.178.28-.349.442-.51.919-.92 2.124-1.379 3.329-1.379z"></path>
		   		</svg>
		   		<span class="goWishTrainer">관심트레이너 등록</span>
	   		</button>
	   		</div>
		</div>
		<pre style="background: none; border: none; padding-top: 20px;">
${trainerTemDto.profile}
저는 예전엔 120kg이 나가는 운동의 운자도 모르던 친구였었습니다..! 
지금의 모습이 되기까지 미친듯한 다이어트가 도움됐다기보단 운동을  즐기고 꾸준한 생활습관에서의 
노력이 제모습들을 만들었다고 생각이 듭니다:)

여러분 또한 버핏서울과 함께하며 운동이란 게 힘들고 어려운 게 아니라 충분히 즐겁고 내 삶의 일부가 될 
수가 있다는 것을 느껴보셨으면 좋겠습니다. 우리가 함께 땀 흘리고 즐기다 보면 어느새 내가 꿈꾸던 모습들에
 한 발자국 더 다가갈 수 있지 않을까 라는 생각이 듭니다!

저 또한 옆에서 여러분들이 다치지 않고 재밌게 즐기실 수 있도록 최선을 다해 도와드리도록 하겠습니다!
버핏서울 화이팅.!!
 	 	</pre>
		<c:if test="${loginUser.user_no eq trainerTemDto.user_no}">
			<input type="button" class="TrainerDetailBtn" value="새 프로그램 등록" onclick="location.href='goCreateMeetingPage.plitche'"/>
		</c:if>	
	</div>
</div>

<div id="tab">
	<ul>
		<li data-id="meetingList" class="on">
			${trainerTemDto.user_nickname}의 Hot!한 모임들
			<span style="color: orangered; margin-left: 5px; "><i class="fas fa-user-friends"></i></span>
			<span id="totalMeeting" style="color: orangered"></span>
		</li>
		<li data-id="reviewList">
			모임 리뷰 With ${trainerTemDto.user_nickname}!
			<span style="color: orangered; margin-left: 5px;"><i class="fas fa-grin-hearts"></i></span>
			<span id="totalReview" style="color: orangered"></span>
		</li>
		<li data-id="QnAList">
			${trainerTemDto.user_nickname}에게 질문해 보세요!
			<span style="color: orangered; margin-left: 5px;"><i class="fas fa-comments"></i></span>
			<span id="totalQnA" style="color: orangered"></span>
		</li>
	</ul>
	<div id="meetingList" class="conBox on">
		<div id="trainerMeetingList"></div>
		<div id="trainerMeetingFooter"></div>
	</div>
	
	<div id="reviewList" class="conBox">
		<input type="button" id="openReviewModal" class="TrainerDetailBtn" value="리뷰 작성하기">
		<div id="trainerReviewList">
			<div id="reviewListWrap"></div>
			<div style="text-align: center; margin-top: 20px;">
				<span id="reviewShowBtn"></span>
				<span id="reviewCutBtn"></span>
			</div>
		</div>
	</div>
	
	<div id="QnAList" class="conBox">
	<input type="button" id="openQnAModal" class="TrainerDetailBtn" value="질문 등록하기">
		<div id="currentPage" style="text-align: center; padding-left: 12%; font-weight: bold;"></div>
		<div id="trainerQnAList">
			<table id="questionList">
				<colgroup>
					<col width="80">
					<col width="*">
					<col width="90">
					<col width="10%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th>No.</th>
						<th>Question Title</th>
						<th>Writer</th>
						<th>Date</th>
						<th>Answered</th>
					</tr>
				</thead>
				<tbody id="qnaList"></tbody>
				<tfoot>
					<tr style="text-align: center;">
						<td colspan="5" id="qnaPaging"></td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
</div>

<div>
  	<div id="modal">
  		<div class="modal_content">
		    <button id="closeModalBtn"><i class="far fa-times-circle fa-2x"></i></button>
  			<div class="modal_title"></div>
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




