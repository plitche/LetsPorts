<%@page import="com.koreait.project.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!-- 헤더 인클루드 -->
<jsp:include page="../template/header.jsp">
	<jsp:param value="마이페이지" name="title"/>
</jsp:include>
<script src="resources/joon/js/myPage_commonPart.js"></script>
<link type="text/css" rel="stylesheet" href="resources/joon/css/myPage_commonPart.css" >

<!-- 모달창 -->
<script type="text/javascript">

// 모달창
function onClick() {
    document.querySelector('.modal_wrap').style.display ='block';
    document.querySelector('.black_bg').style.display ='block';
}   
function offClick() {
    document.querySelector('.modal_wrap').style.display ='none';
    document.querySelector('.black_bg').style.display ='none';
}

$(document).on("click", "#modal_btn", function(){
	onClick();
});
$(document).on("click", ".modal_close", function(){
	offClick();
});


</script>

<!-- 정보 수정 확인 -->
<script type="text/javascript">
// 페이지로드
$(document).ready(function() {
	goUsersInfoUpdate();
	fileUpload();
});

// 정보수정 전 본인 확인
function goUsersInfoUpdate() {
	$(document).on("click", "#forUpdateInfo_btn", function() {
		var pw = '<%=((UsersDto)session.getAttribute("loginUser")).getPassword()%>';
		if (pw == $('#userAuthPw').val()) {
			alert('정보를 수정하러 갑니다.');
			location.href='userUpdateView.hey'
		}
	});
}
</script>

<!-- 파일 업로드 및 삭제 -->
<script type="text/javascript">

	// 파일 delete 함수
function fileDelete() {
	let filename =  $('.userImage img').attr('src');
	let pos = filename.lastIndexOf('/');
	filename = filename.substr(pos + 1);
	let user_no = '${loginUser.user_no}';
	
	$.ajax({
		url: 'deletePhoto/' + user_no + '/' + filename + '.hey',
		type: 'put',
		dataType: 'json',
		success: function(obj) {
			$('.userImage img').attr('src', 'resources/images/blank-profile-picture.png');
			$('#deleteFileBtn').remove();
		},
		error: function() {
			alert('실패');
		}
	});
}

	// 파일 업로드
function fileUpload(){
	$('#uploadFile').change(function(){
		fileDelete();
		
		setTimeout(function() {
			let file = $('#uploadFile')[0].files[0];
			let user_no = '${loginUser.user_no}';
			
			let data = new FormData();
			data.append("file", file);
			data.append("user_no", user_no);
			
			$.ajax({
		        type: "POST",
		        enctype: 'multipart/form-data',
		        url: "uploadPhoto.hey",
		        data: data,
		        processData: false,
		        contentType: false,
		        dataType: 'json',
		        success: function (data) {
		        	let filename = data.filename;
		        	$('.userImage img').attr('src', 'resources/storage/profile_photo/' + filename);
		        	$('.userImage').append('<i class="fas fa-backspace imageBtn" id="deleteFileBtn"></i>');
		        	$('#uploadFile').val('');
		        },
		        error: function() {
		        	alert('실패');
		        }
	        });
		}, 1000);
	});
}
	
// 기본 사진으로 업뎃
$(document).on('click', '#deleteFileBtn', function(){
	if(confirm('사진을 삭제 하시겠습니까?')) {	
		fileDelete();
	}
});

</script>

<!-- 상태메세지 -->
<script type="text/javascript">
//상태메세지
// db에는 바뀌나, 새로고침 후 바로 변경되지 않음.
$(document).on('click', '#updateMsgBtn', function(){
	$('#updateMsgBtn').attr('value', '수정완료');
	$('#statusMsg').attr('readonly', false);
    $('#statusMsg').on('keyup', function() {
        $('#limitMsg').html("("+($('#statusMsg').val().length)+" / 20)");
 	
        // 남은 글자수 알려주는 칸
        if($(this).val().length > 20) {
            $(this).val($(this).val().substring(0, 20));
            $('#limitMsg').html("(20 / 20)");
        }
        
	       // 수정완료 버튼으로 바뀐 뒤 ajax
		if($('#updateMsgBtn').attr('value', '수정완료')) {
			
	       $(document).on('click', '#updateMsgBtn', function(){
	    	   let user_message = $('#statusMsg').val();
	    	   let user_no = '${loginUser.user_no}';
	    	   let obj = {"user_no" : user_no ,
	    			   	   "user_message" : user_message};
	    	   
	    	   $.ajax({
	    		  	url : "updateMsg.hey",
					type : "post",
					data : JSON.stringify(obj),
					contentType : "application/json",
					dataType : "json",
			        success: function (data) {
			        	Swal.fire('수정 완료되었습니다.');
			        	$('#updateMsgBtn').attr('value', '수정하기');
			        	$('#limitMsg').hide();
			        	$('#statusMsg').html('${loginUser.user_message}');
			        	$('#statusMsg').attr('readonly', true);
			        },
			        error: function() {
			        	Swal.fire('실패');
			        }
		        });
	       });
		}
        
    });
});

</script>

<!-- 모임 -->
<script type="text/javascript">
	$(document).on('click', '#meeting', function(){
 	   let user_no = '${loginUser.user_no}';
	   let obj = {"user_no" : user_no};
		
 	   $.ajax({
		  	url : "meetingInfo.hey",
			type : "post",
			data : JSON.stringify(obj),
			contentType : "application/json",
			dataType : "json",
	        success: function (data) {
	        	console.log('성공');
	        },
	        error: function() {
	        	Swal.fire('실패');
	        }
       });
	});
</script>

<!-- 질의응답 -->
<script type="text/javascript">
	$(document).on('click', '#meeting', function(){
		
		$.ajax({
		  	url : "meetingInfo.hey",
			type : "post",
			data : JSON.stringify(obj),
			contentType : "application/json",
			dataType : "json",
	        success: function (data) {
	        	console.log('성공');
	        	$('#barsBox').append('<table>')
	        },
	        error: function() {
	        	Swal.fire('실패');
	        }
       });
	});
</script>


	<h3>마이페이지</h3>
<div class="myPageHeader" >
	<div class="userImage">
		<c:if test="${loginUser.profile_photo ne null}">
			<img src="resources/storage/profile_photo/${loginUser.profile_photo}" />
			<i class="fas fa-backspace imageBtn" id="deleteFileBtn"></i>
		</c:if>
		<c:if test="${loginUser.profile_photo eq null}">
			<img src="resources/images/blank-profile-picture.png" />
		</c:if>
		<label id="fileBtn">
			<input type="file" id="uploadFile" name="uploadFile" style="display: none" accept="image/*"/>
			<i class="fas fa-camera imageBtn"></i>
		</label>
	</div>

	<div class="myPageInfo">
		<h3>${loginUser.user_nickname}님</h3>
			<!-- 모달 창으로 본인 인증 -->
		<a href="#" id="modal_btn">정보 수정</a><br/>
		별점<br/><br/><br/>
			<div class="black_bg"></div>
			<div class="modal_wrap">
				<p class="modal_close" ><a href="#">X</a></p>
					<div id="verification_content">
						<h3>회원 정보 수정을 위한 인증</h3>
						<input type="password" id="userAuthPw" placeholder="비밀번호 입력"><br/><br/>
					  	<input type="button" id="forUpdateInfo_btn" value="내 정보 수정하러 가기" >
					</div>
			</div>
		
		<!-- 각각 페이지 따로 만들 것! -->
		<div class="interestBtns">
			<a href="WishClassListPage.leo?user_no=${loginUser.user_no}" ><i class="fas fa-heart fa-lg"></i><br/>관심모임</a>
			<a href="WishTrainerListPage.leo?user_no=${loginUser.user_no}"><i class="fas fa-id-badge fa-lg"></i><br/>관심 트레이너</a>
			<a href="#"><i class="far fa-file-alt fa-lg"></i><br/>관심 노하우</a>		</div>
		<br/>
		<div class="status">
			상태 메세지<br/>
			<textarea rows="2" cols="50" id="statusMsg" placeholder="상태 메세지를 입력해주세요." readonly="readonly" style="resize: none">${loginUser.user_message}</textarea><br/>
			<div id="limitMsg"></div>			
			<input type="button" value="수정하기" id="updateMsgBtn" />
		</div>
	</div>
</div>
		

<!-- 탭 이동 형식 -->
<div class="myPagetabBars">
	<ul>
		<li><a id="meeting" href="#" >모임</a></li>
		<li><a href="#">게시물</a></li>
		<li><a href="#">리뷰관리</a></li>
		<li><a id="Q&A" href="#">질의응답</a></li>
	</ul>
	<div id="barsBox">
		<!-- 모임 -->
		<!-- <div id="makeMeeting">
			<div class="makeMeetings">
				제목 : 
				참여자 : (최대 / 최소)
				참여희망자 : 	명
				삭제 , 수정
			</div>
		</div>
		<div id="plannedMeeting">
			<div class="plannedMeetings"></div>
		</div>
		<div id="pastMeeting">
			<div class="pastMeetings"></div>
		</div> -->
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
							<td><a href="goQnAViewPage.plitche?board_qna_no=${list.board_qna_no}&page=${page}">${list.board_qna_title}</a></td>
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
	</div>

</div>

<%@ include file="../template/footer.jsp" %>