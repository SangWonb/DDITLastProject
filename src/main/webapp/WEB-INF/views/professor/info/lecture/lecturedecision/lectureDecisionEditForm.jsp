<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<hr>
<h3>신청 상세 내역</h3>

<form id="decisionEditForm" method="post">
  <table class="table bg-white" style="margin: 20px;">
    <tbody>
        <tr style="display: none;">
            <td>
            <input type="text" class="form-control" id="lolAppno" name="lolAppno" value="${lecture.lolAppno }" readonly="readonly"/>
            </td>
        </tr>
        <tr>
            <th scope="row">강의명</th>
            <td>
            <input type="text" class="form-control" id="lolName" name="lolName" value="${lecture.lolName }" readonly="readonly"/>
            </td>
        </tr>
        <tr>
            <th scope="row">교과목</th>
            <td>
            <input class="form-control" id="subCode" name="subCode" value="${lecture.subCode }" readonly="readonly">
            </td>
        </tr>
        <tr>
            <th scope="row">정원</th>
            <td>
            <input type="number" class="form-control" id="lolLimit" name="lolLimit" value="${lecture.lolLimit }" readonly="readonly"/>
            </td>
        </tr>
        <tr>
            <th scope="row">수업일수</th>
            <td>
            <input type="number" class="form-control" id="lolDaycount" name="lolDaycount" value="${lecture.lolDaycount }" readonly="readonly"/>
            </td>
        </tr>
        <tr>
            <th scope="row">신청인</th>
            <td>
            <input type="text" class="form-control" id="pmemNo" name="pmemNo" value="${lecture.memName }" readonly="readonly"/>
            </td>
        </tr>
        
<!--    강의 계획서 -->
        <tr>
            <td scope="row" style="text-align: center;" colspan="2"><h3>강의계획서</h3></td>
        </tr>
        <tr>
        	<th scope="row">강의개요</th>
            <td>
            <input type="text" class="form-control" value="${lecture.lecturePlan.lpContent }" readonly="readonly"/>
            </td>
        </tr>
        <tr>
        	<th scope="row">출석반영비율</th>
            <td>
            <input type="number" class="form-control" id="lpAttendRef" value="${lecture.lecturePlan.lpAttendRef }" readonly="readonly"/>
            </td>
        </tr>
        <tr>
        	<th scope="row">시험반영비율</th>
            <td>
            <input type="number" class="form-control" id="lpTestRef" value="${lecture.lecturePlan.lpTestRef }" readonly="readonly"/>
            </td>
        </tr>
        <tr>
        	<th scope="row">과제반영비율</th>
            <td>
            <input type="number" class="form-control" id="lpTaskRef" value="${lecture.lecturePlan.lpTaskRef }" readonly="readonly"/>
            </td>
        </tr>
        <tr>
        	<th scope="row">교재</th>
            <td>
            <input type="text" class="form-control" value="${lecture.lecturePlan.lpBook }" readonly="readonly"/>
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
					<input type="text" class="form-control" value="${lecture.lecturePlan.lectureContent[fn:substring(lpNo, 4, 6) - 1].lpContent}" readonly="readonly"/>

		        </td>
		    </tr>
		</c:forEach>
    </tbody>
</table>
	<div class="row">
    <div class="col-sm-2"> <!-- 반려 사유 셀렉트 박스 -->
        <select id="rejectReason" name="rejectReason" class="form-control">
            <option value="">반려사유 선택</option>
    <c:forEach items="${rejectList}" var="reject">
            <option value="${reject.rejectCode }">${reject.rejectReason }</option>
       </c:forEach>
        </select>
    </div>
    <div class="col-sm-6"> <!-- 승인, 반려 버튼 그룹 -->
        <div class="btn-group">
            <button type="submit" id="statusSelect" class="btn btn-primary">승인</button>
            <button type="submit" id="rejectSelect" class="btn btn-danger">반려</button>
        </div>
    </div>
</div>
</form>