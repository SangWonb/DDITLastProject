<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<style>
	.tableCnt{
		margin-left: 10px;
	}
	.tcnt {
		margin-left: 5px;
	}
	.tbText {
		font-size: 18px;
	}
	.contA {
		margin-left: 15px;
	}
	.formCon {
		margin-top: 10px;
		width: 300px;
	}
	.formText {
		margin-top: 10px;
		margin-left: 15px;
	}
</style>
<div class="contA">
<div class="card">
   <div class="bg-white" style="width: 1200px;">
				<div class="col d-flex" data-pg-role="searchUI" data-pg-target="#submitForm" >
                     <div class="col-1" style="margin-right: 50px;">
                        <form:select class="form-control" path="paging.simpleCondition.searchType" style="width: 100px;">
                           <form:option value="all" label="전체" selected="true"/>
                           <form:option value="job" label="직무" />
                           <form:option value="deptName" label="학과" />
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
		
<div class="card-header p-0 nav bg-white" style="width: 1200px;">
    <div class="row no-gutters" role="tablist">
        <div class="col-auto border-left border-right">
            <a href="#ongoing" data-toggle="tab" role="tab" aria-selected="false"
                class="dashboard-area-tabs__tab card-body d-flex flex-row align-items-center justify-content-start active">
                <span class="h2 mb-0 mr-3">1</span>
                <span class="flex d-flex flex-column">
                    <strong class="card-title">멘토목록</strong>
                    <small class="card-subtitle text-50">Mentors</small>
                </span>
            </a>
        </div>
        <div class="col-auto">
            <a href="#mentor" data-toggle="tab" role="tab" aria-selected="true"
                class="dashboard-area-tabs__tab card-body d-flex flex-row align-items-center justify-content-start">
                <span class="h2 mb-0 mr-3">2</span>
                <span class="flex d-flex flex-column">
                    <strong class="card-title">신청목록</strong>
                    <small class="card-subtitle text-50">MentoringAppl</small>
                </span>
            </a>
        </div>
    </div>
</div>
<div id="mentor"></div>
 <div id="mentorList" class="table-responsive bg-white" data-toggle="lists" style="width: 1200px;"
            data-lists-sort-by="js-lists-values-project2" data-lists-sort-desc="true"
            data-lists-values='["js-lists-values-project2", "js-lists-values-a", "js-lists-values-job2","js-lists-values-status2", "js-lists-values-budget2"]'>
            <table class="table mb-0 thead-border-top-0 table-nowrap">
            
		<thead>
			<tr>

				<th style="width: 150px;"><a href="javascript:void(0)"
					class="sort tableCnt" data-sort="js-lists-values-project2">순번</a></th>

				<th><a href="javascript:void(0)" class="sort"
					data-sort="js-lists-values-a">멘토이름</a></th>
					
				<th><a href="javascript:void(0)" class="sort"
					data-sort="js-lists-values-job2">직무</a></th>

				<th style="width: 48px;"><a href="javascript:void(0)"
					class="sort" data-sort="js-lists-values-status2">회사구분</a></th>

				<th style="width: 48px;"><a href="javascript:void(0)"
					class="sort" data-sort="js-lists-values-budget2">학과</a></th>

				<th style="width: 48px;">
					<span>신청하기</span>
				</th>
			</tr>
		</thead>
		<c:forEach items="${mentorList }" var="mentor">
			<tbody class="list" id="projects">

				<tr>
					<td>

						<div class="media flex-nowrap align-items-center"
							style="white-space: nowrap;">
							<div class="media-body">
								<div class="d-flex flex-column tableCnt">
									<small class="js-lists-values-project2 tcnt tbText"><strong>${mentor.rnum }</strong></small>
								</div>
							</div>
						</div>
					</td>
					
					<td>
					    <div class="media-body">
					        <div class="d-flex align-items-center">
					            <div class="flex d-flex flex-column">
					                <p class="mb-0">
					                    <strong class="js-lists-values-a tbText" id="mentorDetailA" data-srNo="${mentor.srNo}">
					                        ${mentor.memName}
					                    </strong>
					                </p>
					            </div>
					        </div>
					    </div>
					</td>


					<td>
					<div class="media-body">
						<div class="d-flex align-items-center">
							<div class="flex d-flex flex-column">
								<p class="mb-0">
									<strong class="js-lists-values-job2 tbText">
									${mentor.companyJob }
									</strong>
								</p>
							</div>
						</div>
					</div>
					</td>

					<td>
						<div class="d-flex flex-column">
							<small class="js-lists-values-status2 text-50 mb-4pt tbText">
								${mentor.companyType }
							</small>
						</div>
					</td>

					<td>
						<div class="d-flex flex-column">
							<small class="js-lists-values-budget2 tbText"><strong>${mentor.deptName }</strong></small>
						</div>
					</td>

					<td>
						<div class="d-flex flex-column tbText">
                                <a href="#" onclick="applbtn('${mentor.srNo }','${mentor.memName }')">신청하기</a>
						</div>
					</td>

			</tbody>
		</c:forEach>
	</table>
		${pagingHTML }
</div>
</div>
    <button type="button" class="btn btn-primary" id="forMentor" style="margin-top: 10px";>
        멘토 되어보기
    </button>
<div class="formCon card">
<div class="formText">
<div id="applForm" action=""></div>
<div id="viewForm" action=""></div>
<div id="editForm" action=""></div>
<div id="newMentor" action=""></div>
<form id="submitForm" action="" style="display: none;">
	<input type="text" name="page"/>
</form>
</div>
</div>
</div>
<script src="<c:url value='/resources/js/paging.js'/>"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>

function fillFormData() {
    // 시연용 데이터 설정
    var menteeJob = "IT개발(SI)";
    var menteeCom = "가온";
    
    // 강의명(input)에 데이터 채우기
    document.getElementById("menteeJob").value = menteeJob;
    document.getElementById("menteeCom").value = menteeCom;
}

var cPath = $('body').data('bodyCpath')
var deletefilesData = [];

var forMentor = $("#forMentor");
// 멘토등록폼
forMentor.click(function() {
    var url = `\${cPath}/student/careerup/mentoring/mentoringmentee/forMentor`;
    $.ajax({
        url: url,
        type: 'GET',
        success: function(response) {
            $('#viewForm').empty();
            $('#editForm').empty();
            $('#applForm').empty();
            $('#newMentor').html(response); 
            
        },
        error: function(xhr, status, error) {
            console.error('Error retrieving:', error);
        }
    });
});

// 멘토등록 폼 제출
$(document).on("submit","#forMentorForm", function(event){
	event.preventDefault();
	
	var $form = $('#forMentorForm');
	var formData = new FormData($form[0]);
	var url = `\${cPath}/student/careerup/mentoring/mentoringmentee/forMentor`;
		
	  $.ajax({
	     url: url,
	     type: 'POST',
	     data: formData,
	     processData: false, 
         contentType: false,
	     success: function(response) {
  		    Swal.fire({
   		      title: '신청 제출 완료',
   		      icon: 'success'
   		    });
	         $('#newMentor').empty();
	     },
	     error: function(xhr, status, error) {
	         console.error('Error:', error);
	     }
	 }); 
	return false;
});

// 탭에 따라 다른 URL 설정
$(document).ready(function() {
    $('.dashboard-area-tabs__tab').on('click', function() {
        
        var tabId = $(this).attr('href');
        var url;
    
        if (tabId === '#ongoing') {
            url = `\${cPath}/student/careerup/mentoring/mentoringmentee/mentoringMenteeAppl`;
	        $.ajax({
	            url: url,
	            type: 'GET',
	            success: function(response) {
	            	let parser = new DOMParser();
	    			let newDoc = parser.parseFromString(response, "text/html");
	    			let preTag = newDoc.getElementById('mentorList');
	    			$('#mentor').empty();
	    			$('#applForm').empty();
	    			$('#viewForm').empty();
	    			$('#editForm').empty();
	                $('#mentorList').html(preTag);
	            },
	            error: function(xhr, status, error) {
	                console.error('Error retrieving:', error);
	            }
	        });
	        
        } else if (tabId === '#mentor') {
            url = `\${cPath}/student/careerup/mentoring/mentoringmentee/mentorList`;
	        $.ajax({
	            url: url,
	            type: 'GET',
	            success: function(response) {
	            	let parser = new DOMParser();
	    			let newDoc = parser.parseFromString(response, "text/html");
	    			let preTag = newDoc.getElementById('applList');
	    			$('#mentorList').empty();
	    			$('#applForm').empty();
	    			$('#viewForm').empty();
	    			$('#editForm').empty();
	                $('#mentor').html(preTag); 
	            },
	            error: function(xhr, status, error) {
	                console.error('Error retrieving:', error);
	            }
	        });
        }
    });
});

// 신청 버튼 클릭 -> 신청 폼
function applbtn(srNo,memName) {
    var url = `\${cPath}/student/careerup/mentoring/mentoringmentee/mentorApplForm?srNo=\${srNo}&memName=\${memName}`;
    $.ajax({
        url: url,
        type: 'GET',
        success: function(response) {
            $('#viewForm').empty();
            $('#editForm').empty();
            $('#newMentor').empty();
            $('#applForm').html(response); 
            
        },
        error: function(xhr, status, error) {
            console.error('Error retrieving:', error);
        }
    });
}

// 신청 폼 제출
$(document).on("submit","#menteeInsertForm", function(event){
	event.preventDefault();
	
	var formData = $('#menteeInsertForm').serialize();
	var srNo = $("#senior").val();
	var url = `\${cPath}/student/careerup/mentoring/mentoringmentee/mentorApplForm/\${srNo}`;
		
	  $.ajax({
	     url: url,
	     type: 'POST',
	     data: formData,
	     success: function(response) {
  		    Swal.fire({
   		      title: '신청 제출 완료',
   		      icon: 'success'
             });
	         $('#applForm').empty();
	     },
	     error: function(xhr, status, error) {
	         console.error('Error:', error);
	     }
	 }); 
	return false;
});

//이름 클릭 이벤트
$(document).on('click', '#mentorDetailA', function() {
    var srNo = $(this).attr('data-srNo');
    
    var url = `\${cPath}/student/careerup/mentoring/mentoringmentee/mentorDetail/\${srNo}`;
    $.ajax({
        url: url,
        type: 'GET',
        success: function(response) {
            $('#applForm').empty();
            $('#editForm').empty();
            $('#viewForm').html(response);
        },
        error: function(xhr, status, error) {
            console.error('Error detail:', error);
        }
    });
});

// 수정버튼 클릭
function editBtn(menteeNo) {
    console.log("수정하기 버튼이 클릭되었습니다.");
    console.log(menteeNo);
    var url = `\${cPath}/student/careerup/mentoring/mentoringmentee/applEditForm/\${menteeNo}`;
    $.ajax({
        url: url,
        type: 'GET',
        success: function(response) {
            $('#viewForm').empty();
            $('#editForm').html(response); 
            
        },
        error: function(xhr, status, error) {
            console.error('Error retrieving:', error);
        }
    });
}
//수정 폼 제출
$(document).on("submit","#menteeEditForm", function(event){
	event.preventDefault();
	
	var formData = $('#menteeEditForm').serialize();
	var menteeNo = $("#applEditMenteeNo").val();
	var url = `\${cPath}/student/careerup/mentoring/mentoringmentee/applEditForm/\${menteeNo}`;
	console.log(url);
		
	  $.ajax({
	     url: url,
	     type: 'POST',
	     data: formData,
	     success: function(response) {
    	 	Swal.fire({
   		      title: '신청 수정 완료',
   		      icon: 'success'
   	 		}).then((result) => {
                if (result.isConfirmed) {
                    location.href = `\${cPath}/student/careerup/mentoring/mentoringmentee/mentoringMenteeAppl`;
                }
             });
	         $('#editForm').empty();
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
    
    var menteeNo = $("#applEditMenteeNo").val();
    var url = `\${cPath}/student/careerup/mentoring/mentoringmentee/del/\${menteeNo}`;
    console.log(url);
    $.ajax({
        url: url,
        type: 'POST',
        success: function(response) {
      		Swal.fire({
   		      title: '신청 취소 완료',
   		      icon: 'success'
   	 		}).then((result) => {
                if (result.isConfirmed) {
                    location.href = `\${cPath}/student/careerup/mentoring/mentoringmentee/mentoringMenteeAppl`;
                }
             });
            $('#editForm').empty();
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
	fn_downloadFile(fileNo);
});

</script>