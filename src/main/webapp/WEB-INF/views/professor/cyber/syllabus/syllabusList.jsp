<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
강의 계획서 조회/등록/수정/삭제 페이지 (교수)
<div class="container">
    <c:if test="${not empty syllabusList}">
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead class="table-light">
                    <tr>
                        <th>순번</th>
                        <th>강의명</th>
                        <th>년도</th>
                        <th>학년</th>
                        <th>학기</th>
                        <th>이수구분</th>
                        <th>강의교재</th>
                        <th>강의계획서</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="syllabus" items="${syllabusList}" varStatus="status">
                        <tr>
                            <td>${syllabus.rnum}//${syllabus.lecCode}</td>
                            <td>${syllabus.subName}</td>
                            <td>${syllabus.lpContent}</td>
                            <td>${syllabus.lpAttendRef}</td>
                            <td>${syllabus.lpTestRef}</td>
                            <td>${syllabus.lpTaskRef}</td>
<%--                             <td>${syllabus.lpNote}</td> --%>
<%--                             <td>${syllabus.lpScore}</td> --%>
                            <td>${syllabus.lpBook}</td>
                            <td>
<button type="button" class="btn btn-primary syllabusDetailBtn" data-lecCode="${syllabus.lecCode}" style="font-size: smaller; padding: 5px;">
상세보기
</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
           ${pagingHTML }
        </div>
    </c:if>
    <c:if test="${empty syllabusList}">
        <p>강의가 없습니다.</p>
    </c:if>
   
<div class="container">
    <div id="syllabusDetailArea" style="display: none;">
    </div>
</div>
</div>

<form id="submitForm" action="" style="display: none;">
	<input type="text" name="page"/>
</form>
<script src="<c:url value='/resources/js/paging.js'/>"></script>    
<script>
var cPath = $('body').data('bodyCpath')
$('.syllabusDetailBtn').click(function() {
	var lecCode = $(this).data('lecCode');
	console.log(lecCode);
    $.ajax({
        url: `\${cPath}/professor/cyber/syllabus/syllabusDetail/\${lecCode}`,
        type: 'GET',
        success: function(response) {
        	let parser = new DOMParser();
			let newDoc = parser.parseFromString(response, "text/html");
			let preTag = newDoc.getElementById('syllabusDetail')
            $('#syllabusDetailArea').html(preTag).toggle(); 
        },
        error: function(xhr, status, error) {
            console.error('Error retrieving syllabus:', error);
        }
    });
});
var cPath = $('body').data('bodyCpath')
$(document).ready(function () {
    // 수정 버튼에 클릭 이벤트 핸들러 등록
    $('#editButton').click(function () {
        var lpCode = $(this).data('lecCode'); // 수정 버튼의 lpCode 속성값 가져오기
        console.log(lpCode);

        // lpCode를 이용하여 Ajax로 수정 폼을 로드
        $.ajax({
            url: `\${cPath}/professor/cyber/syllabus/syllabusEditForm/\${lpCode}`,
            type: 'GET',
            success: function (response) {
            	let parser = new DOMParser();
    			let newDoc = parser.parseFromString(response, "text/html");
    			let preTag = newDoc.getElementById('layout-content')
    			
                $('#editForm').html(preTag).toggle();
    			
                $('#editForm').html(response); // 수정 폼을 editFormContainer에 추가
                $('#syllabusDetail').hide(); // 상세보기 영역 숨기기
                $('#editForm').show(); // 수정 폼 보이기
            },
            error: function (xhr, status, error) {
                console.error('Error loading edit form:', error);
            }
        });
    });
});

$(document).ready(function () {
    $('#editForm').submit(function (e) {
        e.preventDefault();
        $.ajax({
            type: 'POST',
            url: '', // 수정이 완료되는 URL로 변경해야 함
            data: $(this).serialize(),
            success: function (response) {
                $('#editResult').html('<div class="alert alert-success">수정이 완료되었습니다.</div>');
            },
            error: function (xhr, status, error) {
                $('#editResult').html('<div class="alert alert-danger">수정 중 오류가 발생했습니다.</div>');
            }
        });
    });
});
function loadSyllabusDetails(lpCd) {
	
    $.ajax({
        type: "GET",
        url: `\${cPath}/professor/cyber/syllabus/syllabusEditForm/\${lpCode}`,
        data: { lpCd: lpCd },
    })
    .done(function(response) {
        $('#syllabusDetails').html(response);
    })
    .fail(function(xhr, status, error) {
        console.error("An error occurred while loading syllabus details:", error);
    });
}
</script>