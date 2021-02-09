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
	
<script>
	

	// 삭제하기 버튼 클릭시 작동

	function fn_knowHowDelete() {
		swal.fire({
			title: '작성한 질문이 삭제됩니다.', 	text: '정말 삭제하시겠습니까?',
			icon: 'warning',			  	showCancelButton: true,
			confirmButtonColor: 'red',		cancelButtonColor: 'green',
			confirmButtonText: '삭제하기',	cancelButtonText: '취소하기'
		}).then(function(result) {
			if (result.isConfirmed) {
				location.href='board_knowHowDelete.limyeng?knowhow_no=${board_knowhowDto.knowhow_no}';
			}
		});
	}

</script>
		
	
	글보기 페이지 입니다.<br/><br/>

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
		
	<input type = "button" value = "수정" id = "btnUpdate" onclick = "location.href='board_knowHowUpdatePage.limyeng?knowhow_no=${board_knowhowDto.knowhow_no}'">
	<input type = "button" value = "삭제" id = "btnDelete" onclick = "fn_knowHowDelete()" />
	<input type = "button" value = "글목록" id = "btnList" onclick = "location.href='GoBoard_KnowHowList.limyeng'"><br/><br/>
	

			
	<!-- 밑 하단 부분 페이징 처리 -->
	<%@ include file="../../template/footer.jsp" %>
	

