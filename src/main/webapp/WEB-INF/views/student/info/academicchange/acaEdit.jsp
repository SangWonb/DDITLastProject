<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <form id="recordEditForm" modelAttribute="newRecord" method="post" action='<c:url value="acaEditForm"/>'>
  <p style="font-weight: bold; font-size: 20px;">신청서</p>
  	<div class="col-lg-32 d-flex align-items-center" style="max-width: 100%; margin-top: 20px;">
  	 	<div class="form-row">
          <div class="col-12 col-md-6 mb-3">
                  <label class="form-label"
                         for="validationSample01">학번</label>
                       <input name="memNo" class="form-control" value="${memNo}" readonly></input>
              </div>
              <div class="col-12 col-md-6 mb-3">
                  <label class="form-label"
                         for="validationSample02">이름</label>
                       <input name="memName" class="form-control" value="${name}" disabled></input>
              </div>
              <div class="form-group">
                   <label class="form-label">시작날짜</label>
                   <input id="flatpickrSample01" type="hidden" class="form-control flatpickr-input" data-toggle="flatpickr" value="2024-02-19">
                   <input id="flatpickrSample01"
                   		  name="arcStart"
                          type="hidden"
                          class="form-control flatpickr-input"
                          data-toggle="flatpickr"
                          value="${record.arcStart}"
                          required
                          >
               </div>
               <div class="form-group">
                   <label class="form-label">종료날짜</label>
                   <input id="flatpickrSample02"
                    	  name="arcEnd"
                          type="hidden"
                          class="form-control flatpickr-input"
                          data-toggle="flatpickr"
                          value="${record.arcEnd}"
                          required
                          >
               </div>
              <div class="col-12 col-md-6 mb-3">
             		<label class="form-label"
                                  for="custom-select">학적변동분류</label>
	                <select id="custom-select"  name="acCode"
                           class="form-control custom-select">
                       <option value="record.acaCla.acName">선택</option>
                     	      <c:forEach items="${acaType}" var="t">
                      	       		<c:if test="${t.acCode != 'AC004'}">
	                       		<option value="${t.acCode}" data-type="${t.acCode}">${t.acName}</option>
                      				</c:if>
                      	      </c:forEach>
	                </select>
              </div>
              
               <div class="custom-file ">
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
               <div class="col-12 col-md-100 mb-s ">
                  <label class="form-label"
                         for="reason01">신청사유</label>
                  <input type="text"
                         class="form-control"
                         name="arcReason"
                         id="reason01"
                         required="">
              </div>
      </div>
  </div>
   <div class="col text-right">
  <button class="btn btn-primary" type="submit" id="submitForm">제출하기</button>
  </div>
  </form>

<script src="<c:url value='/resources/js/paging.js' />"></script>
<script src='<c:url value="/resources/js/app/academicchange/academicRecordChange.js" />'></script>
