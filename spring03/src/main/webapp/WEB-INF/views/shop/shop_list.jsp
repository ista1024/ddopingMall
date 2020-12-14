<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<h2>목록</h2>
<table border="1" width="500px">
	<tr>
	<th>게시물 번호</th>
	 <th>상품코드</th>
        <th>상품사진</th>
        <th>상품명</th>
        <th>가격</th>
        <th>상품 설명</th>
	</tr>
<c:forEach var="row" items="${list}"> 
    <tr align = "center">
    <td>${row.product_num}</td>
    <td>${row.product_code}</td>
    <td><img src="${path}/images/${row.product_main_photo}"
    width="100" height = "100"></td>
    <td> <a href = "${path }/shop/shop/detail/${row.product_num}">
    ${row.product_name }</a>
     <a href="${path}/shop/shop/edit/${row.product_num}">[편집]</a>
    </td>
    <td>
    <fmt:formatNumber value="${row.product_price}" pattern="#,###" /> </td>
    <td>${row.product_description}</td>
   </tr>
 </c:forEach>


</table>

</body>
</html>