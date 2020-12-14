<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="${path}/resources/css/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="${path}/resources/css/bootstrap.css">
<link rel="stylesheet" href="${path}/resources/admin/css/style.css">
<!--[if lt IE 9]><script src="${path}/resources/js/respond.min.js"></script><![endif]-->
		
<header id="fh5co-header" role="banner">
	<div class="container text-center">
		<div id="header">
			<h6><a href="${path}/main/home.do">D P M</a></h6>	
		</div>
		<nav>
			<hr>
			<ul>
				<li><a href="${path}/main/home.do"><button><i class="icon-home"></i><p>메인</p></button></a></li>
				<li><a href="${path}/admin/adminHome.do"><button><i class="icon-home2"></i><p>관리자홈</p></button></a></li>
				<li><a href="${path}/admin/listAllMember.do"><button><i class="icon-users"></i><p>회원리스트</p></button></a></li>
				<li><a href="${path}/admin/product_write.do"><button><i class="icon-pricetags"></i><p>상품등록</p></button></a></li>
				<li><a href="${path}/admin/chart1.do"><button><i class="icon-pie-chart"></i><p>파이차트</p></button></a></li>
				<li><a href="${path}/admin/chart2.do"><button><i class="icon-pie-chart2"></i><p>파이차트</p></button></a></li>
				<li><a href="${path}/admin/email_write.do"><button><i class="icon-envelope"></i><p>이메일</p></button></a></li>
			</ul>
		</nav>
	</div>
</header>
<div style="text-align: right; padding-top: 15px;">
  <c:choose>
    <c:when test="${sessionScope.admin_userid == null }">
		<c:redirect url="${path}/main/home.do" />
    </c:when>
    <c:otherwise>
        <!-- 로그인한 상태 -->
        ${sessionScope.name}님이 로그인중입니다.
        <a href="${path}/member/logout.do">로그아웃</a>
    </c:otherwise>
  </c:choose>
</div>
<hr>