<%@page import="java.net.URLDecoder"%>
<%@page import="com.koreait.project.dto.Board_knowhowDto"%>
<%@page import="com.koreait.project.yewon.dao.KnowHowDao"%>
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

	$(function(){
		fn_send1();
		fn_send2();
	});
	
	function fn_send1() {
		$('#btn1').click(function(){
			$.ajax({
				url: 'getText',
				type: 'get',
				data: 'send' + $('send').val(),
				dataType: 'text',
				success: function(responseText) {
					$('#content1').text(responseText.trim());
				},
				error: function() {
					alert('실패');
				}
			});
		});		
	}
	
	

</script>
	
	<script>
		
		// 페이지 로드 이벤트
		$(document).ready(function(){
			commentList();
			commentInsert();
			commentUpdate();
			commentUpdate2();
			commentUpdateCancel();
			commentInsertCancel();
		});
		
		/**** 리스트 뿌려주기 ****/
		function commentList() {
			var meeting_no = '${trainerClassDto.meeting_no}';
			$.ajax({
				url: 'comment.limyeng',
				type: 'get',
				data: 'meeting_no=' + meeting_no,
				dataType: 'json',
				success: function (responseObj) {
					if (responseObj.result) {
						commentListContent(responseObj.commentList);
						$('#totalCount').empty();
						$('<span>').html(responseObj.totalCount)
						.appendTo('#totalCount');
					} else {
						$('#listComment_all').empty();
						 $('<div>').html('댓글을 작성해주세요')
						.appendTo('#listComment_all');
					}
				},
				error: function() {alert('실패');}
			});
		}
		
		function commentListContent(list) {
			$('#listComment_all').empty();
			$.each(list, function(idx, comment){
					
				$('<div>').addClass('commentContent')
				.append( $('<div>').addClass('myPhoto').append( $('<img alt="내프로필" src="">') ))
				.append( $('<div>').addClass('comment_wrap')
					.append( $('<div>').addClass('comment_all')
						.append( $('<div>').addClass('comment1')
								.append( $('<div>').html(comment.user_no))
								.append( $('<div>').html(comment.created_at))
						)
						.append( $('<div>').addClass('comment2').html(comment.comment_content) )
					)
					.append( $('<div>').addClass('CommentU_DBtn')
						.append( $('<input type="hidden" name="comment_no"/>').val(comment.comment_no) )
						.append( $('<input type="hidden" name="user_no"/>').val(comment.user_no))
						.append( $('<input type="hidden" name="comment_content"/>').val(comment.comment_content))
						.append( $('<div>').html('<input type="button" value="수정" id="btnUpdate"/>') )
						.append( $('<div>').html('<input type="button" value="삭제" id="btnDelete" onclick="commentDelete('+ comment.comment_no + ')"/>') )
					)															
				)
				.appendTo('#listComment_all');
				
			});
		}
		
		/**** 댓글 삽입 ****/
		function commentInsert() {
			$('#commentBtn').click(function(){
				var meeting_no = ${trainerClassDto.meeting_no};
				var user_no = 10;
				var comment_content = $('input:text[name="comment_content"]').val();
				var sendObj = {
						"comment_referer_no": meeting_no,
						"user_no": user_no,
						"comment_content": comment_content
					};
				
				$.ajax({
					url: 'commentInsert.leo',
					type: 'post',
					dataType:'json',
					data: JSON.stringify(sendObj),
					contentType: 'application/json; charset=utf-8',
					success: function(responseObj) {
						if (responseObj.result == true) {
							alert('댓글이 작성되었습니다.');
							commentList();
							$('input:text[name="comment_content"]').val('');
						} else {
							alert('댓글이 작성되지 않았습니다.');
						}
					},
					error: function(){alert('실패');}
				});
			});
		}
		
		/**** 댓글 삭제 ****/	
		function commentDelete(comment_no) {
					$.ajax({
						url: 'commentDelete.limyeng/' + comment_no,
						type: 'get',
						dataType: 'json',
						success: function(responseObj) {
							if (responseObj.result == 1) {
								alert('삭제되었습니다.');
								commentList();
							} else {
								alert('삭제에 실패했습니다.');
							}
						},
						error: function(){alert('실패');}						
					});
		}
		
		/**** 댓글 수정하기 위한 input 생성 후 value 입력 ****/
		function commentUpdate() {
			$('#listComment_all').on('click', '#btnUpdate', function() {
				$(this).parents('.comment_wrap').addClass('my');
				$(this).parents('.comment_wrap').empty();
				/*
				var a = $('<div>')
				.append($('<input type="text" name="commentUpdate"/>'))
				.append($('<input type="button" value="수정완료"/>'))
				.append($('<input type="button" value="취소"/>'));
				
				$('#listComment_all').find('.my').append(a);
				*/
				var comment_no = $(this).parents('div').find('input:hidden[name="comment_no"]').val();
				var comment_content = $(this).parents('div').find('input:hidden[name="comment_content"]').val();
				
				$('<div>').addClass('commentUpdateScreen')
				.append($('<input type="text" name="commentUpdate" id="commentUpdate"/>').val(comment_content))
				.append($('<input type="hidden" name="comment_no"/>').val(comment_no))
				.append($('<input type="button" value="수정완료" id="commentUpdateEnd"/>'))
				.append($('<input type="button" value="취소" id="commentUpdateCancel"/>'))
				.appendTo('.my');
			});
		}
				
		/***** 댓글 수정 *****/
		function commentUpdate2() {
				$(document).on('click', '#commentUpdateEnd', function() {
					
					var commentUpdate = $(this).parent('div').find('input:text[name="commentUpdate"]').val();
					var comment_no = $(this).parent('div').find('input:hidden[name="comment_no"]').val();
					
					var sendObj = {
										"comment_content" : commentUpdate,
										"comment_no" : comment_no
									   };
					$.ajax({
						
							url: 'commentUpdate.limyeng',
							type: 'post',
							data: JSON.stringify(sendObj),
							dataType: 'json',
							contentType: 'application/json; charset=utf-8',
							success: function(responseObj) {
								if (responseObj.result == true) {
									alert('수정되었습니다.');
									commentList();
								} else {
									alert('수정되지 않았습니다.');
								}
							},
							error:function(){alert('실패3');}
					});
				});
			}
		
		// 수정버튼 눌렀을때 나오는 취소 버튼 처리
		function commentUpdateCancel() {
			$(document).on('click', '#commentUpdateCancel', function() {
				commentList();			
			});	
		}
		
		// 작성버튼 옆에 취소 버튼 처리
		function commentInsertCancel() {
			$('#commentInsertCancel').click(function(){
					$('input:text[name="comment_content"]').val('');
			});
		}
		
	</script>
	
	글보기 페이지 입니다.<br/><br/>
	
	<form method = "post">
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
	</form>
			
				<!-- <input type = "hidden" name = "knowhow_no" value = "${board_knowhowDto.knowhow_no}" -->
				<input type = "button" value = "수정" id = "btnUpdate" onclick = "location.href='board_knowHowUpdatePage.limyeng?knowhow_no=${board_knowhowDto.knowhow_no}'">
				<input type = "button" value = "삭제" id = "btnDelete" onclick = "fn_knowHowDelete(this.form)" >
				<input type = "button" value = "글목록" id = "btnList" onclick = "location.href='board_knowHowListPage.limyeng'"><br/><br/>
	
		
		
		<form>
			<div>댓글&nbsp;<span id="totalCount"></span>개</div><br/>
			<!-- 댓글 작성란 -->
			<div class="createComment_all">
				<div class="myPhoto"><img alt="내 프로필" src="" /></div>
				<div id="createComment"><input type="text" name="comment_content" id="comment_content" placeholder="댓글작성.."></textarea></div>
				<div class="btns">
					<input type="button" value="취소" id="commentInsertCancel"/>
					<input type="button" value="댓글달기" id="commentBtn" /> 
				</div>
			</div>
		</form>
	
	<!-- 댓글 리스트란 -->
	<div id="listComment_all">
	
	</div>

			
			<!-- 밑 하단 부분 페이징 처리 -->
			
	
	<%@ include file="../../template/footer.jsp" %>
	

