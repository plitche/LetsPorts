<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- hidden 
				   <input type="hidden" name="photo_filename" value="${trainerClassDto.photo_filename}" />
				   <input type="hidden" name="meeting_no" value="${trainerClassDto.meeting_no}" />
				   <input type="hidden" name="meeting_title" value="${trainerClassDto.meeting_title}" />
				   <input type="hidden" name="meeting_date" value="${trainerClassDto.meeting_date}" />
				   <input type="hidden" name="start_gather_date" value="${trainerClassDto.start_gather_date}" />
				   <input type="hidden" name="end_gather_date" value="${trainerClassDto.end_gather_date}" />
				   <input type="hidden" name="meeting_min" value="${trainerClassDto.meeting_min}" />
				   <input type="hidden" name="meeting_max" value="${trainerClassDto.meeting_max}" />
				   <input type="hidden" name="exercise_no" value="${trainerClassDto.exercise_no}" />
				   <input type="hidden" name="location1_no" value="${trainerClassDto.location1_no}" />
				   <input type="hidden" name="location2_no" value="${trainerClassDto.location2_no}" />
				   <input type="hidden" name="detail_location" value="${trainerClassDto.detail_location}" />
				   <input type="hidden" name="meeting_content" value="${trainerClassDto.meeting_content}" />
				   -->
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- jquery, fontawesome -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://kit.fontawesome.com/07b67006ce.js"></script>
        
<!-- css파일 및 js파일 -->
<link rel="stylesheet" href="resources/wooki/css/textEditor.css">

<script type="text/javascript">
    $(document).ready(function() {
        $('div[contenteditable="true"]').attr('contenteditable', 'false');
        $('.btn').hide();
    });
</script>
    
<jsp:include page="../template/header.jsp" />
<link type="text/css" rel="stylesheet" href="resources/style/jung/TrainerClassViewPage.css" >
<!-- sweetalert -->
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
	
</script>

<script>

	$(document).on('click', '.WishListBtn', function() {
		if ('${loginUser.user_no}' == '') {
			loginAlert();
		}
	});

</script>


    <!--  <form method="post">-->
    
    		<br/><br/><br/>
 	   		<!-- 상단 제목 + 위시리스트 -->
   	   		<div class="TrainerClass_title_part">
   	   		
    	   		<div id="TrainerClass_title" style="font-size: 32px; font-weight: 900;">${trainerClassDto.meeting_title}</div>
    	   		
    	   		<!-- wishlist 버튼 -->
    	   		<div class="OfferWishListBtn_Box">
				   		<button type="button" class="WishListBtn" >
					   		<svg class="WishIcon-module__container--cAypQ" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
					   			<path id="loveIcon_1" fill="none" fill-rule="evenodd" stroke="#CED4DA" stroke-width="1.25" d="M15.876 4.625c1.205 0 2.41.46 3.33 1.379.918.92 1.378 2.124 1.378 3.33 0 1.204-.46 2.41-1.379 3.329h0l-7.1 7.1-7.101-7.1c-.92-.92-1.379-2.125-1.379-3.33s.46-2.41 1.379-3.329c.92-.92 2.124-1.379 3.33-1.379 1.204 0 2.41.46 3.329 1.379.161.162.309.332.442.51.133-.178.28-.349.442-.51.919-.92 2.124-1.379 3.329-1.379z"></path>
					   		</svg>
					   		<span class="goWishList">위시리스트에 담기</span>
				   		</button>
			   			<p class="IfgoWish_message"></p>
			   	</div>
			   	<!-- wishlist 버튼 -->
   	   		
   	   		</div>
   	   		
   	   		<div id="title_line" style="width:1080px; height: 0.5px; background: #cacfd5; margin: 10px 0px;"></div>
    	   <div class="TrainerClassView_part1" style="width:1080px; heigth:auto;"> 
    	   			
	    	   		
		    	   <div class="TrainerClassInfos"  id="TrainerClass_part">
		    	   		<div id="TrainerClass_intro">
			    	   		<div class="subTitle" style="margin-top: auto;">모임 소개</div>
			    	   		<div class="title">자세한 정보를 알려드릴게요</div>
			    	   		<div  class="info_row" style="margin-top:20px;">
			    	   			<i class="fas fa-user-friends"></i>
			    	   			<span class="intro_values">최소 ${trainerClassDto.meeting_min}명 ~ 최대 ${trainerClassDto.meeting_max}명</span>
			    	   		</div>
			    	   		<div  class="info_row">
			    	   			<i class="far fa-calendar-alt"></i>
			    	   			<span class="intro_values">약속일 ${trainerClassDto.meeting_date}</span>
			    	   		</div>
			    	   		<div class="info_row">
								<i class="fas fa-hourglass-half"></i>
								<span class="intro_values">모집 기간 ${trainerClassDto.start_gather_date} ~ ${trainerClassDto.end_gather_date}</span>
							</div>
							<div class="info_row">
								<i class="fas fa-map-marked-alt"></i>
								<span class="intro_values">${trainerClassDto.location1_name} ${trainerClassDto.location2_name}</span>
							</div>
							<div class="info_row">
								<i class="fas fa-dumbbell"></i>
								<span class="intro_values">${trainerClassDto.exercise_name}</span>
							</div>
		    	   		</div>
	    	   			<div class="WishList_all">
			   		
						   <div class="TrainerClassPhoto">
						   		<img alt="${trainerClassDto.photo_filename}" src="resources/storage/${trainerClassDto.photo_filename}" style="width: 500px; height:500px;">
						   </div>
					   
					   </div>
	    	   	</div>
				<div id="TrainerClass_part">
				
						<div style="width:1080px; height: 0.5px; background: white; margin:20px 0px;"></div>
						
						<div class="subTitle">준비사항</div>
		    	   		<div class="title">함께 준비하면 좋아요</div>
		    	   		<div style="margin-top:20px;">
						   <i class="fas fa-american-sign-language-interpreting"></i>
						   <span class="info_row">준비물 : 
							   <c:forEach var="materialsDto" items="${list}">
							   		<span>${materialsDto.materials_name}&nbsp;</span>
							   </c:forEach>
						   </span>
		    	   		</div>
				
				</div>
				<div id="TrainerClass_part">
				
						<div style="width:1080px; height: 0.5px; background: white; margin:20px 0px;"></div>

					   <div class="subTitle" >안내사항</div>
					   <div class="title">어떤 모임인가요</div>
					   <div id="content" style="margin-top:20px;">
   							 ${trainerClassDto.meeting_content}
						</div>
				
				</div>
						
						<div style="width:1080px; height: 0.5px; background: white; margin:10px 0px;"></div>
						
				<div id="TrainerClass_part">
				
				  		<span class="subTitle">상세 위치</span>
				  		<div class="title" style="margin-top:10px;">지도로 한눈에 확인해요</div>
					 	<div id="map" style="width:500px;height:200px; margin-top:20px; margin-bottom:80px;"></div>
						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=74162e293be31e9dc5e8e7b8c8e0be9c"></script>
						<script>
							var detailLocation = '${trainerClassDto.detail_location}';
							var locationIdx = detailLocation.indexOf('/');
							var lat = detailLocation.substring(0, locationIdx);
							var lng = detailLocation.substring(locationIdx+1);
							
							var container = document.getElementById('map');
							var options = {
								center: new kakao.maps.LatLng(lat, lng),
								level: 4
							};
							
							var map = new kakao.maps.Map(container, options);
							
							// 마커가 표시될 위치입니다 
							var markerPosition  = new kakao.maps.LatLng(lat, lng); 
						
							// 마커를 생성합니다
							var marker = new kakao.maps.Marker({
							    position: markerPosition
							});
						
							// 마커가 지도 위에 표시되도록 설정합니다
							marker.setMap(map);
							
							function relayout() {    
							    // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
							    // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
							    // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
							    map.relayout();
							}
							// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
						    var mapTypeControl = new kakao.maps.MapTypeControl();
			
						    // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
						    // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
						    map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
			
						    // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
						    var zoomControl = new kakao.maps.ZoomControl();
						    map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
						</script>
		   
				</div>		
				   
				   
				   <!-- 받은 여러개의 materials 값을 보내기 위한 hidden 작업 -->
				   <c:forEach var="materialsList" items="${list}">
					   <input type="hidden" name="materials_name" value="${materialsList.materials_name}" />
				   </c:forEach>
    	   
    	   </div>
    	   
    	   <script>
    	   
    	   $(document).ready(function(){
    		   
    	   		if ('${loginUser.user_no}' == '${trainerClassDto.user_no}') {
    	   			$('#ClassApplyBtn').hide();
    	   			$('.ClassQuestionBtn').hide();
    	   		} else {
    	   			$('#ClassUpdateBtn').hide();
    	   			$('#ClassDeleteBtn').hide();
    	   		}
    	   		
    	   });
    	   
    	   // 트레이너 클래스 리스트로 넘어가는 경로 설정
    	   function fn_TrainerClassList() {
	    		location.href = 'TrainerClassListPage.leo';
    	   }
    	   
    	   </script>
			   
    	   <script>
    	   
	    	   // 클래스 신청 클릭시 작동
	    	   $(document).ready(function() {
	    		   ClassApply();
				});
	    	   
	    	   function ClassApply() {
		    	   $(document).on('click', '#ClassApplyBtn', function() {
					   if ('${loginUser.user_no}' == '') {
						   loginAlert();	
					   } else {
						   location.href = '';  // 클래스 신청했을 때 넘어가는 경로
					   }
				   });
	    	   }
    	   
    	   </script>
    	   
<!-- *********************************************************** 위시리스트 담기 시작점 ************************************************************ -->
    	   <script>
    
    	   $(document).ready(function() {
    		   
    		   $('#loveIcon_1').attr('stroke', '#CED4DA');
			   $('#loveIcon_1').attr('fill', 'none');
				
    		   $('.OfferWishListBtn_Box').on('click', '.WishListBtn' , function(){
			    	var data_state = $('#loveIcon_1').attr('fill');
	    		   if (data_state == 'none') {
		    		   WishListInsert();
	    		   } else if (data_state == '#FA5B4A') {
		    		   WishListDelete();
	    		   }
    		   });
    		   WishListTotal();
    		});
    	   
	    	
    		function WishListInsert() {
    			//$('.WishListBtn').click(function(){
	    		   var meeting_no = '${trainerClassDto.meeting_no}';
	    		   var scrap_user_no = '${trainerClassDto.user_no}';
	    		   var user_no = '${loginUser.user_no}';
	    		   var end_gather_date = '${trainerClassDto.end_gather_date}';
    		   	 
	    		   $.ajax({
	    			  url: 'WishClassInsert.leo',
	    			  type: 'post',
	    		      data: 'scrap_referer_no=' + meeting_no + '&scrap_user_no=' + scrap_user_no + '&user_no=' +user_no + '&end_gather_date=' + end_gather_date,
    		    	  dataType: 'json',
 	    			  success: function (responseObj) {
 	    				if (responseObj.result > 0) {
	 	    				$('#loveIcon_1').attr('stroke', '#FA5B4A');
	 	    				$('#loveIcon_1').attr('fill', '#FA5B4A');
	 	 	    		    $('.goWishList').html('위시리스트 추가됨');
	 	 	    		  WishListTotal();
 	    				} else {
 	    					alert('찜리스트 삽입에 실패하였습니다.');
 	    				}
 	    			  },
 	    			  error: function(){alert('실패1');}
	    	  	   });
	    		   
    	  		//});
    			
    		}
    		
   			function WishListDelete() {
	    		//$('.WishListBtn').click(function(){
	    			 var meeting_no = '${trainerClassDto.meeting_no}';
	    			 $.ajax({
			  			  url: 'WishClassDelete.leo',
			  			  type: 'get',
			  		      data: 'meeting_no=' + meeting_no,
					      dataType: 'json',
			   			  success: function (responseObj) {
			   				  if (responseObj.result > 0) {
			   					$('#loveIcon_1').attr('stroke', '#CED4DA');
		 	    				$('#loveIcon_1').attr('fill', 'none');
		 	 	    		    $('.goWishList').html('위시리스트에 담기');
		 	 	    		  WishListTotal();
			   				  }
			   			  },
			   			  error: function(){alert('실패2');}
			  	  	   });
    			//});
   			}
   			
    		function WishListTotal() {
	    			 var meeting_no = '${trainerClassDto.meeting_no}';
		    		$.ajax({
		  			  url: 'WishClassTotal.leo',
		  			  type: 'get',
		  		      data: 'meeting_no=' + meeting_no,
				    	  dataType: 'json',
		   			  success: function (responseObj) {
			    				$('.IfgoWish_message').html(responseObj.WishClassListTotal + '명이 위시리스트에 담았습니다.')
		   			  },
		   			  error: function(){alert('실패3');}
		  	  	   });
    		}
    		
    	   </script>
							   
<!-- *********************************************************** 위시리스트 담기 마감 ************************************************************ -->
    
			   <!-- 버튼들(수정, 삭제, 등록) -->
				   <div class="Btns1" style="display:flex;">
				   
						   <div><input type="button" value="모임신청" onclick="fn_TrainerClassApply(this.form)" id="ClassApplyBtn" /></div>
						   <div><input type="button" value="모임 질문" id="modal-open-btn" class="ClassQuestionBtn" /></div>
						   <div><input type="button" value="모임 목록"  id="meeting_List" onclick="fn_TrainerClassList()"/></div>
						   <div><input type="button" value="수정" onclick="fn_TrainerClassViewUpdatePage(this.form)" id="ClassUpdateBtn" /></div>
						   <div><input type="button" value="삭제" onclick="fn_TrainerClassViewDelete(this.form)" id="ClassDeleteBtn" /></div>
				   
				   </div>
				   
				   
				   
				   
</form>

			   
			   <!-- 모달창 버튼 누를 시 열리는 내용들 -->
			   <div id="modal_background"></div>
			   <div class="modal_all">
				      <div class="modal-box">
				      		<div id="modal_close_btn">X</div>
				      		<br/>
					        <p class="modal-title">안녕하세요? 게시물 등록자입니다. 저희 모임에 대해 궁금하시다구요!? 무엇이든 질문 주세요.</p>
					        <br/>
					        <div class="modal-close-box">
					        <form>
					         	 <input type="text" name="question_title" id="question_title" placeholder="질문 제목" /><br/>
					         	 <textarea rows="10" cols="90" name="question_content" id="question_content" placeholder="질문 내용"></textarea>
					         	 <br/>
					         	 <input type="button" value="질문등록하기"  id="questionBtn"/>
					        </form>
					        	
					        </div><br/>
					        <table border="1">
					        	<thead>
					        		<tr>
					        			<td>질문자</td>
					        			<td>질문 제목</td>
					        			<td>답변 여부</td>
					        		</tr>
					        	</thead>
					        	<tbody id=question_info>
					        		
					        	</tbody>
					        </table>
				      </div>
			    </div>
			   
    <br/><br/>
    
 	<div style="width:1080px; height: 0.5px; background: #cacfd5; margin:20px 0px;"></div>
 				
 	<br/>
 	
 				
 				
	<div class="subTitle" >호스트 소개</div>
	<div class="title">우리 반갑게 만나요!</div>
    <div class="trainerHostInfo_all">
		<a href="#" onclick="">
			<c:if test="${trainerClassDto.user_separator eq 1}"><!-- 회원 구분 : 트레이너 -->
	    		<div class="trainerHostInfo">
	    			<div id="profileAndName" style="display:flex;">
		    			<div style="width: 80px; height: 80px; ">
		    				<c:if test="${empty trainerClassDto.profile_photo}">
			    				<img alt="기본사진" src="resources/images/blank-profile-picture.png" style="width:100%; height: 100%; border-radius:100px;"/>
		    				</c:if>
		    				<c:if test="${not empty trainerClassDto.profile_photo}">
			    				<img alt="${trainerClassDto.profile_photo}" src="resources/storage/profile_photo/${trainerClassDto.profile_photo}" style="width:100%; height: 100%; border-radius:100px;"/>
		    				</c:if>
		    			</div>
		    			<div class="user_names">
			    			<div class="user_separator">Let'sPorts 트레이너</div>
			    			<div class="user_nameInfo">${trainerClassDto.user_nickname} [${trainerClassDto.trainer_name}]</div>
		    			</div>
	    			</div>
	    			<div id="location">
		    			<span>${trainerClassDto.location1_name}</span>
		    			<span>${trainerClassDto.location2_name}</span>
	    			</div>
	    			<div id="materials">
	    				<c:forEach var="interestList" items="${interestList}">
	    					<span>${interestList}</span>
	    				</c:forEach>
	    			</div>
		    		<div class="trainer_message">
		    			${trainerClassDto.user_message}
		    		</div>
	    		
	    		</div>
			</c:if>
			<c:if test="${trainerClassDto.user_separator eq 2}"><!-- 회원 구분 : 유저일때 -->
	    		<div class="trainerHostInfo">
	    			<div id="profileAndName" style="display:flex;">
		    			<div style="background: lightgray; width: 80px; height: 80px; ">
		    				<img alt="${trainerClassDto.profile_photo}" src="resources/storage/profile_photo/${trainerClassDto.profile_photo}" style="width:100%; height: 100%; border-radius:100px;"/>
		    			</div>
		    			<div class="user_names">
			    			<div  class="user_separator">Let'sPorts 회원</div>
			    			<div class="user_nameInfo">${trainerClassDto.user_nickname} [${trainerClassDto.trainer_name}]</div>
		    			</div>
	    			</div>
	    			<div id="location">
		    			<span>${trainerClassDto.location1_name}</span>
		    			<span>${trainerClassDto.location2_name}</span>
	    			</div>
	    			<div id="materials">
	    				<c:forEach var="interestLists" items="${interestList}">
	    					<span>${interestLists.exercise_name}</span>
	    				</c:forEach>
	    			</div>
		    		<div class="trainer_message">
		    			${trainerClassDto.user_message}
		    		</div>
	    		
	    		</div>
			</c:if>
 		</a>
  	 </div>
    
    <br/><br/>
    
    <div style="width:1080px; height: 0.5px; background: #cacfd5; margin:20px 0px;"></div>
  	
  	<br/>
  	<!-- 관련트레이너 클래스 리스트 뿌려주는 곳 -->
  	<div class="subTitle" >관련모임</div>
  	<div class="title">이런 모임은 어때요?</div>
    <br/>
    <div class="relatedClass_all">
    
    
    </div>
    
    
    <script>
    	
    
    	// 관련리스트 뿌려졌을때 관련 리스트로 가는 법
    	function fn_showRelatedMeeting(meeting_no) {
    		location.href = 'TrainerClassViewPage.leo?meeting_no=' + meeting_no;
    	}
    	
    	// 관련트레이너 클래스리스트를 뿌려줄 ajax
    	// 페이지 로드 이벤트
		$(document).ready(function(){
			relatedClassList();
		});
    	
    	function relatedClassList() {
    		var exercise_no = ${trainerClassDto.exercise_no};
    		var meeting_no = ${trainerClassDto.meeting_no};
    		var user_no = ${trainerClassDto.user_no};
    		
    		var sendObj = {
    								 "exercise_no":exercise_no,
    								 "meeting_no":meeting_no,
    								 "user_no":user_no
    						 	      };
    		$.ajax({
    			
    			url: 'relatedClass.leo',
    			type: 'post',
    			data: JSON.stringify(sendObj),
    			contentType: 'application/json; charset=UTF-8',
    			dataType: 'json',
    			success: function(responseObj) {
    				if (responseObj.result == true) {
    					relatedClassListContent(responseObj.relatedClassList);
    				} else {
    					$('.relatedClass_all').empty();
						$('<div>').html('관련 클래스목록이 없습니다.')
						.appendTo('.relatedClass_all');
    				}
    			},
    			error: function(){alert('실패??!43$#324324?');}
    		});
    	}
    		
    	
    	function relatedClassListContent(list) {
    		$('.relatedClass_all').empty();
			$.each(list, function(idx, relatedClass) {
				
				var viewphoto = null;
				if (relatedClass.profile_photo == null) {
					viewphoto = $('<div>').html('<img alt="' + relatedClass.profile_photo + '" src="resources/images/blank-profile-picture.png" class="profile_photo">');
				} else if (relatedClass.profile_photo != null) {
					viewphoto = $('<div>').html('<img alt="' + relatedClass.profile_photo + '" src="resources/storage/profile_photo/' + relatedClass.profile_photo + '" class="profile_photo">');
				}
				
				/*
				var viewcover = null;
				if (relatedClass.photo_filename == null) {
					viewcover = $('<div>').html('<img alt="' + relatedClass.photo_filename + '" src="resources/storage/' + relatedClass.photo_filename + '" style="border-radius: 16px 16px 0 0; width:250px; height:100px;">');
				} else if (relatedClass.photo_filename != null) {
					viewcover =  $('<div>').html('<img alt="' + relatedClass.photo_filename + '" src="resources/storage/' + relatedClass.photo_filename + '" style="border-radius: 16px 16px 0 0; width:250px; height:100px;">');
				}
				*/
				
				$('<div>').addClass('relatedClass')
					.append( $('<a href="#" onclick="fn_showRelatedMeeting(' + relatedClass.meeting_no + '); return false;">')
								.append($('<img alt="' + relatedClass.photo_filename + '" src="resources/storage/' + relatedClass.photo_filename + '" style="border-radius: 16px 16px 0 0; width:250px; height:100px;">'))
								.append( $('<div>').addClass('related_meeting_content')
									.append($('<div class="related_meeting_title">' +relatedClass.meeting_title + '</div>'))
									.append($('<div class="related_exercise_name">' + relatedClass.exercise_name + '</div>'))
									.append($('<div style="margin-top:5px;">')
										.append($('<i class="fas fa-map-marker-alt"></i><span class="location">' + relatedClass.location1_name + ' ' +relatedClass.location2_name + ' · ' + relatedClass.meeting_date + '</span>'))
									)
									.append($('<div style="display:flex;">')
										.append(viewphoto)
										.append($('<div style="margin-top:10px; margin-left:5px;">' + relatedClass.user_nickname + '</div>'))
										.append($('<i class="fas fa-eye" style="color: lightgray; margin-left: 90px; margin-top:12px;"></i><div style="font-size:10px; margin-top:13px; margin-left: 5px;">' + relatedClass.meeting_hit + '</div>'))
									)
								)
					)
				.appendTo('.relatedClass_all');
			});
    	}
    
    </script>

	<script>
	
			//모달창 만들어주는 함수
			$(document).on('click', '#modal-open-btn', function() {
				$('.modal_all').show();
			});
			
			$(document).on('click', '#modal_close_btn', function(){
				$('.modal_all').hide();
			});
			
			$('#modal_close_btn').hover(function() {
				  $(this).css("color", "black").css("font-weight", "800");
			}, function(){
				  $(this).css("color", "silver").css("font-weight", "300");
			});
			
			
			$(function(){ 
		
				  $("#modal-open-btn").click(function(){
				    $("#modal_background").fadeIn();
				  });
				  
				  $("#modal_close_btn").click(function(){
				    $("#modal_background").fadeOut();
				  });
				  
			});
	
	</script>


    <script>
			
    		// 해당 게시물 수정 (작성자 권한)
			function fn_TrainerClassViewUpdatePage() {
				location.href = 'TrainerClassViewUpdatePage.leo?meeting_no=' + ${trainerClassDto.meeting_no};
			
			}
			
    		// 해당 게시물 삭제 (작성자 권한)
			function fn_TrainerClassViewDelete() {
				if (confirm('삭제하시겠습니까?')) {
					location.href = 'TrainerClassViewDelete.leo?meeting_no=' + ${trainerClassDto.meeting_no};
				}
			}
    		
    		// 해당 게시물을 작성자가 등록(마이페이지의 리스트로 넘어감)
    		function fn_TrainerClassApply(f) {
    			f.action = '';
    			f.submit();
    		}
	</script>
	
	
	<script>
		
		// 페이지 로드 이벤트
		$(document).ready(function(){
			commentList();
			commentInsert();
			commentUpdate();
			commentUpdate2();
			commentUpdateCancel();
			commentInsertCancel();
		});
		
		// 페이징 처리
		var commentPage = 1;  // 기본 페이징 1로 설정
		
		/**** 리스트 뿌려주기 ****/
		function commentList() {
			var meeting_no = '${trainerClassDto.meeting_no}'; // 클래스에 댓글이 달리니까 클래스를 넘겨서 클래스 안에있는 댓글을 가져오기 위해 보낸다
			
			$.ajax({
				url: 'comment.leo', 
				type: 'get',
				data: 'meeting_no=' + meeting_no + '&commentPage=' + commentPage,
				dataType: 'json',
				success: function (responseObj) {
					
					var paging = responseObj.paging;
					
					if (responseObj.result) {
						commentListContent(responseObj.commentList);
						$('#totalCount').empty();
						$('<span>').html(paging.totalRecord)
						.appendTo('#totalCount');
					} else {
						$('#listComment_all').empty();
						 $('<div style="margin-left:80px;">').html('댓글을 작성해주세요')
						.appendTo('#listComment_all');
					}
					
					$('#paging').empty(); // 기존 페이징 초기화
					
					// <
					if (paging.beginPage <= paging.pagePerBlock) {
						$('#paging').append('<span class="disable"><a>◀</a></span>');
					} else {
						$('#paging').append('<span class="prev-block" data-page="' + (paging.beginPage - 1) + '"><a>◀</a></span>');
					}
					
					for (let p = paging.beginPage; p <= paging.endPage; p++) {
						if (paging.commentPage == p) {
							$('#paging').append('<span class="now-page"><a>' + p + '</a></span>')
						} else {
							$('#paging').append('<span class="go-page" data-page="' + p +'"><a>' + p + '</a></span>');
						}
					}
					// >
					if (paging.endPage >= paging.totalPage) {
						$('#paging').append('<span class="disable"><a>▶</a></span>');
					} else {
						// class 의미
						// 1) next-block : 다음(▶)으로 이동하려고
						// 2) go-page : css (cursor: pointer) 적용하려고
						$('#paging').append('<span class="next-block" data-page="' + (paging.endPage + 1) + '"><a>▶</a></span>');
					}
				},
				error: function() {alert('실패44');}
			});
			
			// 링크가 걸릴 때 이동할 페이지 번호를 알아내서 다시 목록을 뿌리는 함수들
			$('#paging').on('click', '.prev-block', function(){
				commentPage = $(this).attr('data-page');
				commentList();
			});
			$('#paging').on('click', '.go-page', function(){
				commentPage = $(this).attr('data-page');
				commentList();
			});
			$('#paging').on('click', '.next-block', function(){
				commentPage = $(this).attr('data-page');
				commentList();
			});
			
		}
		
		function commentListContent(list) {
			$('#listComment_all').empty();
			
			
			$.each(list, function(idx, comment){
				var photostate = null
				if (comment.profile_photo == null) {
					photostate = $('<div class="comment_profile_photos">').html('<img alt="내프로필" src="resources/images/blank-profile-picture.png" class="comment_profile_photos">')
				} else if(comment.profile_photo != null) {
					photostate = $('<div class="comment_profile_photos">').html('<img alt="내프로필" src="resources/storage/profile_photo/'+ comment.profile_photo +'"  class="comment_profile_photos">')
				}
				
				
				$('<div>')
				.append(photostate)
				.appendTo('.myPhoto');
				
				
				$('<div>').addClass('commentContent')
				.append( $('<div>').addClass('myPhoto').append(photostate))
				.append( $('<div>').addClass('comment_wrap')
					.append( $('<div>').addClass('comment_all')
						.append( $('<div>').addClass('comment1')
								.append( $('<div>').html(comment.user_nickname))
								.append( $('<div>').html(comment.created_at))
						)
						.append( $('<div>').addClass('comment2').html(comment.comment_content) )
					)
					.append( $('<div>').addClass('CommentU_DBtn')
						.append( $('<input type="hidden" name="comment_no"/>').val(comment.comment_no) )
						.append( $('<input type="hidden" name="user_no"/>').val(comment.user_no))
						.append( $('<input type="hidden" name="comment_content"/>').val(comment.comment_content))
						.append( $('<div>').html('<input type="button" value="수정" id="btnUpdate"/>') )
						.append( $('<div>').html('<input type="button" value="삭제" id="btnDelete" onclick="commentDelete('+ comment.comment_no + ')"/>') )
					)															
				)
				.appendTo('#listComment_all');
				
			});
		}
		
		
		
		/**** 댓글 삽입 ****/
		function commentInsert() {
			$('#commentBtn').click(function(){
				
				if ( '${loginUser.user_no}' == '') {
					loginAlert();
				} else {
					
					var meeting_no = ${trainerClassDto.meeting_no};
					var board_user_no = ${trainerClassDto.user_no};
					var user_no = '${loginUser.user_no}';
					var comment_content = $('input:text[name="comment_content"]').val();
					var sendObj = {
							"comment_referer_no": meeting_no,
							"board_user_no": board_user_no,
							"comment_content": comment_content,
							"user_no":user_no
						};
					
						$.ajax({
							url: 'commentInsert.leo',
							type: 'post',
							data: JSON.stringify(sendObj),
							contentType: 'application/json; charset=utf-8',
							dataType:'json',
							success: function(responseObj) {
								if (responseObj.result == true) {
									alert('댓글이 작성되었습니다.');
									commentList();
									$('input:text[name="comment_content"]').val('');
								} else {
									alert('댓글이 작성되지 않았습니다.');
								}
							},
							error: function(){alert('실패??');}
						});
					
				}
					
			
				
			});
		}
		
		/**** 댓글 삭제 ****/	
		function commentDelete(comment_no) {
			
			
			$.ajax({
				url: 'commentDelete.leo/' + comment_no,
				type: 'get',
				contentType: 'application/json',
				dataType: 'json',
				success: function(responseObj) {
					if (responseObj.result == 1) {
						alert('삭제되었습니다.');
						commentList();
					} else {
						alert('삭제에 실패했습니다.');
					}
				},
				error: function(){alert('실패2124');}						
			});
		}
		
		/**** 댓글 수정하기 위한 input 생성 후 value 입력 ****/
		function commentUpdate() {
			$('#listComment_all').on('click', '#btnUpdate', function() {
				$(this).parents('.comment_wrap').addClass('my');
				$(this).parents('.comment_wrap').empty();
				/*
				var a = $('<div>')
				.append($('<input type="text" name="commentUpdate"/>'))
				.append($('<input type="button" value="수정완료"/>'))
				.append($('<input type="button" value="취소"/>'));
				
				$('#listComment_all').find('.my').append(a);
				*/
				var comment_no = $(this).parents('div').find('input:hidden[name="comment_no"]').val();
				var comment_content = $(this).parents('div').find('input:hidden[name="comment_content"]').val();
				
				$('<div>').addClass('commentUpdateScreen')
				.append($('<input type="text" name="commentUpdate" id="commentUpdate"/>').val(comment_content))
				.append($('<input type="hidden" name="comment_no"/>').val(comment_no))
				.append($('<input type="button" value="완료" id="commentUpdateEnd"/>'))
				.append($('<input type="button" value="취소" id="commentUpdateCancel"/>'))
				.appendTo('.my');
			});
		}
				
		/***** 댓글 수정 *****/
		function commentUpdate2() {
				$(document).on('click', '#commentUpdateEnd', function() {
					
					var commentUpdate = $(this).parent('div').find('input:text[name="commentUpdate"]').val();
					var comment_no = $(this).parent('div').find('input:hidden[name="comment_no"]').val();
					
					var sendObj = {
										"comment_content" : commentUpdate,
										"comment_no" : comment_no
									   };
					$.ajax({
						
							url: 'commentUpdate.leo',
							type: 'post',
							data: JSON.stringify(sendObj),
							dataType: 'json',
							contentType: 'application/json; charset=utf-8',
							success: function(responseObj) {
								if (responseObj.result == true) {
									alert('수정되었습니다.');
									commentList();
								} else {
									alert('수정되지 않았습니다.');
								}
							},
							error:function(){alert('실패3');}
					});
				});
			}
		
		// 수정버튼 눌렀을때 나오는 취소 버튼 처리
		function commentUpdateCancel() {
			$(document).on('click', '#commentUpdateCancel', function() {
				commentList();			
			});	
		}
		
		// 작성버튼 옆에 취소 버튼 처리
		function commentInsertCancel() {
			$('#commentInsertCancel').click(function(){
					$('input:text[name="comment_content"]').val('');
			});
		}
		
		
		
	</script>
	
	
	<br/><br/>

	<div style="width:1080px; height: 0.5px; background: #cacfd5; margin:20px 0px;"></div>
	
	<br/>
	<div class="subTitle" >댓글</div>
  	<div class="title">만날 사람과 자유롭게 대화해요</div>
  	
  	<br/>

		<form>
			<div>댓글&nbsp;<span id="totalCount"></span>개</div><br/>
			<!-- 댓글 작성란 -->
			<div class="createComment_all">
				
					<div class="myPhoto"></div>
				
				<div id="createComment"><input type="text" name="comment_content" id="comment_content" placeholder="댓글작성.."></textarea></div>
				<div class="btns">
					<input type="button" value="댓글" id="commentBtn" /> 
					<input type="button" value="취소" id="commentInsertCancel"/>
				</div>
			</div>
		</form>
	
	<!-- 댓글 리스트란 -->
	<div id="listComment_all">
	
	</div>
	<!-- 페이징 -->
	<div id="paging">
	
	</div>
	
    
<%@ include file="../template/footer.jsp" %>