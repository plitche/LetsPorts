<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<jsp:include page="../template/header.jsp">
	<jsp:param value="트레이너 리스트 페이지" name="title"/>
</jsp:include>

	${trainerTemDto.user_nickname}

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<jsp:include page="../template/header.jsp">
	<jsp:param value="트레이너 상세 페이지" name="title"/>
</jsp:include>

	트레이너 사진 파일 이름: ${trainerTemDto.profile_photo} <br/>
	트레이너 닉네임 : ${trainerTemDto.user_nickname} <br/>
	상태 메세지 : ${trainerTemDto.user_message} <br/>
	트레이너 경력 : ${trainerTemDto.career}년 <br/>
	트레이너 활동 센터 : ${trainerTemDto.employment} <br/>
	트레이너 프로필 : ${trainerTemDto.profile} <br/>
<br/>

<div>
	<div>${trainerTemDto.user_nickname} 트레이너의 프로그램</div>
	총 : ##개  &nbsp;&nbsp;&nbsp;&nbsp; <a href="goCreateMeetingPage.plitche">새 프로그램 등록하기</a> <br/>
	<table border="1">
		<thead>
			<tr>
				<td>코스번호</td>
				<td>제목</td>
				<td>내용</td>
				<td>최대 참가 인원</td>
				<td>일시</td>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty meetingDto}">
				<tr>
					<td colspan="5">개설된 프로그램이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty meetingDto}">
				<c:forEach var="list" items="${meetingDto}">
					<tr>
						<td>${list.meeting_no}</td>
						<td>${list.meeting_title}</td>
						<td>${list.meeting_content}</td>
						<td>${list.meeting_max}</td>
						<td>${list.meeting_date}</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
</div>

<br/>

<div>
	<div>${trainerTemDto.user_nickname} 트레이너가 받은 리뷰</div>
	총 : ##개  &nbsp;&nbsp;&nbsp;&nbsp; <a href="">새 리뷰 등록하기</a> <br/>	
	<table border="1">
		<thead>
			<tr>
				<td>리뷰번호</td>
				<td>점수</td>
				<td>작성자</td>
				<td>내용</td>
				<td>일시</td>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty reviewDto}">
				<tr>
					<td colspan="4">작성된 리뷰가 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty reviewDto}">
				<c:forEach var="list" items="${reviewDto}">
					<tr>
						<td>${list.review_no}</td>
						<td>${list.score}</td>
						<td>${list.writer_user_no}</td>
						<td>${list.content}</td>
						<td>${list.created_at}</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
</div>

<br/>

<div>
	<div>${trainerTemDto.user_nickname} 트레이너에게 질문</div>
	총 : ##개  &nbsp;&nbsp;&nbsp;&nbsp; <a href="">새 질문 등록하기</a> <br/>
	<table border="1">
		<thead>
			<tr>
				<td>질문번호</td>
				<td>질문제목</td>
				<td>질문내용</td>
				<td>작성자</td>
				<td>일시</td>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty trainer_qnaDto}">
				<tr>
					<td colspan="4">작성된 질문이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty trainer_qnaDto}">
				<c:forEach var="list" items="${trainer_qnaDto}">
					<tr>
						<td>${list.trainer_qna_no}</td>
						<td>${list.trainer_qna_title}</td>
						<td>${list.trainer_qna_content}</td>
						<td>${list.question_user_no}</td>
						<td>${list.created_at}</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
</div>


<%@ include file="../template/footer.jsp" %>