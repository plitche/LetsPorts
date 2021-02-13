<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<form method="post" id="insertForm" action="insertBoardTest.wooki">
		<input type="hidden" name="temp_no" id="temp_no" />
		<input type="hidden" name="user_no" id="user_no" value="${loginUser.user_no}" />
	</form>
	<div id="content"></div>
	<i class="far fa-plus-square btn" onclick="fn_addContent()"></i>
	<label>
		<input style="display: none" type="file" id="uploadFile" name="uploadFile" accept="image/*" />
		<i class="far fa-images btn"></i>
	</label>
	<input type="button" value="게시글 작성" onclick="fn_submit()" />
</body>
</html>