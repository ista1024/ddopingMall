<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="${path}/include/js/common.js"></script>
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="${path}/resources/css/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="${path}/resources/css/bootstrap.css">
<link rel="stylesheet" href="${path}/resources/css/style.css">
<style type="text/css">
	td {
		padding-bottom: 15px;
		color: black;
	}
</style>

<script type="text/javascript">
$(function(){ //자동으로 실행되는 코드
	//댓글 목록 출력
	listReply();
	//listReply2();
	//댓글 쓰기
	$("#btnReply").click(function(){
		var replytext=$("#replytext").val(); //댓글 내용
		var product_num="${dto.product_num}"; //게시물 번호
		var param={ "replytext": replytext, "product_num": product_num};
		//var param="replytext="+replytext+"&bno="+bno;
		$.ajax({
			type: "post",
			url: "${path}/reply2/insert.do",
			data: param,
			success: function(){
				alert("댓글이 등록되었습니다.");
				listReply();
				//listReply2(); //댓글 목록 출력
			}
		});
	});
});
	function listReply(){
		$.ajax({
			type: "get",
			url: "${path}/reply2/list.do?product_num=${dto.product_num}",
			success: function(result){
				//result : responseText 응답텍스트(html)
				$("#listReply").html(result);
			}
		});
	}
</script>

</head>
<body>
<%-- <%@ include file="../include/menu.jsp" %> --%>

<header id="fh5co-header" role="banner">
	<div class="container text-center">
		<div id="header">
			<h6><a href="${path}/main/home.do">D P M</a></h6>	
		</div>
		<nav>
			<ul >
				<li ><a href="${path}/main/menubar.do?product=best">Best</a></li>
				<li><a href="${path}/main/menubar.do?product=top">Top</a></li>
				<li><a href="${path}/main/menubar.do?product=pants">Pants</a></li>
				<li><a href="${path}/board/list.do">Review</a></li>
			</ul>
		</nav>
	</div>
		
</header>

 
<h2 align="center">상품정보</h2><br>

<table align="center">
  <tr>
     <td style="padding-right:40px;">
     <img src="${path}/resources/images/${dto.product_photo}" 
     width="300px" > </td>
     <td align="center">
              <form name="form1" method="post" action="${path}/shop/cart/insert.do" style="display: inline;">
       <table style="height:300px; width:400px;">
          
         <tr>
           <td style="width:20%" valign="top">상품명 <input type="hidden" name="product_num" id="product_num" value="${dto.product_num}"></td>
           <td colspan="3">${dto.product_name} </td>
         </tr>
         
         <tr>   
          <td valign="top">상품설명 </td>
           <td colspan="3">${dto.product_description} </td>  
         </tr>
         
         
         <tr>
          <td valign="top">사이즈 </td>
           <td colspan="3">${dto.product_option1} </td>
         </tr>
         
         <tr>
           <td>가격</td>
           <td><fmt:formatNumber value="${dto.product_price}" pattern="#,###" /> </td>
         	<td>수량</td>
         	<td>
         		<select name="amount">
		    	     <c:forEach begin="1" end="10" var="i">
			         <option value="${i}">${i}</option>
			         </c:forEach>
		         </select>
	         </td>
         </tr>
         <tr>
         	<td>사이즈</td>
         	<td>
	        <input type="hidden" name="product" value="6">
	           <select>
	           <c:forEach var="row" items="${op_list}">
				<option value="${row.product_option1}">${row.product_option1}</option>
	           </c:forEach>
				</select>
			</td>
         	<td>색상</td>
         	<td>
				 <select>
	               <c:forEach var="row" items="${op2_list}"> 
					<option value="${row.product_option2}">${row.product_option2}
					</c:forEach>
               </select>
         </td>
         </tr>

      
         
         <tr align="center">        
         </tr>
  
         <tr align="center">
          <td colspan="2" style="color: black">

         <input style="color: black" type="submit" value="장바구니에 담기">
               
          </td>
         </tr>        
       </table>
             </form>
     </td>
  </tr>
</table>
<br><br><br>

<h3 align="center">상품 이미지</h3>
<div class="product_picture" style="text-align: center;">
	<c:forEach var="row2" items="${picture_list}"> 
		<img src="${path}/resources/images/${row2.product_photoUrl}"><br><br>
	</c:forEach>
</div>


<div align="center">
<img src="${path}/resources/images/footer_inform.jpg">
</div>



<div align="center">
<div style="width:700px; align-content:center; text-align:center;">
 <c:if test="${sessionScope.userid != null }">
 	<textarea rows="5" cols="80" id="replytext"
 		placeholder="댓글을 작성하세요"></textarea>
 	<br>
 	<button type="button" id="btnReply">댓글쓰기</button>
  </c:if>
</div>
</div>
<!-- 댓글 목록 -->
<div align="center">
<div aldiv id="listReply"></div>
</div>
<footer id="fh5co-footer" role="contentinfo">
	<div class="container-fluid">
		<div class="footer-content">
			<div class="copyright" style="color: black"><small>&copy; 2020 DDO PING MALL. All Rights Reserved. <br></small></div>
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