<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<jsp:include page="../template/header.jsp">
	<jsp:param value="트레이너 리스트 페이지" name="title"/>
</jsp:include>


<script>


</script>
<style>


</style>

<br/><br/>
<table border="1">
	<tbody>
		<tr>
			<td>인기 트레이너</td>
			<td>인기 트레이너</td>
			<td>인기 트레이너</td>
		</tr>
	</tbody>
</table>	

<br/><br/>
우리는 어쩌고저쩌고 트레이너 어쩌고 저쩌고
<br/><br/>

<table border="1">
	<tbody>
		<c:if test="${empty trainerList}">
		<!-- 등록된 trainerList가 하나도 없을 때 -->
			<tr>
				<td colspan="3">등록된 트레이너가 없습니다.</td>
			</tr>	
		</c:if>
		<c:if test="${not empty trainerList}">
		<!-- 등록된 trainerList가 있을 때 -->
			<tr>
				<c:forEach var="trainerTemDto" items="${trainerList}">
						<td>
							<a href="goTrainerDetail.do?user_no=${trainerTemDto.user_no}" style="background: lightblue">
								<ul>
									<li>사진 : ${trainerTemDto.profile_photo}</li>
									<li>닉네임 : ${trainerTemDto.user_nickname}</li>
									<li>이름 : ${trainerTemDto.trainer_name}</li>
									<li>활동 : ${trainerTemDto.employment}</li>
								</ul>
							</a>
						</td>
				</c:forEach>
			</tr>
		</c:if>
	</tbody>
</table>

<%@ include file="../template/footer.jsp" %>