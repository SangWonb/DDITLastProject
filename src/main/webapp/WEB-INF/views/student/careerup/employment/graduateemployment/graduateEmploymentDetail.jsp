<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<div id="graduateEmploymentDetail">
	<table class="table">
	</table>
    <div class="container mt-5 card">
        <table class="table">
            <tr>
                <th colspan="6" style="text-align: center;">
					선배 취업처 상세조회
				</th>
            </tr>
            <tr>
                <td colspan="1" style="text-align: center; font-weight: bold;">회사명</td>
                <td colspan="2" style="border-left: 1px solid #f0f0f0; text-align: center;">
                ${graduateEmployment.companyNm}</td>
                <td colspan="1" style="border-left: 1px solid #f0f0f0; text-align: center;">부서명</td>
                <td colspan="2" style="border-left: 1px solid #f0f0f0; text-align: center;">
                ${graduateEmployment.companyDept}</td>
            </tr>
            <tr>
             	<td colspan="1" style="text-align: center;">회사구분</td>
                <td colspan="2" style="border-left: 1px solid #f0f0f0; text-align: center;">
                ${graduateEmployment.companyType}</td>
             	<td colspan="1" style="border-left: 1px solid #f0f0f0; text-align: center;">회사위치</td>
                <td colspan="2" style="border-left: 1px solid #f0f0f0; text-align: center;">
                ${graduateEmployment.companyLoc}</td>
            </tr>
            <tr>
             	<td colspan="1" style="text-align: center;">단과대</td>
                <td colspan="2" style="border-left: 1px solid #f0f0f0; text-align: center;">
                ${graduateEmployment.colName}</td>
             	<td colspan="1" style="border-left: 1px solid #f0f0f0; text-align: center;">학과</td>
                <td colspan="2" style="border-left: 1px solid #f0f0f0; text-align: center;">
                ${graduateEmployment.deptName}</td>
            </tr>
            <tr>
             	<c:choose>
				    <c:when test="${not empty graduateEmployment.langType}">
				        <td colspan="1" style="text-align: center;"> ${graduateEmployment.langType}</td>
				        <td colspan="2" style="border-left: 1px solid #f0f0f0; text-align: center;">
				            ${graduateEmployment.langScore}
				        </td>
				    </c:when>
				    <c:otherwise>
				        <td colspan="3" style="text-align: center;">어학성적 내역이 존재하지 않습니다.</td>
				    </c:otherwise>
				</c:choose>
                
             	<td colspan="1" style="border-left: 1px solid #f0f0f0; text-align: center;">자격증</td>
                <c:choose>
				    <c:when test="${not empty graduateEmployment.licenseEnroll}">
				        <td colspan="2" style="border-left: 1px solid #f0f0f0; text-align: center;">
				            <c:forEach items="${graduateEmployment.licenseEnroll}" var="licenseEnroll" varStatus="loop">
				                ${licenseEnroll.license.licenNm}<c:if test="${not loop.last}">, </c:if>
				            </c:forEach>
				        </td>
				    </c:when>
				    <c:otherwise>
				        <td colspan="2" style="border-left: 1px solid #f0f0f0; text-align: center;">
				            자격증 내역이 존재하지 않습니다.
				        </td>
				    </c:otherwise>
				</c:choose>
            </tr>
        </table>
        <table class="table">
<!--             <tr> -->
<!--                 <td colspan="1" style="text-align: center;">역량 프로그램 참여 내역</td> -->
<%--                 <c:if test=""></c:if> --%>
<!--                 <td colspan="5" style="border-left: 1px solid #f0f0f0; text-align: center;">프로그램명</td> -->
<!--             </tr> -->
            <tr>
                <td colspan="2" style="text-align: center;">인턴 프로그램 참여 내역</td>
               <c:if test="${not empty graduateEmployment.ifCompany}">
   				<td colspan="1" style="border-left: 1px solid #f0f0f0; text-align: center;">회사명</td>
				    <td colspan="1" style="border-left: 1px solid #f0f0f0; text-align: center;">${graduateEmployment.ifCompany}</td>
				    <td colspan="1" style="border-left: 1px solid #f0f0f0; text-align: center;">근무기간</td>
				    <td colspan="1" style="border-left: 1px solid #f0f0f0; text-align: center;">${graduateEmployment.ifDate}</td>
				</c:if>
				<c:if test="${empty graduateEmployment.ifCompany}">
				    <td colspan="4" style="border-left: 1px solid #f0f0f0; text-align: center;">인턴 프로그램 참여 내역이 존재하지 않습니다.</td>
				</c:if>
            </tr>
            
            <tr>
                <td colspan="1" style="text-align: center;">대외활동 참여 내역</td>
               <c:choose>
				    <c:when test="${not empty graduateEmployment.honorsNm}">
				        <td colspan="5" style="border-left: 1px solid #f0f0f0; text-align: center;">${graduateEmployment.honorsNm}</td>
				    </c:when>
				    <c:otherwise>
				        <td colspan="5" style="border-left: 1px solid #f0f0f0; text-align: center;">대외활동 참여 내역이 존재하지 않습니다.</td>
				    </c:otherwise>
				</c:choose>
            </tr>
            </table>
    </div>
</div>