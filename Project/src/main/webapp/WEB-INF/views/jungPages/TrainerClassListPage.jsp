<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../template/header.jsp" />
<link type="text/css" rel="stylesheet" href="resources/style/jung/TrainerClassMain.css" >

<br/><br/>
<form action="SearchClass.leo" method="get">

	<input type="text" name="search_content" placeholder="검색어를 입력하세요" />
	<button>검색</button>
	
</form>

	<span class="tags">
		<span><a href="" id="soccer">축구</a></span>
		<span><a href="" id="">족구</a></span>
		<span><a href="">농구</a></span>
		<span><a href="">크로스핏</a></span>
		<span><a href="">스피닝</a></span>
		<span><a href="">댄스</a></span>
		<span><a href="">러닝</a></span>
		<span><a href="">요가</a></span>
		<span><a href="">명상</a></span>
	</span>
	
	
	<script>
		/*
		$(document).on('click', '#soccer', function(){
			$.ajax ({
				url: 'soccerTag',
				data:
				
			});
			
		});
		*/
	
	</script>
	
	
	<div class="MeetingClass_all">
		
		<!-- 트레이너 클래스 개설창 -->
		<div class="maketrainerClass">
			<a href="TrainerClassInsertPage.leo">
			
				+ 트레이너 클래스 개설<br/><br/>
				클래스를 개설해 자신만의 운동을
				사람들에게 가르쳐주세요.
				
				
			</a>
		</div>
	
		<!-- 트레이너 클래스 리스트 -->
		<c:forEach var="MeetingDto" items="${MeetingList}">
			<div class="MeetingClass">
				<a href="TrainerClassViewPage.leo?meeting_no=${MeetingDto.meeting_no}">${MeetingDto.meeting_title}</a><br/><br/>
				모임일 : ${MeetingDto.meeting_date}<br/>
				운동 종목 : ${MeetingDto.exercise_name}<br/>
			</div>
		</c:forEach>
	
	</div>


<%@ include file="../template/footer.jsp" %>