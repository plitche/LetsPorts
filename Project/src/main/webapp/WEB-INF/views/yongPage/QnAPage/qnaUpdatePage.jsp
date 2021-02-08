<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include page="../../template/header.jsp">
	<jsp:param value="질문 상세페이지" name="title"/>
</jsp:include>

<!-- 질문 수정 완료 후 view페이지로 돌아올 때 alert창을 띄어주기위한 script -->
<script>

</script>

<!-- 질문 수정 완료 버튼 클릭 시 내용이 다 기입되었는지 확인할 function -->
<script>
	function fn_updateQnA(f) {
		if($('input[name="board_qna_title"]').val() == '') {
			Swal.fire('제목이 없습니다.', '질문 제목을 작성해주세요!', 'error');
			return;
		}
		if($('input[name="board_qna_content"]').val() == '') {
			Swal.fire('내용이 없습니다.', '질문 내용을 작성해주세요!', 'error');
			return;
		}
		f.action='updateQnA.plitche';
		f.submit();
	}
</script>


${qnaTemDto.user_nickname}

<form method="post">
	제목 <input type="text" name="board_qna_title" value="${qnaTemDto.board_qna_title}"/>
	질문 내용 <textarea name="board_qna_content" id="summernote" class="summernote">${qnaTemDto.board_qna_content}</textarea>
	<input type="hidden" name="board_qna_no" value="${qnaTemDto.board_qna_no}" />
	<input type="button" value="수정완료" onclick="fn_updateQnA(this.form)" />
</form>

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

