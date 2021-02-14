<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<!-- jquery, fontawesome -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://kit.fontawesome.com/07b67006ce.js"></script>
<!-- css파일 및 js파일 -->
<link rel="stylesheet" href="resources/wooki/css/textEditor.css">
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/6b75fdce2b.js" crossorigin="anonymous"></script>
<link type="text/css" rel="stylesheet" href="resources/style/soo/qnaViewPage.css" >

<jsp:include page="../../template/header.jsp">
	<jsp:param value="질문 상세페이지" name="title"/>
</jsp:include>

<!-- 로그인 sweetalert -->
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
<!-- updatePage에서 수정완료를 클릭하고 수정완료 성공시 나타날 sweetalert -->
<script>
	var updateResult = '${updateResult}';
	if (updateResult) {
		Swal.fire('질문이 수정되었습니다.', '댓글이 작성되기 전에 내용을 다시한번 확인해주세요.^^', 'success');
	}
</script>
<!-- 수정하기 / 삭제하기 클릭시 처리할 script -->
<script>
	/* 수정하기 버튼 클릭 시 작동할 function */
	function fn_goUpdate() {
		Swal.fire('수정 페이지로 이동합니다.', '질문 내용을 꼼꼼히 확인해주세요!', 'info').then((result)=> {
			location.href='goUpdateQnAPage.plitche?board_qna_no='+${qnaTemDto.board_qna_no};
		});
	}
	
	
	/* 삭제하기 버튼 클릭 시 작동할 function */
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
<!-- 해결 완료 클릭 시 처리할 script -->
<script>
	function fn_solveQnA(board_qna_no) {
		swal.fire({
			title: '해결 완료하시면 더 이상 댓글을 받을 수 없습니다.', 	text: '정말 완료하시겠습니까?',
			icon: 'warning',     			showCancelButton: true,
			confirmButtonColor: 'green',		cancelButtonColor: 'red',
			confirmButtonText: '완료하기',		cancelButtonText: '취소하기'
		}).then((result)=> {
			if (result.isConfirmed) {
				$.ajax({
					url: 'solveQnA.plitche/'+board_qna_no,
					type: 'get',
					dataType: 'json',
					success: function(responseObj) {
						if(responseObj.result) {
							Swal.fire('질문이 해결되었습니다.', '더 많은 정보들을 물어보세요!^^', 'success');
							$('#writeComment').empty();
							$('#writeComment').css('border', 'none');
							$('#solveBtn').remove();
							$('#deleteBtn').remove();
							$('#updateBtn').remove();
							$('#unsolved').text('[ 해결 완료 ]').css('color', 'green');
						} else {
							alert('해결완료가 안되었습니다.');
						}
					},
					error: function(){alert('해결완료 실패');}
				});
			}
		});
		
	}
</script>
<!-- 댓글 관련 scirpt -->
<script>
	$(document).ready(function() {
		getQnACommentList();
		addQnAComment();
	});
	
	var commentPageNo = 1;
	/* 가져온 댓글 리스트를 append해주기위한 서브함수 */
	function qnaCommentListTable(list) {
		$('#commentContent').empty();
		$.each(list, function(idx, qnaComment){
			if ('${loginUser.user_no}' == qnaComment.user_no) {
				$('#commentContent')
				.append( $('<div class="comment-container" >')
						.append( $('<div class="profile">').html('<img alt="'+qnaComment.profile_photo+'" src="resources/storage/'+qnaComment.profile_photo+'">') )
					.append( $('<div class="comment-content">')
						.append( $('<p>').html(qnaComment.user_nickname) )
						.append( $('<p class="'+qnaComment.comment_no+'nthComment">').html(qnaComment.comment_content) )
						.append( $('<p>').html(qnaComment.created_at) )
					)
					.append( $('<div class="comment-btn">')
						.append( $('<div class="'+qnaComment.comment_no+'nthBtn">').addClass('editComment')
							.append( $('<a href="#" class="btnClass" onclick="fn_updateComment(' + qnaComment.comment_no + '); return false;" >').html('수정') )
							.append( $('<a href="#" class="btnClass" onclick="fn_deleteComment(' + qnaComment.comment_no + '); return false;" >').html('삭제') )
						)
					)		
				);
			} else {
				$('#commentContent')
				.append( $('<div class="comment-container">')
					.append( $('<div class="profile">').html('<img alt="'+qnaComment.profile_photo+'" src="resources/storage/'+qnaComment.profile_photo+'">') )
					.append( $('<div class="comment-content">')
						.append( $('<p>').html(qnaComment.user_nickname) )
						.append( $('<p>').html(qnaComment.comment_content) )
						.append( $('<p>').html(qnaComment.created_at2) )
					)
				);
			}
		});
	}	
	
	/* 해당 질문에 달린 댓글을 가져오기 위한 ajax*/
	function getQnACommentList() {
		var qnaNo = ${qnaTemDto.board_qna_no};
		
		$.ajax ({
			url: 'getQnACommentList.plitche/'+qnaNo+'/commentPageNo/'+commentPageNo,
			type: 'get',
			dataType :'json',
			success: function(responseObj) {
				if(responseObj.result) {
					$('#totalCommentCount').empty();
					$('#totalCommentCount').html(responseObj.commentCount + '개');
					
					qnaCommentListTable(responseObj.qnaCommentList);

					var commentPagingHtml = '<a href="#" onclick="preCommentPage(); return false;"> 이전 <a/>';
					for (let i=1; i<=Math.ceil(responseObj.commentCount/10); i++) {
						commentPagingHtml += '<a href="#" onclick="changeCommentPage(' + i + '); return false;">' + i + '</a>';
					}
					commentPagingHtml += '<a href="#" onclick="nextCommentPage(' + Math.ceil(responseObj.commentCount/10) + '); return false;"> 다음 <a/>';
					
					$('#commentPaging').empty();
					$('#commentPaging').html(commentPagingHtml);
				} else {
					if (${qnaTemDto.is_resolved} == '0') {
						$('#commentContent').empty();
						$('#commentContent')
						.append( $('<div>').html('작성된 댓글이 없습니다.') );	
					}
				}
			},
			error: function(){alert('실패');}
		});
	};
	
	/* 댓글 페이지 숫자 클릭시 처리할 function */
	function changeCommentPage(goCommentPage_no) {
		commentPageNo = goCommentPage_no;
		getQnACommentList();
	}
	
	/* 댓글 페이지 이전 클릭시 처리할 function */
	function preCommentPage() {
		if (commentPageNo != 1) {
			commentPageNo -= 1;
		}
		getQnACommentList();
	}
	
	/* 댓글 페이지 다음 클릭시 처리할 function */
	function nextCommentPage(lastCommentPage) {
		if (commentPageNo != lastCommentPage) {
			commentPageNo += 1;
		}
		getQnACommentList();
	}
	
	// 댓글 작성 완료 버튼 클릭시 작동할 ajax함수
	function addQnAComment() {
		$('#addComment').click(function(){
			if ( '${loginUser.user_no}' == '' ) {
				loginAlert();
			} else {
				var board_qna_no = ${qnaTemDto.board_qna_no};
				var user_no = '${loginUser.user_no}';
				var comment_content = $('textarea[name="comment_content"]').val();
				var board_user_no = ${qnaTemDto.user_no}
				var sendObj = {
					"comment_referer_no": board_qna_no,
					"user_no": user_no,
					"comment_content": comment_content,
					"board_user_no": board_user_no
				};
				
				$.ajax({
					url: 'addQnAComment.plitche',
					type: 'post',
					dataType: 'json',
					data: JSON.stringify(sendObj),
					contentType: 'application/json; charset=utf-8',
					success: function(responseObj) {
						if(responseObj.result) {
							Swal.fire('새로운 댓글이 작성되었습니다.', '활발한 활동 감사합니다!' ,'success');
							getQnACommentList();
							document.getElementById("comment_content").value='';
						} else {
							alert('댓글이 작성되지 않았습니다.');
						}
					},
					error: function(){alert('실패');}
				});
			}
		});
	}
	
	// 댓글 수정 버튼을 눌렸을 때 내용을 input으로 바꿔줄 function
	function fn_updateComment(qnaComment_no) {
		var commentContent = $('p[class="'+qnaComment_no+'nthComment"]').text();
		$('.'+qnaComment_no+'nthComment').empty();
		$('.'+qnaComment_no+'nthComment')
		.append( $('<input type="text" name="changeContent" value="'+commentContent+'" >') );
		// 수정하고자 하는 댓글 input에 포커스 주기
		$('input[name="changeContent"]').focus();
		
		$('.'+qnaComment_no+'nthBtn').empty();
		$('.'+qnaComment_no+'nthBtn')
		.append( $('<a href="#" class="btnClass" onclick="fn_updateCommentDone(' + qnaComment_no + '); return false;" >').html('수정완료') )
		.append( $('<a href="#" class="btnClass" onclick="getQnACommentList(); return false;" >').html('수정취소') );
	}
	
	/* 댓글 수정 완료 버튼 클릭시 작동할 ajax함수 */
	function fn_updateCommentDone(qnaComment_no) {
		var comment_content = $('input[name="changeContent"').val();
		var sendObj = {
			"comment_no": qnaComment_no,
			"comment_content": comment_content
		};
	
		$.ajax({
			url: 'updateQnAComment.plitche',
			type: 'post',
			data: JSON.stringify(sendObj),
			contentType: 'application/json; charset=utf-8',
			dataType: 'json',
			success: function(responseObj) {
				if(responseObj.result) {
					Swal.fire('댓글 수정이 완료되었습니다.', '더 많은 댓글 달아주실꺼죠!?^^', 'success');
					getQnACommentList();
				} else {
					alert('댓글이 수정되지 않았습니다.');
				}
			},
			error: function(){alert('실패');}
		});
		
	}
	
	// 댓글 삭제 버튼을 눌렸을 때 작동할 ajax함수
	function fn_deleteComment(qnaComment_no) {
		swal.fire({
			title: '작성한 댓글이 삭제됩니다.', 	text: '정말 삭제하시겠습니까?',
			icon: 'warning',     			showCancelButton: true,
			confirmButtonColor: 'red',		cancelButtonColor: 'green',
			confirmButtonText: '삭제하기',		cancelButtonText: '취소하기'
		}).then((result)=> {
			if (result.isConfirmed) {
				$.ajax({
					url: 'deleteQnAComment.plitche/'+ qnaComment_no,
					type: 'get',
					dataType: 'json',
					success: function(responseObj) {
						if (responseObj.result) {
							Swal.fire('댓글이 삭제되었습니다.', '더 많은 댓글 달아주실꺼죠!?^^', 'success');
							getQnACommentList();
						} else {
							alert('댓글이 삭제되지 않았습니다.');
						}
					},
					error: function(){alert('실패');}
				});
			}
		});
	}
</script>
<!-- 텍스트 에디터 관련 script -->
<script>
	$(document).ready(function() {
		$('div[contenteditable="true"]').attr('contenteditable', 'false');
		$('.btn').hide();
	})
</script>

<c:if test="${qnaTemDto.is_resolved eq 1}">
	<h3>해결 완료된 질문입니다!! 많은 정보를 얻어가세요.^^</h3>
</c:if>
<c:if test="${qnaTemDto.is_resolved eq 0}">
	<h3>아직 해결되지 않은 질문입니다!! 빠른 해결에 도움을 주세요.^^</h3>
</c:if>

<c:if test="${loginUser.user_no ne null}">
	<c:if test="${qnaTemDto.user_no eq loginUser.user_no}">
		<form id="writerBtn">
			<c:if test="${qnaTemDto.is_resolved eq 0}">
				<input type="button" id="solveBtn" value="해결완료" onclick="fn_solveQnA(${qnaTemDto.board_qna_no})" />
				<input type="button" id="updateBtn" value="수정하기" onclick="fn_goUpdate()" />
				<input type="button" id="deleteBtn" value="삭제하기" onclick="fn_deleteQnA()" />
			</c:if>
		</form>
	</c:if>		
</c:if>
<form method="get" id="backToQnAList">
	<input type="hidden" name="page" value="${page}"/>
	<input type="button" value="전체목록 돌아가기" onclick="fn_goQnAListPage(this.form)"/>				
</form>

<table id="qnaDetail">
	<colgroup>
		<col width="100">
		<col width="*">
		<col width="170">
	</colgroup>
	<thead>
		<tr>
			<th colspan="3">
				${qnaTemDto.board_qna_title}			
				<c:if test="${qnaTemDto.is_resolved eq 1}">
					<span style="color: green; font-size: 14px;">[ 해결 완료 ]</span>
				</c:if>
				<c:if test="${qnaTemDto.is_resolved eq 0}">
					<span id="unsolved" style="color: red;  font-size: 14px;">[ 미 해결  ]</span>
				</c:if>
			</th>
		</tr>	
	</thead>
	<tbody>
		<tr>
			<td rowspan="2">
				<img alt="${qnaTemDto.profile_photo}" src="resources/storage/${qnaTemDto.profile_photo}">
			</td>
			<td>
				<c:if test="${qnaTemDto.user_separator eq 0}">관리자</c:if>
				<c:if test="${qnaTemDto.user_separator eq 1}">트레이너</c:if>
				<c:if test="${qnaTemDto.user_separator eq 2}">일반 회원</c:if>
			</td>
		</tr>
		<tr>
			<td>${qnaTemDto.user_nickname}</td>
			<td>${qnaTemDto.created_at2}</td>
		</tr>
		<tr>
			<td colspan="3">${qnaTemDto.board_qna_content}</td>
		</tr>
	</tbody>
</table>

<div id="comment">
	<div id="commentHeader">
		<span style="color: black"><i class="far fa-comment-dots fa-2x"></i></span>
		<div style="font-weight: 800; margin: 0 10px;">댓글</div>
		<div id="totalCommentCount"></div>
		<div style="margin-left: 87%"><i class="fas fa-link fa-2x"></i></div>
	</div>
	<div id="commentContent"></div>
	<div id="commentPaging"></div>
	<c:if test="${qnaTemDto.is_resolved eq 0}">
		<form>
			<div id="writeComment">
				<p style="font-weight: bold; font-size: 1.5rem;">${loginUser.user_nickname}</p>
				<textarea rows="5" cols="100" id="comment_content" name="comment_content" placeholder="댓글을 남겨보세요"></textarea><br/>
				<input type="button" value="작성완료" id="addComment"/>
			</div>
		</form>
	</c:if>
</div>
	
<!-- 뷰페이지에서 list페이지로 돌아가기 -->
<script>
	function fn_goQnAListPage(f) {
		f.action='goQnAPage.plitche';
		f.submit();
	}

</script>

<%@ include file="../../template/footer.jsp" %>

