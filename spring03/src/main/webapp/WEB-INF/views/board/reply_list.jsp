<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">

function reply_Delete(num){
	var replyNum = document.getElementById("rno" + num).value;
	console.log(replyNum);
	$.ajax({
		type: "post",
		url: "${path}/reply/delete.do",
		data: {"rno" : replyNum},
		success: function(){
			alert("댓글이 삭제되었습니다.");
			location.reload();
		}
	});
}
$(function(){

});

</script>
</head>
<body>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<table style="width:700px; text-align: center; margin:0 auto;">
<!-- fn: header.jsp의 jstl -->
<c:forEach var="row" items="${list}" varStatus="replyCount">   
	<c:set var="str"
value="${fn:replace(row.replytext,'<','&lt;') }" />
	<c:set var="str"
value="${fn:replace(str,'>','&gt;') }" />	
	<c:set var="str"  
value="${fn:replace(str,'  ','&nbsp;&nbsp;')}" />
	<c:set var="str"
value="${fn:replace(str,newLineChar,'<br>') }" />

<%-- <c:set var="str" value="${fn:replace(str, '\\','<br>') }" /> --%>
<!-- c:set 태그안에는 역슬래쉬를 쓸 수 없어서 별도로 처리해야함 -->
	<tr>
		<td>
			${row.name}
			<input type="hidden" id="rno${replyCount.count}" value="${row.rno}" readonly="readonly" disabled="disabled">
			( <fmt:formatDate value="${row.regdate}"
				 pattern="yyyy-MM-dd a HH:mm:ss" /> )<br>
			${str}
			<c:if test="${sessionScope.name == row.name || sessionScope.name == '어드민'}">
		<%-- <button type = "button" id = "btn_reply_Update${replyCount.count}" onclick="reply_Update(${replyCount.count})">수정</button> --%>
			<button type = "button" id = "btn_reply_Delete${replyCount.count}" onclick="reply_Delete(${replyCount.count})">삭제</button>
			</c:if>
		</td>
	</tr>
</c:forEach>	
</table>
</body>
</html>
