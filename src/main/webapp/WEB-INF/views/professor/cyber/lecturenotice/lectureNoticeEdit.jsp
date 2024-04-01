<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	.headText {
		font-size: 14px;
		letter-spacing: 3px;
	}
</style>
<div style="width: 100%; background-color: #FFFFFF;">
	<div style="margin-left: 10%; width: 80%;">
		<h2>${contentTitle}</h2>
	</div>
	<div style="margin-left: 10%; width: 80%;" class="page-separator"></div>
	<div style="margin-left: 10%; width: 80%; background-color: #f0f0f0;" class="headText">
		<p style="overflow-x: auto; white-space: pre-wrap; margin-left: 20px; margin-right: 20px;">
			<br> 게시판에 작성되는 본문 내용 및 첨부파일 내에 성명, 주민등록번호, 핸드폰 번호, 이메일 등 2개 이상의 개인정보 작성 시 개인정보보호법 제2조제1호에 의거 개인정보에 해당되어 작성 및 등록을 제한하고 관리자에 의해 삭제 처리될 수 있습니다. 게시판 사용에 유의하시기 바랍니다. ※ 개인정보를 위조 또는 도용, 외부에 유출한 자는 관련법에 의거 법적처벌을 받을 수 있으며, 게시 글에 포함된 개인정보 또한 책임은 게시자에게 있으며 정보 노출을 원하지 않으실 경우에는 수정 및 삭제하시기 바랍니다. (개인정보보호법 제71조에 의거 개인정보를 유출한 자는 5년 이하의 징역 또는 5천만원 이하의 벌금이 부과될 수 있습니다.) <br>
		</p>
	</div>
	<div style="margin-left: 10%; width: 80%;" class="page-separator"></div>
	<div style="margin-left: 10%; width: 80%; background-color: #FFFFFF;">
		<table style="width: 100%; border-collapse: collapse;">
			<tr>
				<td
					style="border-top: 1px solid #ddd; border-right: 1px solid #ddd; border-bottom: 1px solid #ddd; margin-top: 10px;"><label
					for="validationSample03">제목</label></td>
				<td
					style="border-top: 1px solid #ddd; border-bottom: 1px solid #ddd; margin-top: 10px;">
					<input type="text" id="lecannTitle" name="lecannTitle"
					class="form-control" value="${la.lecannTitle}">
				</td>

			</tr>
			<tr>
				<td
					style="border-right: 1px solid #ddd; border-bottom: 1px solid #ddd; margin-top: 10px;"><label
					for="validationSample03">작성자</label></td>
				<td style="border-bottom: 1px solid #ddd; margin-top: 10px;">${la.memName}</td>
			</tr>
			<tr>
				<td
					style="border-right: 1px solid #ddd; border-bottom: 1px solid #ddd; margin-top: 10px;"><label
					for="validationSample03">작성일</label></td>
				<td style="border-bottom: 1px solid #ddd; margin-top: 10px;">${la.lecannDate}</td>
			</tr>
			<!--           <tr> -->
			<!--             <td style=" border-right: 1px solid #ddd; border-bottom: 1px solid #ddd; margin-top:10px; "><label for="validationSample03">조회수</label></td> -->
			<%--             <td style=" border-bottom: 1px solid #ddd; margin-top:10px;">${la.cmntCount}</td> --%>
			<!--         </tr> -->
			<tr>
				<td
					style="margin-top: 10px; border-right: 1px solid #ddd; border-bottom: 1px solid #ddd;"><label
					for="validationSample03">첨부파일</label></td>
				<td colspan="2" style="border-bottom: 1px solid #ddd;"></td>
			</tr>
			<tr>
				<td
					style="margin-top: 10px; border-right: 1px solid #ddd; border-bottom: 1px solid #ddd;">
					<label class="form-label">내용</label>
				</td>
				<td style="margin-top: 5px; border-bottom: 1px solid #ddd;"><textarea
						id="lecannContent" name="lecannContent" class="form-control"
						style="width: 100%; height: 200px;">${la.lecannContent}</textarea></td>
			</tr>

		</table>
	</div>
	<div
		style="display: flex; justify-content: flex-end; margin-top: 10px; margin-right: 10%;">
		<button id="listBtn" class="btn btn-secondary"
			style="margin-right: 5px;" type="button">목록</button>
<button id="updateBtn" class="btn btn-primary" style="margin-right: 5px;" type="button">수정</button>
	</div>
</div>
<script>
    // 수정 버튼 클릭 시
      document.getElementById("updateBtn").addEventListener("click", function (event) {
        event.preventDefault(); // 링크의 기본 동작 방지
        var lecannTitle = document.getElementById("lecannTitle").value;
        var lecannContent = document.getElementById("lecannContent").value;
        var lecCode = "${la.lecCode}";
        var lecannNo = "${la.lecannNo}";
        console.log("프라이머리키",lecannNo);
        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath}/professor/cyber/lecturenotice/lectureNoticeEdit.do',
            data: {
                lecannNo: lecannNo,
                lecannTitle: lecannTitle,
                lecannContent: lecannContent
            },
            success: function () {
                window.location.href = '${pageContext.request.contextPath}/professor/cyber/' + lecCode + '/lectureNotice';
            },
            error: function () {
                alert('게시글 정보를 업데이트하는데 실패했습니다.');
            }
        });
    });
    

</script>
