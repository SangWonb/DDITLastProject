<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
  <div class="container page__container">
	<div class="col d-flex" data-pg-role="searchUI" data-pg-target="#submitForm" >
        <div class="col-1" style="margin-right: 50px;">
           <form:select class="form-control" path="paging.simpleCondition.searchType" style="width: 100px;">
              <form:option value="all" label="전체" selected="true"/>
              <form:option value="title" label="제목" />
              <form:option value="content" label="내용" />
           </form:select>
        </div>

		<div class="col-3 d-flex align-items-start">
           <form:input type="search" class="form-control" path="paging.simpleCondition.searchWord" aria-label="Search"  style="margin-right: 10px;"/>
           <input type="button"  class="btn btn-outline-primary" data-pg-role="searchBtn" value="검색"/>
        </div>
	</div>
	<form:form id="submitForm" action="" modelAttribute="paging" method="get">
          <input type='hidden' name="page" />
          <form:input type='hidden' path="simpleCondition.searchType"/>
          <form:input type='hidden' path="simpleCondition.searchWord"/>
      </form:form> 
</div>

<div class="card dashboard-area-tabs p-relative o-hidden mb-lg-32pt"></div>
<div class="card-header p-0 nav">
	<div class="row no-gutters" role="tablist">
		<div class="col-auto">
			<a href="#employmentProgramList" data-toggle="tab" role="tab" aria-selected="true"
				class="dashboard-area card-body d-flex flex-row align-items-center justify-content-start active">
				<span class="h2 mb-0 mr-3">1</span> 
				<span class="flex d-flex flex-column"> <strong class="card-title">취업교육</strong> 
				<small class="card-subtitle text-50">EMPOLYMENT PROGRAM</small>
			</span>
			</a>
		</div>
		<div class="col-auto border-left border-right">
            <a href="#employmentProgramAppl" data-toggle="tab" role="tab" aria-selected="false"
                class="dashboard-area card-body d-flex flex-row align-items-center justify-content-start">
                <span class="h2 mb-0 mr-3">2</span>
                <span class="flex d-flex flex-column">
                    <strong class="card-title">신청목록</strong>
                    <small class="card-subtitle text-50">ProgramAppl</small>
                </span>
            </a>
        </div>
	</div>
</div>
<div id="employmentProgramApplArea" class="bg-white"></div>
<div id="employmentProgramArea" class="bg-white">
	<div class="table-responsive" data-toggle="lists"
		id="employmentProgramList" data-lists-sort-by="js-lists-values-date"
		data-lists-sort-desc="true"
		data-lists-values='["js-lists-values-project", "js-lists-values-lead", "js-lists-values-status", "js-lists-values-budget"]'>
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
						class="sort" data-sort="js-lists-values-project">순번</a></th>

					<th><a href="javascript:void(0)" class="sort"
						data-sort="js-lists-values-lead">교육명</a></th>

					<th style="width: 48px;"><a href="javascript:void(0)"
						class="sort" data-sort="js-lists-values-status">신청기간</a></th>

					<th style="width: 48px;"><a href="javascript:void(0)"
						class="sort" data-sort="js-lists-values-budget">정원</a></th>
				</tr>
			</thead>
			<tbody class="list" id="projects">
				<c:if test="${not empty employProgramList}">
					<c:forEach items="${employProgramList }" var="employProgram">

						<tr>

							<td class="pr-0">
								<div class="custom-control custom-checkbox">
									<input type="checkbox"
										class="custom-control-input 
								js-check-selected-row"
										id="customCheck1_1">
								</div>
							</td>

							<td>

								<div class="media flex-nowrap align-items-center"
									style="white-space: nowrap;">
									<div class="media-body">
										<div class="d-flex flex-column">
											<small class="js-lists-values-project"><strong>${employProgram.rnum }</strong></small>
										</div>
									</div>
								</div>

							</td>

							<td>

								<div class="media-body">

									<div class="d-flex align-items-center">
										<div class="flex d-flex flex-column">
											<p class="mb-0">
												<a class="js-lists-values-lead" id="employProgramCd"
													data-emppgCode="${employProgram.emppgCode }">
													${employProgram.emppgNm } </a>
											</p>
										</div>
									</div>

								</div>
							</td>

							<td>
								<div class="d-flex flex-column">
									<small class="js-lists-values-status text-50 mb-4pt">
										${employProgram.emppgStart } ~ ${employProgram.emppgEnd } </small> <span
										class="indicator-line rounded bg-warning"></span>
								</div>
							</td>

							<td>
								<div class="d-flex flex-column">
									<small class="js-lists-values-budget"><strong>${employProgram.emppgLimit}</strong></small>
								</div>
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		${pagingHTML }
	</div>
</div>

<div id="viewArea"></div>

<script src="<c:url value='/resources/js/paging.js'/>"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
var cPath = $('body').data('bodyCpath');
//탭에 따라 다른 URL 설정
$(document).ready(function() {
 $('.dashboard-area').on('click', function() {
     
     var tabId = $(this).attr('href');
     var url;
     
     if (tabId === '#employmentProgramList') {
         url = `\${cPath}/student/careerup/employment/employmenteducation/employmentEducationList`;
	        $.ajax({
	            url: url,
	            type: 'GET',
	            success: function(response) {
	            	let parser = new DOMParser();
	    			let newDoc = parser.parseFromString(response, "text/html");
	    			let preTag = newDoc.getElementById('employmentProgramList');
	    			$('#employmentProgramApplArea').empty();
	    			$('#viewArea').empty();
	                $('#employmentProgramArea').html(preTag).toogle(); 
	            },
	            error: function(xhr, status, error) {
	                console.error('Error retrieving:', error);
	            }
	        });
	        
     } else if (tabId === '#employmentProgramAppl') {
         url = `\${cPath}/student/careerup/employment/employmenteducation/employProgramApplList`;
	        $.ajax({
	            url: url,
	            type: 'GET',
	            success: function(response) {
	    			$('#employmentProgramArea').empty();
	    			$('#viewArea').empty();
	                $('#employmentProgramApplArea').html(response);
	                var options = {
	                	    valueNames: [ "js-lists-values-project1", "js-lists-values-lead1", 
	                			"js-lists-values-status1", "js-lists-values-budget1", "js-lists-values-date1" ]
	                	};
	                	var hackerList = new List('employmentProgramApplList', options);
	            },
	            error: function(xhr, status, error) {
	                console.error('Error retrieving:', error);
	            }
	        });
     }
 });
});

//이름 클릭 이벤트
$(document).on('click', '#employProgramCd', function() {
    var emppgCode = $(this).attr('data-emppgCode');
    
    var url = `\${cPath}/student/careerup/employment/employmenteducation/employmentEducationDetail/\${emppgCode}`;
    $.ajax({
        url: url,
        type: 'GET',
        success: function(response) {
            $('#viewArea').html(response);
        },
        error: function(xhr, status, error) {
            console.error('Error detail:', error);
        }
    });
});

// 신청하기 버튼 클릭
 function employmentProgramAppl(emppgCode) {
   console.log('신청 제출:', emppgCode);
   var applCode = emppgCode;
   var url = `\${cPath}/student/careerup/employment/employmenteducation/employProgramApplForm?applCode=\${applCode}`;
   $.ajax({
       url: url,
       type: 'POST',
       success: function(response) {
			$('#viewArea').empty();
			 Swal.fire({
       	      title: '신청완료',
       	      icon: 'success'
	   	 		}).then((result) => {
	                if (result.isConfirmed) {
	                    location.href = `\${cPath}/student/careerup/employment/employmenteducation/employmentEducationList`;
	                }
	             });
       },
       error: function(xhr, status, error) {
           console.error('Error retrieving:', error);
       }
   });
 }
 
//삭제 버튼
 $(document).on('click','#delApplBtn', function() {
	 	var applNo = $(this).val();

	    var url = `\${cPath}/student/careerup/employment/employmenteducation/employProgramApplList/\${applNo}`;
	     $.ajax({
	         url: url,
	         type: 'POST',
	         success: function(response) {
	        	 Swal.fire({
	        	      title: '신청취소완료',
	        	      icon: 'success'
	    	 		}).then((result) => {
	                    if (result.isConfirmed) {
	                        location.href = `\${cPath}/student/careerup/employment/employmenteducation/employmentEducationList`;
	                    }
	                 });
	             $('#viewArea').empty();
	         },
	         error: function(xhr, status, error) {
	             console.error('Error:', error);
	         }
	     });
 });
</script>