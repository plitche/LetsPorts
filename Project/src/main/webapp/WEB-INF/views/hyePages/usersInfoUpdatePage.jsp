<%@page import="com.koreait.project.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<jsp:include page="../template/header.jsp">
	<jsp:param value="회원정보 수정 페이지" name="title"/>
</jsp:include>

<script src="resources/joon/js/userInfoUpdate.js"></script>

<title>회원정보 수정 페이지</title>
<script type="text/javascript">
// 버튼 클릭 후 실행될 함수
function fn_backMyPage(f){
	f.action = "myPage_commonPart.hey";
	f.submit();	
}
function fn_updateAccount(f){
	f.action = "updateAccount.hey";
	f.submit();
}

$(document).ready(function(){
	updatePageView();
	deleteAccount();
});

var user_no = '<%=((UsersDto)session.getAttribute("loginUser")).getUser_no()%>';
function updatePageView() {
	
        var obj = {"user_no" : user_no};
        
        $.ajax({
        	url: 'userUpdateView.hey'
       		type : "post",
   			data : JSON.stringify(obj),
   			contentType : "application/json",
   			dataType : "json",
        	success: function(data) {
        			console.log('확인');
        		
        		if (data.result == user_no) {
        			console.log('성공');
        		}
        			
        	},
        	error: function(){
				alert('실패');
			}
        });
	
}
// 회원 탈퇴
function deleteAccount(){
	$('#deleteAccount').click(function(){
		var email = $("#email").val();
		var obj = {"email" : email};
		
		$.ajax({
			url : "deleteAccount.hey",
			type : "post",
			data : JSON.stringify(obj),
			contentType : "application/json",
			dataType : "json",
			success : function(data) {
				console.log('됐나?')
				if (data.result == 1) {
						alert('그동안 감사했습니다! 다음에 또 뵙길 바랍니다!');
						
					} else {
						
					}
				}, error : function() {
						console.log("실패");
				}
			});
	});
}
	

</script>
<script type="text/javascript">

</script>
	<h3>회원정보 수정</h3>
		<!-- wrapper는 나중에 css 작업에 용이하게 하기 위함 -->
	<div id="signUpWrapper">
		<form method="post">
			<!-- 닉네임 -->
			<div class="form-group">
				<label for="user_nickname">닉네임</label><br /> <input type="text"
					class="form-control" id="user_nickname" name="user_nickname"
					placeholder="닉네임 입력" required />${loginUser.user_nickname}<br />
				<div class="check_font" id="nick_check"></div>
			</div>

			<!-- 이메일 -->
			<div class="form-group">
				<label for="email">이메일</label><br /> 
				<span> ${loginUser.email} </span>
				<br />
				<br />
			</div>

		<!-- 비밀번호 -->
			<div class="form-group">
				<label for="password">비밀번호 </label><br/>
				<input type="password" class="form-control" id='password' name="password" />${loginUser.password}<br/>
				<div class="check_font" id="pw_check"></div>
			</div>
			
		<!-- 비밀번호 확인 -->
			<div class="form-group">
				<label for="re_password">비밀번호 확인 </label><br/>
				<input type="text" class="form-control" id="re_password" name="re_password" />${loginUser.password}<br/>
				<div class="check_font" id="pw_reCheck"></div>
			</div>
			
			<!-- 생년월일 -->
			<div class="form-group">
				<label for="password">생년월일</label><br/>
				<span>${loginUser.birth_year}년 ${loginUser.birth_month}월 ${loginUser.birth_day}일</span>
			</div>
			<br/>
			
			<!-- 주소 -->
			<div class="form-group">
				<label for="address">주소 </label><br/>
				<select id="location1" name="location1_no">
					<option id="none" value="">시/도 선택</option>
					<option id="seoul" value="0">서울특별시</option>
					<option id="incheon" value="1">인천광역시</option>
					<option id="gyeongi" value="2">경기도</option>
				</select>
				<select id="location2" name="location2_no">
					
				</select> 
			</div>
			
			<hr/>
			<!-- 관심분야 -->
			<div class="form-group">
				관심분야 <br/>
				<label><input type="checkbox" name="exercise_no" value="0">족구</label>
				<label><input type="checkbox" name="exercise_no" value="1">축구</label>
				<label><input type="checkbox" name="exercise_no" value="2">농구</label>
				<label><input type="checkbox" name="exercise_no" value="3">볼링</label><br/>
				<label><input type="checkbox" name="exercise_no" value="4">크로스핏</label>
				<label><input type="checkbox" name="exercise_no" value="5">스피닝</label>
				<label><input type="checkbox" name="exercise_no" value="6">댄스</label>
				<label><input type="checkbox" name="exercise_no" value="7">요가</label><br/>
				<label><input type="checkbox" name="exercise_no" value="8">명상</label>
			</div>
			<hr />
			<input type="button" value="회원탈퇴" id="deleteAccount" /> 
			<input type="button" value="수정완료" id="updateAccount" /> 
			<input type="button" value="돌아가기" id="backMyPage" onclick="fn_backMyPage(this.form)" /> 
	
		</form>
	</div>
	
<%@ include file="../template/footer.jsp" %>