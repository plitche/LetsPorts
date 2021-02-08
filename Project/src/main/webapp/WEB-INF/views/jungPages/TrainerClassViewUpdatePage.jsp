<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../template/header.jsp" />
<link type="text/css" rel="stylesheet" href="resources/style/jung/TrainerClassUpdatePage.css" >



	<form method="post" enctype="multipart/form-data" >
	
		<br/><br/><br/>
    	   <div class="TrainerClassUpdate_part1"> 
    	   
	    	   <div class="TrainerClassUpdate">
	    	   		
				   모임제목 : <input type="text" name="meeting_title" value="${trainerClassDto.meeting_title}"/><br/><br/>
				   모임일 : <input type="text" name="meeting_date" value="${trainerClassDto.meeting_date}"/><br/><br/>
				   모집 기간 : <input type="text" name="start_gather_date" value="${trainerClassDto.start_gather_date}"/> ~
				   <input type="text" name="end_gather_date" value="${trainerClassDto.end_gather_date}"/><br/><br/>
				   모집 인원 : 최소 <input type="text" name="meeting_min" value="${trainerClassDto.meeting_min}"/>명 ~ 최대
				   <input type="text" name="meeting_max" value="${trainerClassDto.meeting_max}"/><br/><br/>
				   운동 종목 : <input type="text" name="exercise_no" value="${trainerClassDto.exercise_no}"/><br/><br/>
				   모임장소 : <input type="text" name="location1_no" value="${trainerClassDto.location1_no}"/>
				   <input type="text" name="location2_no" value="${trainerClassDto.location2_no}"/><br/><br/>
				   상세 주소 : <input type="text" name="detail_location" value="${trainerClassDto.detail_location}"/><br/><br/>
				   준비물 : <!-- 준비물 받아오기.. 여러개 배열 받기. -->
				   <c:forEach var="materialsList" items="${trainerClassDto.materials_name}">
					   <div><input type="text" name="materials_name" value="${materialsList}"/></div>
				   </c:forEach>
				   <br/><br/>
				   상세내용 :<br/>
	    	   		<textarea rows="10" cols="50" name="meeting_content">${trainerClassDto.meeting_content}</textarea><br/><br/>
	    	   </div>
			   
			   <div class="12">
			   
				   <div class="WishList"><a href="">관심페이지 등록하기</a></div>
				   <div class="TrainerClassPhoto">
					   		<img alt="${trainerClassDto.photo_filename}" src="resources/storage/${trainerClassDto.photo_filename}" style="width: 300px; height:300px;">
				   </div>
				   <div class="coverphotoUpdate"><input type="file" name="coverphotoUpdate" /></div>
					
								   
			   </div>
			</div>
				
				<!-- hidden -->
				<input type="hidden" name="meeting_no" value="${trainerClassDto.meeting_no}"/>
				<input type="hidden" name="user_no" value="${loginUser.user_no}" />
			   <input type="button" value="수정완료" onclick="fn_TrainerClassViewUpdate(this.form)">
			   <input type="reset" value="초기화" />
			   <input type="button" value="트레이너클래스페이지로" onclick="location.href='TrainerClassListPage.leo'" />
	
	</form>

	<script>
	
		function fn_TrainerClassViewUpdate(f) {
			f.action = 'TrainerClassViewUpdate.leo';
			f.submit();
		}
	
	</script>


<%@ include file="../template/footer.jsp" %>