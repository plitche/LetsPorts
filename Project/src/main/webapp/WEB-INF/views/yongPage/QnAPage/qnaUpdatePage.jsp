<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jquery, fontawesome -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://kit.fontawesome.com/07b67006ce.js"></script>
	
<!-- css파일 및 js파일 -->
<link rel="stylesheet" href="resources/wooki/css/textEditor.css">
<script src="resources/wooki/js/textEditor.js"></script>
<link type="text/css" rel="stylesheet" href="resources/style/soo/qnaUpdatePage.css" >
<!DOCTYPE html>

<jsp:include page="../../template/header.jsp">
	<jsp:param value="질문 수정 페이지" name="title"/>
</jsp:include>

<!-- 텍스트 에디터 사용을 위한 script -->
<script>
	$(document).ready(function() {
		fn_insertTempBoard($('#user_no').val());
		divToBr();
		deleteContent();
		fn_filesend();
	});
</script>

<!-- 질문 수정 완료 버튼 클릭 시 내용이 다 기입되었는지 확인할 function -->
<script>
	function fn_updateQnA(f) {
		/* 내용 수정이 안되었을 때 막는방법 생각하기 */
		/* 
		if($('input[name="board_qna_title"]').val() == '${boardQnATemDto.board_qna_title}' &&
		   $('input[name="board_qna_content"]').val() == content ) {
			Swal.fire('수정된 내용이 없습니다.', '질문 제목과 내용을 확인해주세요!', 'error');
			return;
		}
		 */
		if($('input[name="board_qna_title"]').val() == '') {
			Swal.fire('제목이 없습니다.', '질문 제목을 작성해주세요!', 'error');
			return;
		}
		if($('input[name="board_qna_content"]').val() == '') {
			Swal.fire('내용이 없습니다.', '질문 내용을 작성해주세요!', 'error');
			return;
		}
		fn_submit();
	}
	
	/* 뒤로 가기 버튼 클릭 시 작동할 function */
	/* 알럿창을 초기화시킬 방법 찾아보기 */
	function fn_goBack() {
		history.back();
	}
	
</script>

<h3 style="font-weight: bold; width: 90%; text-align: center; margin: 50px auto;">질문 수정하기</h3>

<form method="post" id="insertForm" action="updateQnA.plitche">
	<div id="qnaTitle">
		<div>질문 제목</div>
		<input type="text" name="board_qna_title" value="${boardQnATemDto.board_qna_title}"/>
	</div>
	<input type="hidden" name="temp_no" id="temp_no" />
	<input type="hidden" name="user_no" id="user_no" value="${loginUser.user_no}" />
	<input type="hidden" name="board_qna_no" value="${boardQnATemDto.board_qna_no}" />
</form>
<pre id="updateRefer">
   ■ 필독 사항
   - 자유 형식으로 질문 제목과 질문 내용을 작성해 주세요.
   - 질문 제목은 질문 내용을 간략하게 표현할 수 있게 작성해 주세요.
   - 댓글을 통해 궁금증이 해결되셨다면, 해결 완료 버튼을 통해 더이상 댓글을 받지 않을 수 있습니다.
   - 해결 완료를 하시면 수정과 삭제가 불가하오니 신중히 결정해 주세요.  
</pre>
<div id="qnaContent">
	<span>질문 상세 내용</span>
	<div style="color: darkgray;">텍스트를 입력하시려면 +버튼, 이미지를 첨부하시려면 사진버튼을 클릭해주세요~!</div>
	<div id="content" style="border: 1px solid #d8d8d8;">${boardQnATemDto.board_qna_content}</div>
	<br/>
	<i class="far fa-plus-square btn" onclick="fn_addContent()"></i>
	<label>
		<input style="display: none" type="file" id="uploadFile" name="uploadFile" accept="image/*" />
		<i class="far fa-images btn"></i>
	</label>
	<input type="button" id="doneBtn" value="수정완료" onclick="fn_updateQnA(this.form)" />
	<input type="button" id="cancelBtn" value="수정취소" onclick="fn_goBack()" />
</div>


<%@ include file="../../template/footer.jsp" %>

