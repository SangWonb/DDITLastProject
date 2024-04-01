<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="mdk-header-layout__content page-content ">
	<div class="container page__container page-section">

		<div class="container page__container">
				<div class="col d-flex" data-pg-role="searchUI" data-pg-target="#submitForm" >
                     <div class="col-1" style="margin-right: 50px;">
                        <form:select class="form-control" path="paging.simpleCondition.searchType" style="width: 100px;">
                           <form:option value="cmntAll" label="전체" selected="true"/>
                           <form:option value="deptName" label="학과" />
                           <form:option value="cmntTitle" label="제목" />
                           <form:option value="cmntContent" label="내용" />
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
				<div class="col-auto dashboard-area-tabs__tab card-body d-flex flex-row align-items-center justify-content-start active">
					<span class="h2 mb-0 mr-3">1</span>
					<span class="flex d-flex flex-column">
						<strong class="card-title">학과 공지사항</strong>
						<small class="card-subtitle text-50"></small>
					</span>
				</div>
			</div>
		</div>

		<div class="table-responsive bg-white" data-toggle="lists" style="padding: 20px;"
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
							class="sort" data-sort="js-lists-values-project">번호</a></th>

						<th><a href="javascript:void(0)" class="sort"
							data-sort="js-lists-values-lead">제목</a></th>

						<th style="width: 48px;"><a href="javascript:void(0)"
							class="sort" data-sort="js-lists-values-status">작성자</a></th>

						<th style="width: 48px;"><a href="javascript:void(0)"
							class="sort" data-sort="js-lists-values-budget">등록일</a></th>

						<th style="width: 48px;"><a href="javascript:void(0)"
							class="sort" data-sort="js-lists-values-date">조회수</a></th>
						<th style="width: 24px;"></th>
					</tr>
				</thead>
				<c:forEach items="${departmentNoticeList }" var="departmentNotice">
				<tbody class="list" id="projects">
					<tr>
						<td class="pr-0">
							<div class="custom-control custom-checkbox">
								<input type="checkbox"
									class="custom-control-input js-check-selected-row"
									id="customCheck1_1">
							</div>
						</td>

						<td>
							<div class="media-body">
								<div class="d-flex flex-column">
									<small class="js-lists-values-project"><strong>${departmentNotice.rnum}</strong></small>
								</div>
							</div>
						</td>

						<td>
							<div class="media-body">
								<div class="d-flex align-items-center">
									<div class="flex d-flex flex-column">
										<p class="mb-0">
											<a href="#" class="js-lists-values-lead btn-load-detail" id="noticeName" data-cmntCode="${departmentNotice.cmntCode}">${departmentNotice.cmntTitle}</a>
										</p>
									</div>
								</div>
							</div>
						</td>

						<td>
							<div class="d-flex flex-column">
								<small class="js-lists-values-status">${departmentNotice.memName}</small>
							</div>
						</td>

						<td>
							<div class="d-flex flex-column">
								<small class="js-lists-values-budget"><strong>${fn:substring(departmentNotice.cmntDate, 0, 10)}</strong></small>
							</div>
						</td>

						<td>
							<div class="d-flex flex-column">
								<small class="js-lists-values-date"><strong>${departmentNotice.cmntCount}</strong></small>
							</div>
						</td>
					</tr>
				</tbody>
				</c:forEach>
			</table>
			<div class="text-right mt-3">
			<button type="button" class="btn btn-success" id="insertBtn">공지사항 작성</button>
			</div>
			${pagingHTML }
		</div>
		
<!-- 세부 내용을 표시할 영역 -->
		<div id="noticeDetailM"></div> 
		<div id="noticeInsertAreaM"></div> 
		<div id="noticeEditAreaM"></div> 

		<form id="submitForm" action="" style="display: none;">
			<input type="text" name="page"/>
		</form>

	</div>
</div>

<script src="<c:url value='/resources/js/paging.js'/>"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>

var cPath = $('body').data('bodyCpath');
var deletefilesData = [];
//이름 클릭 이벤트
$(document).on('click', '#noticeName', function() {
    var cmntCode = $(this).attr('data-cmntCode');
    console.log(cmntCode)
    var url = `\${cPath}/manager/com/board/departmentnotice/departmentNoticeDetail/\${cmntCode}`;
    console.log(url)
    $.ajax({
        url: url,
        type: 'GET',
        success: function(response) {
            $('#noticeInsertAreaM').empty();
            $('#noticeEditAreaM').empty();
            $('#noticeDetailM').html(response);
        },
        error: function(xhr, status, error) {
            console.error('Error detail:', error);
        }
    });
});

//신청 버튼 클릭 -> 신청 폼
$(document).on('click', '#insertBtn', function() {
    
    var url = `\${cPath}/manager/com/board/departmentnotice/departmentNoticeInsertForm`;
    $.ajax({
        url: url,
        type: 'GET',
        success: function(response) {
            $('#noticeDetailM').empty();
            $('#noticeEditAreaM').empty();
            $('#noticeInsertAreaM').html(response); 
        },
        error: function(xhr, status, error) {
            console.error('Error retrieving:', error);
        }
    });
});

// 신청 폼 제출
$(document).on("submit","#noticeInsertData", function(event){
	event.preventDefault();
	
	var $form = $('#noticeInsertData');
	var formData = new FormData($form[0]);
	var url = `\${cPath}/manager/com/board/departmentnotice/departmentNoticeInsertForm`;
	console.log(url);
		
	  $.ajax({
	     url: url,
	     type: 'POST',
	     data: formData,
	     processData: false, // 필수: processData를 false로 설정하여 FormData를 직렬화하지 않음
	     contentType: false, // 필수: contentType을 false로 설정하여 기본 타입을 지정하지 않음
	     success: function(response) {
  		    Swal.fire({
   		      title: '공지사항 등록 완료',
   		      icon: 'success'
   	 		}).then((result) => {
                if (result.isConfirmed) {
                    location.href = `\${cPath}/manager/com/board/departmentnotice/departmentNoticeList`;
                }
             });
	         $('#noticeInsertAreaM').empty();
	     },
	     error: function(xhr, status, error) {
	         console.error('Error:', error);
	     }
	 }); 
	return false;
});

// 수정버튼 클릭
$(document).on('click', '#editFormBtn', function() {
    var cmntCode = $(this).val();
    
    var url = `\${cPath}/manager/com/board/departmentnotice/departmentNoticeEditForm/\${cmntCode}`;
    $.ajax({
        url: url,
        type: 'GET',
        success: function(response) {
            $('#noticeDetailM').empty();
            $('#noticeInsertAreaM').empty();
            $('#noticeEditAreaM').html(response); 
            
            var deptCodeValue = $("#deptCode").data("select-value");
            document.getElementById("deptCode").value = deptCodeValue;
            $('#deptCode').val(deptCodeValue);
        },
        error: function(xhr, status, error) {
            console.error('Error retrieving:', error);
        }
    });
});
    
//수정 폼 제출
$(document).on("submit","#noticeEditData", function(event){
	event.preventDefault();
	
	var $form = $('#noticeEditData');
	var formData = new FormData($form[0]);
	if(deletefilesData.length > 0){
	for(var data of deletefilesData)
	formData.append('deleteFiles', data);
}
	var url = `\${cPath}/manager/com/board/departmentnotice/departmentNoticeEditForm`;
	console.log(url);
	
	  $.ajax({
	     url: url,
	     type: 'POST',
	     data: formData,
	     processData: false, // 필수: processData를 false로 설정하여 FormData를 직렬화하지 않음
	     contentType: false, // 필수: contentType을 false로 설정하여 기본 타입을 지정하지 않음
	     success: function(response) {
    	 	Swal.fire({
   		      title: '공지사항 수정 완료',
   		      icon: 'success'
   	 		}).then((result) => {
                if (result.isConfirmed) {
                    location.href = `\${cPath}/manager/com/board/departmentnotice/departmentNoticeList`;
                }
             });
	         $('#noticeEditAreaM').empty();
	     },
	     error: function(xhr, status, error) {
	         console.error('Error:', error);
	     }
	 }); 
	return false;
});

// 삭제 버튼
$(document).on("click", "#delBtn", function(event) {
    event.preventDefault();
    event.preventDefault(".deletefileObj");
    var cmntCode = $(this).val();
    var url = `\${cPath}/manager/com/board/departmentnotice/del`;
    console.log(url);
    $.ajax({
        url: url,
        type: 'POST',
        data: { cmntCode: cmntCode },
        success: function(response) {
      		Swal.fire({
   		      title: '공지사항 삭제 완료',
   		      icon: 'success'
   	 		}).then((result) => {
                if (result.isConfirmed) {
                    location.href = `\${cPath}/manager/com/board/departmentnotice/departmentNoticeList`;
                }
             });
            $('#noticeDetailM').empty();
        },
        error: function(xhr, status, error) {
            console.error('Error:', error);
        }
    });
});

//파일삭제 클릭 임시 삭제 폼
$(document).on("click",".deletefileObj", function(event){
	var clickedElement = $(event.currentTarget); 
	var gfNo = clickedElement.data("gfNo");
	var fileNo = clickedElement.data("fileNo");
	deletefilesData.push(fileNo);
	
	$(`"#\${fileNo}"`).remove();
	
});

function deleteSelectedFile(fileName) {
    // 파일 삭제 동작 구현
    // 필요한 경우 AJAX를 사용하여 서버로 파일 삭제 요청을 보낼 수 있습니다.
    alert('파일 ' + fileName + ' 삭제됨');
    // 해당 파일명이 보이지 않도록 숨기기
    var fileDiv = document.getElementById("selectedFile_" + fileName);
    if (fileDiv) {
        fileDiv.style.display = "none";
    }
}

//파일 다운로드
function fn_downloadFile(fileNo){
	let hiddenA = document.createElement("a");
	hiddenA.href = cPath + "/download/single?fileNo=" + fileNo;;
	hiddenA.click();
	hiddenA.remove();
}
function fn_downloadFiles(gfNo){
	let hiddenA = document.createElement("a");
	hiddenA.href = cPath + "/download/multipleGfNo?gfNo=" + gfNo;
	hiddenA.click();
	hiddenA.remove();
}
$(document).on("click", ".fileObj", function(event){
	var clickedElement = $(event.currentTarget); 
	var gfNo = clickedElement.data("gfNo");
	var fileNo = clickedElement.data("fileNo");
	fn_downloadFile(fileNo);
});
</script>