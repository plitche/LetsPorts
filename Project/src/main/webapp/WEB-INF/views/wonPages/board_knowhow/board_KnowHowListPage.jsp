<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>

<jsp:include page="../../template/header.jsp">
	<jsp:param value="노하우 리스트 페이지" name="title"/>
</jsp:include>

<style>
	header {
		height: auto;
		padding: 1rem;
		color: black;
		background: white;
		font-weight: bold;
		align-items: center;
	}
	
	div > ul > li {
		height: auto;
		width: 400px;
		
	}
	
	input {
		font-size: 20px;
		width: 325px;
	}
	
	input > button {
		font-size: 20px;
		width: 100px;
	}
	
</style>


		<h3>오늘의 인기글</h3>
		
		<div class = "menu" id = "" >
			<ul>
				<li>메뉴1</li>
				<li>메뉴2</li>
				<li>메뉴3</li>
			</ul>
		</div>

	
	
		<h3>게시글 목록</h3>
	
	
	<div class = "search">
		<input type = "text" name = "keyworld" id = "keyworld" placeholder = "검색어를 입력하세요." />
		<button type = "submit">검색</button>
	</div><br/><br/>
	
	<div id = "Tag">
	<h4>카테고리</h4>
		<ul class = "category">
			<li><a href = "javascript:void(0)">족구</a></li>
			<li><a href = "">축구</a></li>
			<li><a href = "">농구</a></li>
			<li><a href = "">볼링</a></li>
			<li><a href = "">크로스핏</a></li>
			<li><a href = "">스피닝</a></li>
			<li><a href = "">댄스</a></li>
			<li><a href = "">요가</a></li>
			<li><a href = "">명상</a></li>
			<li><a href = "">다이어트정보</a></li>
			<li><a href = "">건강정보</a></li>
			<li><a href = "">식단정보</a></li>
		</ul>
		
			
		
			<c:forEach var = "tags" items = "${tag_name}">
				<input type = "button" value = "${tags.tag_name}" onclick = "Tag${tags.tag_no}"/>
				<input type = "hidden" value = "${tags.tag_name}" value = "${Tags.tag_name}"/>
			</c:forEach>
		
		</div>
	
	<div id = "container" style="display: flex">
		<c:if test="${empty list}">
			없음
		</c:if> 
		<c:if test="${not empty list}">
			<c:forEach var = "dto" items = "${list}">
				<div style="border: 1px solid black">
					<div>번호: ${dto.knowhow_no}</div>
					<div>제목: <a href="Board_KnowHowViewPage.limyeng?knowhow_no=${dto.knowhow_no}">${dto.knowhow_title}</a></div>
					<div>내용: ${dto.knowhow_content}</div>
					<div>작성일: ${dto.created_at}</div>
					<div>조회수: ${dto.knowhow_hit}</div>
				</div>
			</c:forEach>
		</c:if>
	</div>

	
	
		
	<br/><br/>
	<table>
	
		<tr>
			<td colspan = "5">
				<input type = "button" id = "btn1" value = "새글 작성하러 가기" onclick = "location.href='goBoard_KnowHowInsertPage.limyeng'" />
			</td>
		</tr>
	</table><br/><br/>

	<script>
	// 태그 기능
	function fn_Tag0(f) { // 족구
		f.action = 'Tag.limyeng'; 
		f.submit();
	}
	function fn_Tag1(f) { // 축구
		f.action = 'Tag.limyeng';
		f.submit();
	}
	function fn_Tag2(f) { // 농구
		f.action = 'Tag.limyeng';
		f.submit();
	}
	function fn_Tag3(f) { // 볼링
		f.action = 'Tag.limyeng';
		f.submit();
	}
	function fn_Tag4(f) { // 크로스핏
		f.action = 'Tag.limyeng';
		f.submit();
	}
	function fn_Tag5(f) { // 스피닝
		f.action = 'Tag.limyeng';
		f.submit();
	}
	function fn_Tag6(f) { // 댄스
		f.action = 'Tag.limyeng';
		f.submit();
	}
	function fn_Tag7(f) { // 요가
		f.action = 'Tag.limyeng';
		f.submit();
	}
	function fn_Tag8(f) { // 명상
		f.action = 'Tag.limyeng';
		f.submit();
	}
	function fn_Tag9(f) { // 다이어트 정보
		f.action = 'Tag.limyeng';
		f.submit();
	}
	function fn_Tag10(f) { // 건강정보
		f.action = 'Tag.limyeng';
		f.submit();
	}
	function fn_Tag11(f) { // 식단 정보
		f.action = 'Tag.limyeng';
		f.submit();
	}
	
	
			
	</script>

	
	<%@ include file="../../template/footer.jsp" %>


