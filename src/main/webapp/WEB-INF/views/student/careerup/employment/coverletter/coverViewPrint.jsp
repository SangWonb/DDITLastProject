<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<style>
    .container {
        margin-top: 50px;
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .text-center {
        text-align: center;
    }

    .bodyText {
        text-align: left;
    }

    .table {
        width: 100%;
        border-collapse: collapse;
    }

    .table th,
    .table td {
        border: 1px solid #dee2e6;
        padding: 8px;
    }

    .table th {
        background-color: #f8f9fa;
    }
</style>

<div class="container">
    <h2 class="text-center mb-4">자기소개서</h2>
    <table class="table">
        <tbody>
            <c:forEach var="cover" items="${coverList}">
                <tr>
                    <td class="bodyText">${cover.cldTitle}</td>
                </tr>
                <tr>
                    <td class="bodyText">${cover.cldContent}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<script>
	print()
</script>