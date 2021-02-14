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
				<td>자기소개 및 수상내역</td>
				<td>
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
	<input type="hidden" name="user_no" value="${param.user_no}" />
	<input type="button" value="가입하기" onclick="fn_send(this.form)">
</form>

<%@ include file="../template/footer.jsp" %>