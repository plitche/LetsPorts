<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<jsp:include page="../template/header.jsp" />
<link type="text/css" rel="stylesheet" href="resources/style/jung/TrainerClassViewPage.css" >
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


    <form method="post">
    
    		<br/><br/><br/>
    	   <div class="TrainerClassView_part1"> 
    	   
		    	   <div class="TrainerClassInfo">
		    	   
					   <h3>${trainerClassDto.meeting_title}</h3><br/><br/>
					   모임일 : ${trainerClassDto.meeting_date}<br/><br/>
					   모집 기간 : ${trainerClassDto.start_gather_date} ~ ${trainerClassDto.end_gather_date}<br/><br/>
					   모집 인원 : 최소 ${trainerClassDto.meeting_min}명 ~ 최대 ${trainerClassDto.meeting_max}<br/><br/>
					   운동 종목 : ${trainerClassDto.exercise_name}<br/><br/>
					   모임장소 : ${trainerClassDto.location1_name} ${trainerClassDto.location2_name}<br/><br/>
					   상세 주소 : ${trainerClassDto.detail_location}<br/><br/>
					   준비물 :
					   <c:forEach var="materialsDto" items="${list}">
						   	${materialsDto.materials_name}
					   </c:forEach>
					   <br/><br/>
					   상세내용 : ${trainerClassDto.meeting_content}<br/><br/>
		    	   
		    	   </div>
				   
				   <div class="WishList_all">
				   
					   <div class="WishList"><a href="">관심페이지 등록하기</a></div>
					   <div class="TrainerClassPhoto">
					   		<img alt="${trainerClassDto.photo_filename}" src="resources/storage/${trainerClassDto.photo_filename}" style="width: 300px; height:300px;">
					   </div>
				   
				   </div>
				   
				   <!-- hidden -->
				   <input type="hidden" name="photo_filename" value="${trainerClassDto.photo_filename}" />
				   <input type="hidden" name="meeting_no" value="${trainerClassDto.meeting_no}" />
				   <input type="hidden" name="meeting_title" value="${trainerClassDto.meeting_title}" />
				   <input type="hidden" name="meeting_date" value="${trainerClassDto.meeting_date}" />
				   <input type="hidden" name="start_gather_date" value="${trainerClassDto.start_gather_date}" />
				   <input type="hidden" name="end_gather_date" value="${trainerClassDto.end_gather_date}" />
				   <input type="hidden" name="meeting_min" value="${trainerClassDto.meeting_min}" />
				   <input type="hidden" name="meeting_max" value="${trainerClassDto.meeting_max}" />
				   <input type="hidden" name="exercise_no" value="${trainerClassDto.exercise_no}" />
				   <input type="hidden" name="location1_no" value="${trainerClassDto.location1_no}" />
				   <input type="hidden" name="location2_no" value="${trainerClassDto.location2_no}" />
				   <input type="hidden" name="detail_location" value="${trainerClassDto.detail_location}" />
				   <input type="hidden" name="meeting_content" value="${trainerClassDto.meeting_content}" />
				   <!-- 받은 여러개의 materials 값을 보내기 위한 작업 -->
				   <c:forEach var="materialsList" items="${list}">
					   <input type="hidden" name="materials_name" value="${materialsList.materials_name}" />
				   </c:forEach>
    	   
    	   </div>
    	   
    	   <script>
    	   
    	   $(document).ready(function(){
    		   
    	   		if ('${loginUser.user_no}' == '${trainerClassDto.user_no}') {
    	   			$('#ClassApplyBtn').hide();
    	   			$('.ClassQuestionBtn').hide();
    	   		} else {
    	   			$('#ClassUpdateBtn').hide();
    	   			$('#ClassDeleteBtn').hide();
    	   		}
    	   		
    	   });
    	   
    	   // 트레이너 클래스 리스트로 넘어가는 경로 설정
    	   function fn_TrainerClassList() {
	    		location.href = 'TrainerClassListPage.leo';
    	   }
    	   
    	   </script>
			   
    	   <script>
    	   
	    	   // 클래스 신청 클릭시 작동
	    	   $(document).ready(function() {
	    		   ClassApply();
				});
	    	   
	    	   function ClassApply() {
		    	   $(document).on('click', '#ClassApplyBtn', function() {
					   if ('${loginUser.user_no}' == '') {
						   loginAlert();	
					   } else {
						   location.href = '';  // 클래스 신청했을 때 넘어가는 경로
					   }
				   });
	    	   }
    	   
    	   </script>
    	   
<!-- *********************************************************** 위시리스트 담기 시작점 ************************************************************ -->
    	   <script>
    
    	   $(document).ready(function() {
    		   WishListInsert();
    		   WishListDelete();
    		   WishListTotal();
    		});
    	   
    		function WishListInsert() {
    			$('.WishListBtn').click(function(){
	    		   var meeting_no = '${trainerClassDto.meeting_no}';
	    		   var scrap_user_no = '${trainerClassDto.user_no}';
	    		   var user_no = '${loginUser.user_no}';
	    		   var end_gather_date = '${trainerClassDto.end_gather_date}';
    		   	 
	    		   $.ajax({
	    			  url: 'WishClassInsert.leo',
	    			  type: 'get',
	    		      data: 'scrap_referer_no=' + meeting_no + '&scrap_user_no=' + scrap_user_no + '&user_no=' +user_no + '&end_gather_date=' + end_gather_date,
    		    	  dataType: 'json',
 	    			  success: function (responseObj) {
 	    				if (responseObj.result > 0) {
	 	    				$('#loveIcon').attr('stroke', '#FA5B4A');
	 	    				$('#loveIcon').attr('fill', '#FA5B4A');
	 	 	    		    $('.goWishList').html('위시리스트 추가됨');
	 	 	    		 	 WishListTotal();
 	    				} else {
 	    					alert('찜리스트 삽입에 실패하였습니다.');
 	    				}
 	    			  },
 	    			  error: function(){alert('실패');}
	    	  	   });
	    		   
    	  		});
    			
    		}
    		
   			function WishListDelete() {
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
   			
    		function WishListTotal() {
	    			 var meeting_no = '${trainerClassDto.meeting_no}';
		    		$.ajax({
		  			  url: 'WishClassTotal.leo',
		  			  type: 'get',
		  		      data: 'meeting_no=' + meeting_no,
				    	  dataType: 'json',
		   			  success: function (responseObj) {
			    				$('.IfgoWish_message').html(responseObj.WishClassListTotal + '명이 위시리스트에 담았습니다.')
		   			  },
		   			  error: function(){alert('실패');}
		  	  	   });
    		}
    		
    	   </script>
    
			   <!-- 버튼들(수정, 삭제, 등록) -->
				   <div class="Btns1" style="display:flex;">
				   
						   <div><input type="button" value="클래스 신청" onclick="fn_TrainerClassApply(this.form)" id="ClassApplyBtn" /></div>
						   <!-- 모달창 띄우는 버튼 -->
						   <div class="OfferWishListBtn_Box">
							   		<button type="button" class="WishListBtn" >
								   		<svg class="WishIcon-module__container--cAypQ" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
								   			<path id="loveIcon" fill="none" fill-rule="evenodd" stroke="#CED4DA" stroke-width="1.25" d="M15.876 4.625c1.205 0 2.41.46 3.33 1.379.918.92 1.378 2.124 1.378 3.33 0 1.204-.46 2.41-1.379 3.329h0l-7.1 7.1-7.101-7.1c-.92-.92-1.379-2.125-1.379-3.33s.46-2.41 1.379-3.329c.92-.92 2.124-1.379 3.33-1.379 1.204 0 2.41.46 3.329 1.379.161.162.309.332.442.51.133-.178.28-.349.442-.51.919-.92 2.124-1.379 3.329-1.379z"></path>
								   		</svg>
								   		<span class="goWishList">위시리스트에 담기</span>
							   		</button>
							   		
						   		<p class="IfgoWish_message"></p>
						   	</div>
<!-- *********************************************************** 위시리스트 담기 마감 ************************************************************ -->
			   
			   
							<!-- 이것또한 버튼들 -->			   
						   <div><input type="button" value="클래스 질문하기" id="modal-open-btn" class="ClassQuestionBtn" /></div>
						   <div><input type="button" value="클래스 목록"  onclick="fn_TrainerClassList()"/></div>
						   <div><input type="button" value="수정" onclick="fn_TrainerClassViewUpdatePage(this.form)" id="ClassUpdateBtn" /></div>
						   <div><input type="button" value="삭제" onclick="fn_TrainerClassViewDelete(this.form)" id="ClassDeleteBtn" /></div>
				   
				   </div>
</form>
			   
			   <!-- 모달창 버튼 누를 시 열리는 내용들 -->
			   <div id="modal_background"></div>
			   <div class="modal_all">
				      <div class="modal-box">
				      		<div id="modal_close_btn">X</div>
				      		<br/>
					        <p class="modal-title">안녕하세요? 게시물 등록자입니다. 저희 모임에 대해 궁금하시다구요!? 무엇이든 질문 주세요.</p>
					        <br/>
					        <div class="modal-close-box">
					        <form>
					         	 <input type="text" name="question_title" id="question_title" placeholder="질문 제목" /><br/>
					         	 <textarea rows="10" cols="90" name="question_content" id="question_content" placeholder="질문 내용"></textarea>
					         	 <br/>
					         	 <input type="button" value="질문등록하기"  id="questionBtn"/>
					        </form>
					        	
					        </div><br/>
					        <table border="1">
					        	<thead>
					        		<tr>
					        			<td>질문자</td>
					        			<td>질문 제목</td>
					        			<td>답변 여부</td>
					        		</tr>
					        	</thead>
					        	<tbody id=question_info>
					        		
					        	</tbody>
					        </table>
				      </div>
			    </div>
			   
    </form>
    
    <br/><br/><br/><br/><br/>
    
	<h3>트레이너 소개</h3>
    <div class="trainerHostInfo_all">
		<a href="#" onclick="">
	    		<div class="trainerHostInfo">
				    <div>${trainerClassDto.profile_photo}</div>
	    			<div>${trainerClassDto.user_nickname}</div>
	    		</div>
	    		<div>${trainerClassDto.user_message}</div>
 		</a>
  	 </div>
    
    <br/><br/><br/><br/><br/>
  	
  	<!-- 관련트레이너 클래스 리스트 뿌려주는 곳 -->
  	<h3>관련 트레이너 클래스</h3>
    <br/>
    <div class="relatedClass_all">
    
    
    </div>
    
    <script>
    	
    
    	// 관련리스트 뿌려졌을때 관련 리스트로 가는 법
    	function fn_showRelatedMeeting(meeting_no) {
    		location.href = 'TrainerClassViewPage.leo?meeting_no=' + meeting_no;
    	}
    	
    	// 관련트레이너 클래스리스트를 뿌려줄 ajax
    	// 페이지 로드 이벤트
		$(document).ready(function(){
			relatedClassList();
		});
    	
    	function relatedClassList() {
    		var exercise_no = ${trainerClassDto.exercise_no};
    		var meeting_no = ${trainerClassDto.meeting_no};
    		var user_no = ${trainerClassDto.user_no};
    		
    		var sendObj = {
    								 "exercise_no":exercise_no,
    								 "meeting_no":meeting_no,
    								 "user_no":user_no
    						 	      };
    		$.ajax({
    			
    			url: 'relatedClass.leo',
    			type: 'post',
    			data: JSON.stringify(sendObj),
    			contentType: 'application/json; charset=UTF-8',
    			dataType: 'json',
    			success: function(responseObj) {
    				if (responseObj.result == true) {
    					relatedClassListContent(responseObj.relatedClassList);
    				} else {
    					$('.relatedClass_all').empty();
						$('<div>').html('관련 클래스목록이 없습니다.')
						.appendTo('.relatedClass_all');
    				}
    			},
    			error: function(){alert('실패??!43$#324324?');}
    		});
    	}
    		
    	function relatedClassListContent(list) {
    		$('.relatedClass_all').empty();
			$.each(list, function(idx, relatedClass) {
				$('<div>').addClass('relatedClass')
				.append($('<img alt="' + relatedClass.photo_filename + '" src="resources/storage/' + relatedClass.photo_filename + '" style="width:250px; height:100px;">'))
				.append($('<a href="#" onclick="fn_showRelatedMeeting(' + relatedClass.meeting_no + '); return false;">' + relatedClass.meeting_title + '</a> '))
				.append($('<div>모임날짜  : ' + relatedClass.meeting_date + '</div>'))
				.append($('<div>운동종목 : ' + relatedClass.exercise_name + '</div>'))
				.append($('<div>작성자 : ' + relatedClass.user_nickname + '</div>'))
				.append($('<div>조회수 : ' + relatedClass.meeting_hit + '</div>'))
				.appendTo('.relatedClass_all');
			});
    	}
    
    </script>

	<script>
	
			//모달창 만들어주는 함수
			$(document).on('click', '#modal-open-btn', function() {
				$('.modal_all').show();
			});
			
			$(document).on('click', '#modal_close_btn', function(){
				$('.modal_all').hide();
			});
			
			$('#modal_close_btn').hover(function() {
				  $(this).css("color", "black").css("font-weight", "800");
			}, function(){
				  $(this).css("color", "silver").css("font-weight", "300");
			});
			
			
			$(function(){ 
		
				  $("#modal-open-btn").click(function(){
				    $("#modal_background").fadeIn();
				  });
				  
				  $("#modal_close_btn").click(function(){
				    $("#modal_background").fadeOut();
				  });
				  
			});
	
	</script>


    <script>
			
    		// 해당 게시물 수정 (작성자 권한)
			function fn_TrainerClassViewUpdatePage(f) {
				f.action = 'TrainerClassViewUpdatePage.leo';
				f.submit();
			}
			
    		// 해당 게시물 삭제 (작성자 권한)
			function fn_TrainerClassViewDelete(f) {
				if (confirm('삭제하시겠습니까?')) {
					f.action = 'TrainerClassViewDelete.leo';
					f.submit();
				}
			}
    		
    		// 해당 게시물을 작성자가 등록(마이페이지의 리스트로 넘어감)
    		function fn_TrainerClassApply(f) {
    			f.action = '';
    			f.submit();
    		}
	</script>
	
	
	<script>
		
		// 페이지 로드 이벤트
		$(document).ready(function(){
			commentList();
			commentInsert();
			commentUpdate();
			commentUpdate2();
			commentUpdateCancel();
			commentInsertCancel();
		});
		
		// 페이징 처리
		var commentPage = 1;  // 기본 페이징 1로 설정
		
		/**** 리스트 뿌려주기 ****/
		function commentList() {
			var meeting_no = '${trainerClassDto.meeting_no}'; // 클래스에 댓글이 달리니까 클래스를 넘겨서 클래스 안에있는 댓글을 가져오기 위해 보낸다
			
			$.ajax({
				url: 'comment.leo', 
				type: 'get',
				data: 'meeting_no=' + meeting_no + '&commentPage=' + commentPage,
				dataType: 'json',
				success: function (responseObj) {
					
					var paging = responseObj.paging;
					
					if (responseObj.result) {
						commentListContent(responseObj.commentList);
						$('#totalCount').empty();
						$('<span>').html(paging.totalRecord)
						.appendTo('#totalCount');
					} else {
						$('#listComment_all').empty();
						 $('<div>').html('댓글을 작성해주세요')
						.appendTo('#listComment_all');
					}
					
					$('#paging').empty(); // 기존 페이징 초기화
					
					// <
					if (paging.beginPage <= paging.pagePerBlock) {
						$('#paging').append('<div class="disable"><a>◀</a></div>');
					} else {
						$('#paging').append('<div class="prev-block" data-page="' + (paging.beginPage - 1) + '"><a>◀</a></div>');
					}
					
					for (let p = paging.beginPage; p <= paging.endPage; p++) {
						if (paging.commentPage == p) {
							$('#paging').append('<div class="now-page"><a>' + p + '</a></div>')
						} else {
							$('#paging').append('<div class="go-page" data-page="' + p +'"><a>' + p + '</a></div>');
						}
					}
					// >
					if (paging.endPage >= paging.totalPage) {
						$('#paging').append('<div class="disable"><a>▶</a></div>');
					} else {
						// class 의미
						// 1) next-block : 다음(▶)으로 이동하려고
						// 2) go-page : css (cursor: pointer) 적용하려고
						$('#paging').append('<div class="next-block" data-page="' + (paging.endPage + 1) + '"><a>▶</a></div>');
					}
				},
				error: function() {alert('실패44');}
			});
			
			// 링크가 걸릴 때 이동할 페이지 번호를 알아내서 다시 목록을 뿌리는 함수들
			$('#paging').on('click', '.prev-block', function(){
				commentPage = $(this).attr('data-page');
				commentList();
			});
			$('#paging').on('click', '.go-page', function(){
				commentPage = $(this).attr('data-page');
				commentList();
			});
			$('#paging').on('click', '.next-block', function(){
				commentPage = $(this).attr('data-page');
				commentList();
			});
			
		}
		
		function commentListContent(list) {
			$('#listComment_all').empty();
			$.each(list, function(idx, comment){
					
				$('<div>').addClass('commentContent')
				.append( $('<div>').addClass('myPhoto').append( $('<img alt="내프로필" src="">') ))
				.append( $('<div>').addClass('comment_wrap')
					.append( $('<div>').addClass('comment_all')
						.append( $('<div>').addClass('comment1')
								.append( $('<div>').html(comment.user_nickname))
								.append( $('<div>').html(comment.created_at))
						)
						.append( $('<div>').addClass('comment2').html(comment.comment_content) )
					)
					.append( $('<div>').addClass('CommentU_DBtn')
						.append( $('<input type="hidden" name="comment_no"/>').val(comment.comment_no) )
						.append( $('<input type="hidden" name="user_no"/>').val(comment.user_no))
						.append( $('<input type="hidden" name="comment_content"/>').val(comment.comment_content))
						.append( $('<div>').html('<input type="button" value="수정" id="btnUpdate"/>') )
						.append( $('<div>').html('<input type="button" value="삭제" id="btnDelete" onclick="commentDelete('+ comment.comment_no + ')"/>') )
					)															
				)
				.appendTo('#listComment_all');
				
			});
		}
		
		
		
		/**** 댓글 삽입 ****/
		function commentInsert() {
			$('#commentBtn').click(function(){
				
				if ( '${loginUser.user_no}' == '') {
					loginAlert();
				} else {
					
					var meeting_no = ${trainerClassDto.meeting_no};
					var board_user_no = ${trainerClassDto.user_no};
					var user_no = '${loginUser.user_no}';
					var comment_content = $('input:text[name="comment_content"]').val();
					var sendObj = {
							"comment_referer_no": meeting_no,
							"board_user_no": board_user_no,
							"comment_content": comment_content,
							"user_no":user_no
						};
					
						$.ajax({
							url: 'commentInsert.leo',
							type: 'post',
							data: JSON.stringify(sendObj),
							contentType: 'application/json; charset=utf-8',
							dataType:'json',
							success: function(responseObj) {
								if (responseObj.result == true) {
									alert('댓글이 작성되었습니다.');
									commentList();
									$('input:text[name="comment_content"]').val('');
								} else {
									alert('댓글이 작성되지 않았습니다.');
								}
							},
							error: function(){alert('실패??');}
						});
					
				}
					
			
				
			});
		}
		
		/**** 댓글 삭제 ****/	
		function commentDelete(comment_no) {
			
			
			$.ajax({
				url: 'commentDelete.leo/' + comment_no,
				type: 'get',
				contentType: 'application/json',
				dataType: 'json',
				success: function(responseObj) {
					if (responseObj.result == 1) {
						alert('삭제되었습니다.');
						commentList();
					} else {
						alert('삭제에 실패했습니다.');
					}
				},
				error: function(){alert('실패2124');}						
			});
		}
		
		/**** 댓글 수정하기 위한 input 생성 후 value 입력 ****/
		function commentUpdate() {
			$('#listComment_all').on('click', '#btnUpdate', function() {
				$(this).parents('.comment_wrap').addClass('my');
				$(this).parents('.comment_wrap').empty();
				/*
				var a = $('<div>')
				.append($('<input type="text" name="commentUpdate"/>'))
				.append($('<input type="button" value="수정완료"/>'))
				.append($('<input type="button" value="취소"/>'));
				
				$('#listComment_all').find('.my').append(a);
				*/
				var comment_no = $(this).parents('div').find('input:hidden[name="comment_no"]').val();
				var comment_content = $(this).parents('div').find('input:hidden[name="comment_content"]').val();
				
				$('<div>').addClass('commentUpdateScreen')
				.append($('<input type="text" name="commentUpdate" id="commentUpdate"/>').val(comment_content))
				.append($('<input type="hidden" name="comment_no"/>').val(comment_no))
				.append($('<input type="button" value="수정완료" id="commentUpdateEnd"/>'))
				.append($('<input type="button" value="취소" id="commentUpdateCancel"/>'))
				.appendTo('.my');
			});
		}
				
		/***** 댓글 수정 *****/
		function commentUpdate2() {
				$(document).on('click', '#commentUpdateEnd', function() {
					
					var commentUpdate = $(this).parent('div').find('input:text[name="commentUpdate"]').val();
					var comment_no = $(this).parent('div').find('input:hidden[name="comment_no"]').val();
					
					var sendObj = {
										"comment_content" : commentUpdate,
										"comment_no" : comment_no
									   };
					$.ajax({
						
							url: 'commentUpdate.leo',
							type: 'post',
							data: JSON.stringify(sendObj),
							dataType: 'json',
							contentType: 'application/json; charset=utf-8',
							success: function(responseObj) {
								if (responseObj.result == true) {
									alert('수정되었습니다.');
									commentList();
								} else {
									alert('수정되지 않았습니다.');
								}
							},
							error:function(){alert('실패3');}
					});
				});
			}
		
		// 수정버튼 눌렀을때 나오는 취소 버튼 처리
		function commentUpdateCancel() {
			$(document).on('click', '#commentUpdateCancel', function() {
				commentList();			
			});	
		}
		
		// 작성버튼 옆에 취소 버튼 처리
		function commentInsertCancel() {
			$('#commentInsertCancel').click(function(){
					$('input:text[name="comment_content"]').val('');
			});
		}
		
		
		
	</script>
	
	
	<br/><br/><br/><br/><br/>

		<form>
			<div>댓글&nbsp;<span id="totalCount"></span>개</div><br/>
			<!-- 댓글 작성란 -->
			<div class="createComment_all">
				<div class="myPhoto"><img alt="내 프로필" src="" /></div>
				<div id="createComment"><input type="text" name="comment_content" id="comment_content" placeholder="댓글작성.."></textarea></div>
				<div class="btns">
					<input type="button" value="취소" id="commentInsertCancel"/>
					<input type="button" value="댓글달기" id="commentBtn" /> 
				</div>
			</div>
		</form>
	
	<!-- 댓글 리스트란 -->
	<div id="listComment_all">
	
	</div>
	<!-- 페이징 -->
	<div id="paging">
	
	</div>
	
    
<%@ include file="../template/footer.jsp" %>