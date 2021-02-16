<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../template/header.jsp">
	<jsp:param value="트레이너 가입" name="title"/>
</jsp:include>

<script>
	function fn_send(f) {
		if(f.trainer_name.value == '') {
			alert('이름을 입력해주세요.');
			return;
		}
		if(f.career.value == '') {
			alert('경력을 입력해주세요.');
			return;
		}
		if(f.employment.value == '') {
			alert('근무지를 입력해주세요.');
			return;
		}
		if(f.profile.value == '') {
			alert('자기소개를 입력해주세요.');
			return;
		}
		if(f.certificate_filename.value == '') {
			alert('자격증 파일을 선택해주세요.');
			return;
		}
		
		f.submit();
	}
</script>
<style>
form {
	transform: translate(20%, 10%);
	height: 700px;
}
td, th {
    padding: 20px;
}
h3 {
	text-align: center;
}
input[type=text]{
	width: 475px;
	height: 30px;
	color: #6c757d;
	font-weight: 500;
	font-size: 15px;
	padding:6px 12px;
	margin-top: 10px;
	border: 0.5px solid silver;
	appearance: textfield;
}
input:focus {
	outline:1px solid #fa8072;
}
textarea {
	width: 475px;
	resize: none;
	color: #6c757d;
	font-weight: 500;
	font-size: 15px;
	padding:6px 12px;
	margin-top: 10px;
	border: 0.5px solid silver;
}
#file-upload-button {
	width: 100px;
	height: 50px;
	margin-left: 80px;
	font-size: 16px;
	font-weight: bold;
	border: none;
	background: #fa8072;
	color: #ffffff;
}
#signUpSubmit {
	width: 500px;
	height: 50px;
	margin-left: 80px;
	font-size: 16px;
	font-weight: bold;
	border: none;
	background: #fa8072;
	color: #ffffff;
}

</style>

<h3>트레이너 전용 회원가입</h3>
<form method="post" action="insertTrainer.wooki" enctype="multipart/form-data">
	<table>
		<tbody>
			<tr>
				<td>본명</td>
				<td>
					<input type="text" name="trainer_name" />
				</td>
			</tr>
			<tr>
				<td>경력</td>
				<td>
					<input type="text" name="career" />
				</td>
			</tr>
			<tr>
				<td>센터명</td>
				<td>
					<input type="text" name="employment" />
				</td>
			</tr>
			<tr>
				<td>자기소개 및 <br>수상내역</td>
				<td>
					<br/>
					<textarea rows="10" cols="40" name="profile"></textarea>
				</td>
			</tr>
			<tr>
				<td>자격증 파일</td>
				<td>
					<input type="file" name="certificate_filename" accept="image/*"/>
				</td>
			</tr>
		</tbody>
	</table>
					<br/>
					<br/>
	<input type="hidden" name="user_no" value="${param.user_no}" />
	<input type="button" id="signUpSubmit" value="가입하기" onclick="fn_send(this.form)">
</form>

<%@ include file="../template/footer.jsp" %>