<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<script src="https://kit.fontawesome.com/6b75fdce2b.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="resources/style/soo/trainerListPage.css" >

<jsp:include page="../template/header.jsp">
	<jsp:param value="트레이너 리스트 페이지" name="title"/>
</jsp:include>

<div id="trainerMainPhoto">
	<img alt="coaching" src="resources/images/soo/coaching.jpg">
</div>
<br/><br/>
<div id="ManageTrainer">
	<div>
		<img class="introLogo" alt="interview" src="resources/images/soo/job-interview.png">
		<div class="introTitle">3차 면접을 통한 까다로운 선발</div>
		<div class="introContent">우리는 서류면접, 시뮬레이션 면접, 실제 모임 면접까지 총 3단계의 까다로운 면접을 통해 트레이너를 선발합니다. </div>
	</div>
	<div>
		<img class="introLogo" alt="training" src="resources/images/soo/training.png">
		<div class="introTitle">시뮬레이션 및 정기 교육 진행</div>
		<div class="introContent">트레이너의 성장과 서비스 퀄리티 향상을 위해 매달 정기적인 교육 및 노하우 공유 회의를 진행합니다.</div>
	</div>
	<div>
		<img class="introLogo" alt="score" src="resources/images/soo/score.png">
		<div class="introTitle">LetsPots만의 평가제도</div>
		<div class="introContent">트레이너 모임 리뷰, 평가, 횟수 등을 종합적으로 반영하여 트레이너를 관리합니다. 주요 지표들이 좋지 않을 경우, 철저한 교육을 실시합니다.</div>
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
		<c:forEach var="trainer" items="${trainerList}">
			<a href="goTrainerDetail.plitche?user_no=${trainer.user_no}">
				<div class="trainer">
					<div class="trainer-picture">
						<div class="overlay">
							<div style="bottom: 60px;"><i class="fas fa-check-circle"></i> 활동센터 : ${trainer.employment} </div>
							<div style="bottom: 30px;"><i class="fas fa-check-circle"></i> 활동경력 : ${trainer.career}년 </div>
							<div style="bottom: 0px;"><i class="fas fa-check-circle"></i> ${trainer.user_message} </div>
						</div>
						<img alt="${trainer.profile_photo}" src="resources/storage/${trainer.profile_photo}" >
					</div>
					<div class="trainer-info">
						<div>${trainer.trainer_name}</div>
						<div>${trainer.user_nickname}</div>
						<div>
							<c:if test="${trainer.score eq 0.0}">
								<span><i class="fas fa-star"></i> 0점 </span>	
							</c:if>
							<c:if test="${trainer.score ne 0.0}">
								<span><i class="fas fa-star"></i> ${trainer.score}점 </span>	
							</c:if>
							<span><i class="far fa-comments"></i> ${trainer.reviews}개</span>
						</div>				
					</div>
				</div>
			</a>
		</c:forEach>
		</div>
	</div>
</c:if>
<%@ include file="../template/footer.jsp" %>