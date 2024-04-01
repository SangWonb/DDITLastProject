<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<form id="menteeInsertForm" method="post">
  <div class="form-group row">
    <label for="senior" class="col-sm-2 col-form-label">취업선배코드</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="senior" name="senior" value="${srNo }" readonly style="width: 150px;">
    </div>
  </div>
  
  <div class="form-group row">
    <label for="senior" class="col-sm-2 col-form-label">취업선배</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="senior" name="senior" value="${memName }" readonly style="width: 150px;">
    </div>
  </div>
  
  <div class="form-group row">
    <label for="userNumber" class="col-sm-2 col-form-label">학번</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="memNo" name="memNo" value="${hakbun }" readonly style="width: 150px;">
    </div>
  </div>
  
  <div class="form-group row">
    <label for="desiredJob" class="col-sm-2 col-form-label">원하는 직무</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="menteeJob" name="menteeJob" style="width: 150px;">
    </div>
  </div>
  
  <div class="form-group row">
    <label for="desiredCompany" class="col-sm-2 col-form-label">원하는 회사</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="menteeCom" name="menteeCom" style="width: 150px;">
    </div>
  </div>
  
  <div class="form-group row">
    <div class="col-sm-10 offset-sm-2">
      <button type="submit" id="submitForm" class="btn btn-primary">신청하기</button>
      <button id="demoButton" type="button" class="btn btn-primary" onclick="fillFormData()">시연용 데이터</button>
    </div>
  </div>
</form>
