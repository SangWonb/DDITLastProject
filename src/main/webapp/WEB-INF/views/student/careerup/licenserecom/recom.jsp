<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    
<div id="licenseRecom" class="bg-white">
<div class="card dashboard-area-tabs p-relative o-hidden mb-lg-32pt"></div>

<div class="text-center mb-4">
    <h5 class="mb-0">선택한 전공과 직무를 기반으로 추천된 자격증 순위입니다.</h5>
</div>

<div class="card-header p-0 nav" >
	<div class="row no-gutters" role="tablist">
		<div class="col-auto">
			<a href="#" data-toggle="tab" role="tab" aria-selected="true"
				class="dashboard-area-tabs__tab card-body d-flex flex-row align-items-center justify-content-start active">
				<span class="h2 mb-0 mr-3">1</span> 
				<span class="flex d-flex flex-column">
				<strong class="card-title">자격증 추천</strong>
				<small class="card-subtitle text-50">Certificate recommendation</small>
			</span>
			</a>
		</div>
	</div>
</div>

<div class="table-responsive" data-toggle="lists"
	data-lists-sort-by="js-lists-values-date" data-lists-sort-desc="true"
	data-lists-values='["js-lists-values-lead", "js-lists-values-project", "js-lists-values-status", "js-lists-values-budget", "js-lists-values-date"]'>
		<table class="table mb-0 thead-border-top-0 table-nowrap">
			<thead>
				<tr>
					<th style="width: 150px;"><a href="javascript:void(0)"
						class="sort" data-sort="js-lists-values-project">순위</a></th>

					<th><a href="javascript:void(0)" class="sort"
						data-sort="js-lists-values-lead">자격증명</a></th>

					<th style="width: 48px;"><a href="javascript:void(0)"
						class="sort" data-sort="js-lists-values-status">자격증발행기관</a></th>

<!-- 					<th style="width: 48px;"><a href="javascript:void(0)" -->
<!-- 						class="sort" data-sort="js-lists-values-budget">자격증발행기관</a></th> -->
				</tr>
			</thead>
				<tbody class="list" id="projects">
					<tr>
						<td>
							<div class="media-body">
								<div class="d-flex align-items-center">
									<div class="flex d-flex flex-column">
										<p class="mb-0">
											<strong class="js-lists-values-lead">1순위</strong>
										</p>
									</div>
								</div>
							</div>
						</td>

						<td>
							<div class="d-flex flex-column">
								<small class="js-lists-values-status mb-4pt">${recom.one }</small>
							</div>
						</td>

						<td>
							<div class="d-flex flex-column">
								<small class="js-lists-values-budget"><strong>${recom.oneAuth }</strong></small>
							</div>
						</td>
<!-- 						<td> -->
<!-- 							<div class="d-flex flex-column"> -->
<%-- 								<small class="js-lists-values-date"><strong>${recom.three }${recom.threeAuth }</strong></small> --%>
<!-- 							</div> -->
<!-- 						</td> -->
					</tr>
					<tr>
						<td>
							<div class="media-body">
								<div class="d-flex align-items-center">
									<div class="flex d-flex flex-column">
										<p class="mb-0">
											<strong class="js-lists-values-lead">2순위</strong>
										</p>
									</div>
								</div>
							</div>
						</td>

						<td>
							<div class="d-flex flex-column">
								<small class="js-lists-values-status mb-4pt">${recom.two }</small>
							</div>
						</td>

						<td>
							<div class="d-flex flex-column">
								<small class="js-lists-values-budget"><strong>${recom.twoAuth }</strong></small>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="media-body">
								<div class="d-flex align-items-center">
									<div class="flex d-flex flex-column">
										<p class="mb-0">
											<strong class="js-lists-values-lead">3순위</strong>
										</p>
									</div>
								</div>
							</div>
						</td>

						<td>
							<div class="d-flex flex-column">
								<small class="js-lists-values-status mb-4pt">${recom.three }</small>
							</div>
						</td>

						<td>
							<div class="d-flex flex-column">
								<small class="js-lists-values-budget"><strong>${recom.threeAuth }</strong></small>
							</div>
						</td>
						</tr>
				</tbody>
		</table>
	</div>
</div>