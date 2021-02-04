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
	
	
	
	글보기 페이지 입니다.<br/><br/>
	
	<form method = "post">
		<h4>원데이 클래스</h4>
		<table>
			<tr>
				<td align = "center" width = "" >조회수</td>
				<td align = "center">${board_knowhowDto.knowhow_hit}</td>
			</tr>
			<tr>
				<th>작성자(트레이너)</th>
				<td>${board_knowhowDto.user_separator}</td>
			</tr>
			
			<tr>
				<th>제목</th>
				<td>${board_knowhowDto.knowhow_title}</td>
			</tr>
			
			<tr>
				<th>내용</th>
				<td>${board_knowhowDto.knowhow_content}</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<input type = "hidden" name = "knowhow_no" value = "${board_knowhowDto.knowhow_no}" >
					<input type = "button" value = "수정" id = "btnUpdate" onclick = "location.href='board_knowHowUpdatePage.limyeng'">
					<input type = "button" value = "삭제" id = "btnDelete" onclick = "fn_knowHowDelete(this.form)" >
				</td>
		</table><br/><br/>
	
			<input type = "hidden" name ="knowhow_no" value = "${board_knowhowDto.knowhow_no}">
				
				<h4>댓글 작성</h4>
				
				<input type = "text" id  = "comment_content" value = "${CommentsDto.comment_content}" placeholder="댓글입력" ><br/>
				<input type = "button" id = "btn" value="작성" onclick =  />
				
			
					
			
			


		</form>

		
		
		
			
			<!-- 밑 하단 부분 페이징 처리 -->
			
	
	

	
	<%@ include file="../../template/footer.jsp" %>
	

