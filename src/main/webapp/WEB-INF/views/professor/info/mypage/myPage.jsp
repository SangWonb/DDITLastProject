<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="page-separator">
	<div class="page-separator__text">교수기초정보</div>
</div>
<div class="bg-white ">
	<div class="row row-cols-auto ">
		<div class="form-row col" style="margin-top: 10px; margin-left: 5px;">
			<div class="col-3">
				<label class="form-label" for="memNo">교번</label>
			</div>
			<div class="col">
				<input type="text" class="form-control" id="memNo"
					value="${pInfo.pmemNo}" disabled="disabled">
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
					value="${pInfo.memName}" disabled="disabled">
			</div>
		</div>
		<div class="form-row col" style="margin-top: 10px;">
			<div class="col-4">
				<label class="form-label" for="birthAndSex">생년월일(성별)</label>
			</div>
			<div class="col">
				<input type="text" class="form-control" id="birthAndSex"
					value="${pInfo.bas}" disabled="disabled">
			</div>
		</div>
		<div class="form-row col" style="margin-top: 10px;">
			<div class="col-4">
				<label class="form-label" for="memTel">전화번호</label>
			</div>
			<div class="col" style="margin-right: 5px;">
				<input type="text" class="form-control" id="memTel"
					value="${pInfo.memTel}" disabled="disabled">
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
					value="${pInfo.cad}" disabled="disabled">
			</div>
		</div>
		<div class="form-row col">
			<div class="col-4">
				<label class="form-label" for="stuJoinyear">입사정보</label>
			</div>
			<div class="col">
				<input type="text" class="form-control" id="startDate"
					value="${pInfo.startDate}" disabled="disabled">
			</div>
		</div>
		<div class="form-row col">
			<div class="col-3">
				<label class="form-label" for="pmemStatus">재직상태</label>
			</div>
			<div class="col-8">
				<input type="text" class="form-control" id="pmemStatus"
					value="${pInfo.pmemStatus}" disabled="disabled">
			</div>
		</div>
		<div class="form-row col">
			<div class="col-3">
				<label class="form-label" for="pmemPosition">직위</label>
			</div>
			<div class="col-8">
				<input type="text" class="form-control" id=pmemPosition
					value="${pInfo.pmemPosition}" disabled="disabled">
			</div>
		</div>
		<div class="form-row col">
			<div class="col-3">
				<label class="form-label" for="pmemResp">직책</label>
			</div>
			<div class="col-8">
				<input type="text" class="form-control" id=pmemResp
					value="${pInfo.pmemResp}" disabled="disabled">
			</div>
		</div>
			<div class="form-row col">
			<div class="col-3">
				<label class="form-label" for="pmemTa">담당과목</label>
			</div>
			<div class="col-8">
				<input type="text" class="form-control" id=pmemTa
					value="${pInfo.pmemTa}" disabled="disabled">
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
						<span class="flex d-flex flex-column"> 신상정보 </span>
					</a>
				</div>

				<div class="col-auto border-left border-right">
					<a href="#tab3" data-toggle="tab" role="tab" aria-selected="true"
						class="dashboard-area-tabs__tab card-body d-flex flex-row align-items-center justify-content-start">
						<span class="flex d-flex flex-column"> 사진변경신청 </span>
					</a>
				</div>
				<div style="margin-left: 600px; margin-top: 7.5px;">
					<button id="modBtn" class="btn btn-primary float-right"
						data-toggle="swal" data-swal-title="수정하시겠습니까?"
						data-swal-show-cancel-button="true"
						data-swal-confirm-button-text="수정하기"
						data-swal-confirm-cb="#swal-confirm-delete"
						data-swal-close-on-confirm="false">저장하기</button>
					<div id="swal-confirm-delete" class="d-none"
						data-swal-type="수정에 성공했습니다." data-swal-title="수정에 실패했습니다.">
					</div>
				</div>
			</div>
		</div>
		<div class="tab-content">
			<div id="tab1"
				class="table-responsive; margin-top:10px; tab-pane fade show active"
				data-toggle="lists" data-lists-sort-by="js-lists-values-date"
				data-lists-sort-desc="true"
				data-lists-values="[&quot;js-lists-values-lead&quot;, &quot;js-lists-values-project&quot;, &quot;js-lists-values-status&quot;, &quot;js-lists-values-budget&quot;, &quot;js-lists-values-date&quot;]">
				<div class="page-separator"
					style="margin-right: 5px; margin-left: 10px; margin-top: 10px;">
					<div class="page-separator__text">◎본인정보</div>
				</div>
				<form id="memInfo" method="post">
					<div
						style="background-color: rgb(245, 245, 245); width: 95%; margin-left: 2.5%;">
						<div class="row row-cols-auto">
							<div class="form-row col" style="margin-top: 10px;">
								<div class="col-3">
									<label class="form-label" for="memNo">주민등록번호</label>
								</div>
								<div class="col">
									<input type="text" class="form-control" name="memReg1"
										value="${pInfo.memReg1}" disabled="disabled" />
								</div>
							</div>
							<div class="form-row col" style="margin-top: 10px;">
								<div class="col-3">
									<label class="form-label" for="memEmail">이메일</label>
								</div>
								<div class="col" style="margin-right: 5px;">
									<input type="text" class="form-control" id="memEmail"
										value="${pInfo.memEmail}" />
								</div>
							</div>
						</div>
						<div class="row row-cols-auto" style="margin-top: 10px;">
							<div class="form-row col">
								<div class="col-1">
									<label class="form-label" for="addr">주소</label>
								</div>
								<div
									class="col search-form form-control-flush search-form--dark">
									<input type="text" class="form-control px-0"
										placeholder="주소 검색" id="searchSample04" readonly="readonly" />
									<button class="btn" type="button" onclick="execDaumPostcode()">
										<i class="material-icons">search</i>
									</button>
								</div>
								<div class="col">
									<input type="text" class="form-control" id="sample6_postcode"
										placeholder="우편번호" />
								</div>
								<div class="col">
									<input type="text" class="form-control" id="memAddr1"
										value="${pInfo.memAddr1}" />
								</div>
								<div class="col">
									<input type="text" class="form-control" id="memAddr2"
										value="${pInfo.memAddr2}" />
								</div>
								<div class="col">
									<input type="text" class="form-control"
										id="sample6_postcode_etc" placeholder="참고항목" />
								</div>
							</div>
						</div>
						<div class="row row-cols-auto"
							style="margin-top: 10px; margin-bottom: 10px;">
							<div class="form-row col">
								<div class="col-1">
									<label class="form-label" for="memTel">전화번호</label>
								</div>
								<div class="col-1" style="margin-right: 5px;">
									<select id="memTel1" style="height: 35px;">
										<c:set var="prefixes" value="010, 011, 018, 017" />
										<c:forEach var="prefix" items="${prefixes}">
											<option value="${prefix}"
												<c:if test="${fn:startsWith(pInfo.memTel, prefix)}">selected</c:if>>${prefix}</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-1" style="text-align: center;">
									<span>-</span>
								</div>
								<div class="col-1">
									<input type="text" class="form-control" id="memTel2"
										value="${fn:substring(pInfo.memTel,4,8)}" maxlength="4" />
								</div>
								<div class="col-1" style="text-align: center;">
									<span>-</span>
								</div>
								<div class="col-1"
									style="margin-right: 5px; margin-bottom: 10px;">
									<input type="text" class="form-control" id="memTel3"
										value="${fn:substring(pInfo.memTel,9,13)}" maxlength="4" />
								</div>
							</div>
						</div>
					</div>
					<div class="page-separator"
						style="margin-right: 5px; margin-left: 10px; margin-top: 10px;">
						<div class="page-separator__text">◎기타정보</div>
					</div>
					<div
						style="background-color: rgb(245, 245, 245); width: 95%; margin-left: 2.5%; margin-bottom: 50px;">
						<div class="row row-cols-auto">
							<div class="form-row col" style="margin-top: 10px;">
								<div class="col">
									<span style="font-size: 1.1em;">*환불계좌정보</span>
								</div>
							</div>
						</div>
						<div class="row row-cols-auto">
							<div class="form-row col" style="margin-top: 10px;">
								<div class="col-1 ">
									<label class="form-label" for="memBank">은행</label>
								</div>
								<div class="col-2">
									<input type="text" class="form-control" id="memBank"
										value="${pInfo.memBank}" />
								</div>
								<div class="form-row col"
									style="margin-top: 10px; margin-bottom: 10px;">
									<div class="col-3">
										<label class="form-label" for="memBanknum">계좌번호</label>
									</div>
									<div class="col">
										<input type="text" class="form-control" id="memBanknum"
											value="${pInfo.memBanknum}" />
									</div>
								</div>
								<div class="form-row col" style="margin-top: 10px;">
									<div class="col-3">
										<label class="form-label" for="memDepo">예금주</label>
									</div>
									<div class="col">
										<input type="text" class="form-control" id="memDepo"
											value="${pInfo.memDepo}" />
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>

			<div id="tab3"
				class="table-responsive; margin-top:10px; tab-pane fade"
				data-toggle="lists" data-lists-sort-by="js-lists-values-date"
				data-lists-sort-desc="true"
				data-lists-values="[&quot;js-lists-values-lead&quot;, &quot;js-lists-values-project&quot;, &quot;js-lists-values-status&quot;, &quot;js-lists-values-budget&quot;, &quot;js-lists-values-date&quot;]">
				<div class="page-separator"
					style="margin-right: 5px; margin-left: 10px; margin-top: 10px;">
					<div class="page-separator__text">◎사진변경신청</div>
				</div>
				<div
					style="background-color: rgb(245, 245, 245); width: 95%; margin-left: 2.5%;">
					<div class="row justify-content-center">
						<div class="col-6">
							<div style="margin-top: 10px;">
								<div
									style="display: flex; justify-content: space-between; align-items: center;">
									<div style="width: 100px; height: 120px;">
										<img src="/lcms/resources/images/kce/김차은.jpg" alt="김차은"
											class="img-fluid"
											style="width: 100%; height: 100%; object-fit: contain;">
									</div>
									<div style="width: 100px; height: 120px;">
										<img src="/lcms/resources/images/logo/logo.png" alt="수정요청사진"
											class="img-fluid"
											style="width: 100%; height: 100%; object-fit: contain;">
									</div>
								</div>
								<div
									style="display: flex; justify-content: space-between; align-items: center;">
									<label class="form-label d-block text-center"
										style="width: 100px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">수정전(현재)</label>
									<label class="form-label d-block text-center"
										style="width: 100px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">수정요청사진</label>
								</div>
							</div>
						</div>
					</div>
					<div class="row justify-content-center">
						<button class="btn btn-primary tooltip-trigger"
							onclick="$('#imgChangeModal').modal('show');"
							data-bs-toggle="modal" data-bs-target="#imgChangeModal">사진변경신청하기</button>
					</div>
					<div class="modal fade" id=imgChangeModal tabindex="-1"
						aria-labelledby="imgChangeModal" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content" style="width: 350px; height: 350px;">
								<form id="memImage" method="post">
									<div style="background-color: gray; height: 10%;">
										<span
											style="color: white; font-weight: bold; font-size: 20px;">변경
											이미지 업로드</span>
										<button type="button" id="imageCloseBtn2"
											style="position: absolute; top: 0; right: 0; outline: none; box-shadow: none; background-color: rgba(255, 255, 255, 0); border: none; color: white; width: 50px; margin-top: 0;"
											class="btn btn-accent"
											onclick="$('#imgChangeModal').modal('hide');">
											<i class="material-icons">close</i>
										</button>
									</div>
									<div style="height: 60%;">
										<%-- 이미지가 부모 요소에 상대적으로 설정될 수 있도록 wrapper div를 추가합니다. --%>
										<div
											style="height: 100%; display: flex; justify-content: center; align-items: center; margin-top: 5px;">
											<%-- 이미지를 부모 요소에 상대적인 크기로 설정합니다. --%>
											<img alt="내이미지"
												src='<c:url value="/resources/images/logo/logo.png"/>'
												style="max-width: 60%; max-height: 60%; height: auto;">
										</div>
									</div>
									<div
										style="height: 20%; display: flex; justify-content: center; align-items: center;">
										<div class="custom-file" style="width: 60%;">
											<input type="file" id="file" class="custom-file-input">
											<label for="file" class="custom-file-label">Choose
												file</label>
										</div>
									</div>
									<div
										style="height: 10%; display: flex; justify-content: center; align-items: center; margin-bottom: 5px;">
										<div>
											<button id="imgUpload" class="btn btn-primary"
												form="memImage">업로드하기</button>
										</div>
										<div>
											<button id="imageCloseBtn3" class="btn btn-secondary"
												onclick="$('#imgChangeModal').modal('hide');">닫기</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div
						style="margin-top: 50px; margin-left: 10px; margin-bottom: 50px;">
						<span> 사진변경 신청하기를 통해 변경할 사진을 등록하십시오.<br> 최종변경은 관리자의 승인
							처리 후 적용됩니다.<br> 신속한 변경이 필요할 시는 사진변경 신청 후 학사지원과(☎
							042-222-8202)로 문의 바랍니다.
						</span>
					</div>

				</div>

			</div>
		</div>
	</div>

</div>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$('#modBtn').click(function(e) {
		e.preventDefault(); // 버튼의 기본 동작 방지

		var memAddr2_B = $('#memAddr2').val();
		var memAddrEtc = $('#sample6_postcode_etc').val();
		var memAddr2 = memAddr2_B + memAddrEtc;

		var tel1 = $('#memTel1').val();
		var tel2 = $('#memTel2').val();
		var tel3 = $('#memTel3').val();
		var memTel = tel1 + tel2 + tel3;

		var activeFormId = $('.tab-pane.active').find('form').attr('id');

		var formData = $('#' + activeFormId).serialize();

		if (activeFormId === 'memInfo') {
			formData += '&memTel=' + memTel;
			formData += '&memAddr2=' + memAddr2;
		}

		$.ajax({
			type : "POST",
			url : "", // 현재 경로로 설정
			data : formData,
			contentType : "application/x-www-form-urlencoded",
			success : function(response) {
				if (response.result === "success") {
					console.log("회원 정보가 성공적으로 수정되었습니다.");
					location.reload();
				} else {
					console.error("회원 정보 수정에 실패했습니다: " + response.message);
				}
			},
			error : function(xhr, status, error) {
				console.error("회원 정보 수정 요청에 실패했습니다: " + error);
			}
		});
	});

	function showModal() {
		$('#myPageModal').modal('show');
	}

	function showImgChangeModal() {
		$('#imgChangeModal').modal('show');
	}
</script>

