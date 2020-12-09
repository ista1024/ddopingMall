<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>

<script type="text/javascript">
$(function(){
	$("#btnFind").click(function(){
		var userid=$("#userid").val();
		var name=$("#name").val();
		var hp=$("#hp").val();
		var hp2=$("#hp2").val();
		var hp3=$("#hp3").val();
		
		if(userid==""){
			alert("아이디을 입력하세요.")
			$("#userid").focus();
			return;
		}if(name==""){
			alert("이름을 입력하세요.")
			$("#name").focus();
			return;
		}if(hp==""){
			alert("전화번호를 입력하세요.");
			$("#hp").focus();
			return;
			}
		if(hp2==""){
			alert("전화번호를 입력하세요.");
			$("#hp2").focus();
			return;
			}
		if(hp3==""){
			alert("전화번호를 입력하세요.");
			$("#hp3").focus();
			return;
			}
		document.form.action="${path}/member/passwdFindCheck.do";
		document.form.submit();
		
	});
});



</script>

</head>
<body>

<%@ include file="../include/menu.jsp" %>
<h2>비밀번호 찾기</h2>
<form name="form" method="post">
<table border="1" width="400px">
<tr>
  <td>아이디</td>
  <td><input name="userid" id="userid"></td>
</tr>
<tr>
  <td>이름</td>
  <td><input name="name" id="name"></td>
</tr>
<tr>
  <td>전화번호</td>
  <td><input name="hp" id="hp"> - <input name="hp2" id="hp2"> - <input name="hp3" id="hp3"></td>
</tr>
<tr>
  <td colspan="2" align="center">
  	<input type="button" id="btnFind" value="찾기">
  
  </td>
</tr>



</table>

</form>
</body>
</html>