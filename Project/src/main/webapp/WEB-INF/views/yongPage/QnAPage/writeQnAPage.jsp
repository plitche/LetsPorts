<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:include page="../../template/header.jsp">
	<jsp:param value="질문과 답변페이지" name="title"/>
</jsp:include>

<!-- 질문 작성 완료 버튼 클릭 시 내용이 다 기입되었는지 확인할 function -->
<script>
	function fn_writeQnA(f) {
		if($('input[name="board_qna_title"]').val() == '') {
			Swal.fire('제목이 없습니다.', '질문 제목을 작성해주세요!', 'error');
			return;
		}
		if($('textarea[name="board_qna_content"]').val() == '') {
			Swal.fire('내용이 없습니다.', '질문 내용을 작성해주세요!', 'error');
			return;
		}
		f.action='writeQnA.plitche';
		f.submit();
	}
</script>

<p>새 질문 작성하기</p>
<div>
	작성자
	${loginUser.profile_photo}
	${loginUser.user_nickname}
	${loginUser.user_message}
</div>

<form method="post">
	제목 <input type="text" name="board_qna_title" placeholder="질문 제목을 입력하세요."/>
	질문 내용 <textarea name="board_qna_content" id="summernote" class="summernote"></textarea>
	<input type="hidden" name="user_no" value="${loginUser.user_no}" />
	<input type="button" value="작성완료" onclick="fn_writeQnA(this.form)" />
</form>


<!-- 섬머노트 에디터용 script -->
<script>
	 $(document).ready(function() {
		$('#summernote').summernote({
			height: 300,                 // 에디터 높이
			minHeight: null,             // 최소 높이
			maxHeight: null,             // 최대 높이
			// focus: true,                 // 에디터 로딩후 포커스를 맞출지 여부
			lang: "ko-KR",					// 한글 설정
			//placeholder 설정
			placeholder: '▶구체적인 내용  ▶기타 상세 내용 등 최대한 자세히 작성해주세요.'
		});
	 });
</script>


<%@ include file="../../template/footer.jsp" %>

