<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>D P M</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
		<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
		<meta name="author" content="FREEHTML5.CO" />
		<%@ include file="../include/header.jsp" %>
		
		<!-- Facebook and Twitter integration -->
		<meta property="og:title" content=""/>
		<meta property="og:image" content=""/>
		<meta property="og:url" content=""/>
		<meta property="og:site_name" content=""/>
		<meta property="og:description" content=""/>
		<meta name="twitter:title" content="" />
		<meta name="twitter:image" content="" />
		<meta name="twitter:url" content="" />
		<meta name="twitter:card" content="" />
		
		<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
		<link rel="shortcut icon" href="favicon.ico">
		
		<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700,900' rel='stylesheet' type='text/css'>
		<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:300,400,700" rel="stylesheet">
			
		<!-- Animate.css -->
		<link rel="stylesheet" href="${path}/resources/css/animate.css">
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
		<!--[if lt IE 9]><script src="${path}/resources/js/respond.min.js"></script><![endif]-->
	
	</head>
	<body>
		
		<header id="fh5co-header" role="banner">
			<div class="container text-center">
				<div id="header">
					<h6><a href="${path}/main/home.do">D P M</a></h6>	
				</div>
				<nav>
					<ul>
						<li><a href="${path}/main/menubar.do?product=best">Best</a></li>
						<li><a href="${path}/main/menubar.do?product=top">Top</a></li>
						<li><a href="${path}/main/menubar.do?product=pants">Pants</a></li>
					</ul>
				</nav>
			</div>
		</header>
		<!-- END #fh5co-header -->
		
		<!-- 좌측 a태그 -->
		<div class="header_left">
			<div>
				<a href="${path}/main/home.do">DDO PING MALL</a>
			</div>
		</div>
		
		<!-- 우측 메뉴1 -->
		<div class="header_right1-1">
			<div>
				<a href=""><i class="icon-chevron-up" style="font-size: 30px;"></i></a>
			</div>
		</div>
		
		<div class="header_right1-2">
			<div>
				<a href="#"><i class="icon-chevron-down" style="font-size: 30px;"></i></a>
			</div>
		</div>
		
		<div class="header_right1-3">
			<div>
				<a href="#"><i class="icon-shopping-cart fa-5x" style="font-size: 30px"></i></a>
			</div>
		</div>
		
		<!-- 우측 메뉴2 -->
			<c:choose>
			    <c:when test="${sessionScope.userid == null }">
					<div class="header_right2-1" style="letter-spacing: 8px;">
				        <!-- 로그인하지 않은 상태  -->
				  		<a href="${path}/member/login.do">LOGIN</a> |
				  		<a href="${path}/member/join.do">JOIN</a> |
				  		<a href="${path}/admin/listAllMember.do">ADMIN</a> |
			  		</div>
			    </c:when>
			    <c:otherwise>
				    <div class="header_right2-2" style="letter-spacing: 8px;">
				        <!-- 로그인한 상태 -->
				        <a href="${path}/member/memberUpdateView.do">MYPAGE</a> |
				        <a href="${path}/member/logout.do">LOGOUT</a>
		        	</div>
			    </c:otherwise>
		  </c:choose>
		
		<div class="container-fluid pt70 pb70">
			<div id="fh5co-projects-feed" class="fh5co-projects-feed clearfix masonry">
				<c:forEach var="row" items="${list}"> 
					<div class="fh5co-project masonry-brick">
						<a href="${path}/shop/shop/detail/${row.product_num}">
						<img src="${path}/resources/images/${row.product_main_photo}" alt="Free HTML5 by FreeHTML5.co">
						<h2>${row.product_name}</h2>
						</a>
					</div>
				</c:forEach>
			</div>
			<!--END .fh5co-projects-feed-->
		</div>
		<!-- END .container-fluid -->
		
		<footer id="fh5co-footer" role="contentinfo">
			<div class="container-fluid">
				<div class="footer-content">
					<div class="copyright"><small>&copy; 2020 DDO PING MALL. All Rights Reserved. <br></small></div>
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