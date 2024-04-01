<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<form id="mentorDecisionForm" method="post">
  <table class="table bg-white" style="margin: 20px;">
    <tbody>
        <tr style="display: none;">
            <td>
            <input type="text" class="form-control" id="memNo" name="memNo" 
            value="${mentoring.memNo}" >
            </td>
        </tr>
        <tr>
            <th scope="row" >멘티신청번호</th>
            <td>
            <input type="text" class="form-control" id="applEditMenteeNo" name="applEditMenteeNo" 
            value="${mentoring.menteeNo}" disabled="disabled">
            </td>
        </tr>
        <tr>
            <th scope="row">멘티이름</th>
            <td>${mentoring.memName}</td>
        </tr>
        <tr>
            <th scope="row">학과</th>
            <td>${mentoring.deptName}</td>
        </tr>
        <tr>
            <th scope="row">학번</th>
            <td>${mentoring.memNo}</td>
        </tr>
        <tr>
            <th scope="row">원하는 직무</th>
            <td>${mentoring.menteeJob}</td>
        </tr>
        <tr>
            <th scope="row">원하는 회사</th>
            <td>${mentoring.menteeCom}</td>
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