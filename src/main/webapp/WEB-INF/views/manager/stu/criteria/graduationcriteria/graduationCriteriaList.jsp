<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
졸업요건 기준 등록 페이지 (관리자)
<div class="card dashboard-area-tabs p-relative o-hidden mb-lg-32pt"></div>
<div class="card-header p-0 nav">
	<div class="row no-gutters" role="tablist">
		<div class="col-auto">
			<a href="#" data-toggle="tab" role="tab" aria-selected="true"
				class="dashboard-area-tabs__tab card-body d-flex flex-row align-items-center justify-content-start active">
				<span class="h2 mb-0 mr-3">1</span> <span
				class="flex d-flex flex-column"> <strong class="card-title">학과별 졸업요건</strong> 
				<small class="card-subtitle text-50"></small>
			</span>
			</a>
		</div>
	</div>
</div>

<div class="table-responsive" data-toggle="lists"
	data-lists-sort-by="js-lists-values-date" data-lists-sort-desc="true"
	data-lists-values='["js-lists-values-lead", "js-lists-values-project", "js-lists-values-status", "js-lists-values-budget", "js-lists-values-date", "js-lists-values-score"]'
	style="max-height: 300px; overflow-y: auto;">
	<table class="table mb-0 thead-border-top-0 table-nowrap">
		<thead>
			<tr>

				<th style="width: 150px;"><a href="javascript:void(0)"
					class="sort" data-sort="js-lists-values-project">순번</a></th>

				<th><a href="javascript:void(0)" class="sort"
					data-sort="js-lists-values-lead">학과명</a></th>

				<th style="width: 48px;"><a href="javascript:void(0)"
					class="sort" data-sort="js-lists-values-status">졸업논문여부</a></th>

				<th style="width: 48px;"><a href="javascript:void(0)"
					class="sort" data-sort="js-lists-values-budget">졸업시험여부</a></th>

				<th style="width: 48px;"><a href="javascript:void(0)"
					class="sort" data-sort="js-lists-values-date">영어시험</a></th>
					
				<th style="width: 48px;"><a href="javascript:void(0)"
					class="sort" data-sort="js-lists-values-score">최소점수</a></th>
					
				<th style="width: 24px;">수정</th>
			</tr>
		</thead>
		<c:forEach items="${graduationCriteriaList }" var="graduationCriteria" varStatus="loop">
			<tbody class="list" id="projects">

				<tr>
					<td>
						<div class="media flex-nowrap align-items-center"
							style="white-space: nowrap;">
							<div class="media-body">
								<div class="d-flex flex-column">
									<small class="js-lists-values-project"><strong>${loop.count }</strong></small>
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
									${graduationCriteria.deptName }
									</strong>
								</p>
							</div>
						</div>
	
					</div>
					</td>

					<td>
						<div class="d-flex flex-column">
							<small class="js-lists-values-status">
								<strong id="deptThesisValue">${graduationCriteria.deptThesis }</strong>
							</small>
						</div>
					</td>

					<td>
						<div class="d-flex flex-column">
							<small class="js-lists-values-budget">
							<strong id="deptTestValue">${graduationCriteria.deptTest }</strong>
							</small>
						</div>
					</td>

					<td>
						<div class="d-flex flex-column">
							<small class="js-lists-values-date">
							<strong>${graduationCriteria.engName }</strong>
							</small>
						</div>
					</td>
					
					<td>
						<div class="d-flex flex-column">
							<small class="js-lists-values-score">
							<strong id="engScoreValue">${graduationCriteria.engScore }</strong>
							</small>
						</div>
					</td>
					
					<td>
					    <div class="d-flex flex-column">
					        <button class="btn btn-primary editBtn" data-grcrCode="${graduationCriteria.grcrCode}"
					        	data-engCode="${graduationCriteria.engCode}"
					        >수정하기</button>
					    </div>
					</td>
				</tr>
			</tbody>
		</c:forEach>
	</table>
</div>

<div id="editArea"></div>

<script src="<c:url value='/resources/js/paging.js'/>"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
var cPath = $('body').data('bodyCpath')

    $(document).on('click', '.editBtn', function() {
        var grcrCode = $(this).attr('data-grcrCode');
        var engCode = $(this).attr('data-engCode');
        var deptThesis = document.getElementById("deptThesisValue").innerText;
        console.log(deptThesis,engCode,deptThesis)
        var deptTest = document.getElementById("deptTestValue").innerText;
        
        var url = `\${cPath}/manager/stu/criteria/graduationcriteria/graduationCriteriaEditForm/\${grcrCode}`;
        $.ajax({
            url: url,
            type: 'GET',
            success: function(response) {
            	$('#editArea').html(response);
            	document.getElementById("deptThesis").value = deptThesis;
            	document.getElementById("deptTest").value = deptTest;
            	document.getElementById("engCode").value = engCode;
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
            }
        });
    });
//수정 폼 제출
$(document).on("submit","#editData", function(event){
	event.preventDefault();
	
	var formData = $('#editData').serialize();
	var url = `\${cPath}/manager/stu/criteria/graduationcriteria/graduationCriteriaEditForm`;
	
	var deptThesis = $("#deptThesis").val();
    var deptTest = $("#deptTest").val();
    var engCode = $("#engCode").val();
    
    // 선택된 값이 null 또는 빈 문자열인 경우 알림 표시
    if (!deptThesis || !deptTest || !engCode) {
    	Swal.fire({
		      title: '졸업요건 기준등록 실패',
		      text : '모든 항목을 선택해주십시오.',
		      icon: 'error'
		    });
        return;
    }
    
	  $.ajax({
	     url: url,
	     type: 'POST',
	     data: formData,
	     success: function(response) {
	         $('#editArea').empty();
 	 	Swal.fire({
		      title: '졸업요건 기준등록 성공',
		      icon: 'success'
		    });
	     },
	     error: function(xhr, status, error) {
	         console.error('Error:', error);
	     }
	 }); 
	return false;
});
</script>