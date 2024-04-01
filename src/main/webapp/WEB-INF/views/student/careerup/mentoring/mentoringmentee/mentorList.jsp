<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<div class="tab-content">
	
	<div id="ongoing">
		<div id="applList" class="table-responsive bg-white" data-toggle="lists"
			data-lists-sort-by="js-lists-values-project" data-lists-sort-desc="true"
			data-lists-values='["js-lists-values-lead", "js-lists-values-project", "js-lists-values-status", "js-lists-values-budget", "js-lists-values-date","js-lists-values-a"]'>
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
							class="sort" data-sort="js-lists-values-project">번호</a></th>

						<th><a href="javascript:void(0)" class="sort"
							data-sort="js-lists-values-lead">멘토이름</a></th>

						<th style="width: 48px;"><a href="javascript:void(0)"
							class="sort" data-sort="js-lists-values-status">학과</a></th>

						<th style="width: 48px;"><a href="javascript:void(0)"
							class="sort" data-sort="js-lists-values-date">신청날짜</a></th>

						<th style="width: 48px;"><a href="javascript:void(0)"
							class="sort" data-sort="js-lists-values-budget">승인/반려</a></th>
							
						<th style="width: 48px;"><a href="javascript:void(0)"
							class="sort" data-sort="js-lists-values-a">수정</a></th>
					</tr>
				</thead>
				<tbody class="list" id="projects">
					<c:if test="${not empty mentoringApplList}">
						<c:forEach items="${mentoringApplList }" var="mentoringAppl" varStatus="status">

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
												<small class="js-lists-values-project">
													<strong>
														<c:out value="${status.index+1}"></c:out>
													</strong>
												</small>
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
														${mentoringAppl.memName } </strong>
												</p>
											</div>
										</div>

									</div>
								</td>

								<td>
									<div class="d-flex flex-column">
										<small class="js-lists-values-date text-50 mb-4pt">
											${mentoringAppl.deptName} </small> <span
											class="indicator-line rounded bg-warning"></span>
									</div>
								</td>

								<td>
									<div class="d-flex flex-column">
										<small class="js-lists-values-status"><strong>${mentoringAppl.menteeDate }</strong></small>
										<!--  <small class="text-50">Invoice Sent</small> -->
									</div>
								</td>
								<td>
									<div class="d-flex flex-column">
										<small class="js-lists-values-budget text-50 mb-4pt">
											${mentoringAppl.status.statusNm } </small>
										${mentoringAppl.reject.rejectReason } <span class="indicator-line rounded bg-warning"></span>
									</div>
								</td>
								<td>
									<div class="d-flex flex-column">
										<small class="js-lists-values-a text-50 mb-4pt"> <c:choose>
												<c:when test="${mentoringAppl.status.statusCode eq 'STA01' }">
												<a href="#" onclick="editBtn('${mentoringAppl.menteeNo }')">수정하기</a>
												</c:when>
												<c:otherwise>
													<button type="button" class="btn btn-secondary" disabled="">수정불가</button>
												</c:otherwise>
											</c:choose>
										</small>
									</div>
								</td>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>
</div>
<!-- 		s -->

<script src="<c:url value='/resources/js/paging.js'/>"></script>