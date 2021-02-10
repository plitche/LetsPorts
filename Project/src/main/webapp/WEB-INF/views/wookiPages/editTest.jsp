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
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://kit.fontawesome.com/07b67006ce.js"></script>
	
	<!-- css파일 및 js파일 -->
	<link rel="stylesheet" href="resources/wooki/css/common.css">
	<script src="resources/wooki/js/textEditer.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			divToBr();
			deleteContent();
			fn_filesend();
		})
	</script>
	<style type="text/css">
		div[contenteditable="true"] {
			width: 500px;
		}
		.flex i {
			align-self: flex-end;
		}
		#content img {
			width: 500px;
			display: block;
		}
		.addBtn {
			display: inline-block;
			padding: 5px 15px;
			font-size: 20px;
			border: 1px solid black;
			border-radius: 5px;
		}
	</style>
</head>
<body>
	<div id="content"></div>
	<i class="far fa-plus-square addBtn" onclick="fn_addContent()"></i>
	<label>
		<input style="display: none" type="file" id="upload" name="upload" accept="image/*" />
		<i class="far fa-images addBtn"></i>
	</label>
</body>
</html>