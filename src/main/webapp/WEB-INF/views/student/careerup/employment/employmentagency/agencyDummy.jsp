<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
취업처 조회 페이지
<div class="box p-3" style="background-color: #f8f9fa;">
    <form action="your_action_url" method="get">
        <div class="row align-items-center">
            <div class="col-auto">
                <input type="text" name="keyword" id="keyword" class="form-control" placeholder="키워드 검색">
            </div>
            <div class="col-auto">
                <button type="submit" class="btn btn-primary">조회</button>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col">
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" value="" id="selectAll">
                    <label class="form-check-label" for="selectAll">
                        전체
                    </label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input city-checkbox" type="checkbox" value="" id="seoul">
                    <label class="form-check-label" for="seoul">
                        서울
                    </label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input city-checkbox" type="checkbox" value="" id="busan">
                    <label class="form-check-label" for="busan">
                        부산
                    </label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input city-checkbox" type="checkbox" value="" id="sejong">
                    <label class="form-check-label" for="sejong">
                        세종
                    </label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input city-checkbox" type="checkbox" value="" id="daejeon">
                    <label class="form-check-label" for="daejeon">
                        대전
                    </label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input city-checkbox" type="checkbox" value="" id="cheongju">
                    <label class="form-check-label" for="cheongju">
                        청주
                    </label>
                </div>
                <!-- 추가적인 도시들을 여기에 추가 -->
            </div>
        </div>
    </form>
</div>

<script>
    // 전체 선택 체크박스
    var selectAllCheckbox = document.getElementById("selectAll");

    // 전체 선택 체크박스의 이벤트 리스너 추가
    selectAllCheckbox.addEventListener("change", function() {
        var checkboxes = document.querySelectorAll(".city-checkbox");
        checkboxes.forEach(function(checkbox) {
            checkbox.checked = selectAllCheckbox.checked;
        });
    });

    // 도시 체크박스들
    var cityCheckboxes = document.querySelectorAll(".city-checkbox");

    // 각 도시 체크박스의 이벤트 리스너 추가
    cityCheckboxes.forEach(function(cityCheckbox) {
        cityCheckbox.addEventListener("change", function() {
            var allChecked = true;
            cityCheckboxes.forEach(function(checkbox) {
                if (!checkbox.checked) {
                    allChecked = false;
                }
            });
            selectAllCheckbox.checked = allChecked;
        });
    });
</script>


<div class="card dashboard-area-tabs p-relative o-hidden mb-lg-32pt"></div>
<div class="card-header p-0 nav">
	<div class="row no-gutters" role="tablist">
		<div class="col-auto">
			<a href="#" data-toggle="tab" role="tab" aria-selected="true"
				class="dashboard-area-tabs__tab card-body d-flex flex-row align-items-center justify-content-start active">
				<span class="h2 mb-0 mr-3">1</span> <span
				class="flex d-flex flex-column"> <strong class="card-title">취업처</strong> 
				<small class="card-subtitle text-50"></small>
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

				<th style="width: 18px;" class="pr-0">
					<div class="custom-control custom-checkbox">
						<input type="checkbox"
							class="custom-control-input js-toggle-check-all"
							data-target="#projects" id="customCheckAll">
					</div>
				</th>

				<th style="width: 150px;"><a href="javascript:void(0)"
					class="sort" data-sort="js-lists-values-project">업체명</a></th>

				<th><a href="javascript:void(0)" class="sort"
					data-sort="js-lists-values-lead">공고명</a></th>

				<th style="width: 48px;"><a href="javascript:void(0)"
					class="sort" data-sort="js-lists-values-status">근무지역</a></th>

				<th style="width: 48px;"><a href="javascript:void(0)"
					class="sort" data-sort="js-lists-values-budget">시작일</a></th>

				<th style="width: 48px;"><a href="javascript:void(0)"
					class="sort" data-sort="js-lists-values-date">마감일</a></th>
				<th style="width: 24px;"></th>
			</tr>
		</thead>
		<c:forEach begin="1" end="12" var="scholaship">
			<tbody class="list" id="projects">

				<tr>

					<td class="pr-0">
						<div class="custom-control custom-checkbox">
							<input type="checkbox"
								class="custom-control-input js-check-selected-row"
								id="customCheck1_1">
							<!--   <label class="custom-control-label" -->
							<!--  for="customCheck1_1"><span class="text-hide">Check</span></label> -->
						</div>
					</td>

					<td>

						<div class="media flex-nowrap align-items-center"
							style="white-space: nowrap;">
<!-- 							<div class="avatar avatar-sm mr-8pt"> -->
<!-- 								<span class="avatar-title rounded bg-primary text-white">SM</span> -->
<!-- 							</div> -->
							<div class="media-body">
								<div class="d-flex flex-column">
									<small class="js-lists-values-project"><strong>DDIT</strong></small>
<!-- 									<small class="js-lists-values-location text-50">Twitter</small> -->
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
									백엔드 개발자(Java, Spring)
									</strong>
								</p>
							</div>
						</div>
	
					</div>
					</td>

					<td>
						<div class="d-flex flex-column">
							<small class="js-lists-values-status text-50 mb-4pt">세종</small>
							<span class="indicator-line rounded bg-warning"></span>
						</div>
					</td>

					<td>
						<div class="d-flex flex-column">
							<small class="js-lists-values-budget"><strong>24-02-05</strong></small>
							<!--  <small class="text-50">Invoice Sent</small> -->
						</div>
					</td>

					<td>
						<div class="d-flex flex-column">
							<small class="js-lists-values-date"><strong>24-02-20</strong></small>
							<!--  <small class="text-50">18 days</small> -->
						</div>
					</td>
					<td class="text-right"><a href="" class="text-50"><i
							class="material-icons">more_vert</i></a></td>
				</tr>

			</tbody>
		</c:forEach>
	</table>
		${pagingHTML }
</div>
<form id="submitForm" action="" style="display: none;">
	<input type="text" name="page"/>
</form>
<script src="<c:url value='/resources/js/paging.js'/>"></script>