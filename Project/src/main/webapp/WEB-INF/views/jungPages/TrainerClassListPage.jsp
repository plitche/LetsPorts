<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../template/header.jsp" />
<link type="text/css" rel="stylesheet" href="resources/style/jung/TrainerClassMain.css" >

<br/><br/>

<form>
	
	<div class="QueryAndTag">
	
		<div id="Query">
			<input type="text" name="search_content" placeholder="검색어를 입력하세요"/>
			<input type="button" value="검색" onclick="fn_SearchClass(this.form)" />
			<a href="TrainerClassListPage.leo"><img alt="모든 목록" src="resources/images/jung/rotate-option.png" /></a>
		</div>
			
		<div id="Tag">
		
			<c:forEach var="Tags" items="${ClassTags}">
				<input type="button" value="#${Tags.exercise_name}" onclick="Tag${Tags.exercise_no}(this.form)" />
				<input type="hidden" name="${Tags.exercise_name}" value="${Tags.exercise_name}" />
			</c:forEach>
			
		</div>	
		
	</div>
	
	<br/><br/><br/>	
</form>
	
	
	<script>
	
		// 검색 기능
		function fn_SearchClass(f) {
			f.action = 'SearchClass.leo';
			f.submit();
		}
		// 태그 기능(축)
		function Tag0(f) {// 족구
			f.action = 'Tag0.leo';
			f.submit();
		}
		function Tag1(f) {// 축구
			f.action = 'Tag1.leo';
			f.submit();
		}
		function Tag2(f) {// 농구
			f.action = 'Tag2.leo';
			f.submit();
		}
		function Tag3(f) {// 볼링
			f.action = 'Tag3.leo';
			f.submit();
		}
		function Tag4(f) {// 크로스핏
			f.action = 'Tag4.leo';
			f.submit();
		}
		function Tag5(f) {// 크로스핏
			f.action = 'Tag5.leo';
			f.submit();
		}
		function Tag6(f) {// 댄스
			f.action = 'Tag6.leo';
			f.submit();
		}
		function Tag7(f) {// 요가
			f.action = 'Tag7.leo';
			f.submit();
		}
		function Tag8(f) {// 명상
			f.action = 'Tag8.leo';
			f.submit();
		}
	
		
		// 트레이너 클래스 목록 페이지에서 로그인이 안되어있을경우 넘겨주는 스크립트
		function forMakeClassLogin() {
			if ('${loginUser}' == '') {
				alert('LetSports 트레이너 자격이 있으신 분만 개설 가능합니다. 로그인해주세요.');
				location.href= 'usersLoginPage.hey';
			} else {
				location.href = 'TrainerClassInsertPage.leo';
			}
			
		}
		
		
	</script>
	
	
	<div class="MeetingClass_all">
		
			<!-- 트레이너 클래스 개설창 -->
			<a href="#" onclick="forMakeClassLogin()">
				<div class="maketrainerClass">
					
						+ 트레이너 클래스 개설<br/><br/>
						클래스를 개설해 자신만의 운동을
						사람들에게 가르쳐주세요.
						
				</div>
			</a>
	
		<!-- 트레이너 클래스 리스트 -->	
		<c:forEach var="MeetingDto" items="${MeetingList}">
			<a href="TrainerClassViewPage.leo?meeting_no=${MeetingDto.meeting_no}">
				<div class="MeetingClass">
					${MeetingDto.meeting_title}<br/><br/>
					모임일 : ${MeetingDto.meeting_date}<br/>
					운동 종목 : ${MeetingDto.exercise_name}<br/>
					조회수 ${MeetingDto.meeting_hit}<br/>
				</div>
			</a>
		</c:forEach>
	
	</div>


<%@ include file="../template/footer.jsp" %>