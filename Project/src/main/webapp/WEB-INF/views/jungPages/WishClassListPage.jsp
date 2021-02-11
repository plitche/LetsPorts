<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../template/header.jsp" />
<link type="text/css" rel="stylesheet" href="resources/style/jung/.css" >

<br/>
<h3>위시 리스트</h3>
<br/>

<div id="WishList_line" style="width: 1080; height: 1px; background: lightgray;"></div>
		
	<br/><br/>
		
	<c:forEach var="wishClassList" items="${WishClassList}">
		<a href="TrainerClassViewPage.leo?meeting_no=${wishClassList.meeting_no}">
			<div id="WishListBox" style="width: 250px; height: 300px; background: lightgray; margin-right: 20px;">
				<div><img alt="${wishClassList.photo_filename}" src="resources/storage/${wishClassList.photo_filename}" style="width:250px; height:100px;"></div>
				${wishClassList.meeting_title}<br/><br/>
				모임일 : ${wishClassList.meeting_date}<br/>
				운동 종목 : ${wishClassList.exercise_name}<br/>
				작성자 : ${wishClassList.user_nickname}<br/>
				조회수 : ${wishClassList.meeting_hit}<br/>
			</div>
		</a>
	</c:forEach>
	




<%@ include file="../template/footer.jsp" %>
