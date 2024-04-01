<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<form:form id="forMentorForm" method="post">

	<div class="form-group row" style="display: none;">
         <input type="text" class="form-control" id="deptCode" name="deptCode" value="${appl.deptCode }" readonly=""/>
    </div>
            
    <div class="form-group row">
        <label for="senior" class="col-sm-2 col-form-label">성명</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="memName" name="memName" value="${appl.memName }" readonly=""/>
        </div>
    </div>

    <div class="form-group row">
        <label for="userNumber" class="col-sm-2 col-form-label">학번</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="smemNo" name="smemNo" value="${appl.smemNo }" readonly=""/>
        </div>
    </div>

    <div class="form-group row">
        <label for="desiredCompany" class="col-sm-2 col-form-label">회사구분</label>
        <div class="col-sm-10">
            <select class="form-control" name="companyNm" id="companyNm">
                <option value="">회사구분 선택</option>
                <c:forEach items="${companyTypeList }" var="type">
                    <option value="${type.companyNm }">${type.companyNm }</option>
                </c:forEach>
            </select>
        </div>
    </div>

    <div class="form-group row">
        <label for="desiredJob" class="col-sm-2 col-form-label">지역</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="companyLoc" name="companyLoc"/>
        </div>
    </div>

    <div class="form-group row">
        <label for="desiredJob" class="col-sm-2 col-form-label">회사명</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="companyNm" name="companyNm"/>
        </div>
    </div>

    <div class="form-group row">
        <label for="desiredJob" class="col-sm-2 col-form-label">부서</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="companyDept" name="companyDept"/>
        </div>
    </div>

    <div class="form-group row">
        <label for="desiredJob" class="col-sm-2 col-form-label">직무</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="companyJob" name="companyJob"/>
        </div>
    </div>

    <div class="form-group row">
        <div class="col-sm-10 offset-sm-2">
            <button type="submit" id="submitForm" class="btn btn-primary">등록</button>
            <button type="submit" id="delBtn" class="btn btn-primary" data-gf-no="123">삭제</button>
            <button id="demoButton" type="button" class="btn btn-primary" onclick="fillFormData()">시연용 데이터</button>
        </div>
    </div>
</form:form>

