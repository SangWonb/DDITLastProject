<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
강의계획서 조회 페이지 (학생)
<div class="card dashboard-area-tabs p-relative o-hidden mb-lg-32pt"></div>
<div class="card-header p-0 nav">
	<div class="row no-gutters" role="tablist">
		<div class="col-auto">
			<a href="#" data-toggle="tab" role="tab" aria-selected="true"
				class="dashboard-area-tabs__tab card-body d-flex flex-row align-items-center justify-content-start active">
				<span class="h2 mb-0 mr-3">1</span> 
				<span class="flex d-flex flex-column">
				<strong class="card-title">강의 목록</strong>
				<small class="card-subtitle text-50">Ongoing</small>
			</span>
			</a>
		</div>
	</div>
</div>

<div class="table-responsive" data-toggle="lists"
	data-lists-sort-by="js-lists-values-date" data-lists-sort-desc="true"
	data-lists-values='["js-lists-values-lead", "js-lists-values-project", 
	"js-lists-values-status", "js-lists-values-budget", "js-lists-values-date"
	, "js-lists-values-aaa", "js-lists-values-bbb"]'>
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
					class="sort" data-sort="js-lists-values-project">년도</a></th>

				<th><a href="javascript:void(0)" class="sort"
					data-sort="js-lists-values-lead">학년</a></th>

				<th style="width: 48px;"><a href="javascript:void(0)"
					class="sort" data-sort="js-lists-values-status">학기</a></th>

				<th style="width: 48px;"><a href="javascript:void(0)"
					class="sort" data-sort="js-lists-values-budget">강의명</a></th>

				<th style="width: 48px;"><a href="javascript:void(0)"
					class="sort" data-sort="js-lists-values-date">이수구분</a></th>
				<th style="width: 24px;"></th>
				
				<th style="width: 48px;"><a href="javascript:void(0)"
					class="sort" data-sort="js-lists-values-aaa">교수명</a></th>
				<th style="width: 24px;"></th>
				
				<th style="width: 48px;"><a href="javascript:void(0)"
					class="sort" data-sort="js-lists-values-bbb">강의계획서</a></th>
				<th style="width: 24px;"></th>
			</tr>
		</thead>
		<tbody class="list" id="projects">
			<c:forEach begin="1" end="12" var="scholaship">
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
							<div class="avatar avatar-sm mr-8pt">
								<span class="avatar-title rounded bg-primary text-white">SM</span>
							</div>
							<div class="media-body">
								<div class="d-flex flex-column">
									<small class="js-lists-values-project"><strong>asd</strong></small>
									<!-- 									<small class="js-lists-values-location text-50">Twitter</small> -->
								</div>
							</div>
						</div>

					</td>

					<td>
						<!-- 						<div class="media flex-nowrap align-items-center" --> <!-- 							style="white-space: nowrap;"> -->
						<!-- 							<div class="avatar avatar-sm mr-8pt"> --> <!-- 								<span class="avatar-title rounded-circle">BN</span> -->

						<!-- 							</div> -->
						<div class="media-body">

							<div class="d-flex align-items-center">
								<div class="flex d-flex flex-column">
									<p class="mb-0">
										<strong class="js-lists-values-lead">asd</strong>
									</p>
									<!--  <small class="js-lists-values-email text-50">Quality Assurance</small> -->
								</div>
							</div>

						</div> <!--</div> -->

					</td>

					<td>
						<div class="d-flex flex-column">
							<small class="js-lists-values-status text-50 mb-4pt">asd</small>
							<span class="indicator-line rounded bg-warning"></span>
						</div>
					</td>

					<td>
						<div class="d-flex flex-column">
							<small class="js-lists-values-budget"><strong>asd</strong></small>
							<!--  <small class="text-50">Invoice Sent</small> -->
						</div>
					</td>

					<td>
						<div class="d-flex flex-column">
							<small class="js-lists-values-date"><strong>asd</strong></small>
							<!--  <small class="text-50">18 days</small> -->
						</div>
					</td>
					
					<td>
						<div class="d-flex flex-column">
							<small class="js-lists-values-aaa"><strong>ㅂㅈㄷ</strong></small>
							<!--  <small class="text-50">18 days</small> -->
						</div>
					</td>
					<td>
						<div class="d-flex flex-column">
							<small class="js-lists-values-bbb"><strong>ㅂㅈㄷ</strong></small>
							<!--  <small class="text-50">18 days</small> -->
						</div>
					</td>
					<td class="text-right"><a href="" class="text-50"><i
							class="material-icons">more_vert</i></a></td>
				</tr>

			</c:forEach>
		</tbody>
	</table>
		${pagingHTML }
</div>

<!--     <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"> -->
 <div class="container">
    <h1 class="mt-4 mb-4">강의 계획서</h1>

    <table class="table table-bordered">
        <tbody>
            <tr>
                <th>강의 코드</th>
                <td>CS101</td>
            </tr>
            <tr>
                <th>강의명</th>
                <td>프로그래밍 기초</td>
            </tr>
            <tr>
                <th>교수명</th>
                <td>홍길동</td>
            </tr>
            <tr>
                <th>학점</th>
                <td>3</td>
            </tr>
            <tr>
                <th>강의 시간</th>
                <td>월/수 10:00 - 11:30</td>
            </tr>
            <tr>
                <th>강의실</th>
                <td>강의실 101</td>
            </tr>
            <tr>
                <th>수업 방식</th>
                <td>온라인/오프라인 혼합</td>
            </tr>
            <tr>
                <th>수강 대상</th>
                <td>전공학생</td>
            </tr>
            <tr>
                <th>교재</th>
                <td>자바 프로그래밍 입문</td>
            </tr>
            <tr>
                <th>참고 자료</th>
                <td>강의자료 웹사이트</td>
            </tr>
            <tr>
                <th>평가 방법</th>
                <td>중간고사, 기말고사, 프로젝트</td>
            </tr>
            <tr>
                <th>평가 비중</th>
                <td>중간고사 30%, 기말고사 40%, 프로젝트 30%</td>
            </tr>
            <tr>
                <th>기타 사항</th>
                <td>특별한 사항 없음</td>
            </tr>
        </tbody>
    </table>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<form id="submitForm" action="" style="display: none;">
	<input type="text" name="page"/>
</form>
<script src="<c:url value='/resources/js/paging.js'/>"></script>