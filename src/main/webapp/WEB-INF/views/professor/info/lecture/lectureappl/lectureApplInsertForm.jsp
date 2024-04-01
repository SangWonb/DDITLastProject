<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<hr>
<h3>신청 양식</h3>
<div id="lectureApplInsert" class="bg-white" style="margin: 20px;">
<div class="tab-content">
    <div id="ongoing" class="tab-pane fade show active">
        <div class="table-responsive">
<form:form id="lectureApplInsertData" method="post" modelAttribute="lectureOpen">
 <table class="table" id="insertTable">
    <tbody>
        <tr>
            <th scope="row">강의명</th>
            <td>
            <form:input type="text" class="form-control" id="lolName" path="lolName"/>
            </td>
        </tr>
        <tr>
            <th scope="row">교과목</th>
            <td>
            <form:select class="form-control" id="subCode" path="subCode">
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
            <form:input type="text" class="form-control" path="lecturePlan.lpContent" id="lpContent" value="강의개요"/>
            </td>
        </tr>
<!--         <tr> -->
<!--         	<td scope="row" style="text-align: left: ;" colspan="2"><h6>반영비율의 합은 100이 되어야 합니다.</h6></td> -->
<!--         </tr> -->
        <tr>
        	<th scope="row">출석반영비율</th>
            <td>
            <form:input type="number" class="form-control" id="lpAttendRef" path="lecturePlan.lpAttendRef" value="30"/>
            </td>
        </tr>
        <tr>
        	<th scope="row">시험반영비율</th>
            <td>
            <form:input type="number" class="form-control" id="lpTestRef" path="lecturePlan.lpTestRef" value="50"/>
            </td>
        </tr>
        <tr>
        	<th scope="row">과제반영비율</th>
            <td>
            <form:input type="number" class="form-control" id="lpTaskRef" path="lecturePlan.lpTaskRef" value="20"/>
            </td>
        </tr>
        <tr>
        	<th scope="row">교재</th>
            <td>
            <form:input type="text" class="form-control" path="lecturePlan.lpBook" id="book" value=""/>
            </td>
        </tr>
<!--         강의 주차별 -->
        <tr>
            <td scope="row" style="text-align: center;" colspan="2"><h3>강의계획</h3></td>
        </tr>
        <tr>
        	<th scope="row">1주차 내용</th>
            <td>
            <form:input type="text" class="form-control" path="lecturePlan.lectureContent[0].lpContent"/>
            </td>
        </tr>
	    <tr>
	        <td colspan="2" style="text-align: right: ;">
	            <button class="btn btn-primary" type="button" onclick="insertAddWeek()">추가</button>
	            <button class="btn btn-danger" type="button" onclick="insertRemoveLastWeek()">마지막 항목 삭제</button>
				<button id="demoButton" type="button" class="btn btn-primary" onclick="fillFormData()">시연용 데이터</button>
	        </td>
	    </tr>
    </tbody>
</table>
	<div class="col-sm-10">
		<div class="btn-group">
			<button type="submit" id="applFormBtn" class="btn btn-primary">신청하기</button>
		</div>
	</div>
</form:form>
        </div>
    </div>
</div>
</div>