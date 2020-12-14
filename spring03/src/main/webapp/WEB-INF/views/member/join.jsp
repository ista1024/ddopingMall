<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
</head>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Monoton&display=swap" rel="stylesheet">
<style>
	.btnHide{
		display: none;
	}
	
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
#form1{
	background-color: #F2F2F2;
	position: relative;
	z-index: 2;
	padding: 100px;
}
#btnjoin {
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
}
</style>
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
<script type="text/javascript">


$(function(){
	//$("#appendTest").click(function(data){
		//console.log(data);
    	//document.getElementById("appendTest").disabled = true;
    	//document.getElementById("appendTarget").innerHTML = "<input type='text' name='verifyNumber' id='verifyNumber' placeholder='인증번호를 입력하세요'><input type='hidden' name='verifyOrder' id='verifyOrder' value="data" readonly disabled>";
		/* var parenttbl = document.getElementById("emailAppend");
	    var newel = document.createElement('td');
	    var elementid = document.getElementsByTagName("td").length
	    newel.setAttribute('id', 'verifyNumber');
	    newel.innerHTML = "<input type='text' name='verifyNumber' placeholder='인증번호를 입력하세요'>";
	    parenttbl.appendChild(newel); */
    //});
	$("#sendEmailVerify").click(function(){
		var email = {
			"email" : document.getElementById("email").value,
			"textemail" : document.getElementById("textemail").value
		};
		$.ajax({
			type: "post",
			data: email,
			url: "${path}/member/generateEmailVerifyNumber.do",
			async: false,
			success: function(data){
				if(data.result == null) {
					alert("이메일 인증번호 생성에 실패했습니다 다시 시도해주세요");
				} else {
					alert("입력하신 이메일로 인증번호가 발송되었습니다.");
					document.getElementById("verifyNumber").disabled = false;
			    	document.getElementById("verifyNumber").classList.toggle("btnHide");
			    	document.getElementById("verifyOrder").value = data.result;
			    	document.getElementById("verifyOrder").disabled = false;
			    	document.getElementById("verifyOrder").classList.toggle("btnHide");
			    	document.getElementById("btnVerifyEmail").disabled = false;
			    	document.getElementById("btnVerifyEmail").classList.toggle("btnHide");
			    	document.getElementById("sendEmailVerify").disabled = true;
			    	document.getElementById("sendEmailVerify").readOnly = true;
			    	document.getElementById("email").readOnly = true;
			    	document.getElementById("textemail").readOnly = true;
			    	document.getElementById("select").readOnly = true;
				}
			}
		});
	});
	$("#btnVerifyEmail").click(function(){
		var verifyEmail = {
			"verifyOrder" : document.getElementById("verifyOrder").value,
			"verifyNumber" : document.getElementById("verifyNumber").value
		};
		console.log(verifyEmail);
		$.ajax({
			type: "post",
			data: verifyEmail,
			url: "${path}/member/emailVerifyCheck.do",
			async: false,
			success: function(data){
				if(data.result == -1) {
					alert("이메일 인증에 실패했습니다 다시 시도해주세요");
				} else {
					alert("이메일 인증이 완료되었습니다.");
					document.getElementById("verifyNumber").disabled = true;
					document.getElementById("btnVerifyEmail").disabled = true;
					document.getElementById("email_ver").value = 1;
				}
			}
		});
	});
	$("#aa").click(function(){
		var userid=$("#userid").val();
		if(userid==""){
		  alert("아이디를 입력하세요.");
		  $("#userid").focus();
		  return; //함수 종료	
		}
		var userid = document.getElementById("userid");
		var idPattern = /^[A-Za-z]{1}[A-Za-z0-9]{3,19}$/;
		if(idPattern.test(userid.value) != true){
			alert("아이디를 잘못 입력 하셨습니다.");
		      $("#userid").focus();
		      return;
	      }
	      else {
		      
		      
		$.ajax({
			type: "post",
			url: "${path}/member/idCheck.do",
			data: userid.value,
			dataType : "json",
			contentType: "application/json; charset=UTF-8",
			success: function(data){
				
					var ddddd = document.getElementById("ddd").value;
				if(data.rst == 0) {
					document.getElementById("aa").style.display = 'none';
					document.getElementById("userid").readOnly = true;
					ddddd=1;
					$("#ddd").val(data.result);
					alert("사용 가능한 아이디 입니다.");
				}else{
					alert("이미 사용중인 아이디 입니다.");
					ddddd=0;
					return;
					
				}
			}
		});
	      }
	});
	
	$("#btnjoin").click(function(){
		var postcode = document.getElementById("postcode").value;
		console.log(postcode);
		var userid=$("#userid").val();
		var passwd=$("#passwd").val();
		var name=$("#name").val();
		var hp=$("#hp").val();
		var hp2=$("#hp2").val();
		var hp3=$("#hp3").val();
		var email=$("#email").val();
		var textemail=$("#textemail").val();
		var postcode=$("#postcode").val();
		var address=$("#address").val();
		var detailAddress=$("#detailAddress").val();
		var extraAddress=$("#extraAddress").val();
		var email_ver=$("#email_ver").val();
	
		var aa=$("#aa").val();
		var ddd=$("#ddd").val();
		
		if(userid==""){
		  alert("아이디를 입력하세요.");
		  $("#userid").focus();
		  return; //함수 종료	
		}
		if(ddd == "0"){
			  alert("아이디 중복체크를 해주세요.");
			  $("#userid").focus();
			  return;
			}
		if(passwd==""){
		  alert("비밀번호를 입력하세요.");
		  $("#passwd").focus();
		  return;
		}
		
		if(name==""){
			  alert("이름를 입력하세요.");
			  $("#name").focus();
			  return;
			}
		if(hp==""){
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
		if(email==""){
			  alert("이메일를 입력하세요.");
			  $("#email").focus();
			  return;
			}
		if(textemail==""){
			  alert("이메일를 입력하세요.");
			  $("#textemail").focus();
			  return;
			}
		if(email_ver == "0"){
			  alert("이메일 인증을 해주세요.");
			  $("#email").focus();
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
	      var name = document.getElementById("name");
	      var hp = document.getElementById("hp");
	      var hp2 = document.getElementById("hp2");
	      var hp3 = document.getElementById("hp3");
	      var email = document.getElementById("email");
	   	  var texemail = document.getElementById("textemail"); 
	   	 
	      // 정규 표현식
	       /* var idPattern = /^[A-Za-z]{1}[A-Za-z0-9]{3,19}$/; */
		   var pwPattern = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
		   var nameCheck = /^[가-힣]{2,6}$/;
		   var hpExp = /^\d{2,3}$/; 
		   var hp2Exp = /^\d{3,4}$/;
		   var hp3Exp = /^\d{4}$/;
		   var emailPattern1 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z]){3,19}$/;
		   //var emailPattern1 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])$/i;
		    var emailPattern2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,20}$/i;
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

	      if(nameCheck.test(name.value) == true){
		         text += "이름 : " + name.value + "\n";
		      }
		      else {
			      alert("이름을 잘못 입력 하였습니다.");
			      $("#name").focus();
			      return;
		  }      
		  //전화번호
	      if(hpExp.test(hp.value) == true){
		         text += "hp : " + hp.value + "\n";
		      }
		      else {
			      alert("전화번호를 잘못 입력 하셨습니다.");
			      $("#hp").focus();
			      return;
		      }
	      if(hp2Exp.test(hp2.value) == true){
		         text += "hp2 : " + hp2.value + "\n";
		      }
		      else {
			      alert("전화번호를 잘못 입력 하셨습니다.");
			      $("#hp2").focus();
			      return;
		      }
	      if(hp3Exp.test(hp3.value) == true){
		         text += "hp3 : " + hp3.value + "\n";
		      }
		      else {
			      alert("전화번호를 잘못 입력 하셨습니다.");
			      $("#hp3").focus();
			      return;
		      }
	      // 이메일
	      if(emailPattern1.test(email.value) == true){
	        text += "EMAIL : " + email.value + "\n";
	      }
	      else {
		      alert("이메일을 잘못 입력 하셨습니다.");
	      	$("#email").focus();
	     	 return;
			}
	    if(emailPattern2.test(textemail.value) == true){
	        text += "EMAIL : " + textemail.value + "\n";
	      }
	      else {
		      alert("이메일을 잘못 입력 하셨습니다.");
	      	$("#textemail").focus();
	     	 return;
			} 
 	        alert('회원가입 되었습니다.'); // 입력정보출력
 	        
	 
	      // 이전에 입력했던 회원정보를 비우기 
	      if(count == 0+count){
	        text = [];
		      }
		//폼 데이터를 서버로 제출
		
		document.form1.action="${path}/member/join_check.do";
		document.form1.submit();
	});
});
</script>

<!-- 이메일 종류선택 스크립트 -->
<script>
    $(function() {
        $('#select').change(function() {
            if ($('#select').val() == 'directly') {
                $('#textemail').attr("disabled", false);
                $('#textemail').val("");
                $('#textemail').focus();
            } else {
                $('#textemail').val($('#select').val());
            }
        })
    });
</script>

<script type="text/javascript">
$(function() {
    $('#select2').change(function() {
        if ($('#select2').val() == 'directly') {
            $('#hp').attr("disabled", false);
            $('#hp').val("");
            $('#hp').focus();
        } else {
            $('#hp').val($('#select2').val());
        }
    })
});


</script>
<body>
<div id="wrapper">
<header id="fh5co-header" role="banner" style="text-align: center;">
			<div class="container text-center">
				<div id="header">
					<span><a href="${path}/main/home.do" style="font-size: 130px;">D P M</a></span>	
				</div>
			</div>
		</header>
<form name="form1" method="post" style="padding:30px; background-color: #F2F2F2;">
<h2 style="text-align: center; ">회원가입</h2>
<table  style="width: 450px; height: 600px; ">
  <tr>
    <td>아이디</td>
    <td>
    <input style="width: 100px; height: 30px;" name="userid" id="userid" autocomplete="off"><button style="height: 30px;" type="button" id="aa" name="aa">중복확인</button>
    <br>
    *영문 대소문자 최소 1글자가 포함된 3~19자리
    <span id="idcheck"></span><input type="hidden" name="ddd" id="ddd" value=0>
    </td>
  </tr>
  <tr>
    <td>비밀번호</td>
    <td><input style="height: 30px;" type="password" name="passwd" id="passwd"> 
    <br>
    *영문 대소문자, 숫자, 특수문자가 조합된 8~16자리</td>
  </tr>
  <tr>
    <td>이름</td>
    <td><input style="height: 30px;" name="name" id="name" autocomplete="off">
    <br>
    *한글만 입력 가능 2~6자리
     </td>
    
  </tr>
  <tr>
    <td>연락처</td>
    <td>
    <select id="select2" style="width: 60px; height: 20px;">
    	<option value="" disabled selected>선택</option>
    	<option value="010" id="010">010</option>
    	<option value="011" id="011">011</option>
    	<option value="017" id="017">017</option>
    	<option value="018" id="018">018</option>
        <option value="019" id="019">019</option>
        <option value="051" id="051">051</option>
        <option value="053" id="053">053</option>
        <option value="032" id="032">032</option>
        <option value="062" id="062">062</option>
        <option value="042" id="042">042</option>
        <option value="052" id="052">052</option>
        <option value="044" id="044">044</option>
        <option value="031" id="031">031</option>
        <option value="033" id="033">033</option>
        <option value="043" id="043">043</option>
        <option value="041" id="041">041</option>
        <option value="063" id="063">063</option>
        <option value="061" id="061">061</option>
        <option value="054" id="054">054</option>
        <option value="055" id="055">055</option>
        <option value="064" id="064">064</option>
        <option value="directly" id="textEmail">직접 입력하기</option>
    </select>
     <input autocomplete="off" style="width: 60px; height: 20px;" placeholder="02" name="hp" id="hp" >
     - <input style="width: 60px; height: 20px;" autocomplete="off" placeholder="1234" name="hp2" id="hp2"> - <input style="width: 60px; height: 20px;" autocomplete="off" placeholder="5678" name="hp3" id="hp3"></td>
  </tr>
  <tr id="emailAppend">
    <td>E-mail</td>
    <td>
    <input style="width: 100px;" type="text" name="email" id="email" value="" autocomplete="off" placeholder="이메일 입력"> 
    <span>@</span>
 	<input style="width: 85px;" name="textemail" id="textemail" autocomplete="off" placeholder="이메일 입력"> 
 	<select style="width: 60px;" id="select">
    	<option value="" disabled selected>E-mail 선택</option>
        <option value="naver.com" id="naver.com">naver.com</option>
        <option value="hanmail.net" id="hanmail.net">hanmail.net</option>
        <option value="gmail.com" id="gmail.com">gmail.com</option>
        <option value="nate.com" id="nate.com">nate.com</option>
        <option value="directly" id="textEmail">직접 입력하기</option>
    </select>
    <br>
    	<button type="button" id="sendEmailVerify" name="sendEmailVerify">이메일 인증</button>
    	<div id="appendTarget">
    		<input class="btnHide" type='number' name='verifyNumber' id='verifyNumber' autocomplete="off" placeholder='인증번호를 입력하세요' disabled><input class="btnHide" type='hidden' name='verifyOrder' id='verifyOrder' readonly disabled>
    		<button type='button' class="btnHide" id='btnVerifyEmail' name='btnVerifyEmail' disabled>인증</button>
    		<input type="hidden" name="email_ver" id="email_ver" value=0>
    	</div>
    </td>

  </tr> 
  <tr>
    <td>주소</td>
    <td>
<input style="height: 30px;" type="text" name="postcode" id="postcode" autocomplete="off" placeholder="우편번호">
<input style="height: 30px;" type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
<input style="width: 282px; height: 30px;" type="text" name="address" id="address" autocomplete="off" placeholder="주소"><br>
<input style="width: 146px; height: 30px;" type="text" name="detailAddress" id="detailAddress" autocomplete="off" placeholder="상세주소">
<input style="width: 130px; height: 30px;" type="text" name="extraAddress" id="extraAddress" autocomplete="off" placeholder="참고항목">
     </td>
  </tr>
  
  <tr>
    <td colspan="2" align="center">
      <input type="button" id="btnjoin" value="회원가입">
      </td>
      </tr>
  </table>
  </form>

</div>
</body>
</html>