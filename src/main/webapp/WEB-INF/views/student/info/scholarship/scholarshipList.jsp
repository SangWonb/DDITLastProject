<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<div class="card dashboard-area-tabs p-relative o-hidden mb-lg-32pt"></div>
<div class="card-header p-0 nav">
	<div class="row no-gutters" role="tablist">
		<div class="col-auto">
			<a href="#" data-toggle="tab" role="tab" aria-selected="true"
				class="dashboard-area-tabs__tab card-body d-flex flex-row align-items-center justify-content-start active">
				<span class="h2 mb-0 mr-3">1</span> <span
				class="flex d-flex flex-column">
				<strong class="card-title">장학금 수혜 정보</strong>
				<small class="card-subtitle text-50">SCHOLARSHIP</small>
			</span>
			</a>
		</div>
	</div>
</div>

<div class="table-responsive" data-toggle="lists"
	data-lists-sort-by="js-lists-values-date" data-lists-sort-desc="true"
	data-lists-values='["js-lists-values-lead", "js-lists-values-project", "js-lists-values-status", "js-lists-values-budget", "js-lists-values-date"
	, "js-lists-values-year", "js-lists-values-rnum"]'>
	<table class="table mb-0 thead-border-top-0 table-nowrap bg-white" style="margin: 20px;">
		<thead>
			<tr>

				<th style="width: 150px;"><a>순번</a></th>

				<th style="width: 150px;"><a href="javascript:void(0)"
					class="sort" data-sort="js-lists-values-year">년도/학기</a></th>
					
				<th style="width: 150px;"><a href="javascript:void(0)"
					class="sort" data-sort="js-lists-values-project">장학금명</a></th>

				<th><a href="javascript:void(0)" class="sort"
					data-sort="js-lists-values-lead">장학금 기준</a></th>

				<th style="width: 48px;"><a href="javascript:void(0)"
					class="sort" data-sort="js-lists-values-status">지급방법</a></th>

				<th style="width: 48px;"><a href="javascript:void(0)"
					class="sort" data-sort="js-lists-values-date">지급일자</a></th>
				
				<th style="width: 48px;"><a href="javascript:void(0)"
					class="sort" data-sort="js-lists-values-budget">장학금 지급액</a></th>
			</tr>
		</thead>
		
		<c:choose>
			<c:when test="${not empty scholashipList }">
		<c:forEach items="${scholashipList}" var="scholashipList">
			<tbody class="list" id="projects">

				<tr>
					<td>
						<small class="js-lists-values-year"><strong>${scholashipList.rnum}</strong></small>
					</td>
					
					<td>
						<div class="media flex-nowrap align-items-center"
							style="white-space: nowrap;">
							<div class="media-body">
								<div class="d-flex flex-column">
									<small class="js-lists-values-year"><strong>
										<c:set var="year" value="${fn:substringBefore(scholashipList.yearSemester, '/')}"/>
										<c:set var="semester" value="${fn:substringAfter(scholashipList.yearSemester, '/')}"/>
										<c:choose>
										    <c:when test="${semester == 1}">
										        ${year}년 1학기
										    </c:when>
										    <c:when test="${semester == 2}">
										        ${year}년 2학기
										    </c:when>
										    <c:otherwise>
										        유효하지 않은 학기
										    </c:otherwise>
										</c:choose>
									</strong></small>
								</div>
							</div>
						</div>
					</td>
					
					<td>
						<div class="media flex-nowrap align-items-center"
							style="white-space: nowrap;">
							<div class="media-body">
								<div class="d-flex flex-column">
									<small class="js-lists-values-project"><strong>${scholashipList.scholaship.scholName}</strong></small>
								</div>
							</div>
						</div>
					</td>

					<td>
						<div class="media-body">
							<div class="d-flex align-items-center">
								<div class="flex d-flex flex-column">
									<p class="mb-0">
										<strong class="js-lists-values-lead">${scholashipList.scholaship.scholCriteria}</strong>
									</p>
								</div>
							</div>
						</div>
					</td>

					<td>
						<div class="d-flex flex-column">
							<small class="js-lists-values-status text-50 mb-4pt">${scholashipList.scholaship.scholDm}</small>
							<span class="indicator-line rounded bg-warning"></span>
						</div>
					</td>

					<td>
						<div class="d-flex flex-column">
							<small class="js-lists-values-date"><strong>${scholashipList.scholDate}</strong></small>
						</div>
					</td>
					
					<td>
						<div class="d-flex flex-column">
							<small class="js-lists-values-budget" style="margin: 0 auto;"><strong>${scholashipList.scholaship.scholAmt}원</strong></small>
						</div>
					</td>
				</tr>
			</tbody>
		</c:forEach>
		</c:when>
		<c:otherwise>
		<tr>
		    <td colspan="7" style="text-align: center;">
		        <div style="display: flex; justify-content: center; align-items: center;">
		            <small><strong>장학금 내역이 존재하지 않습니다.</strong></small>
		        </div>
		    </td>
		</tr>
		</c:otherwise>
		</c:choose>
	</table>
</div>
<form id="submitForm" action="" style="display: none;">
	<input type="text" name="page"/>
</form>
<script src="<c:url value='/resources/js/paging.js'/>"></script>