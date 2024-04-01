<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

   <h3>신청 목록</h3>
<div class="table-responsive bg-white" data-toggle="lists"
    data-lists-sort-by="js-lists-values-date" data-lists-sort-desc="true"
    data-lists-values='["js-lists-values-lead", "js-lists-values-a", "js-lists-values-b", "js-lists-values-c", "js-lists-values-project", "js-lists-values-d", "js-lists-values-e"]'
    style="overflow-y: scroll; max-height: 500px; margin: 20px;"
    >
    <table class="table mb-0 thead-border-top-0 table-nowrap" style="margin: 20px;">
        <thead>
               <tr>
                <th style="width: 150px;"><a href="javascript:void(0)"
                        class="sort" data-sort="js-lists-values-project">순번</a></th>

                <th><a href="javascript:void(0)" class="sort"
                        data-sort="js-lists-values-c">학기</a></th>
                <th><a href="javascript:void(0)" class="sort"
                        data-sort="js-lists-values-a">학년</a></th>
                <th><a href="javascript:void(0)" class="sort"
                        data-sort="js-lists-values-b">학과</a></th>
                <th><a href="javascript:void(0)" class="sort"
                        data-sort="js-lists-values-d">강의명</a></th>
                <th><a href="javascript:void(0)" class="sort"
                        data-sort="js-lists-values-e">과목명</a></th>

                <th><a href="javascript:void(0)" class="sort"
                        data-sort="js-lists-values-lead">승인여부</a></th>
                        
                <th>수정</th>
            </tr>
        </thead>
        <c:forEach items="${lectureApplList }" var="lectureAppl" varStatus="loop">
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
                                    <strong class="js-lists-values-c">${lectureAppl.subject.subSemester}</strong>
                                </p>
                            </div>
                        </div>
                    </td>

                    <td>
                        <div class="d-flex align-items-center">
                            <div class="flex d-flex flex-column">
                                <p class="mb-0">
                                    <strong class="js-lists-values-a">${lectureAppl.subject.subSchyear }</strong>
                                </p>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="d-flex align-items-center">
                            <div class="flex d-flex flex-column">
                                <p class="mb-0">
                                    <strong class="js-lists-values-b">${lectureAppl.subject.deptName}</strong>
                                </p>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="d-flex align-items-center">
                            <div class="flex d-flex flex-column">
                                <p class="mb-0">
                                    <strong class="js-lists-values-d">${lectureAppl.lolName}</strong>
                                </p>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="d-flex align-items-center">
                            <div class="flex d-flex flex-column">
                                <p class="mb-0">
                                    <strong class="js-lists-values-e">${lectureAppl.subject.subName}</strong>
                                </p>
                            </div>
                        </div>
                    </td>

                    <td>
                       <div class="d-flex flex-column">
							<small class="js-lists-values-status text-50 mb-4pt">
								${lectureAppl.status.statusNm } </small>
							${lectureAppl.reject.rejectReason } <span class="indicator-line rounded bg-warning"></span>
						</div>
                    </td>
					<td>
						<div class="d-flex flex-column">
							<small class="js-lists-values-d text-50 mb-4pt"> <c:choose>
									<c:when test="${lectureAppl.status.statusCode eq 'STA01' }">
									<a href="#" onclick="editBtn('${lectureAppl.lolAppno }')">수정하기</a>
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

<script src="<c:url value='/resources/js/paging.js'/>"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
var cPath = $('body').data('bodyCpath');

//신청 버튼 클릭 -> 신청 폼
function applbtn(memNo) {
 var url = `\${cPath}/professor/info/lecture/lectureappl/lectureApplInsertForm`;
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

//신청 폼 제출
$(document).on("submit","#lectureApplInsert", function(event){
	event.preventDefault();
	
	var formData = $('#lectureApplInsertData').serialize();
	var url = `\${cPath}/professor/info/lecture/lectureappl/lectureApplInsertForm`;
	
	var lolName = $("#lolName").val();
	var subCode = $("#subCode").val();
	var lolLimit = $("#lolLimit").val();
	var lolDaycount = $("#lolDaycount").val();
	var pmemNo = $("#pmemNo").val();

	if (!lolName || !subCode || !lolLimit || !lolDaycount || !pmemNo ||
		lolName === "" || subCode === "" || lolLimit === "" || lolDaycount === "" || pmemNo === "") {
	    Swal.fire({
	        title: '모든 항목을 입력해주세요',
	        icon: 'error'
	    });
	    return;
	}
	
	var lpAttendRef = parseInt($("#lpAttendRef").val());
	var lpTestRef = parseInt($("#lpTestRef").val());
	var lpTaskRef = parseInt($("#lpTaskRef").val());
	var sum = lpAttendRef+lpTestRef+lpTaskRef;
	if (sum !== 100) {
	    Swal.fire({
	        title: '성적 산출 비율의 합은 100이 되어야 합니다.',
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
                    location.href = `\${cPath}/professor/info/lecture/lectureappl/lectureApplList`;
                }
             });
	     },
	     error: function(xhr, status, error) {
	         console.error('Error:', error);
	     }
	 }); 
	return false;
});

//수정버튼 클릭
function editBtn(lolAppno) {
 console.log(lolAppno);
 console.log("수정하기 버튼이 클릭되었습니다.");
 var url = `\${cPath}/professor/info/lecture/lectureappl/lectureApplEditForm/\${lolAppno}`;

 $.ajax({
     url: url,
     type: 'GET',
     success: function(response) {
         $('#insertArea').empty();
         $('#editArea').html(response);
         
     },
     error: function(xhr, status, error) {
         console.error('Error retrieving:', error);
     }
 });
}
//수정 폼 제출
$(document).on("submit","#lectureApplEdit", function(event){
	event.preventDefault();
	
	var formData = $('#lectureApplEdit').serialize();
	var lolAppno = $("#lolAppno").val();
	var url = `\${cPath}/professor/info/lecture/lectureappl/lectureApplEditForm`;
	
	var lolName = $("#lolName").val();
	var subCode = $("#subCode").val();
	var lolLimit = $("#lolLimit").val();
	var lolDaycount = $("#lolDaycount").val();
	var pmemNo = $("#pmemNo").val();

	if (!lolName || !subCode || !lolLimit || !lolDaycount || !pmemNo ||
		lolName === "" || subCode === "" || lolLimit === "" || lolDaycount === "" || pmemNo === "") {
	    Swal.fire({
	        title: '모든 항목을 입력해주세요',
	        icon: 'error'
	    });
	    return;
	}
	
	var lpAttendRef = parseInt($("#lpAttendRef").val());
	var lpTestRef = parseInt($("#lpTestRef").val());
	var lpTaskRef = parseInt($("#lpTaskRef").val());
	var sum = lpAttendRef+lpTestRef+lpTaskRef;
	if (sum !== 100) {
	    Swal.fire({
	        title: '성적 산출 비율의 합은 100이 되어야 합니다.',
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
                    location.href = `\${cPath}/professor/info/lecture/lectureappl/lectureApplList`;
                }
             });
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
 
 var lolAppno = $("#lolAppno").val();
 console.log(lolAppno)
 var url = `\${cPath}/professor/info/lecture/lectureappl/del`;
 console.log(url);
 $.ajax({
     url: url,
     type: 'POST',
     data: {lolAppno : lolAppno},
     success: function(response) {
         $('#editArea').empty();
   		Swal.fire({
		      title: '신청 취소 완료',
		      icon: 'success'
	 		}).then((result) => {
                if (result.isConfirmed) {
                    location.href = `\${cPath}/professor/info/lecture/lectureappl/lectureApplList`;
                }
             });
     },
     error: function(xhr, status, error) {
         console.error('Error:', error);
     }
 });
});

	var index = 0; 
	var isFirstCall = true;
	var week = 1
function insertAddWeek() {
	  if (isFirstCall) {
	        isFirstCall = false;
	        week = 2;
	        index = 1;
	    } else {
	        week += 1; 
	        index += 1;
	    }
    console.log(week,index)
    var table = document.getElementById("insertTable");
    
    var row = table.insertRow(table.rows.length - 1); 

    var cell1 = row.insertCell(0); 
    var cell2 = row.insertCell(1); 

    cell1.innerHTML = '<th scope="row">'+week+'주차 내용</th>';
    cell2.innerHTML = '<td><input type="text" class="form-control" name="lecturePlan.lectureContent[' + index + '].lpContent" /></td>';
}

function insertRemoveLastWeek() {
    if (week > 1) {
        var table = document.getElementById("insertTable");
        table.deleteRow(table.rows.length - 2);
        index--;
        week--;
    }
}

var index = 0
var week = 0
function addWeek(weekno) {
	if(week == 0){
	    week = weekno + 1;		
	}else{
		week++;
	}
    index = week -1;
    
    var table = document.getElementById("editTable");
    var row = table.insertRow(table.rows.length - 1); 

    var cell1 = row.insertCell(0); 
    var cell2 = row.insertCell(1); 

    cell1.innerHTML = '<th scope="row">'+week+'주차 내용</th>';
    cell2.innerHTML = '<td><input type="text" class="form-control" name="lecturePlan.lectureContent[' + index + '].lpContent" /></td>';
}
function removeLastWeek() {
    if (week > 1) {
        var table = document.getElementById("editTable");
        table.deleteRow(table.rows.length - 2);
        index--;
        week--;
        console.log("remove",index,week)
    }
}

function fillFormData() {
    var lolName = "대학수학2";
    var lolLimit = "30";
    var lolDaycount = "2";
    var lpContent = "강의개요는 다음과 같습니다.";
    var lpAttendRef = "20";
    var lpTestRef = "30";
    var lpTaskRef = "50";
    var book = "대학수학2";
    
    document.getElementById("lolName").value = lolName;
    document.getElementById("lolLimit").value = lolLimit;
    document.getElementById("lolDaycount").value = lolDaycount;
    document.getElementById("lpContent").value = lpContent;
    document.getElementById("lpAttendRef").value = lpAttendRef;
    document.getElementById("lpTestRef").value = lpTestRef;
    document.getElementById("lpTaskRef").value = lpTaskRef;
    document.getElementById("book").value = book;
    
    var desiredValue = "1709-1728";

    var subjectSelectBox = document.getElementById("subCode");
    var options = subjectSelectBox.options;
    for (var i = 0; i < options.length; i++) {
        if (options[i].value === desiredValue) {
            subjectSelectBox.selectedIndex = i;
            break;
        }
    }
}
</script>