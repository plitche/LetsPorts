<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<jsp:include page="../../template/header.jsp">
	<jsp:param value="트레이너 수정 페이지" name="title"/>
</jsp:include>

	<form>
		트레이너 viewPage 수정 페이지 입니다.<br/><br/>
		<table border = "1">
			<thead>
				<tr>
					<td>게시물번호: ${board_knowhowDto.knowhow_no}</td>
					<td>작성일자 : ${board_knowhowDto.created_at}</td>
				</tr>
			</thead>
		</table>
		
		<div>
			<p>
				<input type = "hidden" name = "knowhow_no" value = "${board_knowhowDto.knowhow_no}" >
				<input type = "hidden" name = "user_no" value = "${board_knowhowDto.user_no}" >
				제목: <input type="text" name="knowhow_title" value="${board_knowhowDto.knowhow_title}"/><br/>
				내용: <input type="text" name ="knowhow_content" value ="${board_knowhowDto.knowhow_content}"/><br/>
						
				<input type = "button" class = "btn" value = "수정완료" onclick = "fn_knowHowUpdate(this.form)" />
				<input type = "button" class = "btn" value = "취소" onclick = "location.href = 'goboard_knowhowView.limyeng'"/> 
			</p>
		</div>
	</form>
	
	
	
	<script>
		function fn_knowHowUpdate(f) {
			f.action = 'board_knowHowUpdate.limyeng';
			f.submit();
		}
	</script>
	
	
<%@ include file="../../template/footer.jsp" %>