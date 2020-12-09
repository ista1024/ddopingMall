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
  <!-- 
	//////////////////////////////////////////////////////

	FREE HTML5 TEMPLATE 
	DESIGNED & DEVELOPED by FREEHTML5.CO
		
	Website: 		http://freehtml5.co/
	Email: 			info@freehtml5.co
	Twitter: 		http://twitter.com/fh5co
	Facebook: 		https://www.facebook.com/fh5co

	//////////////////////////////////////////////////////
	 -->

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
						<li><a href="${path}/main/menubar.do?product=best">Best</a></li>
						<li><a href="${path}/main/menubar.do?product=top">Top</a></li>
						<li><a href="${path}/main/menubar.do?product=pants">Pants</a></li>
						<li><a href="${path}/main/menubar.do?product=acc">Acc</a></li>
					</ul>
				</nav>
			</div>
		</header>
		<!-- END #fh5co-header -->
		
		<div class="container-fluid pt70 pb70">
			<div id="fh5co-projects-feed" class="fh5co-projects-feed clearfix masonry">
				<c:forEach var="row" items="${list}"> 
					<div class="fh5co-project masonry-brick">
						<a href="#">
							<img src="${path}/resources/images/${row.product_main_photo}" alt="Free HTML5 by FreeHTML5.co">
							<h2>${row.product_name}</h2>
						</a>
					</div>
				 </c:forEach>
				<%-- 
				<div class="fh5co-project masonry-brick">
					<a href="#">
						<img src="${path}/resources/images/${row.product_main_photo}" alt="Free HTML5 by FreeHTML5.co">
						<h2>Your Project Title Here</h2>
					</a>
				</div>
				<div class="fh5co-project masonry-brick">
					<a href="single.html">
						<img src="${path}/resources/images/ex.2.jpg" alt="Free HTML5 by FreeHTML5.co">
						<h2>Your Project Title Here</h2>
					</a>
				</div>
				<div class="fh5co-project masonry-brick">
					<a href="single.html">
						<img src="${path}/resources/images/ex.3.jpg" alt="Free HTML5 by FreeHTML5.co">
						<h2>Your Project Title Here</h2>
					</a>
				</div>
				<div class="fh5co-project masonry-brick">
					<a href="single.html">
						<img src="${path}/resources/images/ex.4.jpg" alt="Free HTML5 by FreeHTML5.co">
						<h2>Your Project Title Here</h2>
					</a>
				</div>
				<div class="fh5co-project masonry-brick">
					<a href="single.html">
						<img src="${path}/resources/images/ex.5.jpg" alt="Free HTML5 by FreeHTML5.co">
						<h2>Your Project Title Here</h2>
					</a>
				</div>
				<div class="fh5co-project masonry-brick">
					<a href="single.html">
						<img src="${path}/resources/images/ex.6.jpg" alt="Free HTML5 by FreeHTML5.co">
						<h2>Your Project Title Here</h2>
					</a>
				</div>
				<div class="fh5co-project masonry-brick">
					<a href="single.html">
						<img src="${path}/resources/images/ex.7.jpg" alt="Free HTML5 by FreeHTML5.co">
						<h2>Your Project Title Here</h2>
					</a>
				</div>
				<div class="fh5co-project masonry-brick">
					<a href="single.html">
						<img src="${path}/resources/images/ex.8.jpg" alt="Free HTML5 by FreeHTML5.co">
						<h2>Your Project Title Here</h2>
					</a>
				</div> --%>
				<%-- <div class="fh5co-project masonry-brick">
					<a href="single.html">
						<img src="${path}/resources/images/ex.9.jpg" alt="Free HTML5 by FreeHTML5.co">
						<h2>Your Project Title Here</h2>
					</a>
				</div> --%>
				<%-- <div class="fh5co-project masonry-brick">
					<a href="single.html">
						<img src="${path}/resources/images/ex.10.jpg" alt="Free HTML5 by FreeHTML5.co">
						<h2>Your Project Title Here</h2>
					</a>
				</div> --%>
				<%-- <div class="fh5co-project masonry-brick">
					<a href="single.html">
						<img src="${path}/resources/images/ex.11.jpg" alt="Free HTML5 by FreeHTML5.co">
						<h2>Your Project Title Here</h2>
					</a>
				</div> --%>
				<%-- <div class="fh5co-project masonry-brick">
					<a href="single.html">
						<img src="${path}/resources/images/ex.12.jpg" alt="Free HTML5 by FreeHTML5.co">
						<h2>Your Project Title Here</h2>
					</a>
				</div> --%>
				<%-- <div class="fh5co-project masonry-brick">
					<a href="single.html">
						<img src="${path}/resources/images/ex.13.jpg" alt="Free HTML5 by FreeHTML5.co">
						<h2>Your Project Title Here</h2>
					</a>
				</div> --%>
				<%-- <div class="fh5co-project masonry-brick">
					<a href="single.html">
						<img src="${path}/resources/images/ex.14.jpg" alt="Free HTML5 by FreeHTML5.co">
						<h2>Your Project Title Here</h2>
					</a>
				</div> --%>
				<!-- <div class="fh5co-project masonry-brick">
					<a href="single.html">
						<img src="${path}/resources/images/img_15.jpg" alt="Free HTML5 by FreeHTML5.co">
						<h2>Your Project Title Here</h2>
					</a>
				</div> -->
				<!-- <div class="fh5co-project masonry-brick">
					<a href="single.html">
						<img src="${path}/resources/images/img_16.jpg" alt="Free HTML5 by FreeHTML5.co">
						<h2>Your Project Title Here</h2>
					</a>
				</div> -->
				<!-- <div class="fh5co-project masonry-brick">
					<a href="single.html">
						<img src="${path}/resources/images/img_17.jpg" alt="Free HTML5 by FreeHTML5.co">
						<h2>Your Project Title Here</h2>
					</a>
				</div> -->
			<!-- 	<div class="fh5co-project masonry-brick">
					<a href="single.html">
						<img src="${path}/resources/images/img_18.jpg" alt="Free HTML5 by FreeHTML5.co">
						<h2>Your Project Title Here</h2>
					</a>
				</div> -->
				<!-- <div class="fh5co-project masonry-brick">
					<a href="single.html">
						<img src="${path}/resources/images/img_19.jpg" alt="Free HTML5 by FreeHTML5.co">
						<h2>Your Project Title Here</h2>
					</a>
				</div> -->
			<!-- 	<div class="fh5co-project masonry-brick">
					<a href="single.html">
						<img src="${path}/resources/images/img_20.jpg" alt="Free HTML5 by FreeHTML5.co">
						<h2>Your Project Title Here</h2>
					</a>
				</div> -->
			</div>
			<!--END .fh5co-projects-feed-->
		</div>
		<!-- END .container-fluid -->
		
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