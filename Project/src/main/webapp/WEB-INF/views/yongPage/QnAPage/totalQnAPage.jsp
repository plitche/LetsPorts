<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link type="text/css" rel="stylesheet" href="resources/style/soo/totalQnAPage.css" >
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
		if($('select[name="searchCategory"]').val() == '') {
			Swal.fire('검색 조건을 선택해주세요!', '', 'info');
			return;
		}
		if ($('#search').val()=='') {
			Swal.fire('검색어를 입력해주세요!', '', 'info');
			return;
		}
		f.action='goQnAPage.plitche';
		f.submit();
	}
</script>
<!-- 해결 완료 여부에 따른 필더링 script -->
<script>
	function fn_filter(what) {
		location.href='goQnAPage.plitche?filter_no='+what;
	}
</script>

<div class="qnaTitle"> Total Question & Answer </div>

<p id="newQnA">
	<input type="button" onclick="fn_filter(2)" value="전체 보기"/> /
	<input type="button" onclick="fn_filter(1)" value="해결 완료"/> /
	<input type="button" onclick="fn_filter(0)" value="미 해결"/>
	<input type="button" value="새 질문 등록하기" id="writeQnABtn" />
</p>

<table id="userQnA">
	<colgroup>
		<col width="60">
		<col width="100">
		<col width="*">
		<col width="100">
		<col width="110">
	</colgroup>
	<thead>
		<tr>
			<th>No.</th>
			<th>IsSolved</th>
			<th>Content</th>
			<th>Nickname</th>
			<th>Date</th>
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
					<c:if test="${list.is_resolved eq 0}">
						<td style="color:orangered;">미 해결</td>
					</c:if>
					<c:if test="${list.is_resolved eq 1}">
						<td style="color:green;">해결 완료</td>
					</c:if>
					<td><a href="goQnAViewPage.plitche?board_qnapage_no=${list.board_qna_no}&page=${page}">${list.board_qna_title}</a></td>
					<td>${list.user_nickname}</td>
					<td>${list.created_at2}</td>
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
	<p>
		<select name="searchCategory">
			<option value="">검색 조건</option>
			<option value="1">제목 + 내용</option>
			<option value="2">제목만</option>
			<option value="3">글작성자</option>
		</select>
		<input id="search" type="text" name="searchKeyword" placeholder="검색어를 입력해주세요."/>
		<input id="searchBtn" type="button" value="검색" onclick="fn_search(this.form)" />
	</p>
</form>

<%@ include file="../../template/footer.jsp" %>