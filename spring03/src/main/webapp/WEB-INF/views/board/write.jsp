<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="${path}/include/js/common.js"></script>
<script src="${path}/resources/ckeditor/ckeditor.js"></script>
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
<script type="text/javascript">
$(function(){
	$("#btnSave").click(function(){
		var subject=$("subject").val();
		var content=$("content").val();
		var str="";
		
		$("#uploadedList .file").each(function(i){
			console.log(i);
			//hidden 태그 구성 
			str += "<input type='hidden' name='files["+i+"]' value='" + $(this).val()+"'>";
		});

		//폼에 hidden 태그들을 붙임
		$("#form1").append(str);
		var content=(#content);
		if(content==""){
			alert("내용을 입력하세요.");
			$("#content").focus();
			}
		document.form1.submit();
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
				var fileInfo=getFileInfo(data);
				var html="<a href='"+fileInfo.getLink+"'>"
				+fileInfo.fileName+"</a><br>";
				html += "<input type='hidden' class='file' value='"
					+fileInfo.fullName+"'>";
				$("#uploadedList").append(html);
			}
		});
	});
});
</script>
<style type="text/css">
.fileDrop {
  width: 600px;
  height: 100px;
  border: 1px dotted gray;
  background-color: gray;
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
<div style="text-align: center; margin: 0 auto;">
<h2>작성</h2>
<form id="form1" name="form1" method="post" 
action="${path}/board/insert.do">
  <div>제목 : <input name="subject" id="subject" size="80" 
  placeholder="제목을 입력하세요" type="text" required="required">
   </div>
  <div style="width: 800px; text-align: center; margin: 0 auto;" >
    내용 : <textarea id="content" name="content" rows="3" cols="80"
    placeholder="내용을 입력하세요">"내용을 입력하세요" </textarea>
  <script type="text/javascript">
    //ckeditor 적용
    CKEDITOR.replace("content",{
    	filebrowserUploadUrl: "${path}/imageUpload.do"
    });
  </script> 
  </div>
  <div style="text-align: center;">
    <button type="submit" id="btnSav">확인</button></div>
</form>
</div>
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