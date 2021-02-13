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
	
	
	
	$(document).on('click', '#catagory1', function(){
		location.href='TrainerClassListPage.leo';
	});
	
	$(document).on('click', '#catagory2', function(){
		location.href='TrainerClassList.leo';
	});
	
	$(document).on('click', '#catagory3', function(){
		location.href='ExerciseMateList.leo';
	});


</script>


<form method="get">
		<div class="filter_content">
			<div class="QueryAndTag">
				<div id="Query">
					<input type="text" name="search_content" placeholder="원하는 모임을 찾아보세요"/>
					<button onclick="fn_SearchClass(this.form)" aria-expanded="false" type="button" data-testid="structured-search-input-search-button">
						<div class="_1hb5o3s">
							<div class="_14lk9e14">
							<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" style="fill:lightgray;height:16px;width:16px;stroke:currentColor;stroke-width:4;overflow:visible" >
							<g fill="none">
							<path d="m13 24c6.0751322 0 11-4.9248678 11-11 0-6.07513225-4.9248678-11-11-11-6.07513225 0-11 4.92486775-11 11 0 6.0751322 4.92486775 11 11 11zm8-3 9 9">
							
							</path>
							</g>
							</svg>
							</div>
						</div>
					</button>
				</div>
			</div>
			<button type='button' id="modal_btn">모임유형 ▼</button>
			<div class="black_bg"></div>
			<div class="modal_wrap">
			    <div class="modal_content">
					<div id="model_title">모임 유형</div>
					<div id="line"></div>
					<a href="#" ><div class="catagory" id="catagory1">모든 모임</div></a>
					<a href="#" ><div class="catagory" id="catagory2">트레이너</div></a>
					<a href="#" ><div class="catagory" id="catagory3">운동메이트</div></a>
			    </div>
			</div>
		</div>


	<div id="Tag">
		<div id="Tag_name">운동종목</div>
		<div id="Tag_content">
			<c:forEach var="Tags" items="${ClassTags}">
				<input type="button" value="#${Tags.exercise_name}" onclick="Tag${Tags.exercise_no}(this.form)" />
				<input type="hidden" name="${Tags.exercise_name}" value="${Tags.exercise_name}" />
			</c:forEach>
		</div>
	</div>	
	

	<div id="line1"></div>
	
	<br/>
	
	<!-- 필터링 부분 처리 -->
	<c:if test="${Lists eq 0}">
		<script type="text/javascript">
			$('#modal_btn').html('모든모임 ▼');
		</script>
		<div class="meeting_filter_alert">
			<h3 id="catagory_title" style="display: inline; font-weight: 900;">모든모임</h3><h4 id="catagory_count" style="display: inline; margin-left:10px;">${totalRecord}개가 있습니다.</h4>
		</div>
	</c:if>
	<c:if test="${Lists eq 1}">
	<script type="text/javascript">
		$('#modal_btn').html('트레이너 ▼');
	</script>
		<div class="meeting_filter_alert">
			<h3 id="catagory_title">트레이너</h3><h4 id="catagory_count">${totalRecord}개가 있습니다.</h4>
		</div>
	</c:if>
	<c:if test="${Lists eq 2}">
	<script type="text/javascript">
			$('#modal_btn').html('운동메이트 ▼');
	</script>
		<div class="meeting_filter_alert">
			<h3 id="catagory_title">운동메이트</h3><h4 id="catagory_count">${totalRecord}개가 있습니다.</h4>
		</div>
	</c:if>
	<!-- 검색 부분 처리 -->
	<c:if test="${Lists eq 3}">
		<div class="meeting_filter_alert">
			<h3 id="catagory_title">${searchContent}</h3><h4 id="catagory_count">${totalRecord}개가 있습니다.</h4>
		</div>
	</c:if>
	<!-- 태그 부분 처리 -->
	<c:if test="${Lists eq 10}">
		<div class="meeting_filter_alert">
			<h3 id="catagory_title">${Tag0}</h3><h4 id="catagory_count">${totalRecord}개가 있습니다.</h4>
		</div>
	</c:if>
	<c:if test="${Lists eq 11}">
		<div class="meeting_filter_alert">
			<h3 id="catagory_title">${Tag1}</h3><h4 id="catagory_count">${totalRecord}개가 있습니다.</h4>
		</div>
	</c:if>
	<c:if test="${Lists eq 12}">
		<div class="meeting_filter_alert">
			<h3 id="catagory_title">${Tag2}</h3><h4 id="catagory_count">${totalRecord}개가 있습니다.</h4>
		</div>
	</c:if>
	<c:if test="${Lists eq 13}">
		<div class="meeting_filter_alert">
			<h3 id="catagory_title">${Tag3}</h3><h4 id="catagory_count">${totalRecord}개가 있습니다.</h4>
		</div>
	</c:if>
	<c:if test="${Lists eq 14}">
		<div class="meeting_filter_alert">
			<h3 id="catagory_title">${Tag4}</h3><h4 id="catagory_count">${totalRecord}개가 있습니다.</h4>
		</div>
	</c:if>
	<c:if test="${Lists eq 15}">
		<div class="meeting_filter_alert">
			<h3 id="catagory_title">${Tag5}</h3><h4 id="catagory_count">${totalRecord}개가 있습니다.</h4>
		</div>
	</c:if>
	<c:if test="${Lists eq 16}">
		<div class="meeting_filter_alert">
			<h3 id="catagory_title">${Tag6}</h3><h4 id="catagory_count">${totalRecord}개가 있습니다.</h4>
		</div>
	</c:if>
	<c:if test="${Lists eq 17}">
		<div class="meeting_filter_alert">
			<h3 id="catagory_title">${Tag7}</h3><h4 id="catagory_count">${totalRecord}개가 있습니다.</h4>
		</div>
	</c:if>
	<c:if test="${Lists eq 18}">
		<div class="meeting_filter_alert">
			<h3 id="catagory_title">${Tag8}</h3><h4 id="catagory_count">${totalRecord}개가 있습니다.</h4>
		</div>
	</c:if>
	

	
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
					
						<div style="font-size: 18px; font-weight: 900; margin-top: 45px;">운동 모임</div>
						<div>
							<ul style="padding:20px; " id="makeTrainerClassContent">
								<li>모임을 개설해</li>
								<li>다양한 사람들과 함께</li>
								<li>운동을 즐겨보세요.</li>
							</ul>
						</div>
						
						<div id="MeetingplusIcon" style=""><i class="fas fa-plus" style="font-size: 24px;"></i></div>
						
				</div>
			</a>
	
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
	
	</div>
	<div class="paging" style="text-align: center; margin-top: 80px;">${paging}</div>
</form>	

<%@ include file="../template/footer.jsp" %>