<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>

<jsp:include page="../../template/header.jsp">
	<jsp:param value="노하우 리스트 페이지" name="title"/>
</jsp:include>

<script>


</script>

	<div>
	<h3>오늘의 인기글</h3><br/>
	</div>	
	<div id = "nav_menu">
	<ul>
		<li>메뉴1</li>
		<li>메뉴2</li>
		<li>메뉴3</li>
	</ul>
</div>

	<div></div>
	
<div class = "search" >
	<input type = "text" name = "keyworld" id = "keyword" placeholder = "검색어를 입력하세요." />
</div>	


<button type = "submit">검색</button>
<br/><br/>

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
				<td colspan = "8">없음</td>
			</tr>
		</c:if>
		<c:if test="${not empty list}">
			<c:forEach var = "Board_knowhowDto" items = "${list}">
				<tr>
					<td>${Board_knowhowDto.knowhow_no}</td>
					<td>${Board_knowhowDto.knowhow_title}</td>
					<td>${Board_knowhowDto.knowhow_content}</td>
					<td>${Board_knowhowDto.created_at}</td>
					<td>${Board_knowhowDto.knowhow_hit}</td>
				</tr>
			</c:forEach>
		</c:if>
		</tbody>
</table>
<table>
	<tr>
		<td colspan = "8">
			<input type = "button" value = "글쓰기" onclick = "location.href='board_knowHowInsertPage.limyeng'" />
		</td>
	</tr>
</table>

		
	
<%@ include file="../../template/footer.jsp" %>


