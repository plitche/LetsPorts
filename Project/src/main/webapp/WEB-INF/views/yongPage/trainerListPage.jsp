<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<jsp:include page="../template/header.jsp">
	<jsp:param value="트레이너 리스트 페이지" name="title"/>
</jsp:include>

<link rel="stylesheet" href="resources/style/soo/trainerListPage.css" >

<br/><br/>
<table border="1">
	<tbody>
		<tr>
			<td>인기 트레이너</td>
			<td>인기 트레이너</td>
			<td>인기 트레이너</td>
		</tr>
	</tbody>
</table>	

<br/><br/>
<div id="ManageTrainer">
	<div>
		<p>3차 면접을 통한 까다로운 선발</p>
		<p>우리는 서류면접, 시뮬레이션 면접, 경영진 면접까지 총 3단계의 까다로운 면접을 통해 트레이너를 선발합니다. </p>
	</div>
	<div>
		<p>시뮬레이션 및 정기 교육 진행</p>
		<p>트레이너의 성장과 서비스 퀄리티 향상을 위해 매달 정기적인 교육 및 노하우 공유 회의를 진행합니다.</p>
	</div>
	<div>
		<p>평가제도</p>
		<p>반기 별로 수업 만족도, 재등록율, 근태, cs 등을 종합적으로 반영하여 트레이너 승급, 인센티브를 제공합니다. 주요 지표들이 좋지 않을 경우, 철저한 내부 보수 교육을 실시합니다.</p>
	</div>
</div>
<br/><br/>


<c:if test="${empty trainerList}">
	<!-- 등록된 trainerList가 하나도 없을 때 -->
	<div style="margin: 0 auto;">등록된 트레이너가 없습니다.</div>
</c:if>
<c:if test="${not empty trainerList}">
	<!-- 등록된 trainerList가 있을 때 -->
	<div id="content-container">
		<div id="trainer-list">
		<c:forEach var="trainerTemDto" items="${trainerList}">
			<a href="goTrainerDetail.plitche?user_no=${trainerTemDto.user_no}">
				<div class="trainer">
					<div class="trainer-picture">
						사진 : ${trainerTemDto.profile_photo}
					</div>
					<div class="trainer-info">
						<div>닉네임 : ${trainerTemDto.user_nickname}</div>
						<div>이름 : ${trainerTemDto.trainer_name}</div>
						<div>
							<span>평점 : ${trainerTemDto.score}점 /</span> 
							<span>리뷰 : ${trainerTemDto.reviews}개</span>
						</div>				
					</div>
				</div>
			</a>
		</c:forEach>
		</div>
	</div>
</c:if>
<%@ include file="../template/footer.jsp" %>