<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>D P M Admin</title>
		<%@ include file="../include/header.jsp" %>
		<script src="${path}/resources/ckeditor/ckeditor.js"></script>
		<style type="text/css">
			table {
				margin-left: auto;
				margin-right: auto;
			}
			table td {
				padding-bottom: 10px;
			}
		</style>
		<script type="text/javascript">
			function shop_delete(){
			 	if(confirm("정말 삭제하시겠습니까?")){//상품 삭제
					document.form1.action="${path}/admin/product_delete.do";
					document.form1.submit();
				}
			}
			function shop_update(){//상품 수정
				var product_name=$("#product_name").val();
				var product_price=$("#product_price").val();
				var product_description=$("#product_description").val();
				if(product_name==""){
				//문자열 비교 : java는 a.equal(b), javascript는 a==b
				alert("상품이름을 입력하세요");
				$("#product_name").focus();//입력포커스 이동
				return; //리턴값 없이 함수 종료
				}
				if(product_price==""){
					alert("가격을 입력하세요");
					$("#product_price").focus();
					return;
				}
				document.form1.action="${path}/shop/shop/update.do";
				document.form1.submit();
			}
		</script>
	</head>
	<body>
		<%@ include file="../include/admin_menu.jsp" %>
		<!-- END #fh5co-header -->
		
		<form name="form1" method="post" enctype="multipart/form-data">
		<input type="hidden" name="product_num" id="product_num" value="${dto.product_num}">
			<table>
				<tr>
					<td colspan="2"><h2>상품 등록</h2></td>
				</tr>
				<tr> 
					<td>상품명</td>
					<td><input name="product_name" id="product_name" value="${dto.product_name}"> </td>
				</tr>
				<tr>
					<td>상품 코드</td>
					<td><input name="product_code" id="product_code" value="${dto.product_code}"> </td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type="number" name="product_price" id="product_price" value="${dto.product_price}"> </td>
				</tr>
				<tr>
					<td>타입</td>
					<td>
						<select name="product_type" id="product_type">
							<option value="top">top</option>
							<option value="pants">pants</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>사이즈</td>
					<td><input name="product_option1" id="product_option1" value="${dto.product_option1}"></td>
				</tr>
				<tr>
					<td>색상</td>
					<td><input name="product_option2" id="product_option2" value="${dto.product_option2}"></td>
				</tr>
				<tr>
					<td>수량</td>
					<td><input type="number" name="product_amount" id="product_amount" value="${dto.product_amount}"></td>
				</tr>
				<tr>
					<td>상품설명</td>
					<td><textarea rows="5" cols="60" name="product_description" id="product_description">${dto.product_description}</textarea>
						<script>
							CKEDITOR.replace("product_description", {
								filebrowserUploadUrl : "${path}/imageUpload.do"
							});
						</script>
					</td>
				</tr>
				<tr>
					<td>상품사진</td>
					<td>
						<img src="${path}/resources/images/${dto.product_photo}" width="300px"><br> 
						<input type="file" name="file1" id="file1">
					</td>
				</tr>
				<tr>
					<td>메인 페이지 사진</td>
					<td>
						<img src="${path}/resources/images/${dto.product_main_photo}" width="300px"><br> 
						<input type="file" name="file2" id="file2">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="hidden" name="product_num" value="${dto.product_num}">
						<input type="button" value="수정" onclick="shop_update()">
						<input type="button" value="삭제" onclick="shop_delete()">
						<input type="button" value="목록" onclick="location.href='${path}/main/home.do'">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>