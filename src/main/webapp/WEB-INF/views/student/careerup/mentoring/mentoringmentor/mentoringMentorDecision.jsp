<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<div class="card-header p-0 nav">
    <div class="row no-gutters" role="tablist">
        <div class="col-auto">
            <a href="#ongoing" data-toggle="tab" role="tab" aria-selected="true"
                class="dashboard-area-tabs__tab card-body d-flex flex-row align-items-center justify-content-start active">
                <span class="h2 mb-0 mr-3">1</span>
                <span class="flex d-flex flex-column">
                    <strong class="card-title">신청목록</strong>
                    <small class="card-subtitle text-50">Mentoring</small>
                </span>
            </a>
        </div>
    </div>
</div>

<div class="tab-content">
		<div class="table-responsive bg-white" data-toggle="lists"
			data-lists-sort-by="js-lists-values-date" data-lists-sort-desc="true"
			data-lists-values='["js-lists-values-lead", "js-lists-values-project", "js-lists-values-status", 
			"js-lists-values-budget", "js-lists-values-date"]'>
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
							data-sort="js-lists-values-lead">멘티이름</a></th>

						<th style="width: 48px;"><a href="javascript:void(0)"
							class="sort" data-sort="js-lists-values-status">학과</a></th>

						<th style="width: 48px;"><a href="javascript:void(0)"
							class="sort" data-sort="js-lists-values-date">신청날짜</a></th>

						<th style="width: 48px;"><a href="javascript:void(0)"
							class="sort" data-sort="js-lists-values-budget">상태</a></th>
							
						<th style="width: 48px;"><a href="javascript:void(0)"
							class="sort" data-sort="js-lists-values-a">수정</a></th>
					</tr>
				</thead>
				<tbody class="list" id="projects">
				<c:choose>
					<c:when test="${not empty mentoringDecisionList}">
						<c:forEach items="${mentoringDecisionList }" var="mentoringDe">

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
												<small class="js-lists-values-project"><strong>${mentoringDe.rnum }</strong></small>
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
														${mentoringDe.memName } </strong>
												</p>
											</div>
										</div>
									</div>
								</td>

								<td>
									<div class="d-flex flex-column">
										<small class="js-lists-values-date text-50 mb-4pt">
											${mentoringDe.deptName} </small> <span
											class="indicator-line rounded bg-warning"></span>
									</div>
								</td>

								<td>
									<div class="d-flex flex-column">
										<small class="js-lists-values-status"><strong>${mentoringDe.menteeDate }</strong></small>
										<!--  <small class="text-50">Invoice Sent</small> -->
									</div>
								</td>
								<td>
									<div class="d-flex flex-column">
										<small class="js-lists-values-budget text-50 mb-4pt">
											${mentoringDe.status.statusNm } </small>
										${mentoringDe.reject.rejectReason } <span class="indicator-line rounded bg-warning"></span>
									</div>
								</td>
								<td>
									<div class="d-flex flex-column">
										<small class="js-lists-values-a text-50 mb-4pt"> <c:choose>
												<c:when test="${mentoringDe.status.statusCode eq 'STA01' }">
												<a href="#" onclick="decisionBtn('${mentoringDe.menteeNo }')">수정하기</a>
												</c:when>
												<c:otherwise>
													<button type="button" class="btn btn-secondary" disabled="">수정불가</button>
												</c:otherwise>
											</c:choose>
										</small>
									</div>
								</td>
						</c:forEach>
						</c:when>
					<c:otherwise>
						<td colspan="7">
							<div style="text-align: center;">
									멘토링 신청목록이 존재하지 않습니다.
							</div>
						</td>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
		</div>
	</div>
	
<div id="decisionArea"></div>

<script src="<c:url value='/resources/js/paging.js'/>"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
var cPath = $('body').data('bodyCpath');
//수정버튼 클릭
function decisionBtn(menteeNo) {
    var url = `\${cPath}/student/careerup/mentoring/mentoringmentor/decisionEditForm/\${menteeNo}`;
    $.ajax({
        url: url,
        type: 'GET',
        success: function(response) {
            $('#decisionArea').html(response); 
            
        },
        error: function(xhr, status, error) {
            console.error('Error retrieving:', error);
        }
    });
}

// 승인버튼
$(document).on("click", "#statusSelect", function(event){
    event.preventDefault(); 
    // 승인 처리
    var menteeNo = $('#applEditMenteeNo').val();
    var memNo = $('#memNo').val();
    console.log("memNo",memNo);
    var url = `\${cPath}/student/careerup/mentoring/mentoringmentor/decisionEditForm`;
    var data = {
    		memNo:`\${memNo}`
    	    ,menteeNo:`\${menteeNo}`
    	    ,statusCode:'STA06'
    	};
    // AJAX로 POST 요청 보내기
    $.ajax({
        url: url,
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(data),
        success: function(data) {
        	    Swal.fire({
        	      title: '승인 완료',
        	      text: '승인된 항목은 멘토링 진행 페이지에서 확인할 수 있습니다.',
        	      icon: 'success'
       	 		}).then((result) => {
                    if (result.isConfirmed) {
                        location.href = `\${cPath}/student/careerup/mentoring/mentoringmentor/mentoringMentorDecision`;
                    }
                 });
        	    $('#mentorDecisionForm').empty();
        },
        error: function(xhr, status, error) {
        	 Swal.fire({
       	      title: '승인 실패',
       	      text: '다시 승인을 진행해주시길 바랍니다.',
       	      icon: 'error'
       	    });
        }
    });
});

$(document).on("click", "#rejectSelect", function(event) {
    event.preventDefault(); 

    // 셀렉트 박스의 값을 가져옵니다.
    var selectedOption = $('#rejectReason').val();

    // 셀렉트 박스의 값이 선택되었는지 확인합니다.
    if (!selectedOption) {
    	Swal.fire({
     	      title: '반려 실패',
     	      text: '반려 사유를 선택해주시길 바랍니다.',
     	      icon: 'error'
     	    });
        return; // 함수 종료
    }

    // 승인 처리
    var menteeNo = $('#applEditMenteeNo').val();
    var url = `\${cPath}/student/careerup/mentoring/mentoringmentor/decisionEditForm`;
    var data = {
        menteeNo: `\${menteeNo}`,
        statusCode: 'STA04',
        rejectCode: `\${selectedOption}`
    };
    // AJAX로 POST 요청 보내기
    $.ajax({
        url: url,
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(data),
        success: function(data) {
        	Swal.fire({
       	      title: '반려 성공',
       	      icon: 'success'
   	 		}).then((result) => {
                if (result.isConfirmed) {
                    location.href = `\${cPath}/student/careerup/mentoring/mentoringmentor/mentoringMentorDecision`;
                }
             });
        	$('#mentorDecisionForm').empty();
        },
        error: function(xhr, status, error) {
        	Swal.fire({
       	      title: '반려 실패',
       	      text: '다시 반려를 진행해주시길 바랍니다.',
       	      icon: 'error'
       	    });
        }
    });
});
</script>