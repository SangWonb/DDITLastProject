<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<form:form id="scholarshipEditData" action="" method="POST" modelAttribute="vo">
    <div class="form-group" style="display: none;">
        <form:input type="text" class="form-control" id="scholCode" path="scholCode" value="${vo.scholCode}" />
    </div>
    <div class="form-group">
        <label for="scholName">장학금명</label>
        <form:input type="text" class="form-control" id="scholName" path="scholName" value="${vo.scholName}" />
    </div>
    <div class="form-group">
        <label for="scholCriteria">수혜조건</label>
        <form:input class="form-control" id="scholCriteria" path="scholCriteria" value="${vo.scholCriteria}" />
    </div>
    <div class="form-group">
        <label for="scholDm">지급방식</label>
        <form:select class="form-control" path="scholDm">
            <form:option value="">지급방식 선택</form:option>
            <form:option value="현금">현금</form:option>
            <form:option value="등록금">등록금</form:option>
            <form:option value="기타">기타</form:option>
        </form:select>
    </div>
    <div class="form-group">
        <label for="scholAmt">지급액</label>
        <form:input type="number" class="form-control" id="scholAmt" path="scholAmt" value="${vo.scholAmt}" />
    </div>
    <div class="form-group">
        <label for="scholRp">교수추천 가능여부</label>
        <form:select class="form-control" path="scholRp">
            <form:option value="">추천가능여부 선택</form:option>
            <form:option value="Y">가능</form:option>
            <form:option value="N">불가</form:option>
        </form:select>
    </div>
    <button type="submit" class="btn btn-primary">수정</button>
    <button type="button" id="delBtn" class="btn btn-danger" value="${vo.scholCode}">삭제</button>
</form:form>
