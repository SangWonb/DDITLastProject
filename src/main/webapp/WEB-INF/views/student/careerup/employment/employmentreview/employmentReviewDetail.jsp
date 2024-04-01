<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="container mt-5 bg-white" id="employmentReviewDetail">
<table class="table table-bordered">
    <thead class="thead-dark">
        <tr>
            <th colspan="4" class="text-center">${employmentReview.empTitle}</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>취업선배 이름</td>
            <td>${employmentReview.memName}</td>
            <td>학과</td>
            <td>${employmentReview.deptName}</td>
        </tr>
        <tr>
            <td>학번</td>
            <td>${employmentReview.smemNo}</td>
            <td>작성일</td>
            <td>${employmentReview.empDate}</td>
        </tr>
        <tr>
            <td colspan="4" class="text-center">${employmentReview.empComment}</td>
        </tr>
    </tbody>
</table>
</div>
