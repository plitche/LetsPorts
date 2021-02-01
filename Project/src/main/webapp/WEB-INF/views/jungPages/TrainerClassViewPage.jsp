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
	
		$(document).ready(function(){
			commentList();
			commentInsert();
		});
	
		function commentList() {
			var meeting_no = ${trainerClassDto.meeting_no};
			$ajax({
				url: 'comment/' + meeting_no,
				type: 'get',
				dataType: 'json',
				success: function (responseList) {
					if (responseList.result) {
						commentListContent(responseList.list);
					}
				},
				error: function() {alert('실패');}
			});
		}
		function commentListContent(list) {
			$('#listComment_all').empty();
			$.each(list, function(idx, comment){
				$('<div id="writerPhoto">')
				.append($('<img alt="내 프로필" src=""/>'))
				.append($('<div class="listCommentContent">'))
				.append($('<div id="listCommentWriter">'))
				.append($('<div id="listComment">').html(comment.comment_content))
				.appendTo('#listComment_all');
			});
		}
		
	
		
		/**** 댓글 삽입 ****/
		function commentInsert() {
			$('#commentBtn').click(function(){
				var comment_content = $('input:text[name="comment_content"]').val();
				var meeting_no = ${trainerClassDto.meeting_no}
				var user_no = 10;
				var sendObj = {
						"meeting_no": meeting_no,
						"user_no": user_no,
						"comment_content": comment_content
					};
				$.ajax({
					url: 'commentInsert',
					type: 'post',
					data: JSON.stringify(sendObj),
					dataType='json',
					contentType: 'application/json; charset=utf-8',
					success: function(responseObj) {
						if (responseObj.result) {
							alert('댓글이 작성되었습니다.');
						} else {
							alert('댓글이 작성되지 않았습니다.');
						}
					},
					error: function(){alert('실패');}
				});
			});
		}
		
	</script>
	
	
	
	<br/><br/><br/><br/><br/>

	<form >
	
		<div>댓글 ~~ 개</div><br/>
		<!-- 댓글 작성란 -->
		<div class="createComment_all">
			<div id="myPhoto"><img alt="내 프로필" src="" /></div>
			<div id="createComment"><input type="text" name="comment_content"  id="comment_content" placeholder="댓글 추가..."/></div>
			<div class="btns">
				<input type="button" value="취소" />
				<input type="button" value="댓글달기" id="commentBtn" /> 
			</div>
		</div>
		
	</form>
	
	<!-- 댓글 리스트란 -->
	<div id="listComment_all">
		<!-- 
		<div id="writerPhoto"><img alt="내 프로필" src="" /></div>
		<div class="listCommentContent">
			<div id="listCommentWriter"></div>
			<div id="listComment"></div>
		</div>
		 -->
	</div>

		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
    
    
<%@ include file="../template/footer.jsp" %>
