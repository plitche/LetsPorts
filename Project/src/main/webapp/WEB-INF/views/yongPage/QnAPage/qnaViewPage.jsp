<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<jsp:include page="../../template/header.jsp">
	<jsp:param value="질문 상세페이지" name="title"/>
</jsp:include>

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
					.append( $('<div class="profile">').html('<img alt="프로필" src="">') )
					.append( $('<div class="comment-content">')
						.append( $('<p>').html('닉네임: ' + qnaComment.user_nickname) )
						.append( $('<p class="'+qnaComment.comment_no+'nthComment">').html(qnaComment.comment_content) )
						.append( $('<p>').html('작성일: ' + qnaComment.created_at) )
					)
					.append( $('<div class="comment-btn">').html('<input type="button" value="[버튼]" />')
						.append( $('<div class="'+qnaComment.comment_no+'nthBtn">')
							.append( $('<a href="#" class="btnClass" onclick="fn_updateComment(' + qnaComment.comment_no + '); return false;" >').html('수정') )
							.append( $('<a href="#" class="btnClass" onclick="fn_deleteComment(' + qnaComment.comment_no + '); return false;" >').html('삭제') )
						)
					)		
				);
			} else {
				$('#commentContent')
				.append( $('<div class="comment-container">')
					.append( $('<div class="profile">').html('<img alt="프로필" src="">') )
					.append( $('<div class="comment-content">')
						.append( $('<p>').html('닉네임: ' + qnaComment.user_nickname) )
						.append( $('<p>').html('내용: ' + qnaComment.comment_content) )
						.append( $('<p>').html('작성일: ' + qnaComment.created_at) )
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
					$('#totalCommentCount')
					.append( $('<p>').html('총 : ' + responseObj.commentCount + '개') )
					
					qnaCommentListTable(responseObj.qnaCommentList);

					var commentPagingHtml = '<a href="#" onclick="preCommentPage(); return false;"> 이전 <a/>';
					for (let i=1; i<=Math.ceil(responseObj.commentCount/10); i++) {
						commentPagingHtml += '<a href="#" onclick="changeCommentPage(' + i + '); return false;">' + i + '</a>';
					}
					commentPagingHtml += '<a href="#" onclick="nextCommentPage(' + Math.ceil(responseObj.commentCount/10) + '); return false;"> 다음 <a/>';
					
					$('#commentPaging').empty();
					$('#commentPaging').html(commentPagingHtml);
				} else {
					$('#commentContent').empty();
					$('#commentContent')
					.append( $('<div>').html('작성된 comment가 없습니다. 첫번째 뎃글을 작성해주세요.') );
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
	
	// 뎃글 작성 완료 버튼 클릭시 작동할 ajax함수
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
							alert('새로운 뎃글이 작성되었습니다.');
							getQnACommentList();
							document.getElementById("comment_content").value='';
						} else {
							alert('뎃글이 작성되지 않았습니다.');
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
		
		$('.'+qnaComment_no+'nthBtn').empty();
		$('.'+qnaComment_no+'nthBtn')
		.append( $('<a href="#" class="btnClass" onclick="fn_updateCommentDone(' + qnaComment_no + '); return false;" >').html('수정완료') );
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


작성자 : ${qnaTemDto.user_nickname} <br/>
제목 : ${qnaTemDto.board_qna_title} <br/>
질문 내용 : ${qnaTemDto.board_qna_content} <br/>

<c:if test="${loginUser.user_no ne null}">
	<c:if test="${qnaTemDto.user_no eq loginUser.user_no}">
		<input type="button" value="수정하기" onclick="fn_goUpdateQnA()" />
		<input type="button" value="해결완료" onclick="fn_solveQna()" />
		<input type="button" value="삭제하기" onclick="fn_deleteQnA()" />		
	</c:if>		
</c:if>
	
<div id="comment"> 
	<p style="font-weight: 800; font-size: 1.5rem; margin-top: 20px;">댓글</p>
	<div id="totalCommentCount"></div>
	<div id="commentContent"></div>
	<div id="commentPaging"></div>
	<form>
		<div id="writeComment">
			<p>${loginUser.user_nickname}</p>
			<textarea rows="5" cols="100" id="comment_content" name="comment_content" placeholder="내용을 입력하시오"></textarea><br/>
		</div>
		<input type="button" value="작성완료" id="addComment"/>
	</form>
</div>
	

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

