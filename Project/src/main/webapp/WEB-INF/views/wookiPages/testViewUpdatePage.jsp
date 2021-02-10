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
			divToBr();
			deleteContent();
			fn_filesend();
		});
	</script>
</head>
<body>
	<div>${dto.no}</div>
	<div>${dto.user_no}</div>
	<div id="content">
		${dto.content}
	</div>
</body>
</html>