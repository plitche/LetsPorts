<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix ="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

	<%-- 작성하기 버튼을 누르면 view페이지로 이동 --%> 
	function fn_knowHowInsert(f) {
		if (confirm('작성하기')) {
			f.action ='boardInsert.limyeng';
			f.submit();
		}
	}
	
	
	

</script>

</head>
<body>

	<article>
		<div class = "container" >
		
			<h3>제목</h3> 
			
			<div class = "">
				<label for = "title">제목</label>
				<input type = "text" value = "title" name = "title"  id = "title" placeholder = "제목을 입력해주세요." />
			</div>
			
			<div class = ""> 
				<label for = "writer">작성자</label>
				<input type = "text" class = "" name = "id" id = "writer" placeholder = "이름을 입력해주세요. " />
			</div>
			
			<div class ="" 순번 >
				
			</div>
			
			<div class = ""></div>
			작성자 번호
			
			구분자
			
			 카테고리
			 <label><input type = "radio" name = "" value = "0">족구</label>
			
			<div class = "" >
				<label for = "content">내용</label>
				<textarea rows="5" name = "content" id = "content" cols=" " placeholder = "내용을 입력해주세요."></textarea>
			</div>


			<button type = "button" class = "btn" id = "btnSave" >작성하기</button>
			<button type = "button" class = "btn" id = "btnList" >목록으로 돌아가기</button>
									
		</div>
	</article>
	
</body>
</html>
	<%@ include file="../../template/footer.jsp" %>