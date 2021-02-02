<%@page import="java.net.URLDecoder"%>
<%@page import="com.koreait.project.dto.Board_knowhowDto"%>
<%@page import="com.koreait.project.yewon.dao.KnowHowDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix = "c"%>
<!DOCTYPE html>
<jsp:include page="../../template/header.jsp">
	<jsp:param value="트레이너 리스트 페이지" name="title"/>
</jsp:include>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%
		Board_knowhowDto board_knowhowDto = (Board_knowhowDto)request.getAttribute("Board_knowhowDto");
		String knowhow_title = URLDecoder.decode(board_knowhowDto.getKnowhow_title(), "utf-8");
		pageContext.setAttribute("knowhow_title",knowhow_title);
	%>
	
	<script type="text/javascript">
		function fn_boardDelete(f) {
			if (confirm('삭제할까요?')) {
				f.action = 'knowhowDelete.limyeng';
				f.submit();
			}
		}
	</script>
	
	
	
	
	
	원데이 클래스
	
	<table border = "1" width = "700px">
		<tr>
			<td align = "center" width = "" >조회수</td>
			<td align = "center">${dto.knowhow_hit}</td>
		</tr>
		<tr>
			<td align="center">작성자</td>
		</tr>
		
		<tr>
			<td align="center">본문</td>
			<td colspan="3">
				<textarea rows="30" cols="50" name = "content">${dto.knowhow_content}</textarea>
			</td>
		</tr>		
		<tr>
			<td align = center>첨부파일</td>
			<td colspan="3">
				<c:if test = ${dto.filesize > 0}>
					
				</c:if>
			</td>
		</tr>
				
		<tr>
			<td>
				<input type = "hidden" name = "num" value = "${dto.knowhow_no}" >
				<input type = "button" value = "수정" id = "btnUpdate" >
				<input type = "button" value = "삭제" id = "btnDelete" >
				<input type = "button" value = "목록" id = "btnList" >
			</td>
		</tr>			
	
	</table>
	
	<table>
		<tr>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		
	</table>
	
	<

	
	<%@ include file="../../template/footer.jsp" %>
	

</body>
</html>