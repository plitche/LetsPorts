<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../template/header.jsp" />
<link type="text/css" rel="stylesheet" href="resources/style/jung/TrainerClassMain.css" >

<script>
	
	var InsertResult = ${InsertResult}
	if(InsertResult > 0) {
		alert('삽입되었습니다.');
	} else {
		alert('삽입되지 않았습니다.');
	}

</script>



<br/><br/>
<form action="">

	<input type="text" placeholder="검색어를 입력하세요" />
	<button>검색</button>

</form>


	<span class="tags">
		<span><a href="">축구</a></span>
		<span><a href="">족구</a></span>
		<span><a href="">농구</a></span>
		<span><a href="">크로스핏</a></span>
		<span><a href="">스피닝</a></span>
		<span><a href="">댄스</a></span>
		<span><a href="">러닝</a></span>
		<span><a href="">요가</a></span>
		<span><a href="">명상</a></span>
	</span>
	
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
		<c:forEach var="MeetingDto" items="${MeetingDto}">
			<div class="MeetingClass">
				<a href="TrainerClassViewPage.leo?meeting_no=${MeetingDto.meeting_no}">${MeetingDto.meeting_title}</a><br/><br/>
				모임일 : ${MeetingDto.meeting_date}<br/>
				운동 종목 : ${MeetingDto.exercise_no}<br/>
			</div>
		</c:forEach>
	
	</div>


<%@ include file="../template/footer.jsp" %>