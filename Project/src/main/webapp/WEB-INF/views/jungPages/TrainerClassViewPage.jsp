<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<jsp:include page="../template/header.jsp" />
<link type="text/css" rel="stylesheet" href="resources/style/jung/TrainerClassViewPage.css" >


    <form method="post">
    
    		<br/><br/><br/>
    	   <div class="TrainerClassView_part1"> 
    	   
		    	   <div class="TrainerClassInfo">
		    	   
					   모임제목 : ${trainerClassDto.meeting_title}<br/><br/>
					   모임일 : ${trainerClassDto.meeting_date}<br/><br/>
					   모집 기간 : ${trainerClassDto.start_gather_date} ~ ${trainerClassDto.end_gather_date}<br/><br/>
					   모집 인원 : 최소 ${trainerClassDto.meeting_min}명 ~ 최대 ${trainerClassDto.meeting_max}<br/><br/>
					   운동 종목 : ${trainerClassDto.exercise_no}<br/><br/>
					   모임장소 : ${trainerClassDto.location1_no} ${trainerClassDto.location2_no}<br/><br/>
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
					   		사진 
					   </div>
				   
				   </div>
				   
				   <!-- hidden -->
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
			   
			   <!-- 버튼들(수정, 삭제, 등록) -->
			   <input type="button" value="수정" onclick="fn_TrainerClassViewUpdatePage(this.form)" />
			   <input type="button" value="삭제" onclick="fn_TrainerClassViewDelete(this.form)" />
			   <input type="button" value="등록하기" onclick="" />
		   
    </form>


    <script>

			function fn_TrainerClassViewUpdatePage(f) {
				f.action = 'TrainerClassViewUpdatePage.leo';
				f.submit();
			}

			function fn_TrainerClassViewDelete(f) {
				if (confirm('삭제하시겠습니까?')) {
					f.action = 'TrainerClassViewDelete.leo';
					f.submit();
				}
			}

	</script>
	
	
	<script>
		
		// 페이지 로드 이벤트
		$(document).ready(function(){
			commentList();
			commentInsert();
			commentDelete();
		});
	
		function commentList() {
			var meeting_no = '${trainerClassDto.meeting_no}';
			$.ajax({
				url: 'comment.leo',
				type: 'get',
				data: 'meeting_no=' + meeting_no,
				dataType: 'json',
				success: function (responseObj) {
					if (responseObj.result) {
						commentListContent(responseObj.commentList);
						$('#totalCount').empty();
						$('<span>').html(responseObj.totalCount)
						.appendTo('#totalCount');
					} else {
						$('#listComment_all').empty();
						 $('<div>').html('댓글을 작성해주세요')
						.appendTo('#listComment_all');
					}
				},
				error: function() {alert('실패');}
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
								.append( $('<div>').html(comment.user_no))
								.append( $('<div>').html(comment.created_at))
						)
						.append( $('<div>').addClass('comment2').html(comment.comment_content) )
					)
					.append( $('<div>').addClass('CommentU_DBtn')
						.append( $('<input type="hidden" name="comment_no"/>').val(comment.comment_no))
						.append( $('<input type="hidden" name="user_no"/>').val(comment.user_no))
						.append( $('<input type="hidden" name="comment_content"/>').html(comment.comment_content))
						.append( $('<div>').html('<input type="button" value="수정" id="btnUpdate"/>') )
						.append( $('<div>').html('<input type="button" value="삭제" id="btnDelete"/>') )
					)															
				)
				.appendTo('#listComment_all');
				
			});
		}
		
		
		/**** 댓글 삽입 ****/
		function commentInsert() {
			$('#commentBtn').click(function(){
				var meeting_no = ${trainerClassDto.meeting_no};
				var user_no = 10;
				var comment_content = $('input:text[name="comment_content"]').val();
				var sendObj = {
						"comment_referer_no": meeting_no,
						"user_no": user_no,
						"comment_content": comment_content
					};
				$.ajax({
					url: 'commentInsert.leo',
					type: 'post',
					dataType:'json',
					data: JSON.stringify(sendObj),
					contentType: 'application/json; charset=utf-8',
					success: function(responseObj) {
						if (responseObj.result == true) {
							alert('댓글이 작성되었습니다.');
							commentList();
						} else {
							alert('댓글이 작성되지 않았습니다.');
						}
					},
					error: function(){alert('실패');}
				});
			});
		}
		
		// 댓글 삭제
		function commentDelete() {
			$('#listComment_all').on('click', '#btnDelete', function(){
				
				var comment_no = $(this).parents('div').find('input:hidden[name="comment_no"]').val();
				var user_no = $(this).parents('div').find('input:hidden[name="user_no"]').val();
				
				var check = confirm(user_no + '님의 정보를 삭제할까요?');
				if (check) {
					
					$.ajax({
						url: 'commentDelete.leo/' + comment_no,
						type: 'delete',
						dataType: 'json',
						success: function(responseObj) {
							if (responseObj.result == 1) {
								alert('삭제되었습니다.');
								commentList();
							} else {
								alert('삭제에 실패했습니다.');
							}
						},
						error: function(){alert('실패');}						
					});
				}
			});
		}
		
	
		

		// 댓글 수정
		function commentUpdate() {
			$('#listComment_all').on('click', '#btnUpdate', function() {
				
				
				/*
				var sendObj = {
										"comment_no" : comment_no,
										"comment_content" : comment_content
									 };
				$.ajax({
					url: 'memberUpdate',
					type: 'put',
					data: JSON.stringify(sendObj),
					dataType: 'json',
					success: function(responseObj) {
						if (responseObj.result == 1) {
							alert('댓글이 수정되었습니다.');
							commentList();
						} else {
							alert('댓글 수정에 실패했습니다.');
						}
					},
					error: function(){alert('실패');}
				});
				*/
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
					<input type="button" value="취소" />
					<input type="button" value="댓글달기" id="commentBtn" /> 
				</div>
			</div>
		</form>
	
	<!-- 댓글 리스트란 -->
	<div id="listComment_all">
	
	</div>
	
    
<%@ include file="../template/footer.jsp" %>
