<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	if (title == null || title.isEmpty()) {
		title = "Let'sPorts Together!";
	}
	pageContext.setAttribute("title", title);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- CSS --%>
<link type="text/css" rel="stylesheet" href="resources/style/style.css" >
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<%-- CDN --%>
<!-- <script defer src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" integrity="sha384-9/D4ECZvKMVEJ9Bhr3ZnUAF+Ahlagp1cyPC7h5yDlZdXs4DQ/vRftzfd+2uFUuqS" crossorigin="anonymous"></script> -->
<script src="https://kit.fontawesome.com/07b67006ce.js"></script>
<%-- jQuery --%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<%-- summbernote --%>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<%-- sweetalert --%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<%-- font --%>
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<%-- favicon --%>
<link rel="icon" href="resources/images/favicon.ico">

<title>${title}</title>

</head>
<body>
	<div class="header">
		<div class="top-wrap" >
			<div class="top-menu">
				<a href="http://localhost:9090/project/" id="logo">
					<span>Let'sPorts</span>
					<img alt="mainLogo" src="resources/images/mainLogo.JPG">
				</a>
				<ul class="menu-bar">
					<li><a href="GoBoard_KnowHowList.limyeng">KnowHow</a></li>
					<li><a href="TrainerClassListPage.leo" >Community</a></li>
					<li><a href="goTrainerList.plitche" >Trainer</a></li>
					<li><a href="goQnAPage.plitche" >Q&A</a></li>
				</ul>
				<ul class="top">
					<%-- 로그인 하지 않은 상태 --%>
					<c:if test="${loginUser eq null}">
						<li><a href="usersLoginPage.hey" >Log In</a></li>
						<li><a href="usersLoginPage.hey" >My Page</a></li>
					</c:if>
					<%-- 로그인 상태 --%>
					<c:if test="${loginUser ne null}">
						<li><a href="usersLogout.hey" >Log Out</a></li>
						<li><a href="myPage_commonPart.hey" >My Page</a></li>
					</c:if>
				</ul>
			</div>
			<div class="imageWrap">
				<div class="introduce">
					<div>
						<span>L</span>
						<span>e</span>
						<span>t</span>
						<span>'</span>
						<span>s</span>
						<span>P</span>
						<span>o</span>
						<span>r</span>
						<span>t</span>
						<span>s</span>
					</div>
					<div>우리만의 다양한 <span>Let'sPorts</span>이야기를 만들어봐요!</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="body-wrap">
	
	
	