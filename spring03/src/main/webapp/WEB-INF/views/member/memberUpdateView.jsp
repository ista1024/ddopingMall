<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Monoton&display=swap" rel="stylesheet">
<title>Insert title here</title>
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
	justify-content: center; 
	display: flex; 
	 
	text-align: ;
	
	/* line-height: 50px; */
	background: white;
	
	}

	#header span {
	font-family: 'Monoton', cursive;
	color: white;
}
#form2{
	background-color: #F2F2F2;
	position: relative;
	z-index: 2;
	padding: 100px;
}
#btnupdate {
width: 60%; height: 40px;
background: black;
opacity: 0.5;
color: gray;
font-size: 20px;
border: none;
border-radius: 25px; 
cursor: pointer;
outline: none;
color: white;
margin-top: 25px; 
}




</style>
<%@ include file="../include/header.jsp" %>
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
<script>
$(function(){
	
	$("#btnupdate").click(function(){
		var postcode = document.getElementById("postcode").value;
		console.log(postcode);
		var userid=$("#userid").val();
		var passwd=$("#passwd").val();
		var postcode=$("#postcode").val();
		var address=$("#address").val();
		var detailAddress=$("#detailAddress").val();
		var extraAddress=$("#extraAddress").val();
	
	
		if(passwd==""){
		  alert("비밀번호를 입력하세요.");
		  $("#passwd").focus();
		  return;
		}
	
		if(postcode==""){
			  alert("주소를 입력하세요.");
			  $("#postcode").focus();
			  return;
			}
		if(address==""){
			  alert("주소를 입력하세요.");
			  $("#address").focus();
			  return;
			}
		if(detailAddress==""){
			  alert("상세주소를 입력하세요.");
			  $("#detailAddress").focus();
			  return;
			}
		if(extraAddress==""){
			  alert("참고항목를 입력하세요.");
			  $("#extraAddress").focus();
			  return;
			}
		
		
		var text = "";
	    var count = 0;
		count++; // 배열 비우기 위한 변수
	      // DOM 객체 찾기
	      /* var userid = document.getElementById("userid"); */
	      var passwd = document.getElementById("passwd");
	   	 
	      // 정규 표현식
	       /* var idPattern = /^[A-Za-z]{1}[A-Za-z0-9]{3,19}$/; */
		   var pwPattern = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
		   //var emailPattern1 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])$/i;
 	      // 아이디
 	     /*  if(idPattern.test(userid.value) == true){
	        text += "ID : " + userid.value + "\n";
	      }
	      else {
		      alert("아이디를 잘못 입력 하셨습니다.");
		      $("#userid").focus();
		      return;
	      } */
	      // 패스워드 
	      if(pwPattern.test(passwd.value) == true){
	         text += "PW : " + passwd.value + "\n";
	      }
	      else {
		      alert("패스워드를 잘못 입력 하셨습니다.");
		      $("#passwd").focus();
		      return;
	      }
	 
	      // 이전에 입력했던 회원정보를 비우기 
	      if(count == 0+count){
	        text = [];
		      }
		//폼 데이터를 서버로 제출
		alert("수정되었습니다.");
		document.form2.action="${path}/member/memberUpdate.do";
		document.form2.submit();
	});
});
</script>

<script type="text/javascript">


</script>


</head>

<body>

<div id="wrapper">
<header id="fh5co-header" role="banner" style="text-align: center;">
			<div class="container text-center">
				<div id="header">
					<span><a href="${path}/main/home.do" style="font-size: 130px;">D P M</a></span>	
				</div>
			</div>
		</header>
		<section id="" style="line-height: 50px;">
			<form name="form2" id="form2" method="post" style="padding:30px; ">
			<h2 style="text-align: center; margin-top: 5px; margin-bottom: 35px;">내정보
			
			</h2>
			
				<div class="" >
					<label style="font-size: 20px;" class="control-label" for="userid">아이디 : ${sessionScope.userid}</label>
					<input name="userid" value="${sessionScope.userid}" hidden="">
					</div>
				<div class="">
					<label style="font-size: 20px;" class="control-label" for="Passwd">비밀번호 : </label>
					<input style="font-size: 20px; border: none; background-color: transparent; width: 130px; " 
					class="form-control" type="password" id="passwd" name="passwd" value="${sessionScope.passwd}" />
				</div>
				<div class="">
					<label style="font-size: 20px;" class="control-label" for="name">성명 : ${sessionScope.name}</label>
					
				</div>
				<div class="">
					<label style="font-size: 20px;" class="control-label" for="hp">연락처 : ${sessionScope.hp}-${sessionScope.hp2}-${sessionScope.hp3}</label>
				</div>
				
				<div>
					<label style="font-size: 20px;" class="control-label" for="email">이메일 : ${sessionScope.email}@${sessionScope.textemail}</label>
					
				</div>
				<div class="" style="line-height: 32px">
					<label style="font-size: 20px; height: 30px;" class="control-label" for="addr">주소 : </label>
					<input style="font-size: 15px; border: 0.5px solid #606060; background-color: transparent; width: 150px; height: 30px;" 
					class="form-control" type="text" id="postcode" name="postcode" value="${sessionScope.postcode}"/>
					<input style="" type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
					<input style="font-size: 15px; border: 0.5px solid #606060; background-color: transparent; width: 354px; height: 30px;" 
					class="form-control" type="text" id="address" name="address" value="${sessionScope.address}"/><br>
					<input style="font-size: 15px; border: 0.5px solid #606060; background-color: transparent; width: 150px; height: 30px;" 
					class="form-control" type="text" id="detailAddress" name="detailAddress" value="${sessionScope.detailAddress}"/>
					<input style="font-size: 15px; border: 0.5px solid #606060; background-color: transparent; width: 198px; height: 30px;" 
					class="form-control" type="text" id="extraAddress" name="extraAddress" value="${sessionScope.extraAddress}"/>
				</div>
				<div class="aa">
					<label style="font-size: 15px;" class="control-label" for="hp">회원가입일자 : <fmt:formatDate value='${sessionScope.join_date}' pattern='yy.MM.dd' />
					</label>
				</div>
				<div class="btnupdate" style="text-align: center;">
					 <button id="btnupdate">회원정보수정</button>
					 <h5 style="margin-bottom:5px; margin-top: 3px; font-size: 11px; color: red;"> 비밀번호, 주소만 수정 가능합니다. 관리자에 문의바랍니다.</h5>
				</div>
			</form>
		</section>
		<%-- <form action="${path}/main/home.do">
		<div>
		<button  type="submit">ㅁㄴㅇㅁㄴㅇ</button>
		</div>
		</form> --%>
		</div>
	</body>
</html>