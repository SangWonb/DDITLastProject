<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="enrollDetail">
	<hr />
	<table class="table" style="white-space: nowrap;">
		<thead>
			<tr>
				<th>년도</th>
				<th>학기</th>
				<th>납부일</th>
				<th>기본수업료</th>
				<th>기성회비</th>
				<th>실습비</th>
				<th>재료비</th>
				<th>총금액</th>
				<th>장학금 지급액</th>
				<th>최종 납부액</th>
				<th>납부확인서</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${enrollInvoice.year}년도</td>
				<td>${enrollInvoice.semester}학기</td>
				<td>${enrollInvoice.enrollRecord[0].enrlDate}</td>
				<td>${enrollInvoice.enrollfee.enrlTf}원</td>
				<td>${enrollInvoice.enrollfee.enrlMf}원</td>
				<td>${enrollInvoice.enrollfee.enrlIf}원</td>
				<td>${enrollInvoice.enrollfee.enrlMc}원</td>
				<td>${enrollInvoice.enrollfee.enrlTotal}원</td>
				<td>${enrollInvoice.scholAmt}원</td>
				<td><c:choose>
						<c:when
							test="${enrollInvoice.enrollfee.enrlTotal - enrollInvoice.scholAmt < 0}">
				            0원
				        </c:when>
						<c:otherwise>
				            ${enrollInvoice.enrollfee.enrlTotal - enrollInvoice.scholAmt}원
				        </c:otherwise>
					</c:choose></td>
				<td>
				 	<button class="btn btn-primary" id="billForm" data-enrlNo2="${enrollInvoice.enrlNo }">출력</button>
					
				</td>
			</tr>
		</tbody>
	</table>
</div>