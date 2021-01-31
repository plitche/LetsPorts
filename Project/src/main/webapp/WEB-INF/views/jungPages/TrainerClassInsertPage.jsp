<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../template/header.jsp" />
<link type="text/css" rel="stylesheet" href="resources/style/TrainerClassPages/.css" >


<form action="TrainerClassInsert.leo" >


	모집제목 <input type="text"	 name="meeting_title"/><br/>
	모임일<input type="date" name="meeting_date"/><br/>
	모집기간<input type="date" name="start_gather_date"/><input type="date" name="end_gather_date"/><br/>
	모집최소<input type="text" name="meeting_min"/><br/>
	모집최대<input type="text" name="meeting_max"/><br/>
	운동종목
	<select name="exercise_no">
		<option value="0">축구</option>
		<option value="1">족구</option>
		<option value="2">농구</option>
		<option value="3">볼링</option>
		<option value="4">크로스핏</option>
		<option value="5">스피닝</option>
		<option value="6">댄스</option>
		<option value="7">요가</option>
		<option value="8">명상</option>
	</select><br/>
	모임장소
	<select name="location1_no">
		<option value="">시도</option>
		<option value="0">서울특별시</option>
		<option value="1">인천광역시</option>
		<option value="2">경기도</option>
	</select>
	<select name="location2_no">
		<option value="">시군구</option>
		<option value="0">강남구</option>
		<option value="1">강동구</option>
		<option value="2">강북구</option>
		<option value="3">강서구</option>
		<option value="4">관악구</option>
		<option value="5">광진구</option>
		<option value="6">구로구</option>
		<option value="7">금천구</option>
		<option value="8">노원구</option>
		<option value="9">도봉구</option>
		<option value="10">동대문구</option>
		<option value="11">동작구</option>
		<option value="12">마포구</option>
		<option value="13">서대문구</option>
		<option value="14">서초구</option>
		<option value="15">성동구</option>
		<option value="16">성북구</option>
		<option value="17">송파구</option>
		<option value="18">양천구</option>
		<option value="19">영등포구</option>
		<option value="20">용산구</option>
		<option value="21">은평구</option>
		<option value="22">종로구</option>
		<option value="23">중구</option>
		<option value="24">중랑구</option>
		<option value="25">계양구</option>
		<option value="26">남구</option>
		<option value="27">남동구</option>
		<option value="28">동구</option>
		<option value="29">부평구</option>
		<option value="30">서구</option>
		<option value="31">연수구</option>
		<option value="32">중구</option>
		<option value="33">강화군</option>
		<option value="34">옹진군</option>
		<option value="35">고양시</option>
		<option value="36">과천시</option>
		<option value="37">광명시</option>
		<option value="38">광주시</option>
		<option value="39">구리시</option>
		<option value="40">군포시</option>
		<option value="41">김포시</option>
		<option value="42">남양주시</option>
		<option value="43">동두천시</option>
		<option value="44">부천시</option>
		<option value="45">성남시</option>
		<option value="46">수원시</option>
		<option value="47">시흥시</option>
		<option value="48">안산시</option>
		<option value="49">안성시</option>
		<option value="50">안양시</option>
		<option value="51">양주시</option>
		<option value="52">오산시</option>
		<option value="53">용인시</option>
		<option value="54">의왕시</option>
		<option value="55">의정부시</option>
		<option value="56">이천시</option>
		<option value="57">파주시</option>
		<option value="58">평택시</option>
		<option value="59">포천시</option>
		<option value="60">하남시</option>
		<option value="61">화성시</option>
		<option value="62">가평군</option>
		<option value="63">양평군</option>
		<option value="64">여주군</option>
		<option value="65">연천군</option>
	</select><br/>
	상세주소<input type="text" name="detail_location"/><br/>
	준비물
	<input type="text" name="materials_name"/>
	<input type="text" name="materials_name"/>
	<input type="text" name="materials_name"/><br/>
	상세내용<br/>
	<textarea rows="10" cols="100" name="meeting_content" placeholder="상세하게 적어주세요"></textarea><br/>
	<button>작성</button>
		
</form>


<%@ include file="../template/footer.jsp" %>