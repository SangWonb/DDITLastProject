<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<style>
	table,tr,td {
		border: 1px solid black;
		border-collapse: collapse;
		text-align: center;
	}
</style>

<div class="container mt-5 bg-white">
    <table class="table" id="table">
        <tr>
            <th colspan="2" style="text-align: center;">${book.bookCode}</th>
        </tr>
        <tr>
            <td>번호: ${book.rnum}</td>
            <td>제목: ${book.bookName}</td>
        </tr>
        <tr>
            <td>저자: ${book.bookWriter}</td>
            <td>출판사: ${book.bookCompany}</td>
        </tr>
        <tr>
            <td>카테고리: ${book.bookCategory}</td>
            <td>대출여부: ${book.bookState}</td>
        </tr>
        <tr>
            <td colspan="2">${book.bookContent}</td>
        </tr>
    </table>
</div>