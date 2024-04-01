<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<form id="submitForm">
    <div class="row">
        <div class="col-auto">
			<input type="text" name="titleName" id="titleName" class="form-control" placeholder="키워드 검색">
        </div>
        <div class="col-auto">
            <button type="submit" class="btn btn-primary">조회</button>
        </div>
    </div>
</form>

<div class="card dashboard-area-tabs p-relative o-hidden mb-lg-32pt bg-white"></div>
<div class="card-header p-0 nav">
   <div class="row no-gutters" role="tablist">
      <div class="col-auto">
         <a href="#" data-toggle="tab" role="tab" aria-selected="true"
            class="dashboard-area-tabs__tab card-body d-flex flex-row align-items-center justify-content-start active">
            <span class="h2 mb-0 mr-3">1</span> <span
            class="flex d-flex flex-column"> <strong class="card-title">취업처</strong>
            <small class="card-subtitle text-50">Agency</small>
         </span>
         </a>
      </div>
   </div>
</div>

<div class="table-responsive bg-white" data-toggle="lists"
    data-lists-sort-desc="true"
   data-lists-values='["js-lists-values-rnum","js-lists-values-project", "js-lists-values-lead", "js-lists-values-status"]'>
   <table class="table mb-0 thead-border-top-0 table-nowrap bg-white" style="margin: 20px;">
      <thead>
         <tr>

            <th style="width: 150px;"><a href="javascript:void(0)"
               class="sort" data-sort="js-lists-values-rnum">순번</a></th>

            <th style="width: 150px;"><a href="javascript:void(0)"
               class="sort" data-sort="js-lists-values-project">제목</a></th>

            <th><a href="javascript:void(0)" class="sort"
               data-sort="js-lists-values-lead">접수기간</a></th>

            <th style="width: 48px;"><a href="javascript:void(0)"
               class="sort" data-sort="js-lists-values-status">회사명</a></th>
         </tr>
      </thead>
      
      <tbody class="list" id="projects">
      <c:choose>
      <c:when test="${not empty employmentAgencyList}">
      <c:forEach items="${employmentAgencyList}" var="agency" varStatus="status">
            <tr>
               <td>
                  <div class="media flex-nowrap align-items-center"
                     style="white-space: nowrap;">
                     <div class="media-body">
                        <div class="d-flex flex-column">
                           <small class="js-lists-values-rnum">${agency.rnum }</small>
                        </div>
                     </div>
                  </div>
               </td>
               
               <td>
                  <div class="media flex-nowrap align-items-center"
                     style="white-space: nowrap;">
                     <div class="media-body">
                        <div class="d-flex flex-column">
                           <a class="js-lists-values-project" href="${agency.emplUrl }" onclick="openNewPage(event)">
                           	${agency.titleName}
                           </a>
                        </div>
                     </div>
                  </div>
               </td>

               <td>
                  <div class="media-body">
                     <div class="d-flex align-items-center">
                        <div class="flex d-flex flex-column">
                           <p class="mb-0">
                              <strong class="js-lists-values-lead">
                              	${agency.limitDate }
                              </strong>
                           </p>
                        </div>
                     </div>
                  </div>
               </td>

               <td>
                  <div class="d-flex flex-column">
                     <small class="js-lists-values-status text-50">
                           ${agency.companyName }
                     </small>
                  </div>
               </td>
            </tr>
         </c:forEach>
         </c:when>
         <c:otherwise>
            <td>취업처 내역이 존재하지 않습니다.</td>
         </c:otherwise>
      </c:choose>
         </tbody>
   </table>
   ${pagingHTML }
</div>

<form id="submitForm" action="" style="display: none;">
	<input type="text" name="page"/>
</form>

<script src="<c:url value='/resources/js/paging.js'/>"></script>
<script>
    function openNewPage(event) {
        event.preventDefault(); 
        var url = event.target.href;
        window.open(url, '_blank');
    }
</script>