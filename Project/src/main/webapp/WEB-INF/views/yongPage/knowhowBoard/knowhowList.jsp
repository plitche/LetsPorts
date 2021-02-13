<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="../../template/header.jsp">
	<jsp:param value="질문과 답변페이지" name="title"/>
</jsp:include>


<h3>서로 운동/건강 정보를 공유하세요!^^</h3>

	<div id="meetingList" class="conBox on">
		<div id="trainerMeetingList"></div>
		<div id="trainerMeetingFooter"></div>
	</div>




<%@ include file="../../template/footer.jsp" %>