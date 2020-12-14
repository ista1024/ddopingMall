<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
.listResult { padding:20px; background:#eee; }
.listResult .sum { float:left; width:45%; font-size:22px; }

.listResult .orderOpne { float:right; width:45%; text-align:right; }
.listResult .orderOpne button { font-size:18px; padding:5px 10px; border:1px solid #999; background:#fff;}
.listResult::after { content:""; display:block; clear:both; }

.orderInfo { border:5px solid #eee; padding:20px; display:none;}
.orderInfo .inputArea { margin:10px 0; }
.orderInfo .inputArea label { display:inline-block; width:120px; margin-right:10px; }
.orderInfo .inputArea input { font-size:14px; padding:5px; }
#userAddr2, #userAddr3 { width:250px; }

.orderInfo .inputArea:last-child { margin-top:30px; }
.orderInfo .inputArea button { font-size:20px; border:2px solid #ccc; padding:5px 10px; background:#fff; margin-right:20px;}
.orderInfo .inputArea #sample2_address { width:230px; }
.orderInfo .inputArea #sample2_detailAddress { width:280px; }
.orderInfo .inputArea #sample2_extraAddress { display:none; }
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
<script type="text/javascript">
$(function(){
	$("#btnList").click(function(){
		//장바구니 목록 이동
		location.href="${path}/shop/shop/list.do";
	});
	$("#btnDelete").click(function(){
		if(confirm("장바구니를 비우시겠습니까?")){
			location.href="${path}/shop/cart/deleteAll.do";
		}
	});
});
</script>
</head>
<body>
<h2 align="center">장바구니</h2>
<c:choose>
  <c:when test="${map.count == 0}">
    장바구니가 비었습니다.
  </c:when>
  <c:otherwise>
    <form name="form1" method="post" 
    action="${path}/shop/cart/update.do">
      <table border="1" align="center">
        <tr align="center">
          <th>상품명 </th>
          <th>단가 </th>
          <th>수량 </th>
          <th>금액 </th>
          <th>&nbsp; </th>
        </tr>
        <c:set var="sum" value="0" />
      <c:forEach var="row" items="${map.list}">
        <tr align="center">
          <td>${row.product_name} </td>
          <td>${row.price} </td>
          <td><input type="number" name="amount" value="${row.amount}">
              <input type="hidden" name="cart_id" value="${row.cart_id}">
          </td>
          <td>${row.money} </td>
          <td><c:if test="${sessionScope.userid != null }"> 
          		<a href="${path}/shop/cart/delete.do?cart_id=${row.cart_id}">삭제</a>
         	  </c:if>  
          </td>
        </tr>
        <c:set var="sum" value="${sum + (cart_List.gdsPrice * cart_List.cartStock)}" />
      </c:forEach> 
        <tr>
          <td colspan="5" align="right">
            <button id="btnUpdate">수정</button>
            <button type="button" id="btnDelete">장바구니 지우기</button><br>
          </td>
        </tr>
      </table>
    </form>
  </c:otherwise>
</c:choose>
<button type="button" id="btnList">상품목록</button>
<div class="listResult">
   <div class="sum">
     장바구니 금액 합계 : ${map.sumMoney} <br>
     배송료 : ${map.fee} <br>
     총 합계 : ${map.sum} 원
   </div>
   <div class="orderOpne">
  <button type="button" class="orderOpne_bnt">주문 정보 입력</button>
  <script>
 $(".orderOpne_bnt").click(function(){
  $(".orderInfo").slideDown();
  $(".orderOpne_bnt").slideUp();
 });      
</script>
 </div>
 <div class="orderInfo">
 <form role="form" method="post" autocomplete="off" action="${path}/shop/cart/buy.do">
  <input type="hidden" name="amount" value="${map.sum}" />
  <input type="hidden" name="userid" value="${sessionScope.userid}" />
  <div class="inputArea">
   <label for="">수령인</label>
   <input type="text" name="name" id="name" readonly value="${sessionScope.name}"/>
  </div>
  <div class="inputArea">
   <label for="orderPhon">수령인 연락처</label>
   <input type="text" name="orderPhon" id="orderPhon" readonly value="${sessionScope.hp}-${sessionScope.hp2}-${sessionScope.hp3}" />
  </div>
  
  <div class="inputArea">
   <label class="control-label" for="addr">주소</label><br>
   <input type="text" id="postcode" name="postcode" value="${sessionScope.postcode}"/>
   <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
   <input type="text" id="address" name="address" value="${sessionScope.address}"/><br>
   <input type="text" id="detailAddress" name="detailAddress" value="${sessionScope.detailAddress}"/>
   <input type="text" id="extraAddress" name="extraAddress" value="${sessionScope.extraAddress}"/>
  </div>
  
    <div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
				
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>
  <div class="inputArea">
   <button type="submit" class="order_btn">주문</button>
   <button type="button" class="cancel_btn">취소</button> 
   <script>
$(".cancel_btn").click(function(){
 $(".orderInfo").slideUp();
 $(".orderOpne_bnt").slideDown();
});      
</script>
  </div>
 </form> 
</div>
</div>
</body>
</html>