<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link type="text/css" rel="stylesheet" href="resources/style/soo/writeQnAPage.css" >
<!DOCTYPE html>
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

<h3 style="font-weight: bold; width: 90%; text-align: center; margin: 50px auto;">질문 수정하기</h3>

<form method="post" id="writeForm">
	<div id="qnaTitle">
		<div>질문 제목</div>
		<input type="text" name="board_qna_title" placeholder="질문 제목을 입력하세요."/>
	</div>
	<pre id="writeRefer">
	■ 필독 사항
	- 자유 형식으로 질문 제목과 질문 내용을 작성해 주세요.
	- 질문 제목은 질문 내용을 간략하게 표현할 수 있게 작성해 주세요.
	- 댓글이 작성되면 질문 수정과 삭제가 불가함으로 다시한번 꼼꼼히 작성해주세요.
	- 댓글을 통해 궁금증이 해결되셨다면, 해결 완료 버튼을 통해 더이상 댓글을 받지 않을 수 있습니다. 
	</pre>
	<div id="qnaContent">
		<div>질문 상세 내용</div>
		<textarea name="board_qna_content" id="summernote" class="summernote"></textarea>
		<input type="hidden" name="user_no" value="${loginUser.user_no}" />
		<input type="button" id="doneBtn" value="작성완료" onclick="fn_writeQnA(this.form)" />
	</div>
</form>


<!-- 섬머노트 에디터용 script -->
<script>
	 $(document).ready(function() {
		$('#summernote').summernote({
			height: 400,                 // 에디터 높이
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

