



// 생년월일 for문
   // setBirthDate 년, 월, 일 표시
   function setBirthDate(){
       var date = new Date();
       var birth_year;
       
       $("#birth_year").append("<option value=''>년</option>");
       // 1900 ~ 2021년도
       for(var y = 1900; y <= 2021; y++){
           $("#birth_year").append("<option value='"+ y +"'>"+ y +"</option>");
       }
       // 1 ~ 12월
       var birth_month;
       $("#birth_month").append("<option value=''>월</option>");
       for(var m = 1; m <= 12; m++){
           $("#birth_month").append("<option value='"+ m +"'>"+ m +"</option>");
       }
       var birth_day;
       $("#birth_day").append("<option value=''>일</option>");
       for(var d = 1; d <= 31; d++){
       	$("#birth_day").append("<option value='"+ d +"'>"+ d +"</option>");
       }
   }

   
// 주소 (select문 서울 선택하면 서울 관련 구만 보여주기)
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
				.append( $('<option value="10>').html('동대문구') )
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
