<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
 <div id="recordForm">
  	<p style="font-weight: bold; font-size: 20px;">신청상세조회</p>
  	<div class="col-lg-32 d-flex align-items-center" style="max-width: 100%; margin-top: 20px;">
  	 	<div class="form-row">
              <div class="col-12 col-md-6 mb-3">
                  <label class="form-label"
                         for="validationSample01">학번</label>
                     <p>${record.memNo}</p>
<!--                   <input type="text" -->
<!--                          class="form-control" -->
<!--                          id="validationSample01" -->
<!--                          required=""> -->
              </div>
              <div class="col-12 col-md-6 mb-3">
                  <label class="form-label"
                         for="validationSample02">이름</label>
                          <p>김차은(하드)</p>
<!--                   <input type="text" -->
<!--                          class="form-control" -->
<!--                          id="validationSample02" -->
<!--                          required=""> -->
              </div>
              <div class="form-group">
                   <label class="form-label">시작날짜</label>
                   <input id="flatpickrSample01"
                          type="hidden"
                          class="form-control flatpickr-input"
                          data-toggle="flatpickr"
                          value="${record.arcStart}">
               </div>
               <div class="form-group">
                   <label class="form-label">종료날짜</label>
                   <input id="flatpickrSample02"
                          type="hidden"
                          class="form-control flatpickr-input"
                          data-toggle="flatpickr"
                          value="${record.arcEnd}">
               </div>
              <div class="col-12 col-md-6 mb-3">
             		<label class="form-label"
                                  for="custom-select">학적변동분류</label>
					<p>${record.acaCla.acName}</p>
              </div>
              
               <div class="custom-file ">
                   <input type="file"
                          id="file"
                          class="custom-file-input">
                   <label for="file"
                          class="custom-file-label">
                          Drop형식으로 보여주기 
                   </label>
               </div>
               <div class="col-12 col-md-100 mb-s ">
                  <label class="form-label"
                         for="reason01">신청사유</label>
                         <p>${record.arcReason }</p>
<!--                   <input type="text" -->
<!--                          class="form-control" -->
<!--                          id="reason01" -->
<!--                          required=""> -->
              </div>
              <div class="col text-right">
              	<c:choose>
               		<c:when test="${record.status.statusCode eq 'STA01' }">
               			<button type="button" class="btn btn-primary" 
               				data-arcNo="${r.arcNo}" id="updateFormButton">수정하기</button>
               		</c:when>
               	</c:choose>
              </div>
      </div>
  </div>
</div>

<script src="<c:url value='/resources/js/paging.js' />"></script>
<script src='<c:url value="/resources/js/app/academicchange/academicRecordChange.js" />'></script>