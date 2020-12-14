<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Monoton&display=swap" rel="stylesheet">
		
<style type="text/css">
a:visited {
   text-decoration: underline;
   color: black;}
a:link {text-decoration: none; color: ; }
a:hover {
   text-decoration:none;  color: underlblack;
   }

* {
    box-sizing: border-box;
}
body{
	padding-top : 100px;
	justify-content: center; 
	display: flex; 
	 
	text-align: center;
	
	/* line-height: 50px; */
	background: #F2F2F2;
	}
#header span {
	font-family: 'Monoton', cursive;
	color: white;
}

#wrapper {
align-items: center;
height: 100vh; 
}


#form1{
background: white;
position: relative;
z-index: 2;
}

#userid{
width: 100%; 
padding: 20px 10px 10px; 
border: none;
border-bottom: 1px solid black; 
background-color: transparent; 
outline: none;
cursor: pointer; 
}

#passwd{
width: 100%; 
padding: 20px 10px 10px; 
border: none;
border-bottom: 1px solid black; 
background-color: transparent; 
outline: none;
cursor: pointer;
}

#caption {
margin-top: 20px;
text-align: center;
}
#caption a {
font-size: 15px;
color: black;
text-decoration: none;
}

#btnLogin {
width: 100%; height: 50px;
background: black;
opacity: 0.5;
color: gray;
font-size: 20px;
border: none;
border-radius: 25px; 
cursor: pointer;
outline: none;
color: white;
}

</style>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
$(function(){
	$("#btnLogin").click(function(){
		var userid=$("#userid").val();
		var passwd=$("#passwd").val();
		if(userid==""){
		  alert("아이디를 입력하세요.");
		  $("#userid").focus();
		  return; //함수 종료	
		}
		if(passwd==""){
		  alert("비밀번호를 입력하세요.");
		  $("#passwd").focus();
		  return;
		}
		//폼 데이터를 서버로 제출
		document.form1.action="${path}/member/login_check.do";
		document.form1.submit();
	});

});


</script>


</head>
<body>
<div id="wrapper">
<header id="fh5co-header" role="banner">
			<div class="container text-center">
				<div id="header">
					<span><a href="${path}/main/home.do" style="font-size: 130px;">D P M</a></span>	
				</div>
			</div>
		</header>



<form id="form1" name="form1" method="post" style="padding:50px; background-color: white;">
	
		
	<h2 align="center">로그인</h2>
<table >
	
  <tr>
    <td style="width: 400px;"><input placeholder= "USER ID" autocomplete="off" name="userid" id="userid"> </td>
  </tr>
  <tr>
    <td style="width: 400px;"><input placeholder="PASSWORD" type="password" name="passwd" id="passwd"> </td>
  </tr>
  <br>
  <tr>
    <td colspan="2" align="center">
    <br>
      <input type="button" id="btnLogin" value="로그인">
      <c:if test="${param.message == 'nologin' }">
        <div style="color: red;">
          로그인 하신 후 사용하세요.
        </div>
      </c:if>
      <c:if test="${message == 'error'}">
        <div style="color: red;">
          아이디 또는 비밀번호가 일치하지 않습니다.
        </div>
      </c:if>
      <c:if test="${message == 'logout' }">
        <div style="color:blue;">
          로그아웃 처리되었습니다.
        </div>
      </c:if>
    </td>
  </tr>
</table>

<br><br>
<div id="caption">
<a href="${path}/member/join.do">회원가입</a> |
<a href="${path}/member/idFind.do">아이디 찾기</a> |
<a href="${path}/member/passwdFind.do">비밀번호 찾기</a>
</div>

</form>
</div>
</body>
</html>