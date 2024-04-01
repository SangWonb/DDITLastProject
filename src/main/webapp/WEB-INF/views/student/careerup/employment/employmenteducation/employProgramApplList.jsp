<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<div id="employmentProgramApplList">
	<div class="table-responsive" data-toggle="lists"
		id="employmentProgramList" data-lists-sort-by="js-lists-values-date"
		data-lists-sort-desc="true"
		data-lists-values='["js-lists-values-project1", "js-lists-values-lead1", 
		"js-lists-values-status1", "js-lists-values-budget1", "js-lists-values-date1"]'>
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
						class="sort" data-sort="js-lists-values-project1">순번</a></th>

					<th><a href="javascript:void(0)" class="sort"
						data-sort="js-lists-values-lead1">프로그램명</a></th>

					<th style="width: 48px;"><a href="javascript:void(0)"
						class="sort" data-sort="js-lists-values-status1">신청일</a></th>

					<th style="width: 48px;"><a href="javascript:void(0)"
						class="sort" data-sort="js-lists-values-budget1">신청상태</a></th>

					<th style="width: 48px;"><a href="javascript:void(0)"
						class="sort" data-sort="js-lists-values-date1">수정</a></th>
				</tr>
			</thead>
			<tbody class="list" id="projects">
				<c:if test="${not empty employProgramApplList}">
					<c:forEach items="${employProgramApplList }" var="employProgramAppl" varStatus="loop">

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
											<small class="js-lists-values-project1"><strong>${loop.count }</strong></small>
										</div>
									</div>
								</div>

							</td>

							<td>
								<div class="media-body">
									<div class="d-flex align-items-center">
										<div class="flex d-flex flex-column">
											<p class="mb-0">
												<strong class="js-lists-values-lead1" id="employProgramCd"> ${employProgramAppl.emppgNm }
												</strong>
											</p>
										</div>
									</div>
								</div>
							</td>

							<td>
								<div class="d-flex flex-column">
									<small class="js-lists-values-status1 text-50 mb-4pt">
										${employProgramAppl.emppgDate } </small>
								</div>
							</td>

							<td>
								<div class="d-flex flex-column">
									<small class="js-lists-values-budget1">
										${employProgramAppl.status.statusNm } </small>
									${employProgramAppl.reject.rejectReason } <span
										class="indicator-line rounded bg-warning"></span>
								</div>
							</td>
							<td>
								<div class="d-flex flex-column">
									<small class="js-lists-values-date text-50 mb-4pt"> <c:choose>
											<c:when
												test="${employProgramAppl.status.statusCode eq 'STA01' }">
<%-- 												<a href="#" onclick="delApplBtn('${employProgramAppl.applNo }')">취소하기</a> --%>
												<button type="button" id="delApplBtn" class="btn btn-danger" value="${employProgramAppl.applNo }">삭제하기</button>
											</c:when>
											<c:otherwise>
												<button type="button" class="btn btn-secondary" disabled="">취소불가</button>
											</c:otherwise>
										</c:choose>
									</small>
								</div>
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
</div>