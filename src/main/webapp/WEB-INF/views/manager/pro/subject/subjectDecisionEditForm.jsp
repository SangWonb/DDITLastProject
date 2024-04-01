<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<hr>
<h3>신청 상세 내역</h3>
<form id="decisionEditForm" method="post">
  <table class="table bg-white" style="margin: 20px;">
    <tbody>
        <tr style="display: none;">
            <th scope="row">과목코드</th>
            <td>
     			<input type="text" class="form-control" id="subAppno" name="subAppno" value="${subject.subAppno}" readonly="readonly" style="display: none;"/>
            </td>
        </tr>
        <tr>
            <th scope="row">과목명</th>
            <td>
            <input type="text" class="form-control" id="subName" name="subName" value="${subject.subName}" readonly="readonly"/>
            </td>
        </tr>
        <tr>
            <th scope="row">학년</th>
            <td>
           	<input class="form-control" id="subSchyear" name="subSchyear" value="${subject.subSchyear }" readonly="readonly"/>
            </td>
        </tr>
        <tr>
            <th scope="row">학기</th>
            <td>
            <input class="form-control" id="subSemester" name="subSemester" value="${subject.subSemester }" readonly="readonly"/>
            </td>
        </tr>
        <tr>
            <th scope="row">학과</th>
            <td>
            <input class="form-control" id="deptCode" name="deptCode" value="${subject.deptName }" readonly="readonly"/>
            </td>
        </tr>
        <tr>
            <th scope="row">전공/교양</th>
            <td>
            <input class="form-control" id="majorCultural" name="majorCultural" value="${subject.majorCultural }" readonly="readonly"/>
            </td>
        </tr>
        <tr>
            <th scope="row">필수/선택</th>
           <td>
            <input class="form-control" id="choiceRequire" name="choiceRequire" value="${subject.choiceRequire }" readonly="readonly"/>
            </td>
        </tr>
        <tr>
            <th scope="row">이수학점</th>
            <td>
            <input type="number" class="form-control" id="subCredit" name="subCredit" value="${subject.subCredit}" readonly="readonly"/>
            </td>
        </tr>
        <tr>
            <th scope="row">교번</th>
            <td>
            <input type="text" class="form-control" id="pmemNo" name="pmemNo" value="${subject.pmemNo}" readonly="readonly"/>
            </td>
        </tr>
        <tr>
            <th scope="row">이름</th>
            <td>
            <input type="text" class="form-control" id="memName" name="memName" value="${subject.memName}" readonly="readonly"/>
            </td>
        </tr>
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