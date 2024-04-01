<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

   <div class="container page__container">
				<div class="col d-flex" data-pg-role="searchUI" data-pg-target="#submitForm" >
                     <div class="col-1" style="margin-right: 50px;">
                        <form:select class="form-control" path="paging.simpleCondition.searchType" style="width: 100px;">
                           <form:option value="all" label="전체" selected="true"/>
                           <form:option value="title" label="제목" />
                           <form:option value="content" label="내용" />
                        </form:select>
                     </div>

					<div class="col-3 d-flex align-items-start">
                        <form:input type="search" class="form-control" path="paging.simpleCondition.searchWord" aria-label="Search"  style="margin-right: 10px;"/>
                        <input type="button"  class="btn btn-outline-primary" data-pg-role="searchBtn" value="검색"/>
                     </div>
				</div>
			<form:form id="submitForm" action="" modelAttribute="paging" method="get">
	           <input type='hidden' name="page" />
	           <form:input type='hidden' path="simpleCondition.searchType"/>
	           <form:input type='hidden' path="simpleCondition.searchWord"/>
        </form:form> 
		</div>

<div class="card dashboard-area-tabs p-relative o-hidden mb-lg-32pt bg-white"></div>
<div class="card-header p-0 nav bg-white">
	<div class="row no-gutters" role="tablist">
		<div class="col-auto">
			<a href="#" data-toggle="tab" role="tab" aria-selected="true"
				class="dashboard-area-tabs__tab card-body d-flex flex-row align-items-center justify-content-start active">
				<span class="h2 mb-0 mr-3">1</span> <span
				class="flex d-flex flex-column"> <strong class="card-title">취업 후기</strong> 
				<small class="card-subtitle text-50"></small>
			</span>
			</a>
		</div>
	</div>
</div>

<div class="table-responsive bg-white" data-toggle="lists"
	data-lists-sort-by="js-lists-values-date" data-lists-sort-desc="true"
	data-lists-values='["js-lists-values-lead", "js-lists-values-project", "js-lists-values-status", "js-lists-values-budget", "js-lists-values-date"]'>
	<table class="table mb-0 thead-border-top-0 table-nowrap">
		<thead>
			<tr>

				<th style="width: 18px;" class="pr-0">
					<div class="custom-control custom-checkbox">
						<input type="checkbox"
							class="custom-control-input js-toggle-check-all"
							data-target="#projects" id="customCheckAll">
					</div>
				</th>

				<th style="width: 150px;"><a href="javascript:void(0)"
					class="sort" data-sort="js-lists-values-project">순번</a></th>

				<th><a href="javascript:void(0)" class="sort"
					data-sort="js-lists-values-lead">제목</a></th>

				<th style="width: 48px;"><a href="javascript:void(0)"
					class="sort" data-sort="js-lists-values-status">학과</a></th>

				<th style="width: 48px;"><a href="javascript:void(0)"
					class="sort" data-sort="js-lists-values-budget">성명</a></th>

				<th style="width: 48px;"><a href="javascript:void(0)"
					class="sort" data-sort="js-lists-values-date">작성일</a></th>
				<th style="width: 24px;"></th>
			</tr>
		</thead>
		<c:forEach items="${employmentReviewList }" var="employmentReview">
			<tbody class="list" id="projects">

				<tr>
					<td class="pr-0">
						<div class="custom-control custom-checkbox">
							<input type="checkbox"
								class="custom-control-input js-check-selected-row"
								id="customCheck1_1">
						</div>
					</td>

					<td>

						<div class="media flex-nowrap align-items-center"
							style="white-space: nowrap;">
							<div class="media-body">
								<div class="d-flex flex-column">
									<small class="js-lists-values-project"><strong>${employmentReview.rnum }</strong></small>
								</div>
							</div>
						</div>

					</td>

					<td>

					<div class="media-body">
	
						<div class="d-flex align-items-center">
							<div class="flex d-flex flex-column">
								<p class="mb-0">
									<a href="#" class="js-lists-values-lead" id="employmentReviewCode" data-empNo="${employmentReview.empNo }">
									${employmentReview.empTitle }
									</a>
								</p>
							</div>
						</div>
	
					</div>
					</td>

					<td>
						<div class="d-flex flex-column">
							<small class="js-lists-values-status">${employmentReview.deptName }</small>
						</div>
					</td>

					<td>
						<div class="d-flex flex-column">
							<small class="js-lists-values-budget">
							<strong>${employmentReview.memName }</strong>
							</small>
						</div>
					</td>

					<td>
						<div class="d-flex flex-column">
							<small class="js-lists-values-date">
							<strong>${employmentReview.empDate }</strong>
							</small>
						</div>
					</td>
				</tr>
			</tbody>
		</c:forEach>
	</table>
		${pagingHTML }
</div>

<div id="employmentDetailArea"></div>

<script src="<c:url value='/resources/js/paging.js'/>"></script>

<script>
var cPath = $('body').data('bodyCpath')
//제목 클릭 이벤트
$(document).on('click', '#employmentReviewCode', function() {
	
    var empNo = $(this).attr('data-empNo');
    console.log(empNo);
    var url = `\${cPath}/student/careerup/employment/employmentreview/employmentReviewDetail/\${empNo}`;
    $.ajax({
        url: url,
        type: 'GET',
        success: function(response) {
            $('#employmentDetailArea').empty();
            $('#employmentDetailArea').html(response);
        },
        error: function(xhr, status, error) {
            console.error('Error detail:', error);
        }
    });
});
</script>