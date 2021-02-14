<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- jQuery --%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>
<%-- sweetalert --%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<link type="text/css" rel="stylesheet" href="resources/joon/css/trainerSignUp.css" >
<script src="resources/joon/js/trainerSignUp.js"></script>
<title>트레이너 회원가입</title>
</head>
<body>
	<h3>회원 가입(트레이너 전용)</h3>
	
<div id="signUpWrapper">
		<form method="post">
			<!-- 닉네임 -->
			<div class="form-group">
				<label for="user_nickname">실명 입력</label><br /> 
				<input type="text" class="form-control" id="trainer_name" name="trainer_name" value="${loginUser.user_nickname}" placeholder="닉네임 입력" required /><br />
			</div>
			
			<!-- 근무센터명 -->
			<div class="form-group">
				<label for="password">근무센터명</label><br/>
				<input type="text" id="centerName" name="employment"/>
			</div>
			<br/>
			
			<!-- 활동지역 -->
			<div class="form-group">
				<label for="address">활동 지역 </label><br/>
				<select id="location1" name="location1_no">
					<option id="none" value="">시/도 선택</option>
					<option id="seoul" value="0">서울특별시</option>
					<option id="incheon" value="1">인천광역시</option>
					<option id="gyeongi" value="2">경기도</option>
				</select>
				<select id="location2" name="location2_no">
					
				</select> 
			</div>
			
			<!-- 경력 -->
			<div class="form-group">
				<label for="address">수상 경력 및 한마디(1000자 이내) </label><br/>
				<textarea rows="20" cols="50" placeholder="내용을 입력해주세요"></textarea> 
				<div id="textCheck">(0/1000)</div>
			</div>
			
			<hr/>
				<!-- 자격증 파일 업로드 -->
				<div class="form-group">
					<label for="address">자격증 업로드 </label><br/>
					<div>	
					자격증이 잘 보이게 사진으로 찍어 올려주세요.
					트레이너 등록 후에는 임의의 변경이 불가하니, 신중하게 올려주세요.
					</div>
					<label id="fileBtn">
						<input type="file" id="uploadFile" name="uploadFile" accept="image/*"/>
						<i class="fas fa-camera imageBtn"></i>
					</label>
				</div>
				
			<hr />
			<input type="button" value="가입하기" id="joinTrainer" />
	
		</form>
	</div>
	
</body>
</html>