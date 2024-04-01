<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<div class="mdk-header-layout__content page-content ">
	<div class="container page__container page-section">

		<div class="card dashboard-area-tabs p-relative o-hidden mb-lg-32pt"></div>
		<div class="card-header p-0 nav bg-white" style="margin: 20px;">
			<div class="row no-gutters" role="tablist">
				<div class="col-auto dashboard-area-tabs__tab card-body d-flex flex-row align-items-center justify-content-start active">
					<span class="h2 mb-0 mr-3">1</span>
					<span class="flex d-flex flex-column">
						<strong class="card-title">멘토신청목록</strong>
						<small class="card-subtitle text-50"></small>
					</span>
				</div>
			</div>
		</div>

		<div class="table-responsive bg-white" data-toggle="lists" 
			data-lists-sort-by="js-lists-values-date" data-lists-sort-desc="true"
			data-lists-values='["js-lists-values-lead", "js-lists-values-project", "js-lists-values-status", "js-lists-values-budget", "js-lists-values-date"]'
			style="overflow-y: scroll; max-height: 500px; margin: 20px;"
			>
			<table class="table mb-0 thead-border-top-0 table-nowrap">
				<thead>
					<tr>
						<th style="width: 48px;"><a href="javascript:void(0)"
							class="sort" data-sort="js-lists-values-project">번호</a></th>

						<th style="width: 48px;"><a href="javascript:void(0)" class="sort"
							data-sort="js-lists-values-lead">성명</a></th>

						<th style="width: 48px;"><a href="javascript:void(0)"
							class="sort" data-sort="js-lists-values-status">학번</a></th>

						<th style="width: 48px;"><a href="javascript:void(0)"
							class="sort" data-sort="js-lists-values-budget">학과</a></th>

						<th style="width: 48px;"><a href="javascript:void(0)"
							class="sort" data-sort="js-lists-values-date">첨부파일</a></th>
							
						<th style="width: 24px;">등록</th>
					</tr>
				</thead>
				<c:forEach items="${mentorAppl }" var="appl" varStatus="loop">
				<tbody class="list" id="projects" >
					<tr>
						<td>
							<div class="media-body">
								<div class="d-flex flex-column">
									<small class="js-lists-values-project"><strong>${loop.count}</strong></small>
								</div>
							</div>
						</td>

						<td>
							<div class="media-body">
								<div class="d-flex align-items-center">
									<div class="flex d-flex flex-column">
										<p class="mb-0">
											<small class="js-lists-values-lead"><strong>${appl.memName}</strong></small>
										</p>
									</div>
								</div>
							</div>
						</td>

						<td>
							<div class="d-flex flex-column">
								<small class="js-lists-values-status text-50 mb-4pt"><strong>${appl.smemNo}</strong></small>
							</div>
						</td>

						<td>
							<div class="d-flex flex-column">
								<small class="js-lists-values-budget"><strong>${appl.deptName}</strong></small>
							</div>
						</td>
						<td>
						    <div class="d-flex flex-column">
						        <small class="js-lists-values-date">
									<a href="#" data-gf-no="${appl.fileList[0].gfNo}" data-file-no="${appl.fileList[0].fileNo}" class="fileObj">${appl.fileList[0].fileNm}</a>
						        </small>
						    </div>
						</td>
						<td>
							<div class="d-flex flex-column">
							    <button type="button" class="btn btn-success" id="insertBtn" onclick="sendMemNo('${appl.smemNo}')">멘토 등록</button>
							</div>
						</td>
					</tr>
				</tbody>
				</c:forEach>
			</table>
		</div>
		
		<div id="insertFormArea"></div> 
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>

var cPath = $('body').data('bodyCpath');
var deletefilesData = [];

function sendMemNo(memNo) {
    console.log("memNo:", memNo);
    var url = `\${cPath}/manager/stu/mentor/mentorApplInsertForm/\${memNo}`;
    console.log(url)
    $.ajax({
        url: url,
        type: 'GET',
        success: function(response) {
            $('#insertFormArea').html(response);
        },
        error: function(xhr, status, error) {
            console.error('Error detail:', error);
        }
    });
}


//신청 폼 제출
$(document).on("submit","#forMentorForm", function(event){
    event.preventDefault();
    
    var formData = $(this).serialize();

    var url = `\${cPath}/manager/stu/mentor/mentorApplInsertForm`;
    console.log(url);

    $.ajax({
        url: url,
        type: 'POST',
        data: formData,
        success: function(response) {
            Swal.fire({
                title: '멘토 등록 완료',
                icon: 'success'
   	 		}).then((result) => {
                if (result.isConfirmed) {
                    location.href = `\${cPath}/manager/stu/mentor/mentorList`;
                }
             });
            $('#insertFormArea').empty();
        },
        error: function(xhr, status, error) {
            console.error('Error:', error);
        }
    });
    return false;
});

//삭제 버튼
$(document).on("click", "#delBtn", function(event) {
    event.preventDefault();
    
    var smemNo = $('#smemNo').val();
    console.log(smemNo);
    var url = `\${cPath}/manager/stu/mentor/del`;
    console.log(url);
    $.ajax({
        url: url,
        type: 'POST',
        data: { smemNo: smemNo },
        success: function(response) {
      		Swal.fire({
   		      title: '신청 반려 완료',
   		      icon: 'success'
   	 		}).then((result) => {
                if (result.isConfirmed) {
                    location.href = `\${cPath}/manager/stu/mentor/mentorList`;
                }
             });
      		$('#insertFormArea').empty();
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
	
	$(`\${fileNo}`).remove();
	
});

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
	console.log(gfNo,fileNo)
	fn_downloadFile(fileNo);
});
</script>