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
				<strong class="card-title">장학금 리스트</strong>
				<small class="card-subtitle text-50">SCHOLARSHIP</small>
			</span>
			</a>
		</div>
	</div>
</div>

<div class="table-responsive" data-toggle="lists"
	data-lists-sort-by="js-lists-values-date" data-lists-sort-desc="true"
	data-lists-values='["js-lists-values-lead", "js-lists-values-project", "js-lists-values-status", "js-lists-values-budget", "js-lists-values-date"
	, "js-lists-values-year", "js-lists-values-rnum"]'
	style="max-height: 300px; overflow-y: auto;">
	<table class="table mb-0 thead-border-top-0 table-nowrap">
		<thead>
			<tr>

				<th style="width: 150px;"><a>순번</a></th>

				<th style="width: 150px;"><a href="javascript:void(0)"
					class="sort" data-sort="js-lists-values-year">장학금명</a></th>
					
				<th style="width: 150px;"><a href="javascript:void(0)"
					class="sort" data-sort="js-lists-values-project">수혜조건</a></th>

				<th><a href="javascript:void(0)" class="sort"
					data-sort="js-lists-values-lead">지급방식</a></th>

				<th style="width: 48px;"><a href="javascript:void(0)"
					class="sort" data-sort="js-lists-values-status">지급액</a></th>

				<th style="width: 48px;"><a href="javascript:void(0)"
					class="sort" data-sort="js-lists-values-date">교수추천가능여부</a></th>
				<th>수정</th>
			</tr>
		</thead>
		
		<c:choose>
			<c:when test="${not empty scholarshipList }">
		<c:forEach items="${scholarshipList}" var="scholaship" varStatus="loop">
			<tbody class="list" id="projects">

				<tr>
					<td>
						<small class="js-lists-values-year"><strong>${loop.count}</strong></small>
					</td>
					
					<td>
						<div class="media flex-nowrap align-items-center"
							style="white-space: nowrap;">
							<div class="media-body">
								<div class="d-flex flex-column">
									<small class="js-lists-values-project"><strong>${scholaship.scholName}</strong></small>
								</div>
							</div>
						</div>
					</td>
					
					<td>
						<div class="media flex-nowrap align-items-center"
							style="white-space: nowrap;">
							<div class="media-body">
								<div class="d-flex flex-column">
									<small class="js-lists-values-year"><strong>${scholaship.scholCriteria}</strong></small>
								</div>
							</div>
						</div>
					</td>
					
					<td>
						<div class="media-body">
							<div class="d-flex align-items-center">
								<div class="flex d-flex flex-column">
									<p class="mb-0">
										<strong class="js-lists-values-lead">${scholaship.scholDm}</strong>
									</p>
								</div>
							</div>
						</div>
					</td>

					<td>
						<div class="d-flex flex-column">
							<small class="js-lists-values-status">${scholaship.scholAmt}</small>
						</div>
					</td>

					<td>
						<div class="d-flex flex-column">
							<small class="js-lists-values-date"><strong style="text-align: center;">${scholaship.scholRp}</strong></small>
						</div>
					</td>
					
					<td>
						<div class="d-flex flex-column">
							<button class="btn btn-primary" id="editBtn" data-scholCode="${scholaship.scholCode }">수정하기</button>
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
	<div class="text-right mt-3">
			<button type="button" class="btn btn-success" id="insertBtn">장학금 등록</button>
	</div>
		<div id="scholashipInsertAreaM"></div> 
		<div id="scholashipEditAreaM"></div> 
<script src="<c:url value='/resources/js/paging.js'/>"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>

function fillFormData() {
    var scholName = "인재장학금";
    var scholCriteria = "학교의 대외적인 홍보를 진행하여 학교발전에 이바지한 학생";
    var scholAmt = "2000000";
    
    document.getElementById("scholName").value = scholName;
    document.getElementById("scholCriteria").value = scholCriteria;
    document.getElementById("scholAmt").value = scholAmt;
    
    var value1 = "Y"; 
    var value2 = "현금"; 

    var subjectSelectBox1 = document.getElementById("scholRp");
    var options1 = subjectSelectBox1.options;
    for (var i = 0; i < options1.length; i++) {
        if (options1[i].value === value1) {
            subjectSelectBox1.selectedIndex = i;
            break;
        }
    }

    var subjectSelectBox2 = document.getElementById("scholDm");
    var options2 = subjectSelectBox2.options;
    for (var j = 0; j < options2.length; j++) {
        if (options2[j].value === value2) {
            subjectSelectBox2.selectedIndex = j;
            break;
        }
    }
}

	var cPath = $('body').data('bodyCpath');

	//신청 버튼 클릭 -> 신청 폼
	$(document).on('click', '#insertBtn', function() {

		var url = `\${cPath}/manager/stu/scholarship/scholarshipInsertForm`;
		$.ajax({
			url : url,
			type : 'GET',
			success : function(response) {
				$('#scholashipEditAreaM').empty();
				$('#scholashipInsertAreaM').html(response);
			},
			error : function(xhr, status, error) {
				console.error('Error retrieving:', error);
			}
		});
	});

	// 신청 폼 제출
	$(document)
			.on(
					"submit",
					"#scholarshipInsertData",
					function(event) {
						event.preventDefault();

						var formData = $('#scholarshipInsertData').serialize();
						var url = `\${cPath}/manager/stu/scholarship/scholarshipInsertForm`;
						console.log(url);

						var scholName = document.getElementById("scholName").value;
						var scholCriteria = document
								.getElementById("scholCriteria").value;
						var scholDm = document.getElementById("scholDm").value;
						var scholAmt = document.getElementById("scholAmt").value;
						var scholRp = document.getElementById("scholRp").value;

						if (scholName.trim() == ""
								|| scholCriteria.trim() == ""
								|| scholDm.trim() == ""
								|| scholAmt.trim() == ""
								|| scholRp.trim() == "") {
							Swal.fire({
								title : '장학금 등록 실패',
								text : '모든 항목을 입력해주세요',
								icon : 'error'
							});
							return false;
						}

						$.ajax({
							url : url,
							type : 'POST',
							data : formData,
							success : function(response) {
								Swal.fire({
									title : '장학금 등록 완료',
									icon : 'success'
								});
								$('#scholashipInsertAreaM').empty();
							},
							error : function(xhr, status, error) {
								console.error('Error:', error);
							}
						});
						return false;
					});

	// 수정버튼 클릭
	$(document)
			.on(
					'click',
					'#editBtn',
					function() {
						var scholCode = $(this).attr('data-scholCode');
						console.log(scholCode)
						var url = `\${cPath}/manager/stu/scholarship/scholarshipEditForm/\${scholCode}`;
						$.ajax({
							url : url,
							type : 'GET',
							success : function(response) {
								$('#scholashipInsertAreaM').empty();
								$('#scholashipEditAreaM').html(response);
							},
							error : function(xhr, status, error) {
								console.error('Error retrieving:', error);
							}
						});
					});

	//수정 폼 제출
	$(document)
			.on(
					"submit",
					"#scholarshipEditData",
					function(event) {
						event.preventDefault();

						var formData = $('#scholarshipEditData').serialize();
						var url = `\${cPath}/manager/stu/scholarship/scholarshipEditForm`;
						console.log(url);

						var scholName = document.getElementById("scholName").value;
						var scholCriteria = document
								.getElementById("scholCriteria").value;
						var scholDm = document.getElementById("scholDm").value;
						var scholAmt = document.getElementById("scholAmt").value;
						var scholRp = document.getElementById("scholRp").value;

						if (scholName.trim() == ""
								|| scholCriteria.trim() == ""
								|| scholDm.trim() == ""
								|| scholAmt.trim() == ""
								|| scholRp.trim() == "") {
							Swal.fire({
								title : '장학금 수정 실패',
								text : '모든 항목을 입력해주세요',
								icon : 'error'
							});
							return false;
						}

						$.ajax({
							url : url,
							type : 'POST',
							data : formData,
							success : function(response) {
								Swal.fire({
									title : '장학금 수정 완료',
									icon : 'success'
								});
								$('#scholashipEditAreaM').empty();
							},
							error : function(xhr, status, error) {
								console.error('Error:', error);
							}
						});
						return false;
					});

	// 삭제 버튼
	$(document).on("click", "#delBtn", function(event) {
		event.preventDefault();

		var scholCode = $(this).val();
		var url = `\${cPath}/manager/stu/scholarship/del`;
		console.log(url);
		$.ajax({
			url : url,
			type : 'POST',
			data : {
				scholCode : scholCode
			},
			success : function(response) {
				Swal.fire({
					title : '장학금 삭제 완료',
					icon : 'success'
				});
				$('#scholashipEditAreaM').empty();
			},
			error : function(xhr, status, error) {
				console.error('Error:', error);
			}
		});
	});
</script>