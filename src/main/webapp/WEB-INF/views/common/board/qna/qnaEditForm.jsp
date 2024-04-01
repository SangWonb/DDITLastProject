<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div style="width: 100%; background-color: #FFFFFF;">
<form id="editData" method="POST">
	<div style="margin-left: 10%; width: 80%;">
	<h2>자유게시판</h2>
	</div>
	<div style="margin-left: 10%; width: 80%;" class="page-separator"></div>

	<div style="margin-left: 10%; width: 80%; background-color: #f0f0f0;">
		<p style="overflow-x: auto; white-space: pre-wrap; margin-left: 20px; margin-right: 20px;">
			<br>게시판에 작성되는 본문 내용 및 첨부파일 내에 성명, 주민등록번호, 핸드폰 번호, 이메일 등 2개 이상의 개인정보 작성 시 개인정보보호법 제2조제1호에 의거 개인정보에 해당되어 작성 및 등록을 제한하고 관리자에 의해 삭제 처리될 수 있습니다. 게시판 사용에 유의하시기 바랍니다. <br>※ 개인정보를 위조 또는 도용, 외부에 유출한 자는 관련법에 의거 법적 처벌을 받을 수 있으며, 게시 글에 포함된 개인정보 또한 책임은 게시자에게 있으며 정보 노출을 원하지 않으실 경우에는 수정 및 삭제하시기 바랍니다. (개인정보보호법 제71조에 의거 개인정보를 유출한 자는 5년 이하의 징역 또는 5천만원 이하의 벌금이 부과될 수 있습니다.) <br>
		</p>
	</div>
	<div style="margin-left: 10%; width: 80%;" class="page-separator"></div>
	<div style="margin-left: 10%; width: 80%; background-color: #FFFFFF;">
		<table style="width: 100%; border-collapse: collapse;">
			<tr>
				<td style="border-top: 1px solid #ddd; border-right: 1px solid #ddd; border-bottom: 1px solid #ddd; margin-top: 10px;">
				<label for="validationSample03">제목</label></td>
				<td style="border-top: 1px solid #ddd; border-bottom: 1px solid #ddd; margin-top: 10px;">
					<input type="text" id="cmntTitle" name="cmntTitle" class="form-control" value="${com.cmntTitle }">
				</td>

			</tr>
			<tr>
				<td>
					<input style="display: none;" name="cmntCode" value="${com.cmntCode }"/>
<%-- 					<input style="display: none;" name="cmntTitle" value="${com.cmntTitle }"/> --%>
<%-- 					<input style="display: none;" name="cmntContent" value="${com.cmntContent }"/> --%>
					<input style="display: none;" name="gfNo" value="${com.gfNo }"/>
				</td>
			</tr>
			<tr>
				<td style="border-right: 1px solid #ddd; border-bottom: 1px solid #ddd; margin-top: 10px;">
					<label for="validationSample03">작성자</label>
				</td>
				<td style="border-bottom: 1px solid #ddd; margin-top: 10px;">${com.memName }</td>
			</tr>
			<tr>
				<td
					style="border-right: 1px solid #ddd; border-bottom: 1px solid #ddd; margin-top: 10px;"><label
					for="validationSample03">작성일</label></td>
				<td style="border-bottom: 1px solid #ddd; margin-top: 10px;">${com.cmntDate }</td>
			</tr>
			<tr>
				<td style="margin-top: 10px; border-right: 1px solid #ddd; border-bottom: 1px solid #ddd;">
				<label for="fileUpload">파일 업로드</label>
				</td>
				<td>
		        <input type="file" class="form-control-file" id="coFiles" name="coFiles" />
		        <small id="fileHelp" class="form-text text-muted">파일을 선택하지 않으면 기존의 파일도 삭제됩니다.</small>
		        <c:forEach items="${com.fileList}" var="file">
		             기존에 선택된 파일 : 
		            <a href="#" data-gf-no="${file.gfNo}" data-file-no="${file.fileNo}" class="fileObj">
		          	${file.fileNm }
		          	</a> 
		         </c:forEach>
		         </td>
			</tr>
			<tr>
					<td
						style="margin-top: 10px; border-right: 1px solid #ddd; border-bottom: 1px solid #ddd;"><label
						class="form-label">내용</label></td>
		
					<td style="margin-top: 5px; border-bottom: 1px solid #ddd;">
						<div style="height: 300px;" data-toggle="quill"></div>
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
<script src="<c:url value='/resources/vendor/moment.min.js' />"></script>
<script src="<c:url value='/resources/vendor/daterangepicker.js' />"></script>
<script src="<c:url value='/resources/js/daterangepicker.js' />"></script>
<script src="<c:url value='/resources/vendor/quill.min.js' />"></script>
<script src="<c:url value='/resources/js/quill.js' />"></script>
<script src="<c:url value='/resources/vendor/select2/select2.min.js' />"></script>
<script src="<c:url value='/resources/js/select2.js' />"></script>

<script>
document.getElementById("listBtn").addEventListener("click", function (event) {
	window.location.href = 'http://localhost/lcms/common/board/qna/qnaList';
	
});

// 수정 버튼 클릭 시
document.getElementById("updateBtn").addEventListener("click", function (event) {
    event.preventDefault();
	var $form = $('#editData');
	var formData = new FormData($form[0]);
	var cmntContent = quill.getText();
	formData.append('cmntContent',cmntContent);
	console.log("폼데이터 :",formData);
	
	
	
   $.ajax({
       url: '${pageContext.request.contextPath}/common/board/qna/updateForm.do',
       type: 'POST',
       data: formData,
       processData: false,
       contentType: false,
       success: function () {
    	   console.log("asdasd")
           window.location.href = '${pageContext.request.contextPath}/common/board/qna/qnaList';
       },
       error: function () {
           alert('게시글 정보를 업데이트하는데 실패했습니다.');
	     }
	 }); 
	return false;
});


var quillContainer = document.querySelector('[data-toggle="quill"]');
var oldCmntContent = '${com.cmntContent}';
quillContainer.innerHTML = oldCmntContent;
var quill = new Quill(quillContainer);
console.log("quill Content", quill.getContents())
console.log("quill text", quill.getText())

</script>
