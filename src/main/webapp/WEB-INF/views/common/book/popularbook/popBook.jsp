<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<style>
	table, th, td {
		border: 1px solid black;
		border-collapse: collapse;
		text-align: center;
	}
</style>

<table>
    <thead>
        <tr>
            <td>순위</td>
            <td>제목</td>
            <td>저자</td>
            <td>출판사</td>
            <td>카테고리</td>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${popBook}" var="p">
            <tr>
                <td>${p.rnum}</td>
                <td>${p.bookInfo.bookName}</td>
                <td>${p.bookInfo.bookWriter}</td>
                <td>${p.bookInfo.bookCompany}</td>
                <td>${p.bookInfo.bookCategory}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>