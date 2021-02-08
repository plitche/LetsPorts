<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<jsp:include page="../../template/header.jsp">
	<jsp:param value="질문 상세페이지" name="title"/>
</jsp:include>

<!-- 수정하기 / 삭제하기 클릭시 처리할 script -->
<script>
	/* 수정하기 버튼 클릭시 작동할 function */
	function fn_goUpdateQnA() {
		location.href='goUpdateQnAPage.plitche?board_qna_no='+${qnaTemDto.board_qna_no};
	}
	
	/* 삭제하기 버튼 클릭시 작동할 function */
	function fn_deleteQnA() {
		swal.fire({
			title: '작성한 질문이 삭제됩니다.', 	text: '정말 삭제하시겠습니까?',
			icon: 'warning',     			showCancelButton: true,
			confirmButtonColor: 'red',		cancelButtonColor: 'green',
			confirmButtonText: '삭제하기',		cancelButtonText: '취소하기'
		}).then((result)=> {
			if (result.isConfirmed) {
				location.href='deleteQnA.plitche?board_qna_no='+${qnaTemDto.board_qna_no};	
			}
		});
	}
</script>

<!-- updatePage에서 수정완료를 클릭하고 수정완료 성공시 나타날 sweetalert -->
<script>
	var updateResult = '${updateResult}';
	if (updateResult) {
		Swal.fire('질문이 수정되었습니다.', '댓글이 작성되기 전에 내용을 다시한번 확인해주세요.^^', 'success');
	}
</script>

작성자
${loginUser.user_no}
${qnaTemDto.user_nickname}

	제목  ${qnaTemDto.board_qna_title}" <br/>
	질문 내용 ${qnaTemDto.board_qna_content} <br/>
	<c:if test="${loginUser.user_no ne null}">
		<c:if test="${qnaTemDto.user_no eq loginUser.user_no}">
			<input type="button" value="수정하기" onclick="fn_goUpdateQnA()" />
			<input type="button" value="삭제하기" onclick="fn_deleteQnA()" />		
		</c:if>		
	</c:if>
	

<!-- 섬머노트 에디터용 script -->
<script>
	 $(document).ready(function() {
		$('#summernote').summernote({
			height: 300,                 // 에디터 높이
			minHeight: null,             // 최소 높이
			maxHeight: null,             // 최대 높이
			// focus: true,              // 에디터 로딩후 포커스를 맞출지 여부
			lang: "ko-KR",				 // 한글 설정
		});
	 });
</script>


<%@ include file="../../template/footer.jsp" %>

