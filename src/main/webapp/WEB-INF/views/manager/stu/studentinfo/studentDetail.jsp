<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%> 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
 <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %> 
 
<div class="bg-white">
	<div class="row row-cols-auto" style="margin-right:10px; margin-bottom:10px;">
			<div class="form-row col" style="margin-top: 10px; margin-left: 5px;">
				<div><h2>학생정보</h2></div>
				<div style=" margin-left: auto; margin-top:10px">
					<button class="btn btn-secondary" onclick="window.history.back();">학생목록</button>
				</div>
			</div>
	</div>
<div class="page-separator" ></div>
	<div class="row row-cols-auto ">
		<div class="form-row col" style="margin-top: 10px; margin-left: 5px;">
			<div class="col-3">
				<label class="form-label" for="memNo">학번</label>
			</div>
			<div class="col">
				<input type="text" class="form-control" id="memNo"
					value="${detail.smemNo}" disabled="disabled">
			</div>
		</div>
		<button class="btn btn-secondary tooltip-trigger"
			onclick="$('#myPageModal').modal('show');" data-bs-toggle="modal"
			data-bs-target="#myPageModal"
			style="width: 70px; height: 35px; margin-top: 10px">사진</button>
		<div class="modal fade" id="myPageModal" tabindex="-1"
			aria-labelledby="myPageModal" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content" style="width: 200px; height: 200px;">
					<div style="background-color: gray; height: 20%;">
						<span style="color: white; font-weight: bold; font-size: 25px;">사진</span>
						<button type="button" id="imageCloseBtn"
							style="position: absolute; top: 0; right: 0; outline: none; box-shadow: none; background-color: rgba(255, 255, 255, 0); border: none; color: white; width: 50px; margin-top: 0;"
							class="btn btn-accent" onclick="$('#myPageModal').modal('hide');">
							<i class="material-icons">close</i>
						</button>
					</div>
					<div style="height: 75%;">
						<div
							style="height: 100%; display: flex; justify-content: center; align-items: center; margin-top: 5px;">
							<img alt="내이미지"
								src='<c:url value="/resources/images/kce/김차은.jpg"/>'
								style="max-width: 100%; max-height: 100%; height: auto;">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="form-row col" style="margin-top: 10px;">
			<div class="col-3">
				<label class="form-label" for="memName">이름</label>
			</div>

			<div class="col">
				<input type="text" class="form-control" id="memName"
					value="${detail.memName}" disabled="disabled">
			</div>
		</div>
		<div class="form-row col" style="margin-top: 10px; margin-right: 5px;">
			<div class="col-4">
				<label class="form-label" for="birthAndSex">생년월일(성별)</label>
			</div>
			<div class="col">
				<input type="text" class="form-control" id="birthAndSex"
					value="${detail.bas}" disabled="disabled">
			</div>
		</div>
	
	</div>
	<div class="row row-cols-auto">
			<div class="form-row col">
			<div class="col-3" style="margin-left: 5px;">
				<label class="form-label" for="cad">소속</label>
			</div>
			<div class="col">
				<input type="text" class="form-control" id="cad"
					value="${detail.cad}" disabled="disabled">
			</div>
		</div>
			<div class="form-row col" >
			<div class="col-4">
				<label class="form-label" for="memTel">전화번호</label>
			</div>
			<div class="col" style="margin-right: 5px;">
				<input type="text" class="form-control" id="memTel"
					value="${detail.memTel}" disabled="disabled">
			</div>
		</div>
	</div>
	<div class="row row-cols-auto">

		<div class="form-row col" >
			<div class="col-6" style="margin-top:10px; margin-left: 5px;">
				<label class="form-label" for="semester">재학학기수</label>
			</div>
			<div class="col-5" style="margin-top: 10px;">
				<input type="text" class="form-control" id="semester"
					value="${detail.commonInfo.value}" disabled="disabled">
			</div>
		</div>
		<div class="form-row col" >
			<div class="col-4" style="margin-top: 10px;"s>
				<label class="form-label" for="stuJoinyear">입학정보</label>
			</div>
			<div class="col" style="margin-top: 10px;">
				<input type="text" class="form-control" id="stuJoinyear"
					value="${detail.stuJoinyear}" disabled="disabled">
			</div>
		</div>
		<div class="form-row col" style="margin-top: 10px;">
			<div class="col-3" >
				<label class="form-label" for="stuProg">과정</label>
			</div>
			<div class="col-8" style="margin-top: 10px; margin-right: 5px;">
				<input type="text" class="form-control" id=stuProg
					value="${detail.stuProg}" disabled="disabled">
			</div>
		</div>
	</div>
	<div class="card dashboard-area-tabs p-relative o-hidden mb-lg-32pt;"
		style="margin-top: 10px;">
		<div class="card-header p-0 nav">
			<div class="row no-gutters" role="tablist">
				<div class="col-auto">
					<a href="#tab1" data-toggle="tab" role="tab" aria-selected="true"
						class="dashboard-area-tabs__tab card-body d-flex flex-row align-items-center justify-content-start active">
						<span class="flex d-flex flex-column"> 등록금내역 </span>
					</a>
				</div>
				<div class="col-auto border-left border-right">
					<a href="#tab2" data-toggle="tab" role="tab" aria-selected="true"
						class="dashboard-area-tabs__tab card-body d-flex flex-row align-items-center justify-content-start">
						<span class="flex d-flex flex-column"> 장학금내역 </span>
					</a>
				</div>
				<div class="col-auto border-left border-right">
					<a href="#tab3" data-toggle="tab" role="tab" aria-selected="true"
						class="dashboard-area-tabs__tab card-body d-flex flex-row align-items-center justify-content-start">
						<span class="flex d-flex flex-column"> 상담내역 </span>
					</a>
				</div>
				<div class="col-auto border-left border-right">
					<a href="#tab4" data-toggle="tab" role="tab" aria-selected="true"
						class="dashboard-area-tabs__tab card-body d-flex flex-row align-items-center justify-content-start">
						<span class="flex d-flex flex-column"> 학적변동신청내역 </span>
					</a>
				</div>
			</div>
		</div>
		<div class="tab-content">
			<div id="tab1"
				class="table-responsive; margin-top:10px; tab-pane fade show active "
				data-lists-sort-by="js-lists-values-date"
				data-lists-sort-desc="true"
				data-lists-values="[&quot;js-lists-values-lead&quot;, &quot;js-lists-values-project&quot;, &quot;js-lists-values-status&quot;, &quot;js-lists-values-budget&quot;, &quot;js-lists-values-date&quot;]">
				<div class="page-separator"
					style="margin-right: 5px; margin-left: 10px; margin-top: 10px;">
					<div class="page-separator__text">◎등록금 납부 내역</div>
				</div>
					<div >
						<table class="table">
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">년도/학기</th>
									<th scope="col">기성회비</th>
									<th scope="col">기본수업료</th>
									<th scope="col">실습비</th>
									<th scope="col">재료비</th>
									<th scope="col">책정액</th>
									<th scope="col">감면액</th>
									<th scope="col">실납부액</th>
									<th scope="col">수납일시</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty enroll}">
								<tr style="text-align: center;">
									<td colspan="12">등록금 내역이 존재하지 않습니다.</td>
								</tr>
								
					</c:if>
					<c:if test="${not empty enroll}">
							<c:forEach items="${enroll}" var="e">
								<tr>
									<td>${e.rnum}</td>
									<td>${e.year}/${e.semester}</td>
									<td>${e.enrlMf}</td>
									<td>${e.enrlTf}</td>
									<td>${e.enrlIf}</td>
									<td>${e.enrlMc}</td>
									<td>${e.enrlTotal}</td>
									<td>${e.amt}</td>
									<td><strong>${e.real}</strong></td>
									<td>${e.enrlDate}</td>
								</tr>
							</c:forEach>
							</c:if>
							</tbody>
						</table>
					</div>
					
				
			</div>
			<div id="tab2"
				class="table-responsive; margin-top:10px; tab-pane fade "
				data-toggle="lists" data-lists-sort-by="js-lists-values-date"
				data-lists-sort-desc="true"
				data-lists-values="[&quot;js-lists-values-lead&quot;, &quot;js-lists-values-project&quot;, &quot;js-lists-values-status&quot;, &quot;js-lists-values-budget&quot;, &quot;js-lists-values-date&quot;]">
				<div class="page-separator"
					style="margin-right: 5px; margin-left: 10px; margin-top: 10px;">
					<div class="page-separator__text">◎장학금 수혜 이력</div>
				</div>
						<div>
							<table class="table">
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">학기/년도</th>
										<th scope="col">장학금이름</th>
										<th scope="col">지급날짜</th>
										<th scope="col">수혜금액</th>
									</tr>
								</thead>
								<tbody>
						<c:if test="${empty scholar}">
								<tr style="text-align: center;">
									<td colspan="6">장학금 수혜 이력이 존재하지 않습니다.</td>
								</tr>
						</c:if>
						<c:if test="${not empty scholar}">
										<c:forEach items="${scholar}" var="s" varStatus="status">

									<tr>
											<td>${status.index + 1}</td>
											<td>${s.yearSemester}</td>
											<td>${s.scholName}</td>
											<td>${s.scholDate}</td>
											<td>${s.scholAmt}</td>
									</tr>
										</c:forEach>
						</c:if>
								</tbody>
							</table>
						</div>
			</div>
				
			<div id="tab3"
				class="table-responsive; margin-top:10px; tab-pane fade "
				data-toggle="lists" data-lists-sort-by="js-lists-values-date"
				data-lists-sort-desc="true"
				data-lists-values="[&quot;js-lists-values-lead&quot;, &quot;js-lists-values-project&quot;, &quot;js-lists-values-status&quot;, &quot;js-lists-values-budget&quot;, &quot;js-lists-values-date&quot;]">
				<div class="page-separator"
					style="margin-right: 5px; margin-left: 10px; margin-top: 10px;">
					<div class="page-separator__text">◎상담내역</div>
				</div>
						<div>
								<table class="table">
									<thead>
										<tr>
											<th scope="col">번호</th>
											<th scope="col">상담번호</th>
											<th scope="col">담당교수(학과)</th>
											<th scope="col">상담방법</th>
											<th scope="col">상담</th>
											<th scope="col">상담날짜</th>
										</tr>
									</thead>
									<tbody>
					<c:if test="${empty couns}">
								<tr style="text-align: center;">
									<td colspan="6">상담내역이 존재하지 않습니다.</td>
								</tr>
								
					</c:if>
						<c:if test="${not empty couns}">
							<c:forEach items="${couns}" var="c" varStatus="status">
										<tr>
											<td>${status.index + 1}</td>
											<td><a onclick="$('#counsDetail').modal('show');" class="tooltip-trigger" data-bs-toggle="modal" data-bs-target="#counsDetail"
											style="align-items: center; justify-content: flex-end; text-decoration: none;"
											>${c.counsNo}</a></td>
											<td>${c.professorName}(${c.deptName})</td>
											<td>${c.counsMethod}</td>
											<td>${c.counsType}</td>
											<td>${c.counsDatetime}</td>
										</tr>
								</c:forEach>
							</c:if>
									</tbody>
								</table>
						</div>
				
			</div>

			<div id="tab4"
				class="table-responsive; margin-top:10px; tab-pane fade"
				data-toggle="lists" data-lists-sort-by="js-lists-values-date"
				data-lists-sort-desc="true"
				data-lists-values="[&quot;js-lists-values-lead&quot;, &quot;js-lists-values-project&quot;, &quot;js-lists-values-status&quot;, &quot;js-lists-values-budget&quot;, &quot;js-lists-values-date&quot;]">
				<div class="page-separator"
					style="margin-right: 5px; margin-left: 10px; margin-top: 10px;">
					<div class="page-separator__text">◎학적변동신청이력</div>
				</div>
							<div>
									<table class="table">
										<thead>
											<tr>
												<th scope="col">번호</th>
												<th scope="col">신청번호</th>
												<th scope="col">학적종류</th>
												<th scope="col">년도/학기</th>
												<th scope="col">변동이유</th>
												<th scope="col">신청상태</th>
											</tr>
										</thead>
										<tbody>
							<c:if test="${empty aca}">
								<tr style="text-align: center;">
									<td colspan="6">학적변동신청이력이 존재하지 않습니다.</td>
								</tr>
							</c:if>
							<c:if test="${not empty aca}">
								<c:forEach items="${aca}" var="a" varStatus="status">
											<tr>
												<td>${status.index+1}</td>
												<td>${a.arcNo}</td>
												<td>${a.acName}</td>
												<td>잠시</td>
												<td>${a.arcReason}</td>
												<td>${a.statusNm}</td>
											</tr>
								</c:forEach>
							</c:if>
										</tbody>
									</table>
							</div>
				</div>

			</div>
</div>
</div>
<script>

</script>
