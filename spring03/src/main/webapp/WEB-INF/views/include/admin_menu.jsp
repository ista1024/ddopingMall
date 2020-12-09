<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<hr>
<a href="${path}/main/home.do">Home</a> |
<a href="${path}/admin/home.do">AdminHome</a> |
<a href="${path}/admin/listAllMember.do">회원 리스트</a> |
<a href="${path}/admin/product_write.do">상품등록</a> |
<a href="${path}/admin/pdf_list.do">PDF</a> |
<a href="${path}/admin/chart1.do">구글차트(json)</a> |
<a href="${path}/admin/chart2.do">구글차트(db)</a> |
<a href="${path}/admin/email_write.do">이메일 발송</a> |

<div style="text-align: right;">
  <c:choose>
    <c:when test="${sessionScope.admin_userid == null }">
		<c:redirect url="${path}/main/home.do" />
    </c:when>
    <c:otherwise>
        <!-- 로그인한 상태 -->
        ${sessionScope.name}님이 로그인중입니다.
        <a href="${path}/member/logout.do">로그아웃</a>
    </c:otherwise>
  </c:choose>
</div>
<hr>