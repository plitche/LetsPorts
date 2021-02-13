<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../template/header.jsp" />
<link type="text/css" rel="stylesheet" href="resources/style/jung/.css" >

<br/>
<h3>관심트레이너 리스트</h3>
<br/>

<div id="WishTrainerList_line" style="width: 1080; height: 1px; background: lightgray;"></div>
		
	<br/><br/>
		
	<c:forEach var="WishTrainerList" items="${WishTrainerList}">
		<a href="goTrainerDetail.plitche?user_no=${WishTrainerList.scrap_referer_no} ">
			<div id="WishTrainerListBox" style="width: 250px; height: 300px; background: lightgray; margin-right: 20px; float: left; margin-top:20px;" >
				<div><img alt="${WishTrainerList.profile_photo}" src="resources/storage/${WishTrainerList.profile_photo}" style="width:250px; height:100px;"></div>
				${WishTrainerList.user_nickname}[${WishTrainerList.trainer_name}]<br/><br/>
				${WishTrainerList.location1_name}<br/>
				${WishTrainerList.location2_name}<br/>
				관심분야 :
			</div>
		</a>
	</c:forEach>





<%@ include file="../template/footer.jsp" %>