<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>D P M Admin</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<%@ include file="../include/header.jsp" %>
		
		<style type="text/css">
			.hideBorder {
				border: 0;
			}
			.hide {
				display: hidden; 
			}
			.namePass {
				width: 100px;
			}
			.hp {
				width: 40px;
			}
			.email {
				width: 80px;
			}
			.postcode, .rank {
				width: 50px;
			}
			#memberListTable{
				max-height: 100px;
				overflow-y: auto;
			}
		</style>
	</head>
	<body>
	
		<%@ include file="../include/admin_menu.jsp" %>
		<!-- END #fh5co-header -->
		
		<table class="table" id="memberListTable">
			<tr>
				<td>아이디</td>
				<td>비밀번호</td>
				<td>이름</td>
				<td>이메일</td>
				<td>연락처</td>
				<td>우편번호</td>
				<td>주소</td>
				<td>회원등급</td>
				<td>회원권한</td>
				<td>가입일자</td>
				<td></td>
			</tr>
			<c:forEach var="dto" items="${memberList}" varStatus="memberlistNumber">
				<tr>
					<td>
						<input class="listInput${memberlistNumber.count} hideBorder namePass" id="memberListUserid${memberlistNumber.count}" value="${dto.userid}" readonly="readonly">
						<input type="hidden" id="memberListUserno${memberlistNumber.count}" value="${dto.userno}" disabled readonly>
					</td>
					<td><input type="password" class="listInput${memberlistNumber.count} hideBorder namePass" id="memberListPassword${memberlistNumber.count}" value="${dto.passwd}" readonly="readonly"></td>
					<td><input class="listInput${memberlistNumber.count} hideBorder namePass" id="memberListName${memberlistNumber.count}" value="${dto.name}" readonly="readonly"></td>
					<td>
						<input class="listInput${memberlistNumber.count} hideBorder email" id="memberListEmail${memberlistNumber.count}" value="${dto.email}" readonly="readonly">
						<input class="listInput${memberlistNumber.count} hideBorder email" id="memberListTextemail${memberlistNumber.count}" value="${dto.textemail}" readonly="readonly">
					</td>
					<td>
						<input class="listInput${memberlistNumber.count} hideBorder hp" id="memberListHpA${memberlistNumber.count}" value="${dto.hp}" readonly="readonly">
						<input class="listInput${memberlistNumber.count} hideBorder hp" id="memberListHpB${memberlistNumber.count}" value="${dto.hp2}" readonly="readonly">
						<input class="listInput${memberlistNumber.count} hideBorder hp" id="memberListHpC${memberlistNumber.count}" value="${dto.hp3}" readonly="readonly">
					</td>
					<td>
						<input class="listInput${memberlistNumber.count} hideBorder postcode" id="memberListPostcode${memberlistNumber.count}" value="${dto.postcode}" readonly="readonly">
					</td>
					<td>
						<input class="listInput${memberlistNumber.count} hideBorder" id="memberListAddress${memberlistNumber.count}" value="${dto.address}" readonly="readonly">
						<input class="listInput${memberlistNumber.count} hideBorder" id="memberListDetailAddress${memberlistNumber.count}" value="${dto.detailAddress}" readonly="readonly">
						<input class="listInput${memberlistNumber.count} hideBorder" id="memberListExtraAddress${memberlistNumber.count}" value="${dto.extraAddress}" readonly="readonly">
					</td>
					<td class="rank">
						<c:choose>
							<c:when test="${dto.member_rank >= 8}">
								어드민
							</c:when>
							<c:when test="${dto.member_rank == 4}">
								VVIP
							</c:when>
							<c:when test="${dto.member_rank == 3}">
								VIP
							</c:when>
							<c:when test="${dto.member_rank == 2}">
								골드
							</c:when>
							<c:when test="${dto.member_rank == 1}">
								실버
							</c:when>
							<c:otherwise>
								-
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<select class="listInput${memberlistNumber.count}" name="member_verify" id="member_verify${memberlistNumber.count}" disabled="disabled">
							<c:choose>
								<c:when test="${dto.member_verify >= 3}">
									<option selected="selected" value="3">어드민</option>
									<option value="2">관리자</option>
									<option value="1">일반회원</option>
								</c:when>
								<c:when test="${dto.member_verify == 2}">
									<option selected="selected" value="2">관리자</option>
									<option value="1">일반회원</option>
								</c:when>
								<c:when test="${dto.member_verify == 1}">
									<option value="2">관리자</option>
									<option selected="selected" value="1">일반회원</option>
								</c:when>
								<c:otherwise>
									<option selected="selected" value="0">-</option>
								</c:otherwise>
							</c:choose>
						</select>
					</td>
					<td><fmt:formatDate value="${dto.join_date}" pattern="yy.MM.dd"/></td>
					<c:choose>
						<c:when test="${sessionScope.member_verify >= 3}">
							<c:if test="${dto.member_verify >= 3}">
								<td></td>
							</c:if>
							<c:if test="${dto.member_verify <= 2}">
								<td>
									<input type="hidden" id="sesseionMember_rank${memberlistNumber.count}" value="${sessionScope.member_rank}">
									<input type="button" id="userEdit${memberlistNumber.count}" value="수정" onclick="userEditList('${memberlistNumber.count}')">
									<input type="button" class="hide" disabled id="submitUserEdit${memberlistNumber.count}" value="확인" onclick="submitUserEdit('${memberlistNumber.count}')">
								</td>
							</c:if>
						</c:when>
						<c:otherwise>
							<td></td>
						</c:otherwise>
					</c:choose>
				</tr>
			</c:forEach>
		</table>
		<script>
			var inputValues = [];
			function userEditList(num) {
				var memberListInput = document.getElementsByClassName("listInput" + num);
				var member_verify = document.getElementById("member_verify" + num);
				var userEdit = document.getElementById("userEdit" + num);
				var submitUserEdit = document.getElementById("submitUserEdit" + num);
				if(userEdit.value.includes("수정")) {
					for(var i = 0; i < memberListInput.length; i++) {
						inputValues[i] = memberListInput[i].value;
						memberListInput[i].readOnly = false;
						memberListInput[i].style.cssText = "border: 1px solid #000; color: blue;";
						member_verify.disabled = false;
						submitUserEdit.classList.toggle("hide");
						submitUserEdit.disabled = false;
						submitUserEdit.style.cssText = "display: inline-block; border: 1px solid #000; color: blue;";
						userEdit.value = "취소";
					}
				} else {
					for(var i = 0; i < memberListInput.length; i++) {
						memberListInput[i].value = inputValues[i];
						memberListInput[i].readOnly = true;
						memberListInput[i].style.cssText = "border: 0px; color: black;";
						member_verify.disabled = true;
						submitUserEdit.classList.toggle("hide");
						submitUserEdit.disabled = true;
						inputValues[i] = null;
						userEdit.value = "수정";
					}
				}
				
				/* var memberListUserid = document.getElementById("memberListUserid" + num);
				var memberListPassword = document.getElementById("memberListPassword" + num);
				var memberListName = document.getElementById("memberListName" + num);
				var memberListEmail = document.getElementById("memberListEmail" + num);
				var memberListTextemail = document.getElementById("memberListTextemail" + num);
				var memberListHpA = document.getElementById("memberListHpA" + num);
				var memberListHpB = document.getElementById("memberListHpB" + num);
				var memberListHpC = document.getElementById("memberListHpC" + num);
				var memberListPostcode = document.getElementById("memberListPostcode" + num);
				var memberListAddress = document.getElementById("memberListAddress" + num);
				var memberListDetailAddress = document.getElementById("memberListDetailAddress" + num);
				var memberListExtraAddress = document.getElementById("memberListExtraAddress" + num);
				var member_verify = document.getElementById("member_verify" + num); */
				// memberListUserid.classList.toggle('hideBorder');
				// memberListInput.style.cssText = "border: 1px solid #000; color: blue;";
				/* memberListUserid.readOnly = false;
				memberListUserid.style.cssText = "border: 1px solid #000; color: blue;";
				memberListPassword.readOnly = false;
				memberListPassword.style.cssText = "border: 1px solid #000; color: blue;";
				memberListName.readOnly = false;
				memberListName.style.cssText = "border: 1px solid #000; color: blue;";
				memberListEmail.readOnly = false;
				memberListEmail.style.cssText = "border: 1px solid #000; color: blue;";
				memberListTextemail.readOnly = false;
				memberListTextemail.style.cssText = "border: 1px solid #000; color: blue;";
				memberListHpA.readOnly = false;
				memberListHpA.style.cssText = "border: 1px solid #000; color: blue;";
				memberListHpB.readOnly = false;
				memberListHpB.style.cssText = "border: 1px solid #000; color: blue;";
				memberListHpC.readOnly = false;
				memberListHpC.style.cssText = "border: 1px solid #000; color: blue;";
				memberListPostcode.readOnly = false;
				memberListPostcode.style.cssText = "border: 1px solid #000; color: blue;";
				memberListAddress.readOnly = false;
				memberListAddress.style.cssText = "border: 1px solid #000; color: blue;";
				memberListDetailAddress.readOnly = false;
				memberListDetailAddress.style.cssText = "border: 1px solid #000; color: blue;";
				memberListExtraAddress.readOnly = false;
				memberListExtraAddress.style.cssText = "border: 1px solid #000; color: blue;";
				member_verify.disabled = false; */
			}
			function submitUserEdit(num) {
				/* var memberListUserno = document.getElementById("memberListUserno" + num);
				var memberListUserid = document.getElementById("memberListUserid" + num);
				var memberListPassword = document.getElementById("memberListPassword" + num);
				var memberListName = document.getElementById("memberListName" + num);
				var memberListEmail = document.getElementById("memberListEmail" + num);
				var memberListTextemail = document.getElementById("memberListTextemail" + num);
				var memberListHpA = document.getElementById("memberListHpA" + num);
				var memberListHpB = document.getElementById("memberListHpB" + num);
				var memberListHpC = document.getElementById("memberListHpC" + num);
				var memberListPostcode = document.getElementById("memberListPostcode" + num);
				var memberListAddress = document.getElementById("memberListAddress" + num);
				var memberListDetailAddress = document.getElementById("memberListDetailAddress" + num);
				var memberListExtraAddress = document.getElementById("memberListExtraAddress" + num);
				var member_verify = document.getElementById("member_verify" + num);
				var sesseionMember_rank = document.getElementById("sesseionMember_rank" + num); */
				if (confirm("수정하시겠습니까?")) {
					var param = {
						"userno": document.getElementById("memberListUserno" + num).value,
						"userid": document.getElementById("memberListUserid" + num).value, 
						"passwd": document.getElementById("memberListPassword" + num).value, 
						"name" : document.getElementById("memberListName" + num).value,
						"email" : document.getElementById("memberListEmail" + num).value,
						"textemail" : document.getElementById("memberListTextemail" + num).value,
						"hp" : document.getElementById("memberListHpA" + num).value,
						"hp2" : document.getElementById("memberListHpB" + num).value,
						"hp3" : document.getElementById("memberListHpC" + num).value,
						"postcode" : document.getElementById("memberListPostcode" + num).value,
						"address" : document.getElementById("memberListAddress" + num).value,
						"detailAddress" : document.getElementById("memberListDetailAddress" + num).value,
						"extraAddress" : document.getElementById("memberListExtraAddress" + num).value,
						"member_verify" : document.getElementById("member_verify" + num).value,
						"sesseionMember_rank": document.getElementById("sesseionMember_rank" + num).value
					}
					$.ajax({
						type: 'post',
						url: '${path}/admin/updateMember.do',
						data: param,
						success: function() {
							location.reload();
						}
					}); // ajax
				}
			}
		</script>
	</body>
</html>