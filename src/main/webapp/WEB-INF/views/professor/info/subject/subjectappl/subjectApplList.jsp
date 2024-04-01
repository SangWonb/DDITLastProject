<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<h3>신청목록</h3>
<!-- 신청목록 테이블 -->
<div class="table-responsive bg-white" data-toggle="lists"
    data-lists-sort-by="js-lists-values-date" data-lists-sort-desc="true"
    data-lists-values='["js-lists-values-lead", "js-lists-values-a", "js-lists-values-b", "js-lists-values-c", "js-lists-values-project"]'
    style="overflow-y: scroll; max-height: 500px; margin: 20px;"
    >
    <table class="table mb-0 thead-border-top-0 table-nowrap" style=" margin: 20px;">
        <thead>
               <tr>
                <th style="width: 150px;"><a href="javascript:void(0)"
                        class="sort" data-sort="js-lists-values-project">순번</a></th>

                <th><a href="javascript:void(0)" class="sort"
                        data-sort="js-lists-values-c">강의명</a></th>
                <th><a href="javascript:void(0)" class="sort"
                        data-sort="js-lists-values-a">학년</a></th>
                <th><a href="javascript:void(0)" class="sort"
                        data-sort="js-lists-values-b">학기</a></th>

                <th><a href="javascript:void(0)" class="sort"
                        data-sort="js-lists-values-lead">승인여부</a></th>
                        
                <th>수정</th>
            </tr>
        </thead>
        <c:forEach items="${subjectApplList }" var="subjectAppl" varStatus="loop">
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
                        <div class="d-flex align-items-center">
                            <div class="flex d-flex flex-column">
                                <p class="mb-0">
                                    <strong class="js-lists-values-c">${subjectAppl.subName}</strong>
                                </p>
                            </div>
                        </div>
                    </td>

                    <td>
                        <div class="d-flex align-items-center">
                            <div class="flex d-flex flex-column">
                                <p class="mb-0">
                                    <strong class="js-lists-values-a">${subjectAppl.subSchyear }</strong>
                                </p>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="d-flex align-items-center">
                            <div class="flex d-flex flex-column">
                                <p class="mb-0">
                                    <strong class="js-lists-values-b">${subjectAppl.subSemester}</strong>
                                </p>
                            </div>
                        </div>
                    </td>

                    <td>
                       <div class="d-flex flex-column">
							<small class="js-lists-values-status text-50 mb-4pt">
								${subjectAppl.status.statusNm } </small>
							${subjectAppl.reject.rejectReason } <span class="indicator-line rounded bg-warning"></span>
						</div>
                    </td>
					<td>
						<div class="d-flex flex-column">
							<small class="js-lists-values-d text-50 mb-4pt"> <c:choose>
									<c:when test="${subjectAppl.status.statusCode eq 'STA01' }">
									<a href="#" onclick="editBtn('${subjectAppl.subAppno }')">수정하기</a>
									</c:when>
									<c:otherwise>
										<button type="button" class="btn btn-secondary" disabled="">수정불가</button>
									</c:otherwise>
								</c:choose>
							</small>
						</div>
					</td>
                </tr>
            </tbody>
        </c:forEach>
    </table>
</div>
<button class="btn btn-primary float-right" onclick="applbtn('${memNo }')">신청하기</button>
<div id="editArea"></div>
<div id="insertArea"></div>

<form id="submitForm" action="" style="display: none;">
</form>
<script src="<c:url value='/resources/js/paging.js'/>"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
var cPath = $('body').data('bodyCpath')

// 신청 버튼 클릭 -> 신청 폼
function applbtn(memNo) {
    var url = `\${cPath}/professor/info/subject/subjectappl/subjectApplInsertForm`;
    $.ajax({
        url: url,
        type: 'GET',
        success: function(response) {
            $('#editArea').empty();
            $('#insertArea').html(response); 
        },
        error: function(xhr, status, error) {
            console.error('Error retrieving:', error);
        }
    });
}

// 신청 폼 제출
$(document).on("submit","#applInsertForm", function(event){
	event.preventDefault();
	
	var formData = $('#applInsertData').serialize();
	var url = `\${cPath}/professor/info/subject/subjectappl/subjectApplInsertForm`;
	
    var subName = $("#subName").val();
    var subSchyear = $("#subSchyear").val();
    var subSemester = $("#subSemester").val();
    var deptCode = $("#deptCode").val();
    var majorCultural = $("#majorCultural").val();
    var choiceRequire = $("#choiceRequire").val();
    var subCredit = $("#subCredit").val();
    var pmemNo = $("#pmemNo").val();

    // 데이터가 없거나 셀렉트 박스가 선택되지 않았을 때
    if (!subName || !subSchyear || !subSemester || !deptCode || !majorCultural || !choiceRequire || !subCredit || !pmemNo ||
        subSchyear === "" || subSemester === "" || deptCode === "" || majorCultural === "" || choiceRequire === "") {
    	Swal.fire({
 		      title: '모든 항목을 입력해주세요',
 		      icon: 'error'
 		    });
        return;
    }
		
	  $.ajax({
	     url: url,
	     type: 'POST',
	     data: formData,
	     success: function(response) {
	         $('#insertArea').empty();
  		    Swal.fire({
   		      title: '신청 제출 완료',
   		      icon: 'success'
   	 		}).then((result) => {
                if (result.isConfirmed) {
                    location.href = `\${cPath}/professor/info/subject/subjectappl/subjectApplList`;
                }
             });
	     },
	     error: function(xhr, status, error) {
	         console.error('Error:', error);
	     }
	 }); 
	return false;
});

// 수정버튼 클릭
function editBtn(subAppno) {
    console.log("수정하기 버튼이 클릭되었습니다.");
    console.log(subAppno);
    var url = `\${cPath}/professor/info/subject/subjectappl/subjectApplEditForm/\${subAppno}`;
   
    $.ajax({
        url: url,
        type: 'GET',
        success: function(response) {
            $('#insertArea').empty();
            $('#editArea').html(response);
            
            var subSchyearValue = $("#subSchyear").data("select-value");
            document.getElementById("subSchyear").value = subSchyearValue;
            
            var subSemesterValue = $("#subSemester").data("select-value");
            document.getElementById("subSemester").value = subSemesterValue;
            
            var deptCodeValue = $("#deptCode").data("select-value");
            document.getElementById("deptCode").value = deptCodeValue;
            
            var majorCulturalValue = $("#majorCultural").data("select-value");
            document.getElementById("majorCultural").value = majorCulturalValue;
            
            var choiceRequireValue = $("#choiceRequire").data("select-value");
            document.getElementById("choiceRequire").value = choiceRequireValue;
            
            
        },
        error: function(xhr, status, error) {
            console.error('Error retrieving:', error);
        }
    });
}
//수정 폼 제출
$(document).on("submit","#applEditForm", function(event){
	event.preventDefault();
	
	var formData = $('#applEditForm').serialize();
	var subAppno = $("#subAppno").val();
	console.log(subAppno)
	var url = `\${cPath}/professor/info/subject/subjectappl/subjectApplEditForm`;
	
	var subName = $("#subName").val();
	var subSchyear = $("#subSchyear").val();
	var subSemester = $("#subSemester").val();
	var deptCode = $("#deptCode").val();
	var majorCultural = $("#majorCultural").val();
	var choiceRequire = $("#choiceRequire").val();
	var subCredit = $("#subCredit").val();
	var pmemNo = $("#pmemNo").val();
	// 데이터가 없거나 셀렉트 박스가 선택되지 않았을 때
    if (!subName || !subSchyear || !subSemester || !deptCode || !majorCultural || !choiceRequire || !subCredit || !pmemNo ||
        subSchyear === "" || subSemester === "" || deptCode === "" || majorCultural === "" || choiceRequire === "") {
    	Swal.fire({
 		      title: '모든 항목을 입력해주세요',
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
   		      title: '신청 수정 완료',
   		      icon: 'success'
   	 		}).then((result) => {
                if (result.isConfirmed) {
                    location.href = `\${cPath}/professor/info/subject/subjectappl/subjectApplList`;
                }
             });
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
    
    var subAppno = $("#subAppno").val();
    var url = `\${cPath}/professor/info/subject/subjectappl/del`;
    console.log(subAppno);
    $.ajax({
        url: url,
        type: 'POST',
        data: {subAppno : subAppno},
        success: function(response) {
            $('#editForm').empty();
      		Swal.fire({
   		      title: '신청 취소 완료',
   		      icon: 'success'
   	 		}).then((result) => {
                if (result.isConfirmed) {
                    location.href = `\${cPath}/professor/info/subject/subjectappl/subjectApplList`;
                }
             });
        },
        error: function(xhr, status, error) {
            console.error('Error:', error);
        }
    });
});
</script>