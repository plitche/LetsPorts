<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>

<jsp:include page="../../template/header.jsp">
	<jsp:param value="트레이너 리스트 페이지" name="title"/>
</jsp:include>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">


</script>
</head>
<body>

		오늘의 인기글
	
		
		
		<input type = "button" name = "btn1" value = "글쓰기" onclick = "boardknowHowInsertPage.limyeng"/>글쓰기
		<a href = "boardknowHowInsertPage.limyeng" >asf</a>
		
		<table border="1">
			<thead>
				<tr>
					<td>번호 </td>
					<td>제목 </td>
					<td>내용 </td>
					<td>작성일 </td>
					<td>유저번호 </td>
					<td>구분자 </td>
					<td>숨김여부 </td>
					<td>조회수 </td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var = "Board_knowhowDto" items = "${list}">
					<tr>
						<td>${Board_knowhowDto.knowhow_no}</td>
						<td>${Board_knowhowDto.knowhow_title}</td>
						<td>${Board_knowhowDto.knowhow_content}</td>
						<td>${Board_knowhowDto.created_at}</td>
						<td>${Board_knowhowDto.user_no}</td>
						<td>${Board_knowhowDto.user_separator}</td>
						<td>${Board_knowhowDto.on_hide}</td>
						<td>${Board_knowhowDto.knowhow_hit}</td>
					</tr>
				</c:forEach>
			</tbody>
			
		
			<div class = "search" >
				<input type = "text" placeholder = "검색어를 입력하세요." />
			</div>	
			
			<div class = "button" >
				<button>검색</button>
			</div> 
			
			<br/><br/>
			
			
	</table>
		
	<%@ include file="../../template/footer.jsp" %>
	

