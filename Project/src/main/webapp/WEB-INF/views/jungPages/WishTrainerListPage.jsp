<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../template/header.jsp" />
<link type="text/css" rel="stylesheet" href="resources/style/jung/WishTrainerListPage.css" >

<br/>
<h3>관심트레이너 리스트</h3>
<br/>

<div id="WishTrainerList_line" style="width: 1080; height: 1px; background: lightgray;"></div>
		
	<br/><br/>
		
	<c:forEach var="WishTrainerList" items="${WishTrainerList}">
		<a href="goTrainerDetail.plitche?user_no=${WishTrainerList.scrap_referer_no} ">
			<div class="WishTrainerListBox">
				<div id="WishTrainerPhoto_Name">
					<div id="WishTrainerProfile"><img alt="${WishTrainerList.profile_photo}" src="resources/storage/${WishTrainerList.profile_photo}" style="width:250px; height:100px;"></div>
					<div style="margin-left:5px;">
						<div style="font-size: 10px; color:gray;">트레이너</div>
						<div style="font-size: 15px; font-weight: 900;">${WishTrainerList.user_nickname}[${WishTrainerList.trainer_name}]</div>
					</div>
				</div>
				<div style="margin-top: 20px;">
					<span id="location1">${WishTrainerList.location1_name}</span>&nbsp;<span id="location2">${WishTrainerList.location2_name}</span>
				</div>
				<div style="margin-top:15px;" id="exercise_name">축구${WishTrainerList.exercise_name}</div>
				<div style="margin-top:15px;">${WishTrainerList.profile}</div>
			</div>
		</a>
	</c:forEach>

<!-- 트레이너 클래스 리스트 -->	
		<c:forEach var="MeetingDto" items="${MeetingList}">
			<a href="TrainerClassViewPage.leo?meeting_no=${MeetingDto.meeting_no}">
				<div class="MeetingClass">
					<div id="MeetingClassPhoto"><img alt="${MeetingDto.photo_filename}" src="resources/storage/${MeetingDto.photo_filename}" style="width:250px; height:100px;"></div>
						<div style="padding:15px;">
							<div style="font-weight: 900;">${MeetingDto.meeting_title}</div>
							<div class="exercise_name">${MeetingDto.exercise_name}</div>
							<div class="location"><i class="fas fa-map-marker-alt"></i>&nbsp;&nbsp;${MeetingDto.location1_name} ${MeetingDto.location2_name} · ${MeetingDto.meeting_date}</div>
							<div style="width:220px; height:0.3px; background: lightgray; margin: 10px 0px;"></div>
							<div style="display: flex; align-items: center;">
								<div style="width: 35px; height: 35px; border-radius: 100px; background: #c2c2c2;"><img alt="${MeetingDto.profile_photo}" src="resources/storage/${MeetingDto.profile_photo}"></div>
								<div style="height: 20px; line-height: 20px; margin-left: 5px; font-size: 12px;">${MeetingDto.user_nickname}</div>
								<div style="margin-left:110px; font-size: 12px; color: lightgray;"><i class="fas fa-eye" style="color: lightgray;"></i> ${MeetingDto.meeting_hit}</div>
							</div>
						</div>
				</div>
			</a>
		</c:forEach>




<%@ include file="../template/footer.jsp" %>