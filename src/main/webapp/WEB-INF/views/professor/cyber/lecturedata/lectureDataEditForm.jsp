<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div style="width: 100%; background-color: #FFFFFF;">
<form id="editData" method="POST">
	<div style="margin-left: 10%; width: 80%;">
	</div>
	<div style="margin-left: 10%; width: 80%;" class="page-separator"></div>
	<div style="margin-left: 10%; width: 80%; background-color: #f0f0f0;">
		<p style="overflow-x: auto; white-space: pre-wrap;">
			<br>  <br>
		</p>
	</div>
	<div style="margin-left: 10%; width: 80%;" class="page-separator"></div>
	<div style="margin-left: 10%; width: 80%; background-color: #FFFFFF;">
		<table style="width: 100%; border-collapse: collapse;">
			<tr>
				<td style="border-top: 1px solid #ddd; border-right: 1px solid #ddd; border-bottom: 1px solid #ddd; margin-top: 10px;">
				<label for="validationSample03">제목</label></td>
				<td style="border-top: 1px solid #ddd; border-bottom: 1px solid #ddd; margin-top: 10px;">
					<input type="text" id="lecannTitle" name="lecDataname" class="form-control" value="${data.lecDataname }">
				</td>

			</tr>
			<tr>
				<td>
					<input style="display: none;" name="lecCode" value="${data.lecCode }"/>
					<input style="display: none;" name="lecDatano" value="${data.lecDatano }"/>
					<input style="display: none;" name="gfNo" value="${data.gfNo }"/>
				</td>
			</tr>
			<tr>
				<td style="border-right: 1px solid #ddd; border-bottom: 1px solid #ddd; margin-top: 10px;">
					<label for="validationSample03">작성자</label>
				</td>
				<td style="border-bottom: 1px solid #ddd; margin-top: 10px;">${data.memName }</td>
			</tr>
			<tr>
				<td
					style="border-right: 1px solid #ddd; border-bottom: 1px solid #ddd; margin-top: 10px;"><label
					for="validationSample03">작성일</label></td>
				<td style="border-bottom: 1px solid #ddd; margin-top: 10px;">${data.lecDate }</td>
			</tr>
			<tr>
				<td style="margin-top: 10px; border-right: 1px solid #ddd; border-bottom: 1px solid #ddd;">
				<label for="fileUpload">파일 업로드</label>
				</td>
				<td>
		        <input type="file" class="form-control-file" id="daFiles" name="daFiles" />
		        <small id="fileHelp" class="form-text text-muted">파일을 선택하지 않으면 기존의 파일도 삭제됩니다.</small>
		        <c:forEach items="${data.fileList}" var="file">
		             기존에 선택된 파일 : 
		            <a href="#" data-gf-no="${file.gfNo}" data-file-no="${file.fileNo}" class="fileObj">
		          	${file.fileNm }
		          	</a> 
		         </c:forEach>
		         </td>
			</tr>
			<tr>
				<td style="margin-top: 10px; border-right: 1px solid #ddd; border-bottom: 1px solid #ddd;">
					<label class="form-label">내용</label>
				</td>
				<td style="margin-top: 5px; border-bottom: 1px solid #ddd;">
				<textarea id="lecannContent" name="lecDatacontent" class="form-control" style="width: 100%; height: 200px;">${data.lecDatacontent }</textarea>
				</td>
			</tr>

		</table>
	</div>
	</form>
	<div style="display: flex; justify-content: flex-end; margin-top: 10px; margin-right: 10%;">
		<button id="listBtn" class="btn btn-secondary" style="margin-right: 5px;" type="button">목록</button>
		<button id="updateBtn" class="btn btn-primary" style="margin-right: 5px;" type="button">수정</button>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
// 수정 버튼 클릭 시
document.getElementById("updateBtn").addEventListener("click", function (event) {
    event.preventDefault();
	var $form = $('#editData');
	var formData = new FormData($form[0]);
	
   $.ajax({
       url: '${pageContext.request.contextPath}/professor/cyber/lectureDataEditForm',
       type: 'POST',
       data: formData,
       processData: false,
       contentType: false,
       success: function () {
 		    Swal.fire({
 	   		      title: '강의자료 수정 완료',
 	   		      icon: 'success'
 	   	 		}).then((result) => {
 	                if (result.isConfirmed) {
 	                    location.href = '${pageContext.request.contextPath}/professor/cyber/${data.lecCode}/lectureDataList';
 	                }
 	             });
       },
       error: function () {
    	   Swal.fire({
	   		      title: '강의자료 수정 실패',
	   		      icon: 'error'
	   	 		});
	     }
	 }); 
	return false;
});

</script>
<script src="<c:url value='/resources/vendor/moment.min.js' />"></script>
<script src="<c:url value='/resources/vendor/daterangepicker.js' />"></script>
<script src="<c:url value='/resources/js/daterangepicker.js' />"></script>
<script src="<c:url value='/resources/vendor/quill.min.js' />"></script>
<script src="<c:url value='/resources/js/quill.js' />"></script>
<script src="<c:url value='/resources/vendor/select2/select2.min.js' />"></script>
<script src="<c:url value='/resources/js/select2.js' />"></script>