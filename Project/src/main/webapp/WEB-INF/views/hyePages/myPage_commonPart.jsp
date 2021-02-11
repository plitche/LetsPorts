<%@page import="com.koreait.project.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link type="text/css" rel="stylesheet" href="resources/joon/css/myPage_commonPart.css" >
<!DOCTYPE html>
<!-- 헤더 인클루드 -->
<jsp:include page="../template/header.jsp">
	<jsp:param value="마이페이지" name="title"/>
</jsp:include>

<script type="text/javascript">
<!-- 모달창 만들기 위함 -->
    window.onload = function() {
 
    function onClick() {
        document.querySelector('.modal_wrap').style.display ='block';
        document.querySelector('.black_bg').style.display ='block';
    }   
    function offClick() {
        document.querySelector('.modal_wrap').style.display ='none';
        document.querySelector('.black_bg').style.display ='none';
    }
 
    document.getElementById('modal_btn').addEventListener('click', onClick);
    document.querySelector('.modal_close').addEventListener('click', offClick);
 
};
</script >

<script type="text/javascript">
	// 정보수정 전 본인 확인
	$(document).ready(function() {
		goUsersInfoUpdate();
	});
	
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
<script type="text/javascript">
// 파일 업로드 버튼 설정
var $file = $("#profile_photo");

$("#fileBtn").on("click", function(){

	$file.trigger( "click" );

	var fileName;

	$("#profile_photo").change(function(){

	fileName = this.value;

	

		if(fileName==""){

			$(".fileName").empty().css("display", "inline-block").html("no files selected");

			$("#profile_photo").unbild("change");

		}else{

			 fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);		

			$(".fileName").empty().css("display", "inline-block").append(fileName);

			$("#profile_photo").unbild("change");

		};

	});

});


// 파일 업로드 ajax
	$(document).ready(function() {
		uploadFile();
	});

function uploadFile(){
    var form = $('#file_form')[0];
    var formData = new FormData(form);
    formData.append("fileObj", $("#profile_photo")[0].files[0]);

    $.ajax({
   		url: 'uploadPhoto.hey',
        processData: false,
        contentType: false,
        data: formData,
        type: 'post',
        success: function(data){
            alert("사진 수정 완료되었습니다.");
        }, error : function() {
			console.log("실패");
		}
     });
}

</script>

<div class="myPageHeader" >
		<h3>마이페이지</h3>
	<div class="userImage">
		<form id="file_form" method="post" enctype="multipart/form-data" action="">
			<div>사진</div>
			<input type="file" id="profile_photo" name="profile_photo" style="display:none;">
			<input type="button" id="fileBtn" value="Select File" style="cursor:pointer;"><span class="fileName"></span>
		</form>

	</div>
	<div class="myPageInfo">
		<br/>
		별점
		<br/>
		${loginUser.user_nickname}님
			<!-- 모달 창으로 본인 인증 -->
		 
		<p><a href="#" id="modal_btn">정보 수정</a></p><br/>
			<div class="black_bg"></div>
			<div class="modal_wrap">
				<p class="modal_close" ><a href="#">X</a></p>
					<div id="verification_content">
						<h3>회원 정보 수정을 위한 인증</h3>
						<input type="password" id="userAuthPw" placeholder="비밀번호 입력"><br/><br/>
					  	<input type="button" id="forUpdateInfo_btn" value="내 정보 수정하러 가기" >
					</div>
			</div>
	</div>
	
	<!-- 각각 페이지 따로 만들 것! -->
	<div class="interestBtns">
		<a href="WishClassListPage.leo?user_no=${loginUser.user_no}" ><i class="fas fa-heart fa-lg"></i><br/>관심모임</a>
		<a href="#"><i class="fas fa-id-badge fa-lg"></i><br/>관심 트레이너</a>
		<a href="#"><i class="far fa-file-alt fa-lg"></i><br/>관심 노하우</a>
	</div>
</div>
		
<div class="statusMsg">
	상태 메세지<br/>
	<textarea rows="3" cols="100" placeholder="상태 메세지를 입력해주세요.">${loginUser.user_message}</textarea>
	<input type="button" value="수정하기" id="updateBtn" />
</div>

<!-- 탭 이동 형식 -->
<div class="tabBars">
	<ul>
		<li><a href="myPage_meeting.hey">모임</a></li>
		<li><a href="myPage_posted.hey">게시물</a></li>
		<li><a href="myPage_review.hey">리뷰관리</a></li>
		<li><a href="myPage_qna.hey">질의응답</a></li>
	</ul>
	<div class="barsBox">
	<!-- 하,, 페이지 이동은 보기 좋지 않으므로 ajax 사용할 예정.. -->
	</div>
</div>

<%@ include file="../template/footer.jsp" %>