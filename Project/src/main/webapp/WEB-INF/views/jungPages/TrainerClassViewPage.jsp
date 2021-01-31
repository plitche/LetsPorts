<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
				   준비물 :<br/><br/>
				   상세내용 : ${trainerClassDto.meeting_content}<br/><br/>
	    	   
	    	   </div>
			   
			   <div class="12">
			   
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
			   
    	   
    	   </div>
			   
			   <!-- 버튼들 -->
			   <input type="button" value="수정" onclick="fn_TrainerClassViewUpdate(this.form)" />
			   <input type="button" value="삭제" onclick="fn_TrainerClassViewDelete(this.form)" />
			   <input type="button" value="등록하기" onclick="" />
		   
    </form>
    
    <script>

			function fn_TrainerClassViewUpdate(f) {
				f.action = 'TrainerClassDelete.leo';
				f.submit();
			}

			function fn_TrainerClassViewDelete(f) {
				if(confirm('삭제하시겠습니까?') {
					f.action = 'TrainerClassViewDelete.leo';
				}
				f.submit();
			}

	</script>
    
    
<%@ include file="../template/footer.jsp" %>
