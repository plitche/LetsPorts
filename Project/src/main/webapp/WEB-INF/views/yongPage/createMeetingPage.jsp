<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link type="text/css" rel="stylesheet" href="resources/style/soo/createMeetingPage.css" >
<jsp:include page="../template/header.jsp">
	<jsp:param value="트레이너 모임 개설 페이지" name="title"/>
</jsp:include>

<form action="createMeeting.plitche">
	<p style="margin-top: 100px; font-weight: 900; font-size: 2rem;">모임 개설 하기</p>
	<div id="meetingHeader">
		<div id="category">
			<select name="exercise_no">
				<option value="">카테고리 선택</option>
				<option value="0">족구</option>
				<option value="1">축구</option>
				<option value="2">농구</option>
				<option value="3">볼링</option>
				<option value="4">크로스핏</option>
				<option value="5">스피닝</option>
				<option value="6">댄스</option>
				<option value="7">요가</option>
				<option value="8">명상</option>
			</select>
		</div>
		<div id="meetingTitle">
			<input type="text" name="meeting_title" placeholder="모임 제목을 입력해 주세요."/><br/>
		</div>
	</div>
	<p style="border: 1px dotted gray; color: blue; margin-bottom: 30px;">
		■ 필독 사항 <br/>
		- 카테고리는 한 가지만 서택 가능합니다. <br/>
	 	- 게시글 양식을 삭제/임의 변경 하지 마시고 정보만 입력해주세요.
	</p>
	<div id="meetingDetail">
		<div id="detailLeft">
			<div id="meetingDate">
				<p>모임일 : </p>
				<input type="date" name="meeting_date"/>
			</div>
			<div id="gather">
				<p>모집 기간</p>
				<div id="gatherDetail">
					<div>
						<p>모집 시작일</p>
						<input type="date" name="start_gather_date"/>
					</div>
					<div>
						<p>모집 종료일</p>
						<input type="date" name="end_gather_date"/>
					</div>
				</div>		
			</div>
			<div>
				<input type="text" name="meeting_max" placeholder="최소 인원"/>
				<input type="text" name="meeting_min" placeholder="최대 인원"/>
			</div>
		</div>
		<div id="detailRight">
			<div id="address">
				<input type="text" name="location1_no" placeholder="시/도"/> 
				<input type="text" name="location2_no" placeholder="시/군/구"/> 
			</div>
			<input type="text" id="detailLocation" name="detail_location" placeholder="상세주소를 입력하세요."/>
			<div id="materials">
				<p>준비물</p>
				<input type="button" id="plusMaterial" value="+"/>
			</div>		
		</div>
	</div>
	<div id="meetingContent">
		<p>상세내용을 작성해 주세요.</p>
		<textarea rows="10" cols="50" name="meeting_content">
▶ 구체적인 시간 :
▶ 진행 방법 : 
▶ 기타 내용 : 
▶ 등 등 등 : 
		</textarea>
		<button>작성 완료</button>
	</div>
</form>

<%@ include file="../template/footer.jsp" %>