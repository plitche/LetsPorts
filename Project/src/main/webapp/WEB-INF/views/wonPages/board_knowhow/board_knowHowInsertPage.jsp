<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix ="c"%>
<!DOCTYPE html>

<jsp:include page="../../template/header.jsp">
	<jsp:param value="노하우 게시글 작성 페이지" name="title"/>
</jsp:include>
	
<form>
	<div class = "container" >
		<h3>게시글 작성하기</h3><br/>
		
		<label for = "title">제목</label>
		<input type = "text" name = "title" id = "title" placeholder = "제목을 입력해주세요." /><br/><br/>
		
		카테고리<br/>
			<label><input type="checkbox" name="tag_no" value="0">족구</label>
			<label><input type="checkbox" name="tag_no" value="1">축구</label>
			<label><input type="checkbox" name="tag_no" value="2">농구</label>
			<label><input type="checkbox" name="tag_no" value ="3">볼링</label><br/>
			<label><input type="checkbox" name="tag_no" value="4">크로스핏</label>
			<label><input type="checkbox" name="tag_no" value="5">스피닝</label>
			<label><input type="checkbox" name="tag_no" value="6">댄스</label>
			<label><input type="checkbox" name="tag_no" value="7">요가</label><br/>
			<label><input type="checkbox" name="tag_no" value="8">명상</label>
			<label><input type="checkbox" name="tag_no" value="9">다이어트정보</label>
			<label><input type="checkbox" name="tag_no" value="10">건강정보</label>
			<label><input type="checkbox" name="tag_no" value="11">식단정보</label><br/><br/>
			
		<br/><label for = "content">내용</label><br/>
		<textarea rows = "10" name = "content" id = "content"  placeholder = "내용을 입력해주세요."></textarea><br/>
	
		<input type="button" class="btn" value="작성완료" onclick="fn_knowHowInsert(this.form)" />
		<input type="button" class="btn" value="목록으로돌아가기" onclick="location.href='GoBoard_KnowHowList.limyeng'" />
		<!--  
		<a href = "javascript:history.back();">목록으로 돌아가기</a>
		-->
			
		<br/><br/>
	</div>
</form>
	
<script>
	function fn_knowHowInsert(f){
		f.action='Board_KnowHowInsertPage.limyeng';
		f.submit();
	}
</script>


<%@ include file="../../template/footer.jsp" %>