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
<%@ include file="../include/menu.jsp" %>
<script type="text/javascript">alert("<%="아이디는 "+request.getAttribute("result")+"입니다." %>")
								location.href="${path}/member/login.do";
</script>
</body>
</html>