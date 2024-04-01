<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
팝업 관리 페이지 (메인, 관리자)

<div class="table-responsive" data-toggle="lists"
    data-lists-sort-by="js-lists-values-date" data-lists-sort-desc="true"
    data-lists-values='["js-lists-values-project", "js-lists-values-title", "js-lists-values-period", 
    "js-lists-values-gfNo"]'
    style="overflow-y: auto; max-height: 400px;"
    >
    <table class="table mb-0 thead-border-top-0 table-nowrap">
        <thead>
               <tr>
                <th style="width: 150px;"><a href="javascript:void(0)"
                        class="sort" data-sort="js-lists-values-project">순번</a></th>

                <th><a href="javascript:void(0)" class="sort"
                        data-sort="js-lists-values-title">제목</a></th>
                <th><a href="javascript:void(0)" class="sort"
                        data-sort="js-lists-values-period">기간</a></th>
                <th><a href="javascript:void(0)" class="sort"
                        data-sort="js-lists-values-gfNo">파일</a></th>
                <th>수정</th>
            </tr>
        </thead>
        <c:forEach items="${popupList }" var="popup" varStatus="loop">
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
                                    <strong class="js-lists-values-title">${popup.popupTitle}</strong>
                                </p>
                            </div>
                        </div>
                    </td>

                    <td>
                        <div class="d-flex align-items-center">
                            <div class="flex d-flex flex-column">
                                <p class="mb-0">
                                    <strong class="js-lists-values-period">
                                    	${fn:substring(popup.popupPeriod, 0, 10)}
									</strong>
                                </p>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="d-flex align-items-center">
                            <div class="flex d-flex flex-column">
                                <p class="mb-0">
                                    <strong class="js-lists-values-gfNo">
<c:choose>
    <c:when test="${not empty popup.fileList}">
        <c:forEach items="${popup.fileList}" var="file">
            <a href="#" data-gf-no="${file.gfNo}" data-file-no="${file.fileNo}" class="fileObj">
                ${file.fileNm}
            </a>
        </c:forEach>
    </c:when>
    <c:otherwise>
        파일없음
    </c:otherwise>
</c:choose>
									</strong>
                                </p>
                            </div>
                        </div>
                    </td>
                <td>
                <div class="d-flex align-items-center">
                         <div class="flex d-flex flex-column">
                             <p class="mb-0">
           						<a href="#" onclick="editBtn('${popup.popupCode }')">수정하기</a>
                             </p>
                         </div>
                     </div>
                    </td>
                </tr>
            </tbody>
        </c:forEach>
    </table>
</div>
    <button class="btn btn-primary float-right" onclick="applbtn()">추가하기</button>
<div id="editArea"></div>
<div id="insertArea"></div>

<script src="<c:url value='/resources/js/paging.js'/>"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
var cPath = $('body').data('bodyCpath');
var deletefilesData = [];

//신청 버튼 클릭 -> 신청 폼
function applbtn() {
 var url = `\${cPath}/manager/com/popup/mainpopup/popupInsertForm`;
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
$(document).on("submit","#popupInsert", function(event){
	event.preventDefault();
	
	var formData = new FormData(popupInsert);
	var url = `\${cPath}/manager/com/popup/mainpopup/popupInsertForm`;
	
	var popupTitle = $("#popupTitle").val();
	var popupPeriod = $("#popupPeriod").val();
	var popFiles = $("#popFiles").val();

	if (!popupTitle || !popupPeriod || !popFiles || popupTitle === "" || popupPeriod === "" || popFiles === "") {
	    Swal.fire({
	        title: '모든 항목을 입력해주세요',
	        icon: 'error'
	    });
	    return;
	}
	  $.ajax({
	     url: url,
	     type: 'POST',
	     processData : false, // 직렬화 방지
	     contentType : false, // 멀티파트 사용하기 위함
	     data: formData,
	     success: function(response) {
	         $('#insertArea').empty();
		    Swal.fire({
		      title: '팝업등록 완료',
		      icon: 'success'
   	 		}).then((result) => {
                if (result.isConfirmed) {
                    location.href = `\${cPath}/manager/com/popup/mainpopup/mainPopup`;
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
function editBtn(popupCode) {
 console.log(popupCode);
 console.log("수정하기 버튼이 클릭되었습니다.");
 var url = `\${cPath}/manager/com/popup/mainpopup/popupEditForm/\${popupCode}`;

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
$(document).on("submit","#popupEdit", function(event){
	event.preventDefault();
	
	var formData = new FormData(popupEdit);
	var url = `\${cPath}/manager/com/popup/mainpopup/popupEditForm`;
	
	var popupTitle = $("#popupTitle").val();
	var popupPeriod = $("#popupPeriod").val();
	var popFiles = $("#popFiles").val();

	if (!popupTitle || !popupPeriod || !popFiles || popupTitle === "" || popupPeriod === "" || popFiles === "") {
	    Swal.fire({
	        title: '모든 항목을 입력해주세요',
	        icon: 'error'
	    });
	    return;
	}
	
	  $.ajax({
	     url: url,
	     type: 'POST',
	     processData : false, // 직렬화 방지
	     contentType : false, // 멀티파트 사용하기 위함
	     data: formData,
	     success: function(response) {
	         $('#editArea').empty();
 	 	Swal.fire({
		      title: '팝업 수정 완료',
		      icon: 'success'
	 		}).then((result) => {
                if (result.isConfirmed) {
                    location.href = `\${cPath}/manager/com/popup/mainpopup/mainPopup`;
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
 
 var popupCode = $("#popupCode").val();
 var url = `\${cPath}/manager/com/popup/mainpopup/del`;
 $.ajax({
     url: url,
     type: 'POST',
     data: {popupCode : popupCode},
     success: function(response) {
         $('#editArea').empty();
   		Swal.fire({
		      title: '팝업 삭제 완료',
		      icon: 'success'
	 		}).then((result) => {
                if (result.isConfirmed) {
                    location.href = `\${cPath}/manager/com/popup/mainpopup/mainPopup`;
                }
             });
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