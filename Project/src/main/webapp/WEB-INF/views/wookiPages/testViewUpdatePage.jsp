<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8" />
	<title>Document</title>
	<!-- jquery, fontawesome -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://kit.fontawesome.com/07b67006ce.js"></script>
	                
	<!-- css파일 및 js파일 -->
	<link rel="stylesheet" href="resources/wooki/css/textEditor.css">
	<script src="resources/wooki/js/textEditor.js"></script>
	        
	<script type="text/javascript">
	    $(document).ready(function() {
	        fn_insertTempBoard($('#user_no').val());
	        divToBr();
	        deleteContent();
	        fn_filesend();
	    });
	</script>
</head>
<body>
	<div>${dto.no}</div>
	<div>${dto.user_no}</div>
	<form method="post" id="insertForm" action="">
	    <input type="hidden" name="temp_no" id="temp_no" />
	    <input type="hidden" name="user_no" id="user_no" value="${loginUser.user_no}" />
	</form>
	<div id="content">
		${dto.content}
	</div>
	<i class="far fa-plus-square btn" onclick="fn_addContent()"></i>
	<label>
	    <input style="display: none" type="file" id="uploadFile" name="uploadFile" accept="image/*" />
	    <i class="far fa-images btn"></i>
	</label>
	<input type="button" value="게시글 수정" onclick="fn_submit()" />
</body>
</html>