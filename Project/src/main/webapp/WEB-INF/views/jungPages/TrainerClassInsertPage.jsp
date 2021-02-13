<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../template/header.jsp" />
<link type="text/css" rel="stylesheet" href="resources/style/jung/TrainerClassInsertPage.css" >
<!-- jquery, fontawesome -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://kit.fontawesome.com/07b67006ce.js"></script>
        
<!-- css파일 및 js파일 -->
<link rel="stylesheet" href="resources/wooki/css/textEditor.css">
<script src="resources/wooki/js/textEditor.js"></script>

<script type="text/javascript">
    $(document).ready(function() {
        fn_insertTempBoard($('#user_no').val());
        divToBr();
        deleteContent();
        fn_filesend();
    });
</script>


	<div class="TrainerClassInsert_all">
		<form action="TrainerClassInsert.leo"  method="post" enctype="multipart/form-data">
	
			<span style="font-size:14px; font-weight: 900; width: 300px; height: 100px; background: #2ed8b6;">새로운 모임 만들기</span>
			<div style="width: 1000px; height: 0.5px; background: black; margin:25px 0px;"></div>
			<div>
			
				<span id="classname">클래스명</span>
				<div class="classname"><input type="text" name="meeting_title" placeholder="ex) 여의도에서 사이클타요!" style="font-size: 12px;"/></div>
				
			</div>
			<div>
			
				<span id="meetingdate">모임일</span>
				<span class="meetingdate"><input type="date" name="meeting_date"  style="font-size: 12px;"/></span>
				
			</div>
			<div>
			
				<span class="TrainerClassGatherDate">모집기간</span>
				<span>
				
					<span id="TrainerClassGatherDate1"><input type="date" name="start_gather_date" style="font-size: 12px;"/></span>
					~<span id="TrainerClassGatherDate2"><input type="date" name="end_gather_date" style="font-size: 12px;"/></span>
				
				</span>
			
			</div>
			<div>
			
				<span id="gather_MinAndMax">참여인원</span>
				<span>
					<span id="gather_MinAndMax1">최소<input type="text" name="meeting_min" style="font-size: 12px;"/></span>
					<span  id="gather_MinAndMax2">최대<input type="text" name="meeting_max" style="font-size: 12px;"/></span>
				</span>
			
			</div>
			<div>
			
				<span id="exercise_name">운동종목</span>
				<span id="exercise_name1">
					<select name="exercise_no" style="font-size: 12px;">
						<option value="">운동종목</option>
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
				</span>
			
			</div>
			<div>
				<span id="meeting_location">모임장소</span>
				<select name="location1_no" id="location1" style="font-size: 12px;">
					<option value="">시도</option>
					<option value="0">서울특별시</option>
					<option value="1">인천광역시</option>
					<option value="2">경기도</option>
				</select>
				<select name="location2_no" id="location2">
					
				</select>
			</div>
			<div>
			
				<span id="detail_location">상세주소</span>
				<span  id="detail_location1"><input type="text" name="detail_location" placeholder="ex) 경기도 서울시 여의방로 호수공원 제1주차장" style="font-size: 12px;"/></span>
			
			</div>
			<input type="hidden" id="detailLocation" name="detail_location"/>			
			<div id="map" style="width:500px;height:400px;"></div>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=74162e293be31e9dc5e8e7b8c8e0be9c"></script>
			<script>
				var container = document.getElementById('map');
				var options = {
					center: new kakao.maps.LatLng(37.567301, 126.978946),
					level: 9
				};
		
				var map = new kakao.maps.Map(container, options);
				
				// 지도를 클릭한 위치에 표출할 마커입니다
				var marker = new kakao.maps.Marker({ 
				    // 지도 중심좌표에 마커를 생성합니다 
				    position: map.getCenter() 
				}); 
				// 지도에 마커를 표시합니다
				marker.setMap(map);

				// 지도에 클릭 이벤트를 등록합니다
				// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
				kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
				    
				    // 클릭한 위도, 경도 정보를 가져옵니다 
				    var latlng = mouseEvent.latLng; 
				    
				    // 마커 위치를 클릭한 위치로 옮깁니다
				    marker.setPosition(latlng);
				    
				    var lat = latlng.getLat();
				    var lng = latlng.getLng();
				    var detailLocation = lat + '/' + lng;
				    $('#detailLocation').val(detailLocation);
				    
				});
			</script>
			
			<div>
			
				<span id="detail_location">준비물</span>
				<span class="materials">
					
					<img alt="추가" src="resources/images/jung/add.png" class="plusBtn">
					
				</span>
				
			</div>
			
			<div class="coverPhoto_all">
				<span  id="coverPhoto_title">커버사진</span>
				 <span class="st_team_logo input_search_ic">
					 
					 <input type="file" id="coverPhoto" class="upload-hidden" style="font-size: 12px;">
                 </span>
            </div>
            
            <script>
            </script>
			
			<div>
			
				<div id="detail_content">상세내용</div>
				<form method="post" id="insertForm" action="">
					    <input type="hidden" name="temp_no" id="temp_no" />
					    <input type="hidden" name="user_no" id="user_no" value="${loginUser.user_no}" />
				</form>
					<div id="content"></div>
					<i class="far fa-plus-square btn" onclick="fn_addContent()"></i>
					<label>
					    <input style="display: none" type="file" id="uploadFile" name="uploadFile" accept="image/*" />
					    <i class="far fa-images btn"></i>
					</label>
					<input type="button" value="게시글 작성"  onclick="fn_submit()" />
					
					
					<div id="submit_Btns">
						<input type="hidden" name="user_no" value="${loginUser.user_no}"/>
						<button id="submit_Btn">작성</button><input type="button" value="취소" id="cancel_Btn" onclick="location.href='TrainerClassListPage.leo'"/>
					</div>
								
			</div>
	
		
</form>
	</div>

<script>
	// 섬머 노트를 위한 스크립트
	$(document).ready(function(){
		$('#summernote').summernote({
			height: 400,              
			minHeight: null,            
			maxHeight: null,          
			lang: "ko-KR",	
			placeholder: '필요한 내용을 적어주세요',
		});
	});

</script>

<script>
$(document).ready(function () {
	$('#location1').change(function() {
		var state = $('#location1 option:selected').val();
		if ( state ==  '0') {
			$('#location2').empty();
			$('#location2')
			.append( $('<option value="">').html('시군구') )
			.append( $('<option value="0">').html('강남구') )
			.append( $('<option value="1">').html('강동구') )
			.append( $('<option value="2">').html('강북구') )
			.append( $('<option value="3">').html('강서구') )
			.append( $('<option value="4">').html('관악구') )
			.append( $('<option value="5">').html('광진구') )
			.append( $('<option value="6">').html('구로구') )
			.append( $('<option value="7">').html('금천구') )
			.append( $('<option value="8">').html('노원구') )
			.append( $('<option value="9">').html('도봉구') )
			.append( $('<option value="10">').html('동대문구') )
			.append( $('<option value="11">').html('동작구') )
			.append( $('<option value="12">').html('마포구') )
			.append( $('<option value="13">').html('서대문구') )
			.append( $('<option value="14">').html('서초구') )
			.append( $('<option value="15">').html('성동구') )
			.append( $('<option value="16">').html('성북구') )
			.append( $('<option value="17">').html('송파구') )
			.append( $('<option value="18">').html('양천구') )
			.append( $('<option value="19">').html('영등포구') )
			.append( $('<option value="20">').html('용산구') )
			.append( $('<option value="21">').html('은평구') )
			.append( $('<option value="22">').html('종로구') )
			.append( $('<option value="23">').html('중구') )
			.append( $('<option value="24">').html('중랑구') )
		} else if ( state == '1' ) {
			$('#location2').empty();
			$('#location2')
			.append( $('<option value="">').html('시군구') )
			.append( $('<option value="25">').html('계양구') )
			.append( $('<option value="26">').html('남구') )
			.append( $('<option value="27">').html('남동구') )
			.append( $('<option value="28">').html('동구') )
			.append( $('<option value="29">').html('부평구') )
			.append( $('<option value="30">').html('서구') )
			.append( $('<option value="31">').html('연수구') )
			.append( $('<option value="32">').html('중구') )
			.append( $('<option value="33">').html('강화군') )
			.append( $('<option value="34">').html('옹진궁') )
		} else if ( state == '2') {
			$('#location2').empty();
			$('#location2')
			.append( $('<option value="">').html('시군구') )
			.append( $('<option value="35">').html('고양시') )
			.append( $('<option value="36">').html('과천시') )
			.append( $('<option value="37">').html('광명시') )
			.append( $('<option value="38">').html('광주시') )
			.append( $('<option value="39">').html('구리시') )
			.append( $('<option value="40">').html('군포시') )
			.append( $('<option value="41">').html('김포시') )
			.append( $('<option value="42">').html('남양주시') )
			.append( $('<option value="43">').html('동두천시') )
			.append( $('<option value="44">').html('부천시') )
			.append( $('<option value="45">').html('성남시') )
			.append( $('<option value="46">').html('수원시') )
			.append( $('<option value="47">').html('시흥시') )
			.append( $('<option value="48">').html('안산시') )
			.append( $('<option value="49">').html('안성시') )
			.append( $('<option value="50">').html('안양시') )
			.append( $('<option value="51">').html('양주시') )
			.append( $('<option value="52">').html('오산시') )
			.append( $('<option value="53">').html('용인시') )
			.append( $('<option value="54">').html('의왕시') )
			.append( $('<option value="55">').html('의정부시') )
			.append( $('<option value="56">').html('이천시') )
			.append( $('<option value="57">').html('파주시') )
			.append( $('<option value="58">').html('평택시') )
			.append( $('<option value="59">').html('포천시') )
			.append( $('<option value="60">').html('하남시') )
			.append( $('<option value="61">').html('화성시') )
			.append( $('<option value="62">').html('가평군') )
			.append( $('<option value="63">').html('양평군') )
			.append( $('<option value="64">').html('여주군') )
			.append( $('<option value="65">').html('연천군') )
		} else {
			$('#location2').empty();
			$('#location2')
			.append( $('<option value="">').html('시군구') )
		}
	});
});
</script>

<script>

	$(document).on('click', '.plusBtn', function(){
		$('<span>').addClass('material_content')
		.append($('<input type="text" name="materials_name" id="materials_box" placeholder="어떤게 필요할까요?"/>'))
		.append($('<input type="button" value="삭제" id="DeleteBtn"/>'))
		.appendTo('.materials');
	});
	
	
	$(document).on('click', '#DeleteBtn', function() {
		$(this).parent('span').find('input:text[name="materials_name"]').remove();
		$(this).parent('span').find('input:button[value="삭제"]').remove();
	});
	
	
	
		

</script>



















<%@ include file="../template/footer.jsp" %>