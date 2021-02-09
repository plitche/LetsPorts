<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<jsp:include page="../../template/header.jsp">
	<jsp:param value="Q&A 페이지" name="title"/>
</jsp:include>

<!-- sweetalert -->
<script>
	/* 질문 작성 성공시 나타날 sweetalert */
	var createResult = '${writeQnAResult}';
	if (createResult) {
		Swal.fire('질문이 작성되었습니다.', '댓글이 달리면 내용을 수정할 수 없으니 다시한번 확인해주세요! 질문이 해결되면 해결 버튼을 눌러주세요.^^', 'success');
	}
	
	/* 질문 삭제 성공시 나타날 sweetalert */
	var deleteResult = '${deleteResult}';
	if (deleteResult) {
		Swal.fire('질문이 삭제되었습니다.', '궁금하신 부분이 있으시면 언제든지 다시 질문을 작성해주세요!', 'success');
	}
</script>
<!-- sweetalert -->
<script>
	/* 로그인 alert을 위한 function */
	var loginAlert = function() {
						swal.fire({
							title: '로그인이 필요한 기능입니다!', 	text: '로그인 페이지로 이동하시겠습니까?',
							icon: 'warning',     			showCancelButton: true,
							confirmButtonColor: 'green',	cancelButtonColor: 'red',
							confirmButtonText: '이동하기',		cancelButtonText: '머물기'
						}).then((result)=> {
							if (result.isConfirmed) {
								Swal.fire('로그인 페이지로 이동합니다.', '로그인 후 더 많은 정보를 확인하세요!^^', 'success').then((result)=> {
										location.href='usersLoginPage.hey';	
									}
								);
							}
						});
					}
</script>
<!-- 새 질문 등록하기 script -->
<script>
	/* 페이지 로드 이벤트 */
	$(document).ready(function() {
		writeQnA();
	});
	
	/* 질문 작성하기 버튼 클릭시 동작할 함수 */
	function writeQnA() {
		$('#writeQnABtn').click(function() {
			if( '${loginUser.user_no}' == '' ) {
				loginAlert();
			} else {
				location.href='goWriteQnAPage.plitche';
			}
		});
	}
</script>
<!-- 키워드 검색 관련 처리 script -->
<script>
	function fn_search(f) {
		f.action='goQnAPage.plitche';
		f.submit();
	}

</script>


<section>
	<p>자주 하는 질문</p>
	<ul>
		<li><a href="javascript:void(0)">트레이너</a></li>
		<li><a href="javascript:void(0)">운동</a></li>
		<li><a href="javascript:void(0)">제휴</a></li>
		<li><a href="javascript:void(0)">시설</a></li>
		<li><a href="javascript:void(0)">기타</a></li>
	</ul>
</section>

<p> 전체 질문과 답변
<table>
	<thead>
		<tr>
			<td>질문 번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>질문 해결 완료</td>
		</tr>
	</thead>
	<tbody>
		<c:if test="${empty qnaList}">
			<tr>
				<td colspan="5">등록된 질문이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty qnaList}">
			<c:forEach var="list" items="${qnaList}" varStatus="k">
				<tr>
					<td>${totalRecord-((page-1) * recordPerPage + k.index)}</td>
					<td><a href="goQnAViewPage.plitche?board_qna_no=${list.board_qna_no}&page=${page}">${list.board_qna_title}</a></td>
					<td>${list.user_nickname}</td>
					<td>${list.created_at}</td>
					<c:if test="${list.is_resolved eq 0}">
						<td>미해결</td>
					</c:if>
					<c:if test="${list.is_resolved eq 1}">
						<td>해결완료</td>
					</c:if>
				</tr>
			</c:forEach>
		</c:if>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="5">${paging}</td>
		</tr>	
	</tfoot>
</table>

<form method="get">
	<fieldset>
		<legend>게시물 검색</legend>
		<p>
			<select name="searchCategory">
				<option value="">검색 조건</option>
				<option value="1">제목 + 내용</option>
				<option value="2">제목만</option>
				<option value="3">글작성자</option>
			</select>
			<input type="text" name="searchKeyword" />
			<input type="button" value="찾기" onclick="fn_search(this.form)" />
			<input type="button" value="새 질문 등록하기" id="writeQnABtn" />
		</p>
	</fieldset>
</form>




<%@ include file="../../template/footer.jsp" %>