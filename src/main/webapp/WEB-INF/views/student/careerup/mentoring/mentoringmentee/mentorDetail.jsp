<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<div id="mentorDetail">
    <table class="table table-striped table-bordered">
        <tbody>
            <tr>
                <th style="width: 30%;" scope="row">이름</th>
                <td style="width: 70%;">${mentor.memName}</td>
            </tr>
            <tr>
                <th scope="row">학과</th>
                <td>${mentor.deptName}</td>
            </tr>
            <tr>
                <th scope="row">회사이름</th>
                <td>${mentor.companyNm}</td>
            </tr>
            <tr>
                <th scope="row">회사구분</th>
                <td>${mentor.companyType}</td>
            </tr>
            <tr>
                <th scope="row">회사부서</th>
                <td>${mentor.companyDept}</td>
            </tr>
            <tr>
                <th scope="row">직무</th>
                <td>${mentor.companyJob}</td>
            </tr>
            <tr>
                <th scope="row">회사위치</th>
                <td>${mentor.companyLoc}</td>
            </tr>
        </tbody>
    </table>
</div>
