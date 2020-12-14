<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="${path}/include/js/common.js"></script>
<script type="text/javascript">
$(function(){
	$("#btnWrite").click(function(){
		location.href="${path}/board/write.do";
	});
});
function list(page){
	location.href="${path}/board/list.do?curPage="+page;
}
</script>
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
<div style="text-align: center; margin: 0 auto;">
<h2>Review</h2>
<!-- 검색폼 -->
<form name="form1" method="post" action="${path}/board/list.do">
<select name="search_option">
  <option value="name"
    <c:if test="${map.search_option == 'name'}">selected</c:if>
  >이름</option>
  <option value="subject"
    <c:if test="${map.search_option == 'subject'}">selected</c:if>
  >제목</option>
   <option value="content"
    <c:if test="${map.search_option == 'content'}">selected</c:if>
  >내용</option>
  <option value="all"
    <c:if test="${map.search_option == 'all'}">selected</c:if>
  >이름+내용+제목</option>
</select>
<input name="keyword" value="${map.keyword}">
<input type="submit" value="조회">
</form>
 <c:if test="${sessionScope.userid != null}">
<button type="button" id="btnWrite">글쓰기</button>
</c:if>
${map.count}개의 게시물이 있습니다.
<br>
<br>
<div style="text-align: center; ">
<table class="table"  style=" margin: 0 auto; width: 50%; border-bottom: 1; ">
 <thead class="thead-dark">
  <tr style="text-align: center;">
    <th>번호 </th>
    <th>제목 </th>
    <th>이름 </th>
    <th>내용 </th>
    <th>날짜 </th>
    <th>추천수</th>
    <th>조회수 </th>
  </tr>
  </thead>
  <!-- forEach var="개별데이터" items="집합데이터" -->
  <tbody>
<c:forEach var="row" items="${map.list}"> 
  <tr>
    <td>${row.bno} </td>
    <td><a href="${path}/board/view.do?bno=${row.bno}">
    ${row.subject}</a>
      <c:if test="${row.cnt > 0}">
        <span style="color: red;">(${row.cnt})</span>
      </c:if>
    </td>
    <td>${row.name} </td>
    <td>${row.content} </td>
    <td><fmt:formatDate value="${row.reg_date}" 
    pattern="yy-MM-dd HH:mm"/></td>
    <td>${row.recommend}</td>
    <td>${row.readcount} </td>
  </tr>
</c:forEach>

<!-- 페이지 네비게이션 출력 -->
<tr>
<td colspan="7" align="center">
<c:if test="${map.pager.curBlock > 1}">
	<a href="#" onclick="list('1')">[처음]</a>
</c:if>
<c:if test="${map.pager.curBlock > 1}">
	<a href="#" onclick="list('${map.pager.prevPage}')">[이전]</a>
</c:if>
<c:forEach var="num" 
	begin="${map.pager.blockStart}"
	end="${map.pager.blockEnd}">
	<c:choose>
    	<c:when test="${num == map.pager.curPage}">
		<!-- 현재 페이지인 경우 하이퍼링크 제거 -->
			<span style="color:red;">${num}</span>
		</c:when>
	<c:otherwise>
		<a href="#" onclick="list('${num}')">${num}</a>
	</c:otherwise>
	</c:choose>
</c:forEach>
	<c:if test="${map.pager.curBlock < map.pager.totBlock}">
		<a href="#" onclick="list('${map.pager.nextPage}')">[다음]</a>
	</c:if>
	<c:if test="${map.pager.curPage < map.pager.totPage}">
		<a href="#"	onclick="list('${map.pager.totPage}')">[끝]</a>
	</c:if>
</td>
</tr> 
</tbody>
</table>
</div>
</div>
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