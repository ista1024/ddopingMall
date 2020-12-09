<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>D P M</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<meta name="author" content="" />
	<%@ include file="../include/header.jsp" %>

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700,900' rel='stylesheet' type='text/css'>
	<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:300,400,700" rel="stylesheet">
	
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="${path}/resources/css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="${path}/resources/css/bootstrap.css">
	<!-- Superfish -->
	<link rel="stylesheet" href="${path}/resources/css/superfish.css">
	<!-- Flexslider  -->
	<link rel="stylesheet" href="${path}/resources/css/flexslider.css">

	<link rel="stylesheet" href="${path}/resources/css/style.css">
	
	<link rel="preconnect" href="https://fonts.gstatic.com">
	
	<!-- Modernizr JS -->
	<script src="${path}/resources/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="resources/js/respond.min.js"></script>
	<![endif]-->
	
	</head>
	<body>
		<header id="fh5co-header" role="banner">
			<div class="container text-center">
				<div id="header">
					<h6><a style="text-decoration: none;" href="${path}/main/home.do">D P M</a></h6>	
				</div>
				<nav>
					<ul>
						<li><a href="${path}/main/menubar.do?product=best">회원관리</a></li>
						<li><a href="${path}/main/menubar.do?product=top">매출관리</a></li>
						<li><a href="${path}/main/menubar.do?product=pants">상품관리</a></li>
					</ul>
				</nav>
			</div>
		</header>
		<!-- END #fh5co-header -->
		
		<div id="wrapper">
			<div id="sidebar">
			
			</div>
			<div id="table-responsive" style="float: right; width: 80%;">
				<table table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<thead>
						<tr>
							<th>아이디</th>
							<th>비밀번호</th>
							<th>이름</th>
							<th>회원등급</th>
							<th>권한</th>
							<th>가입날짜</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>아이디</th>
							<th>비밀번호</th>
							<th>이름</th>
							<th>회원등급</th>
							<th>권한</th>
							<th>가입날짜</th>
						</tr>
					</tfoot>
					<tbody>
						<c:forEach var="row" items="${list}"> 
							<th>${row.userid}</th>
							<th>${row.passwd}</th>
							<th>${row.name}</th>
							<th>${row.member_rank}</th>
							<th>${row.member_verify}</th>
							<th>${row.join_date}</th>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		
		<footer id="fh5co-footer" role="contentinfo">
			<div class="container-fluid">
				<div class="footer-content">
					<div class="copyright"><small>&copy; 2020 DDOPINGMALL. All Rights Reserved. <br></small></div>
					<div class="social">
						<a href="#"><i class="icon-facebook3"></i></a>
						<a href="https://www.instagram.com/lee_jae_hyounggggg/"><i class="icon-instagram2"></i></a>
						<a href="#"><i class="icon-youtube"></i></a>
					</div>
				</div>
			</div>
		</footer>
		<!-- END #fh5co-footer -->
		
	<!-- jQuery -->
	<script src="${path}/resources/js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="${path}/resources/js/bootstrap.min.js"></script>
	<!-- masonry -->
	<script src="${path}/resources/js/jquery.masonry.min.js"></script>
	<!-- MAIN JS -->
	<script src="${path}/resources/js/main.js"></script>

	</body>
</html>