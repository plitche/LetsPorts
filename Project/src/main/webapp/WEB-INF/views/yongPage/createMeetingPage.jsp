<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link type="text/css" rel="stylesheet" href="resources/style/soo/createMeetingPage.css" >
 
<jsp:include page="../template/header.jsp">
	<jsp:param value="트레이너 모임 개설 페이지" name="title"/>
</jsp:include>

<!-- 준비물 + 버튼 클릭시마다 준비물 입력칸이 생성되도록 -->
<script>
	$(document).on('click', '#plusMaterial', function () {
		$('<input type="text" name="materialList" />')
		.appendTo('#materialList');
	});
	$(document).on('click', '#minusMaterial', function () {
		$('#materialList').empty();
	});

</script>

<form action="createMeeting.plitche" method="post" enctype="multipart/form-data">
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
			<div id="imageUpload">
				대표 이미지 첨부 <input type="file" name="mainPhoto" />
			</div>
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
				<select id="location1" name="location1_no">
					<option id="none" value="">시/도 선택</option>
					<option id="seoul" value="0">서울특별시</option>
					<option id="incheon" value="1">인천광역시</option>
					<option id="gyeongi" value="2">경기도</option>
				</select>
				<select id="location2" name="location2_no">
					
				</select> 
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
			<div id="materials">
				<p>준비물</p>
				<div id="materialList">
				</div>
				<div>
					<input type="button" id="plusMaterial" value="+"/>
					<input type="button" id="minusMaterial" value="준비물 삭제"/>
				</div>
			</div>		
		</div>
	</div>
	<div id="detailContent" style="margin-top: 30px;">
		<p style="font-size: 1.5rem; font-weight: 800;">상세 내용</p>
		<textarea name="meeting_content" id="summernote" class="summernote"></textarea>
		<input type="hidden" name="user_no" value="${loginUser.user_no}"/>
		<button>작성 완료</button>
	</div>
</form>

<!-- 섬머노트 에디터용 script -->
<script>
	 $(document).ready(function() {
		$('#summernote').summernote({
			height: 300,                 // 에디터 높이
			minHeight: null,             // 최소 높이
			maxHeight: null,             // 최대 높이
			// focus: true,                 // 에디터 로딩후 포커스를 맞출지 여부
			lang: "ko-KR",					// 한글 설정
			//placeholder 설정
			placeholder: '▶구체적인 시간  ▶진행 방법  ▶기타 상세 내용 등 최대한 자세히 작성하세요.'
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

<%@ include file="../template/footer.jsp" %>