<%@page import="java.util.ArrayList"%>
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


	$(document).ready(function(){
		deleteAccount();
		checkInterest();
	});
	
	// 버튼 클릭 후 실행될 함수
	function fn_backMyPage(f){
		f.action = "myPage_commonPart.hey";
		f.submit();	
	}
	function fn_updateAccount(f){
		f.action = "updateAccount.hey";
		f.submit();
	}
	function checkInterest() {
		var userInterestList = '${userInterestList}';
		$.each(userInterestList, function(idx, userInterest){
			$('input:checkbox[name="exercise_no"][value="' + userInterest.exercise_no + '"]').prop('checked', true);
		});
	}
	
	
	// 회원 탈퇴
	function deleteAccount(){
		$('#deleteAccount').click(function(){
			var user_no = '${loginUser.user_no}';
			var obj = {"user_no" : user_no};
			console.log(email);
			
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
					}
				},
				error : function() {
					console.log("실패");
				}
			});
		});
	}
	

</script>
	<h3>회원정보 수정</h3>
		<!-- wrapper는 나중에 css 작업에 용이하게 하기 위함 -->
	<div id="signUpWrapper">
		<form method="post">
			<!-- 닉네임 -->
			<div class="form-group">
				<label for="user_nickname">닉네임</label><br /> 
				<input type="text" class="form-control" id="user_nickname" name="user_nickname" value="${loginUser.user_nickname}" placeholder="닉네임 입력" required /><br />
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
				<input type="password" class="form-control" id="password" name="password" /><br/>
				<div class="check_font" id="pw_check"></div>
			</div>
			
		<!-- 비밀번호 확인 -->
			<div class="form-group">
				<label for="re_password">비밀번호 확인 </label><br/>
				<input type="text" class="form-control" id="re_password" name="re_password" /><br/>
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
			<%
				ArrayList<String> interests = new ArrayList<String>();
				interests.add("족구");
				interests.add("축구");
				interests.add("농구");
				interests.add("볼링");
				interests.add("크로스핏");
				interests.add("스피닝");
				interests.add("댄스");
				interests.add("요가");
				interests.add("명상");
				pageContext.setAttribute("interests", interests);
			%>
			관심분야 <br/>
			<c:forEach var="interest" items="${interests}" varStatus="k">
				<label><input type="checkbox" name="exercise_no" value="${k.index}" />${interest}</label>
			</c:forEach>
			<c:forEach var="exercise_name" items="${exercise_nameList}" varStatus="k">
			   <div>${exercise_name}</div>
			</c:forEach>
			
			</div>
			<hr />
			<input type="button" value="회원탈퇴" id="deleteAccount" /> 
			<input type="button" value="수정완료" id="updateAccount" /> 
			<input type="button" value="돌아가기" id="backMyPage" onclick="fn_backMyPage(this.form)" /> 
	
		</form>
	</div>
	
<%@ include file="../template/footer.jsp" %>