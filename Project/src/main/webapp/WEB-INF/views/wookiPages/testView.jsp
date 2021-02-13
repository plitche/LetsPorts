<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8" />
	<title>Document</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- jquery, fontawesome -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://kit.fontawesome.com/07b67006ce.js"></script>
	        
	<!-- css파일 및 js파일 -->
	<link rel="stylesheet" href="resources/wooki/css/textEditor.css">
	
	<script type="text/javascript">
	    $(document).ready(function() {
	        $('div[contenteditable="true"]').attr('contenteditable', 'false');
	        $('.btn').hide();
	    })
	</script>
</head>
<body>
	<div>${dto.no}</div>
	<div>${dto.user_no}</div>
	<div id="content">
	    ${dto.content}
	</div>
	<a href="boardUpdatePage.wooki?no=${dto.no}">수정하기</a>
</body>
</html>