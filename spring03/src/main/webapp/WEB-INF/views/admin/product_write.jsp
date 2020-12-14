<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			function product_write(){
				var product_name=$("#product_name").val();
				var product_code=$("#product_code").val();
				var product_price=$("#product_price").val();
				var product_amount=$("#product_amount").val();
				if(product_name==""){
					//문자열 비교 : java는 a.equal(b), javascript는 a==b
					alert("상품이름을 입력하세요");
					$("#product_name").focus();//입력포커스 이동
					return; //리턴값 없이 함수 종료
				}
				if(product_code==""){
					alert("코드을 입력하세요");
					$("#product_code").focus();
					return;
				}
				if(product_price==""){
					alert("가격을 입력하세요");
					$("#product_price").focus();
					return;
				}
				if(product_amount==""){
					alert("수량을 입력하세요");
					$("#product_amount").focus();
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
	
		<%@ include file="../include/admin_menu.jsp" %>
		<!-- END #fh5co-header -->
		
		<form name="form1" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td colspan="2"><h2>상품 등록</h2></td>
				</tr>
				<tr> 
					<td>상품명</td>
					<td><input name="product_name" id="product_name"></td>
				</tr>
				<tr>
					<td>상품 코드</td>
					<td><input name="product_code" id="product_code" value="${dto.product_code}"></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type="number" name="product_price" id="product_price"></td>
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
					<td><input name="product_option1" id="product_option1"></td>
				</tr>
				<tr>
					<td>색상</td>
					<td><input name="product_option2" id="product_option2"></td>
				</tr>
				<tr>
					<td>수량</td>
					<td><input type="number" name="product_amount" id="product_amount"></td>
				</tr>
				<tr>
					<td>상품설명</td>
					<td><textarea rows="5" cols="60" name="product_description" id="product_description"></textarea>
						<script>
							CKEDITOR.replace("product_description", {
								filebrowserUploadUrl : "${path}/imageUpload.do"
							});
						</script>
					</td>
				</tr>
				<tr>
					<td>상품사진</td>
					<td><input type="file" name="file1" id="file1"></td>
				</tr>
				<tr>
					<td>메인 페이지 사진</td>
					<td><input type="file" name="file2" id="file2"></td>
				</tr>
				<tr>
					<td>추가 사진들</td>
					<td><input type="file" name="file3" id="file3"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="button" value="등록" onclick="product_write()">
					<input type="button" value="목록" onclick="location.href='${path}/main/home.do'">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>