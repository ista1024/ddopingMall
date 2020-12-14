<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>

<style>
 section#content {margin: auto; width: 70%;}
 section#content ul li {border:5px solid #eee; padding:10px 20px; margin-bottom:20px; list-style: none;}
 section#content .orderList span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px; }
</style>
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
</head>
<body>
<section id="content">
 <ul class="orderList">
  <c:forEach items="${orderList}" var="orderList">
  <li>
  <div>
   <p><span>주문번호</span><a href="/shop/orderView?n=${orderList.orderId}">${orderList.orderId}</a></p>
   <p><span>수령인</span>${orderList.name}</p>
   <p><span>주소</span>(${orderList.address}) ${orderList.detailAddress} ${orderList.extraAddress}</p>
   <p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderList.amount}" /> 원</p>
  </div>
  </li>
  </c:forEach>
 </ul>
</section>

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
</body>
</html>