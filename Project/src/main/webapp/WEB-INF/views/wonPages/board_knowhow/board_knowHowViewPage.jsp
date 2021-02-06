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
	
<style>
	table {
		border-collapse: collapse;
	}
	
	table, th, td {
		border: 1px solid black;
	}
	
	
</style>
	
	글보기 페이지 입니다.<br/><br/>
	
	<form method = "post">
		<h4>원데이 클래스</h4>
		<table>
			<tr>
			
				<th>조회수</th>
				<td align = "center">${board_knowhowDto.knowhow_hit}</td>
			</tr>
			<tr>
				<th>작성자(트레이너)</th>
				<td align = "center">${board_knowhowDto.user_separator}</td>
			</tr>
			
			<tr>
				<th>제목</th>
				<td align = "center">${board_knowhowDto.knowhow_title}</td>
			</tr>
			
			<tr>
				<th>내용</th>
				<td align = "center">${board_knowhowDto.knowhow_content}</td>
			</tr>
		</table><br/>
			
			
		<div style = "float: left;">
			<!-- <input type = "hidden" name = "knowhow_no" value = "${board_knowhowDto.knowhow_no}" -->
			<input type = "button" value = "수정" id = "btnUpdate" onclick = "location.href='board_knowHowUpdatePage.limyeng?knowhow_no=${board_knowhowDto.knowhow_no}'">
			<input type = "button" value = "삭제" id = "btnDelete" onclick = "fn_knowHowDelete(this.form)" >
			<input type = "button" value = "글목록" id = "btnList" onclick = "location.href='board_knowHowListPage.limyeng'">
		</div><br/><br/>
	
		<h4>댓글 작성</h4>
		<div class = "input-group" role = "group" style = "text-align:left; width: 100%">
			<input type = "text" id  = "comment_content" value = "${CommentsDto.comment_content}" placeholder="댓글입력" ><br/>
			<input type = "button" id = "btn" value="작성" onclick =  />
		</div>
		</form>

			
			<!-- 밑 하단 부분 페이징 처리 -->
			
	
	<%@ include file="../../template/footer.jsp" %>
	

