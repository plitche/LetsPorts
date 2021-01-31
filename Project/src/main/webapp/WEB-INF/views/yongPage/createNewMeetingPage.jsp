<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="../template/header.jsp">
	<jsp:param value="트레이너 모임 개설 페이지" name="title"/>
</jsp:include>

<form action="createNewMeeting.plitche">
	모집 제목
	<br/><input type="text" name="meeting_title"/><br/>
	모임일(날짜)
	<br/><input type="date" name="meeting_date"/><br/>
	모집 시작(날짜)
	<br/><input type="date" name="start_gather_date"/><br/>
	모집 끝(날짜)
	<br/><input type="date" name="end_gather_date"/><br/>

	모집최소(숫자)
	<br/><input type="text" name="meeting_max"/><br/>
	모집최대(숫자)
	<br/><input type="text" name="meeting_min"/><br/>
	카테고리 <select name="exercise_no">
			<option value="0">족구</option>
			<option value="1">축구</option>
			<option value="2">농구</option>
			<option value="3">볼링</option>
			<option value="4">크로스핏</option>
			<option value="5">스피닝</option>
			<option value="6">댄스</option>
			<option value="7">요가</option>
			<option value="8">명상</option>
		  </select><br/>
		
	모임장소(숫자)	<br/><input type="text" name="location1_no"/><br/> 
				<input type="text" name="location2_no"/><br/>
	상세주소
	<br/><input type="text" name="detail_location"/><br/>
	준비물	
	<br/><input type="text" name="materialList"/><br/>
	<br/><input type="text" name="materialList"/><br/>
	<br/><input type="text" name="materialList"/><br/>
	상세내용		
	<br/><textarea rows="10" cols="50" name="meeting_content"></textarea><br/>
	
	<button>작성 완료</button>
</form>

<%@ include file="../template/footer.jsp" %>