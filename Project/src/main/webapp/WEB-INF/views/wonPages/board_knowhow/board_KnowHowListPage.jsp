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
	
	
	<div class = "search" >
		<input type = "text" name = "keyworld" id = "keyword" placeholder = "검색어를 입력하세요." />
		<button type = "submit">검색</button>
	</div><br/><br/>
	
	<div id = "Tag">
	<h4>카테고리</h4>
		<ul>
			<li><a href = ""></a>족구</li>
			<li>축구</li>
			<li>농구</li>
			<li>볼링</li>
			<li>크로스핏</li>
			<li>스피닝</li>
			<li>댄스</li>
			<li>요가</li>
			<li>명상</li>
			<li>다이어트 정보</li>
			<li>건강 정보</li>
			<li>식단 정보</li>
		</ul>
		
			<c:forEach var = "Tags" items = "">
				<input type = "button" value = ""/>
				<input type = "hidden" value = "" value = ""/>
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

	
	<%@ include file="../../template/footer.jsp" %>


