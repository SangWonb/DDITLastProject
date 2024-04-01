<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.time.LocalDate" %>  
  <form id="recordForm" method="post" action='<c:url value="acaForm"/>'>
  <p style="font-weight: bold; font-size: 20px;">신청서</p>
  	<div class="col-lg-32 d-flex align-items-center" style="max-width: 100%; margin-top: 20px;">
  	 	<div class="form-row">
              <div class="col-12 col-md-6 mb-3">
                  <label class="form-label"
                         for="validationSample01">학번</label>
                       <input name="memNo" class="form-control" value="${memNo}" disabled></input>
              </div>
              <div class="col-12 col-md-6 mb-3">
                  <label class="form-label"
                         for="validationSample02">이름</label>
                       <input name="memName" class="form-control" value="${name}" disabled></input>
              </div>
              <div class="form-group">
                   <label class="form-label">년도</label>
                   <c:set var="currentYear" value="<%= LocalDate.now().getYear() %>"/>
                   <input name="arcYear" class="form-control" value="${currentYear}" disabled/>
               </div>
               <div class="form-group" style="margin-left:3%">
                   <label class="form-label">학기</label>
                  <c:set var="currentMonth" value="<%= LocalDate.now().getMonthValue() %>"/>
					<c:choose>
					  <c:when test="${currentMonth ge 2 and currentMonth le 6}">
					    <input name="arcSemester" class="form-control" value="1학기" disabled>
					  </c:when>
					  <c:otherwise>
					     <input name="arcSemester" class="form-control" value="2학기" disabled>
					  </c:otherwise>
					</c:choose>
               </div>
              <div class="col-12 col-md-6 mb-3" style="margin-left:3%;">
             		<label class="form-label"
                                  for="custom-select">학적변동분류</label>
	                <select id="custom-select" name="acCode"
                           class="form-control custom-select" required>
                       <option value="">선택</option>
                     	      <c:forEach items="${acaType}" var="t">
                      	       		<c:if test="${t.acCode != 'AC004'}">
	                       		<option value="${t.acCode}" data-type="${t.acCode}">${t.acName}</option>
                      				</c:if>
                      	      </c:forEach>
	                </select>
              </div>
               <div class="col-12 col-md-100 mb-s " style="margin-bottom:20px;">
                  <label class="form-label"
                         for="reason01">신청사유</label>
                  <input type="text"
                         class="form-control"
                         id="reason01"
                         name="arcReason"
                         required="">
                  <div class="invalid-feedback">Please provide a first name.</div>
                  <div class="valid-feedback">Looks good!</div>
              </div>
              
               <div class="custom-file " style="margin-left:4px;">
                   <input type="file"
                          id="file"
                          name="file"
                          class="custom-file-input">
                   <label for="file"
                          class="custom-file-label">
                          첨부파일선택 
                   </label>
               
                   <div class="col-6 col-md-6 mb-3">
                   	*군휴학 시 입영통지서 첨부 필수
                   </div>
               </div>
      </div>
  </div>
  <div class="col text-right" style="margin-top:10px; margin-left:2%">
  <button class="btn btn-primary" type="submit" id="submitForm" data-mem-no="${memNo}" data-mem-name="${name}">제출하기</button>
  </div>
</form>


<script src="<c:url value='/resources/js/paging.js' />"></script>
<script src='<c:url value="/resources/js/app/academicchange/academicRecordChange.js" />'></script>