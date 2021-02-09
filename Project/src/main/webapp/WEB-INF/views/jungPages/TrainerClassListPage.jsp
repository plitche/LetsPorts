<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../template/header.jsp" />
<link type="text/css" rel="stylesheet" href="resources/style/jung/TrainerClassMain.css" >
<script>
	/* 로그인 alert을 위한 function */
	var loginAlert = function() {
						swal.fire({
							title: '로그인이 필요한 기능입니다!', 	text: '로그인 페이지로 이동하시겠습니까?',
							icon: 'warning',     			showCancelButton: true,
							confirmButtonColor: 'green',	cancelButtonColor: 'red',
							confirmButtonText: '이동하기',		cancelButtonText: '머물기'
						}).then((result)=> {
							if (result.isConfirmed) {
								Swal.fire('로그인 페이지로 이동합니다.', '로그인 후 더 많은 정보를 확인하세요!^^', 'success').then((result)=> {
										location.href='usersLoginPage.hey';	
									}
								);
							}
						});
					}
	
	window.onload = function() {
		 
	    function onClick() {
	        document.querySelector('.modal_wrap').style.display ='block';
	        document.querySelector('.black_bg').style.display ='block';
	    }   
	    function offClick() {
	        document.querySelector('.modal_wrap').style.display ='none';
	        document.querySelector('.black_bg').style.display ='none';
	    }
	 
	    document.getElementById('modal_btn').addEventListener('click', onClick);
	    document.querySelector('.black_bg').addEventListener('click', offClick);
	 
	};

</script>

<br/>

<form>
		<div class="filter_content">
			<br/><br/>	
			<div class="QueryAndTag">
				<div id="Query">
					<input type="text" name="search_content" placeholder="검색어를 입력하세요"/>
					<input type="button" value="검색" onclick="fn_SearchClass(this.form)" />
				</div>
			</div>
			<button type='button' id="modal_btn">모임유형 ▼</button>
			<div class="black_bg"></div>
			<div class="modal_wrap">
			    <div class="modal_content">
					<div id="model_title">모임 유형</div>
					<div id="line"></div>
					<a href="#" ><div class="catagory">모든 모임</div></a>
					<a href="#" ><div class="catagory">트레이너</div></a>
					<a href="#" ><div class="catagory">운동메이트</div></a>
			    </div>
			</div>
		</div>

	<br/><br/>

	<div id="Tag">
		<div id="Tag_name">운동카테고리</div>
		<div id="Tag_content">
			<c:forEach var="Tags" items="${ClassTags}">
				<input type="button" value="#${Tags.exercise_name}" onclick="Tag${Tags.exercise_no}(this.form)" />
				<input type="hidden" name="${Tags.exercise_name}" value="${Tags.exercise_name}" />
			</c:forEach>
		</div>
	</div>	
	
</form>	

	<br/><br/>
	
	<div id="line1"></div>
	
	<br/>
	<div><h3>모임 전체보기</h3></div>
	<br/>
	
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
				loginAlert();
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
					<div><img alt="${MeetingDto.photo_filename}" src="resources/storage/${MeetingDto.photo_filename}" style="width:250px; height:100px;"></div>
					${MeetingDto.meeting_title}<br/><br/>
					모임일 : ${MeetingDto.meeting_date}<br/>
					운동 종목 : ${MeetingDto.exercise_name}<br/>
					작성자 : ${MeetingDto.user_nickname}<br/>
					조회수 ${MeetingDto.meeting_hit}<br/>
				</div>
			</a>
		</c:forEach>
	
	</div>


<%@ include file="../template/footer.jsp" %>