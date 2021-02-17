<%@page import="com.koreait.project.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<!-- 헤더 인클루드 -->
<jsp:include page="../template/header.jsp">
	<jsp:param value="마이페이지" name="title"/>
</jsp:include>

<!-- css파일 적용되지 않아 style에 지정함 -->
<style>
/* 마이페이지 전체 */
a {
	text-decoration: none;
	color: silver;
}
.interestBtns {
	display: flex;
}
.interestBtns > a {
	margin-right: 100px;
	text-align: center;
	color: #fa8072;
}
.myPageHeader {
	display: flex;
	padding: 10px;
	margin-bottom: 10px;
}
#myPageTitle {
	font-size: 30px;
	font-weight: bold;
	text-align: center;
}
.myPageInfo {
	margin-left: 50px;
}
#myPageWrapper {
	width: 700px;
	height: 900px;
	transform: translate(25%, 7%);
}
#policyNoticeBtn {
	width: 100%;
	height: 70px;
	line-height: 70px;
	margin-bottom: 20px;
	color: #fff;
	align-content: center;
	font-size: 20px;
}
#policyNotice {
	text-align: ceneter;
	background: #20c997;
	padding-left: 40%;
	margin: auto;
}
/* 모달 css */
.modal_wrap{
	display: none;
	width: 500px;
	height: 500px;
	position: fixed;
	top:50%;
	left: 50%;
	margin: -250px 0 0 -250px;
	padding: 50px;
	border: 2px solid #fa8072;
	background:#fff;
	z-index: 2;
	box-shadow : 3px 3px 7px #999;
}
.modal_close{
	width: 26px;
	height: 26px;
	position: absolute;
	top: 10px;
	right: 10px;
}
.modal_close> a{
   	
	font-weight: bold;
	color: black;
	display: block;
	width: 100%;
	height: 100%;
	z-index: 3;
}
/* 파일 업로드 */
.userImage {
	overflow: hidden;
	width: 200px;
	height: 300px;
	position: relative;
	border-radius: 10px;
}
.userImage img {
	height: 300px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	
}
i {
	color: #fa8072;
}
i:hover {
	color: #ff6600;
}
#fileBtn {
	position: absolute;
	z-index: 2;
	left: 100%;
	top: 100%;
	transform: translate(-605%, -115%);
	display: block;
	cursor: pointer;
	border: none;
	border-radius: 8px;
	box-shadow : 3px 3px 7px #303030;
	cursor: pointer;
}
#fileBtn:active {
	box-shadow : 2px 2px 5px #303030;
}
#deleteFileBtn {
	position: absolute;
	z-index: 2;
	left: 100%;
	top: 100%;
	transform: translate(-115%, -115%);
	display: block;
	box-shadow : 3px 3px 7px #303030;
	cursor: pointer;
}
#deleteFileBtn:active {
	box-shadow : 2px 2px 5px #303030;
}
.imageBtn {
	display: inline-block;
	padding: 5px;
	font-size: 20px;
	border: 1px solid black;
	border-radius: 5px;
}
/* 상태메세지 */
#statusName {
	font-size: 16px;
}
#statusMsg {
	border: 1px solid silver;
}
#statusMsg:focus {
	outline:1px solid #fa8072;
}
#updateMsgBtn {
	width: 100px;
	height: 40px;
	font-size: 16px;
	font-weight: bold;
	border: none;
	background: #fa8072;
	color: #ffffff;
}
#updateMsgBtn:hover {
	background: #ff6600;
}
/* 마이페이지 탭바 */
.flex {
	display: flex;
}
.barTabs {
	width: 232px;
	height: 50px;
	text-align: center;
	line-height: 50px;
	margin: 2px;
	background: silver;
	color: #fff;
	cursor: pointer;
}
.barTabs:hover {
	background: #fa8072;
}
#contentBox {
	text-align: center;
}
/* 참여예정모임 */
.meeting {
	width: 150px;
	heigh: 200px;
	margin: 5px;
	padding: 0;
	border: 1px solid silver;
	border-radius: 10px;
	cursor: poiter;
}
.cover {
	overflow: hidden;
	width: 150px;
	height: 100px;
	position: relative;
	border-radius: 10px;
}
.cover img {
	height: 100px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	
}
.profiePhoto {
	overflow: hidden;
	width: 30px;
	height: 30px;
	position: relative;
	border-radius: 10px;
}
.profiePhoto img {
	height: 30px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	
}
/* 질의응답 */
table {
	width: 100%;
	height: 300px;
	border-bottom: 1px solid silver;
	margin-top: 10px;
}
th {
	text-align: center;
}
.tdHeight {
	max-height: 20px;
}
#title {
	text-align: center;
}
.content.flex.wrap {
	text-align: center;
}

</style>

<!-- 영욱님 수정 내용 -->
<script src="resources/joon/js/wookiClient.js"></script>

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
		        	$('.userImage').append('<i class="fas fa-eraser imageBtn" id="deleteFileBtn"></i>');
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
	if($('#updateMsgBtn').val()=='수정하기') {
		
		this.value = '수정완료';
		
		/* $('#updateMsgBtn').attr('value', '수정완료'); */
		$('#statusMsg').attr('readonly', false);
		$('#statusMsg').on('keyup', function() {
	        $('#limitMsg').html("("+($('#statusMsg').val().length)+" / 20)");
	 	
	        // 남은 글자수 알려주는 칸
	        if($(this).val().length > 20) {
	            $(this).val($(this).val().substring(0, 20));
	            $('#limitMsg').html("(20 / 20)");
	        }
		});
		

	}else if($('#updateMsgBtn').val()=='수정완료') {
		
    	   let user_message = $('#statusMsg').val();
    	   let user_no = '${loginUser.user_no}';
    	   let obj = {"user_no" : user_no ,
    			   	   "user_message" : user_message};
    	   console.log('수정완료일때' + $('#updateMsgBtn').val());
    	   
    	   $.ajax({
    		  	url : "updateMsg.hey",
				type : "post",
				data : JSON.stringify(obj),
				contentType : "application/json",
				dataType : "json",
		        success: function (data) {
		        	console.log('수정완료 성공');
		        	Swal.fire('수정 완료되었습니다.');
		        	$('#updateMsgBtn').attr('value', '수정하기');
		        	$('#limitMsg').hide();
		        	$('#statusMsg').html('${loginUser.user_message}');
		        	$('#statusMsg').attr('readonly', true);
		        },
		        error: function() {
		        	console.log('수정완료 실패');
		        	Swal.fire('실패');
		        }
	        });
		}
		
});




/* 
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
 */ 
</script>

<div id="myPageWrapper">
	<h3 id="myPageTitle">마이페이지</h3>
	<br/>
	<br/>
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
				<br/><br/>
					<div class="modal_wrap">
						<p class="modal_close" ><a href="#"><i class="far fa-times-circle fa-2x"></i></a></p>
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
					<!-- <a href="#"><i class="far fa-file-alt fa-lg"></i><br/>관심 노하우</a> -->		</div>
				<br/>
				<div class="status">
					<span id="statusName">상태 메세지</span><br/>
					<textarea rows="2" cols="50" id="statusMsg" placeholder="상태 메세지를 입력해주세요." readonly="readonly" style="resize: none">${loginUser.user_message}</textarea><br/>
					<input type="button" value="수정하기" id="updateMsgBtn" />
					<span id="limitMsg"></span>			
				</div>
			</div>
		
		</div>
		<div id="policyNotice">
			<a id="policyNoticeBtn" href="notice.hey" >
				<span >
					모임 방역 수칙😷
				</span>
			</a>
		</div>
		

			<script>
				$(document).ready(function() {
					$('#preparingMeeting').click(function() {
						fn_preparingMeetingForm();
						$('#preparingMeeting').css('background', '#fa8072');
						$('#pastMeeting').css('background', '');
						$('#qna').css('background', '');
					});
					$('#pastMeeting').click(function() {
						fn_pastMeetingForm();
						$('#pastMeeting').css('background', '#fa8072');
						$('#preparingMeeting').css('background', '');
						$('#qna').css('background', '');
					});
					$('#qna').click(function() {
						fn_myQnAForm();
						$('#qna').css('background', '#fa8072');
						$('#pastMeeting').css('background', '');
						$('#preparingMeeting').css('background', '');
					});
				});
			</script>
			
			<input type="hidden" name="user_no" id="user_no" value="${loginUser.user_no}" />
			
			<!-- 탭 이동 형식 -->
			<div id="contentContainer">
				<div class="flex">
					<div class="barTabs" id="preparingMeeting">참여예정 모임</div>
					<div class="barTabs" id="pastMeeting">지난 모임</div>
					<div class="barTabs" id="qna">질문과답변</div>
				</div>
				<div id="contentBox"></div>
		</div>	
</div>

<%@ include file="../template/footer.jsp" %>


