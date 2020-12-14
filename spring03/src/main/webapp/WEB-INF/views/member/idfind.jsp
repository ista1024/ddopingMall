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
	padding-top :100px;
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


#form2{
background: white;
position: relative;
z-index: 2;
}

#name{
width: 66%; 
padding: 20px 1px 10px; 
border: none;
border-bottom: 1px solid black; 
background-color: transparent; 
outline: none;
cursor: pointer; 
}

#hp{
width: 20%; 
padding: 20px 1px 10px; 
border: none;
border-bottom: 1px solid black; 
background-color: transparent; 
outline: none;
cursor: pointer;
}
#hp2{
width: 20%; 
padding: 20px 1px 10px;  
border: none;
border-bottom: 1px solid black; 
background-color: transparent; 
outline: none;
cursor: pointer;
}
#hp3{
width: 20%; 
padding: 20px 1px 10px; 
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

#btnFind {
width: 50%; height: 50px;
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
	$("#btnFind").click(function(){
		var name=$("#name").val();
		var hp=$("#hp").val();
		var hp2=$("#hp2").val();
		var hp3=$("#hp3").val();
		if(name==""){
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
		
		document.form2.action="${path}/member/idFindCheck.do";
		document.form2.submit();
		
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

<form id="form2" name="form2" method="post" style="padding:100px 0px; background-color: white;">
<h2>아이디 찾기</h2>
<table>
<tr>
  <td style="white: 400px;"><input placeholder="NAME" autocomplete="off" name="name" id="name"></td>
</tr>
<tr>
  <td style="white: 133px;"><input autocomplete="off" placeholder="010" name="hp" id="hp"> 
  - <input autocomplete="off" placeholder="0000" name="hp2" id="hp2"> 
  - <input autocomplete="off" placeholder="0000" name="hp3" id="hp3"></td>
</tr>

<tr>
  <td colspan="2" align="center">
  <br><br>
  	<input type="button" id="btnFind" value="찾기">
  
  </td>
</tr>



</table>

</form>
</div>
</body>
</html>