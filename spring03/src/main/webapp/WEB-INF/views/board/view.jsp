<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- views/board/view.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="${path}/include/js/common.js"></script>
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
 <!-- ckeditor의 라이브러리 -->
<script src="${path}/resources/ckeditor/ckeditor.js"></script>
<script>
$(function(){ //자동으로 실행되는 코드
	//댓글 목록 출력
	//listReply();
	listReply();
	
	//댓글 쓰기
	$("#btnReply").click(function(){
		var replytext=$("#replytext").val(); //댓글 내용
		var bno="${dto.bno}"; //게시물 번호
		var param={ "replytext": replytext, "bno": bno};
		//var param="replytext="+replytext+"&bno="+bno;
		$.ajax({
			type: "post",
			url: "${path}/reply/insert.do",
			data: param,
			success: function(){
				alert("댓글이 등록되었습니다.");
				//listReply();
				listReply(); //댓글 목록 출력
			}
		});
	});
	
	$(".fileDrop").on("dragenter dragover",function(e){
		//기본 효과 막음
		e.preventDefault();
	});
	$(".fileDrop").on("drop",function(e){
		e.preventDefault();
		//첫번째 첨부파일
		var files=e.originalEvent.dataTransfer.files;
		var file=files[0];
		//폼 데이터에 첨부파일 추가
		var formData=new FormData();
		formData.append("file",file);
		$.ajax({
			url: "${path}/upload/uploadAjax",
			data: formData,
			dataType: "text",
			processData: false,
			contentType: false,
			type: "post",
			success: function(data){
				//console.log(data);
				//data : 업로드한 파일 정보와 Http 상태 코드
				var fileInfo=getFileInfo(data);
				//console.log(fileInfo);
				var html="<a href='"+fileInfo.getLink+"'>"+
					fileInfo.fileName+"</a><br>";
				html += "<input type='hidden' class='file' value='"
					+fileInfo.fullName+"'>";
				$("#uploadedList").append(html);
			}
		});
	});
	
	
	//목록 버튼
	$("#btnList").click(function(){
		location.href="${path}/board/list.do";
	});
	$("#btnRecommend").click(function(){
	    if(confirm("해당 글을 추천하시겠습니까?")){
	        document.form1.action="recommend.do";
	        document.form1.submit();
	        
	        alert("해당 글을 추천하였습니다.")
	        
	        }
	    });
	//수정 버튼
	$("#btnUpdate").click(function(){
		//첨부파일 이름들을 폼에 추가
		var str="";
		$("#uploadedList .file").each(function(i){
//#id이름(공백).클래스이름 : id가 uploadeList인 태그의 자식태그 중에서 class가 file인 태그들
			str+="<input type='hidden' name='files["+i+"]' value='"+$(this).val()+"'>";
		});
		$("#form1").append(str);
		document.form1.action="${path}/board/update.do";
		document.form1.submit();
	});
	//삭제 버튼
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
			document.form1.action="${path}/board/delete.do";
			document.form1.submit();
		}
	});
	
	listAttach();
	
	//첨부파일 삭제
	//id가 uploadedList인 태그의 class가 file_del인 태그 클릭
	$("#uploadedList").on("click",".file_del",function(e){
		var that=$(this); //클릭한 태그
//data: {fileName: $(this).attr("data-src") },		
		$.ajax({
			type: "post",
			url: "${path}/upload/deleteFile",
			data: "fileName="+	$(this).attr("data-src"),		
			dataType: "text",
			success: function(result){
				if(result=="deleted"){
					//화면에서 태그 제거
					that.parent("div").remove();
				}
			}
		});
	});
	$("#btnSave").click(function(){
		var str="";
		// uploadedList 내부의 .file 태그 각각 반복
		$("#uploadedList .file").each(function(i){
			console.log(i);
			//hidden 태그 구성
			str += "<input type='hidden' name='files["+i+"]' value='" + $(this).val()+"'>";
		});
		//폼에 hidden 태그들을 붙임
		$("#form1").append(str);
		document.form1.submit();
	});
	
});
//댓글 목록 출력 함수
function listReply(){
	$.ajax({
		type: "get",
		url: "${path}/reply/list.do?bno=${dto.bno}",
		success: function(result){
			//result : responseText 응답텍스트(html)
			$("#listReply").html(result);
		}
	});
}
//타임스탬프값(숫자형)을 문자열 형식으로 변환
function changeDate(date){
	date = new Date(parseInt(date));
	year=date.getFullYear();
	month=date.getMonth();
	day=date.getDate();
	hour=date.getHours();
	minute=date.getMinutes();
	second=date.getSeconds();
	strDate = 
		year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
	return strDate;
}
//첨부파일 리스트를 출력하는 함수
function listAttach(){
	$.ajax({
		type: "post",
		url: "${path}/board/getAttach/${dto.bno}",
		success: function(list){
// Controller에서 List<String>타입으로 넘어온 값을 처리하기 위해 json으로 처리
			// list : json
			//console.log(list);
			$(list).each(function(){
				var fileInfo=getFileInfo(this);
				//console.log(fileInfo);
				var html="<div><a href='"+fileInfo.getLink+"'>"
					+fileInfo.fileName+"</a>&nbsp;&nbsp;";
				<c:if test="${sessionScope.userid == dto.userid}">	
				html+="<a href='#' class='file_del' data-src='"
					+this+"'>[삭제]</a></div>";
			</c:if>
			$("#uploadedList").append(html);
		});
	}
});
}


</script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap');
.fileDrop {
width: 600px;
height: 100px;
border: 1px dotted gray;
background-color: gray;
}

h2{
text-align: center; margin: 0 auto;
}
#main{
height: 45%; width: 40%;
text-align: center; margin: 0 auto;
}
#i1{
height: 20px; width: 20px;
}
.sujeong{
text-align:right; padding-right: 200px;
}
#sub1{
text-align: center; margin: 0 auto;
}
#d1{
text-align: center; margin: 0 auto;
}
#read1{
text-align: center; margin: 0 auto;
}
#btn1{
text-align: center; margin: 0 auto;
}
#btnRecommend{
background-color: white; color: black; font-family: 'Gamja Flower', cursive;
}
#btnList{
ckground-color: white; color: black; font-family: 'Gamja Flower', cursive;
}

</style>


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
<br>
<div>
<h2>${dto.subject}</h2>
<div id="read1" style="float: ri">조회수 : ${dto.readcount}	</div>

<form id="form1" name="form1" method="post"
action="${path}/board/insert.do">
<div id="sub1">제목 <input name="subject" id="subject" size="70"
				value="${dto.subject}"
				placeholder="제목을 입력하세요">
</div>
<div id="main">
	<textarea id="content" name="content"rows="3" cols="80" 
	placeholder="내용을 입력하세요">${dto.content}</textarea>
<script>
//ckeditor 적용
CKEDITOR.replace("content",{
filebrowserUploadUrl: "${path}/imageUpload.do",
height: "80%"
});
</script>
</div>
<br>


<!-- 수정,삭제에 필요한 글번호를 hidden 태그에 저장 -->	
<input type="hidden" name="bno" value="${dto.bno}">
<!-- 본인만 수정,삭제 버튼 표시 -->
<div>
	<div class="sujeong" align="right" style="padding-right: 500px;">
	<c:if test="${sessionScope.userid == dto.userid}">
	<button type="button" id="btnUpdate">수정</button>
	<button type="button" id="btnDelete">삭제</button>
	</c:if>
	</div> 
  <div id="btn1">
	<button type="button" id="btnList">목록</button>
	<button type="button" id="btnRecommend"><img id="i1"alt="" src="${path}/resources/images/ddabong.jpg">추천 &nbsp;${dto.recommend}</button>
</div>
</div>
</form>
<br>
<br>
</div>
<!-- 댓글 작성 -->
<div id="d1">
 <c:if test="${sessionScope.userid != null }">
 	<textarea rows="5" cols="80" id="replytext"
 		placeholder="댓글창"></textarea>
 	<br>
 	<button type="button" id="btnReply">댓글 작성</button>
 </c:if>
</div>
<!-- 댓글 목록 -->
<div  id="listReply"></div>
<footer id="fh5co-footer" role="contentinfo">
	<div class="container-fluid">
		<div class="footer-content">
			<div class="copyright"><small>&copy; 2020 DDO PING MALL. All Rights Reserved. <br></small></div>
				<div class="social">
					<a href="#"><i class="icon-facebook3"></i></a>
					<a href="https://www.instagram.com/lee_jae_hyounggggg/"><i class="icon-instagram2"></i></a>
					<a href="#"><i class="icon-youtube"></i></a>
				</div>
		</div>
	</div>
</footer>
</body>
</html>
	