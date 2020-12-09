<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
function shop_write(){
	var product_name=$("#product_name").val();
	var product_price=$("#product_price").val();
	var product_description=$("#product_description").val();
	if(product_name==""){
      //문자열 비교 : java는 a.equal(b), javascript는 a==b
	  alert("상품이름을 입력하세요");
	  $("#product_name").focus();//입력포커스 이동
	  return; //리턴값 없이 함수 종료    
	}
	if(price==""){
		alert("가격을 입력하세요");
		$("#product_price").focus();
		return;
	}
/* 	if(description==""){
		alert("상품 설명을 입력하세요");
		$("#description").focus();
		return;
	} */
	//폼 데이터 처리 주소
	document.form1.action="${path}/admin/product_insert.do";
	document.form1.submit();
}
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>상품 등록</h2>
<form name="form1" method="post" 
enctype="multipart/form-data">
<table>
  <tr> 
     <td>상품명 </td>
     <td><input name="product_name" id="product_name"> </td>
  </tr>
  <tr>
     <td>가격 </td>
     <td><input name="price" id="price"> </td>
  </tr>
  <tr>
  	<td>상품 코드</td>
  	 <td><input name="product_code" id="product_code" 
     value="${dto.product_code}"> </td>
  </tr>
  <tr>
    <td>상품설명 </td>
    <td><textarea rows="5" cols="60" name="product_description" id="product_description">
    </textarea> </td>
  </tr>
  <tr>
    <td>상품이미지 </td>
    <td><input type="file" name="file1" id="file1"> </td>
  </tr>
  <tr>
    <td colspan="2" align="center">
    <input type="button" value="등록" onclick="shop_write()">
    <input type="button" value="목록" 
    onclick="location.href='${path}/shop/shop/list.do'">
    </td>
  </tr>
</table>






</form>
</body>
</html>