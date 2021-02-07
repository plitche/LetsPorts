<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../template/header.jsp" />
<link type="text/css" rel="stylesheet" href="resources/style/jung/TrainerClassInsertPage.css" >


<form action="TrainerClassInsert.leo"  method="post" enctype="multipart/form-data">

	<div class="TrainerClassInsert_all">
	
			<div>
			
				<div>클래스명</div>
				<div><input type="text" name="meeting_title"/></div>
				
			</div>
			<div>
			
				<div>모임일</div>
				<div><input type="date" name="meeting_date"/></div>
				
			</div>
			<div>
			
				<div>모집기간</div>
				<div id="TrainerClassGatherDate">
				
					<div><input type="date" name="start_gather_date"/></div>
					<div><input type="date" name="end_gather_date"/></div>
				
				</div>
			
			</div>
			<div>
			
				<div>참여인원</div>
				<div id="gather_MinAndMax">
					<div>모집최소<input type="text" name="meeting_min"/></div>
					<div>모집최대<input type="text" name="meeting_max"/></div>
				</div>
			
			</div>
			<div>
			
				<div>운동종목</div>
				<div>
					<select name="exercise_no">
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
				</div>
			
			</div>
			<div>
				<div>모임장소</div>
				<select name="location1_no" id="location1">
					<option value="">시도</option>
					<option value="0">서울특별시</option>
					<option value="1">인천광역시</option>
					<option value="2">경기도</option>
				</select>
				<select name="location2_no" id="location2">
					
				</select>
			</div>
			<div>
			
				<div>상세주소</div>
				<div><input type="text" name="detail_location"/></div>
			
			</div>
			<div>
			
				<div>준비물</div>
				<span class="materials">
				
					<img alt="추가" src="resources/images/jung/add.png" class="plusBtn">
					
				</span>
				
			</div>
			
			<div>
			
				<div>커버사진</div>
				<div><input type="file" name="coverphoto" /></div>	
			
			</div>
			
			<div>
			
				<div>상세내용</div>
				<div><textarea rows="10" cols="100" name="meeting_content"  id="summernote"></textarea></div>
			
			</div>
	
	</div>
	
	<input type="hidden" name="user_no" value="${loginUser.user_no}"/>
	<button>작성</button><input type="button" value="취소" onclick="location.href='TrainerClassListPage.leo'"/>
		
</form>

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
		$('<div>').addClass('material_content')
		.append($('<input type="text" name="materials_name" id="materials_box" placeholder="어떤게 필요할까요?"/>'))
		.append($('<input type="button" value="삭제" id="DeleteBtn"/>'))
		.appendTo('.materials');
	});
	
	
	$(document).on('click', '#DeleteBtn', function() {
		$(this).parent('div').find('input:text[name="materials_name"]').hide();
		$(this).parent('div').find('input:button[value="삭제"]').hide();
	});
	
	
	
		

</script>



















<%@ include file="../template/footer.jsp" %>