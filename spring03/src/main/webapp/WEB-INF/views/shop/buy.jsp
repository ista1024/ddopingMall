<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.spring03.model.order.dto.OrderDTO"%>
<%@page import="com.example.spring03.model.shop.dto.CartDTO"%>
<%@page import="com.example.spring03.model.member.dto.MemberDTO"%>
<!DOCTYPE html>
<html>
<head>  
<meta charset="UTF-8">

<title>Insert title here</title>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<%
    MemberDTO dto=new MemberDTO();
    String name = (String)request.getAttribute("sessionScope.name");
    String email = (String)request.getAttribute("email");
    String hp = (String)request.getAttribute("hp");
    String address = (String)request.getAttribute("address");
%>
	<form name="form1" id="form1" action="${path}/shop/cart/order.do">
    	<input type="hidden" name="userid" id="userid" value="${dto.userid}">
    	<input type="hidden" name="address" id="address" value="${dto.address}">
    	<input type="hidden" name="detailAddress" id="detailAddress" value="${dto.detailAddress}">
    	<input type="hidden" name="extraAddress" id="extraAddress"  value="${dto.extraAddress}">
    	<input type="hidden" name="orderPhon" id="orderPhon" value="${dto.orderPhon}">
    	<input type="hidden" name="amount" id="amount" value="${dto.amount}">
    	<input type="hidden" name="name" id="name" value="${dto.name}">
    </form>
   <script>
    $(function(){
        var IMP = window.IMP; // 생략가능
        IMP.init('imp22646485'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg = '';
        var returnedData;
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '안녕하세요 DPM 결제화면입니다',
            amount : ${dto.amount},
            buyer_email : '<%=email%>',
            buyer_name : '<%=name%>',
            buyer_tel : '<%=hp%>',
            buyer_addr : '<%=address%>',
            buyer_postcode : '123-456'
            //m_redirect_url : 'http://www.naver.com'
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                        //기타 필요한 데이터가 있으면 추가 전달
                    }
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        
                        alert(msg);
                    } else {
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });
                //성공시 이동할 페이지
                document.form1.submit();
                //location.href="${path}/shop/cart/order.do";
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                location.href="${path}/shop/cart/list.do";
                alert(msg);
            }
        });
    });
    </script>
</body>
</html>