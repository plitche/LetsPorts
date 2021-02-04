<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>

<jsp:include page="../../template/header.jsp">
	<jsp:param value="노하우 리스트 페이지" name="title"/>
</jsp:include>

<style>
	header {
		height: 20px;
		padding: 1rem;
		color: black;
		background: white;
		font-weight: bold;
		display: flex;
		align-items: center;
	}
	
	div {
		height: 40px;
		width: 400px;
	}
	
	input {
		font-size: 20px;
		width: 325px;
		
	}
	
</style>

	<header>
		<h3>오늘의 인기글</h3>
	</header>
	
		<div>
			<span>메뉴1</span>
			<span>메뉴2</span>
			<span>메뉴3</span><br/><br/>
		</div>

	
	<div class = "search" >
		<input type = "text" name = "keyworld" id = "keyword" placeholder = "검색어를 입력하세요." />
		<button type = "submit">검색</button>
	</div><br/><br/>
	
	<h3>게시글 목록</h3>
	<table border="1">
		<thead>
			<tr>
				<td>번호 </td>
				<td>제목 </td>
				<td>내용 </td>
				<td>작성일 </td>
				<td>조회수 </td>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty list}">
				<tr>
					<td colspan = "5">없음</td>
				</tr>
			</c:if> 
			<c:if test="${not empty list}">
				<c:forEach var = "dto" items = "${list}">
					<tr>
						<td>${dto.knowhow_no}</td>
						<td><a href="board_knowHowViewPage.limyeng?knowhow_no=${dto.knowhow_no}">${dto.knowhow_title}</a></td>
						<td>${dto.knowhow_content}</td>
						<td>${dto.created_at}</td>
						<td>${dto.knowhow_hit}</td>
					</tr>
				</c:forEach>
			</c:if>
			</tbody>
	</table>
		<tr>
			<td colspan = "8">
				<input type = "button" value = "새글 작성하러 가기" onclick = "location.href='board_knowHowInsertPage.limyeng'" />
			</td>
		</tr>

	
	<%@ include file="../../template/footer.jsp" %>


