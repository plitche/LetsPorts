<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<jsp:include page="../../template/header.jsp">
	<jsp:param value="트레이너 수정 페이지" name="title"/>
</jsp:include>

	<style>
		
				
	</style>

	<form method = "get">
		트레이너 viewPage 수정 페이지 입니다.<br/><br/>
			<div>
					<ul>
						<li>게시물번호: ${board_knowhowDto.knowhow_no}</li>
						<li>작성일자 : ${board_knowhowDto.created_at}</li>
					</ul>
			</div>
				
				제목: <input type="text" name="knowhow_title" value="${board_knowhowDto.knowhow_title}"><br/>
				내용: <input type="text" name ="knowhow_content" value ="${board_knowhowDto.knowhow_content}"><br/>
						
				<input type = "hidden"  name = "knowhow_no" value="${board_knowhowDto.knowhow_no}">
				<input type = "button" class = "btn" value = "수정완료" onclick = "fn_knowHowUpdate(this.form)">
				<input type = "button" class = "btn" value = "취소" onclick = "location.href = 'Board_KnowHowViewPage.limyeng?knowhow_no=${board_knowhowDto.knowhow_no}'">
	</form>
	
	<script>
		function fn_knowHowUpdate(f) {
			f.action = 'board_knowHowUpdate.limyeng';
			f.submit();
		}
	</script>
	
	
<%@ include file="../../template/footer.jsp" %>




