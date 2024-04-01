<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<hr>
<h3>신청 수정 양식</h3>
<form:form id="lectureApplEdit" method="post" modelAttribute="lecture">
 <table class="table bg-white" id="editTable" style=" margin: 20px;">
    <tbody>
        <tr style="display: none;">
            <td>
            <input type="text" class="form-control" id="lolAppno" name="lolAppno" value="${lecture.lolAppno }"/>
            </td>
        </tr>
        <tr>
            <th scope="row">강의명</th>
            <td>
            <form:input type="text" class="form-control" id="lolName" path="lolName"/>
            </td>
        </tr>
        <tr>
            <th scope="row">교과목</th>
            <td>
            <form:select class="form-control" id="subCode" path="subCode" >
	            <form:option value="">교과목선택</form:option>
                <c:forEach items="${subjectList }" var="subject">
	                <form:option value="${subject.subCode }">${subject.subName }</form:option>
                </c:forEach>
	        </form:select>
            </td>
        </tr>
        <tr>
            <th scope="row">정원</th>
            <td>
            <form:input type="number" class="form-control" id="lolLimit" path="lolLimit"/>
            </td>
        </tr>
        <tr>
            <th scope="row">수업일수</th>
            <td>
            <form:input type="number" class="form-control" id="lolDaycount" path="lolDaycount"/>
            </td>
        </tr>
        <tr>
            <th scope="row">신청인</th>
            <td>
            <form:input type="text" class="form-control" id="memName" path="memName" value="${memName }" readonly="readonly"/>
            </td>
        </tr>
        <tr style="display: none;">
            <td>
            <form:input type="text" class="form-control" id="pmemNo" path="pmemNo" value="${memNo }" readonly="readonly"/>
            </td>
        </tr>
<!--    강의 계획서 -->
        <tr>
            <td scope="row" style="text-align: center;" colspan="2"><h3>강의계획서</h3></td>
        </tr>
        <tr>
        	<th scope="row">강의개요</th>
            <td>
            <form:input type="text" class="form-control" path="lecturePlan.lpContent"/>
            </td>
        </tr>
        <tr>
        	<th scope="row">출석반영비율</th>
            <td>
            <form:input type="number" class="form-control" id="lpAttendRef" path="lecturePlan.lpAttendRef"/>
            </td>
        </tr>
        <tr>
        	<th scope="row">시험반영비율</th>
            <td>
            <form:input type="number" class="form-control" id="lpTestRef" path="lecturePlan.lpTestRef"/>
            </td>
        </tr>
        <tr>
        	<th scope="row">과제반영비율</th>
            <td>
            <form:input type="number" class="form-control" id="lpTaskRef" path="lecturePlan.lpTaskRef"/>
            </td>
        </tr>
        <tr>
        	<th scope="row">교재</th>
            <td>
            <form:input type="text" class="form-control" path="lecturePlan.lpBook"/>
            </td>
        </tr>
<!--         강의 주차별 -->
        <tr>
            <td scope="row" style="text-align: center;" colspan="2"><h3>강의계획</h3></td>
        </tr>
		<c:forEach var="content" items="${lecture.lecturePlan.lectureContent}" varStatus="status">
			<c:set var="lpNo" value="${content.lpNo }"/>
		    <tr>
		        <th scope="row" >${fn:substring(lpNo, 4, 6)}주차 내용</th>
		        <td>
		            <form:input type="text" class="form-control" path="lecturePlan.lectureContent[${fn:substring(lpNo, 4, 6) -1}].lpContent" />
		        </td>
		    </tr>
		</c:forEach>
		<tr>
		    <td colspan="2">
		        <button type="button" class="btn btn-primary" onclick="addWeek(${fn:substring(lpNo, 5, 6)})">주차 추가</button>
		        <button type="button" class="btn btn-danger" onclick="removeLastWeek()">마지막 주차 삭제</button>
		    </td>
		</tr>
    </tbody>
</table>
	<div class="col-sm-10">
		<div class="btn-group">
			<button type="submit" id="editForm" class="btn btn-primary">수정하기</button>
			<button type="button" id="delBtn" class="btn btn-danger">삭제하기</button>
		</div>
	</div>
</form:form>