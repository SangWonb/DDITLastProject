<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<form id="menteeEditForm" method="post">
  <table class="table">
    <tbody>
        <tr>
            <th scope="row">학과</th>
            <td>${mentoring.seniorCoworker.deptName}</td>
        </tr>
        <tr>
            <th scope="row">회사이름</th>
            <td>${mentoring.seniorCoworker.companyNm}</td>
        </tr>
        <tr>
            <th scope="row">회사구분</th>
            <td>${mentoring.seniorCoworker.companyType}</td>
        </tr>
        <tr>
            <th scope="row">회사부서</th>
            <td>${mentoring.seniorCoworker.companyDept}</td>
        </tr>
        <tr>
            <th scope="row">직무</th>
            <td>${mentoring.seniorCoworker.companyJob}</td>
        </tr>
        <tr>
            <th scope="row">회사위치</th>
            <td>${mentoring.seniorCoworker.companyLoc}</td>
        </tr>
        <tr>
            <th scope="row">회사구분</th>
            <td>${mentoring.seniorCoworker.companyDept}</td>
        </tr>
        <tr>
            <th scope="row">학번</th>
            <td>${mentoring.memNo}</td>
        </tr>
        <tr>
            <th scope="row" >멘티신청번호</th>
            <td>
            <input type="text" class="form-control" id="applEditMenteeNo" name="applEditMenteeNo" value="${mentoring.menteeNo}" disabled="disabled">
            </td>
        </tr>
        <tr>
            <th scope="row">원하는 직무</th>
            <td><input type="text" class="form-control" id="menteeJob" name="menteeJob" value="${mentoring.menteeJob}"></td>
        </tr>
        <tr>
            <th scope="row">원하는 회사</th>
            <td><input type="text" class="form-control" id="menteeCom" name="menteeCom" value="${mentoring.menteeCom}"></td>
        </tr>
    </tbody>
</table>
	<div class="col-sm-10">
		<div class="btn-group">
			<button type="submit" id="editForm" class="btn btn-primary">수정하기</button>
			<button type="button" id="delBtn" class="btn btn-danger">삭제하기</button>
		</div>
	</div>

</form>
