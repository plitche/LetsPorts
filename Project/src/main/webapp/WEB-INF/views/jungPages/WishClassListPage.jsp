<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../template/header.jsp" />
<link type="text/css" rel="stylesheet" href="resources/style/jung/WishClassListPage.css" >

<br/>
<h3>위시 리스트</h3>
<br/>

<div id="WishList_line" style="width: 1080; height: 1px; background: lightgray;"></div>
		
	<br/><br/>
	
		
	<c:forEach var="wishClassList" items="${WishClassList}">
		<a href="TrainerClassViewPage.leo?meeting_no=${wishClassList.meeting_no}">
			<div id="WishListBox" >
				<div class="WishListPhoto"><img alt="${wishClassList.photo_filename}" src="resources/storage/${wishClassList.photo_filename}" style="width:250px; height:100px;"></div>
					<div style="padding:15px;">
						<div style="font-weight: 900;">${wishClassList.meeting_title}</div>
						<div class="exercise_name" style="margin-top: 20px;">${wishClassList.exercise_name}</div>
						<div class="location"><i class="fas fa-map-marker-alt"></i>&nbsp;&nbsp;${wishClassList.location1_name} ${wishClassList.location2_name} · ${wishClassList.meeting_date}</div>
						<div style="width:220px; height:0.3px; background: lightgray; margin: 10px 0px;"></div>
						<div style="display: flex; align-items: center;">
							<div style="width: 35px; height: 35px; border-radius: 100px; background: #c2c2c2;"><img alt="${wishClassList.profile_photo}" src="resources/storage/${MeetingDto.profile_photo}"></div>
							<div style="height: 20px; line-height: 20px; margin-left: 5px; font-size: 12px;">${wishClassList.user_nickname}</div>
							<div style="margin-left:110px; font-size: 12px; color: lightgray;"><i class="fas fa-eye" style="color: lightgray;"></i>${wishClassList.meeting_hit}</div>
						</div>
					</div>
			</div>
		</a>
	</c:forEach>
	




<%@ include file="../template/footer.jsp" %>
