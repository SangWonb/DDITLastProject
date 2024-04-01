<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div style="width:100%; background-color: #FFFFFF;" >
<div style="margin-left:10%; width:80%;">
	<h2>${contentTitle}</h2>
</div>
<div style="margin-left:10%; width:80%;" class="page-separator" ></div>
<div style="margin-left:10%; width:80%; background-color: #f0f0f0;">
		<p style="overflow-x: auto; white-space: pre-wrap; margin-left: 20px; margin-right: 20px;">
			<br> 게시판에 작성되는 본문 내용 및 첨부파일 내에 성명, 주민등록번호, 핸드폰 번호, 이메일 등 2개 이상의 개인정보 작성 시 개인정보보호법 제2조제1호에 의거 개인정보에 해당되어 작성 및 등록을 제한하고 관리자에 의해 삭제 처리될 수 있습니다. 게시판 사용에 유의하시기 바랍니다. ※ 개인정보를 위조 또는 도용, 외부에 유출한 자는 관련법에 의거 법적 처벌을 받을 수 있으며, 게시 글에 포함된 개인정보 또한 책임은 게시자에게 있으며 정보 노출을 원하지 않으실 경우에는 수정 및 삭제하시기 바랍니다. (개인정보보호법 제71조에 의거 개인정보를 유출한 자는 5년 이하의 징역 또는 5천만원 이하의 벌금이 부과될 수 있습니다.) <br>
		</p>
</p>
</div>
<div style="margin-left:10%; width:80%;" class="page-separator"></div>
<div  style="margin-left:10%; width:80%; background-color: #FFFFFF;" >
    <table style="width:100%; border-collapse: collapse; ">
        <tr>
            <td style="width:100px; border-top: 1px solid #ddd; border-right: 1px solid #ddd; border-bottom: 1px solid #ddd; margin-top:10px; "><label for="validationSample03">제목</label></td>
            <td style="border-top: 1px solid #ddd; border-bottom: 1px solid #ddd; margin-top:10px;">${b.cmntTitle}</td>
        </tr>
        <tr>
            <td style="width:100px; border-right: 1px solid #ddd; border-bottom: 1px solid #ddd; margin-top:10px; "><label for="validationSample03">작성자</label></td>
            <td style=" border-bottom: 1px solid #ddd; margin-top:10px;">${b.memName}</td>
        </tr>
         <tr>
            <td style="width:100px; border-right: 1px solid #ddd; border-bottom: 1px solid #ddd; margin-top:10px; "><label for="validationSample03">작성일</label></td>
            <td style=" border-bottom: 1px solid #ddd; margin-top:10px;">${b.cmntDate}</td>
        </tr>
          <tr>
            <td style="width:100px; border-right: 1px solid #ddd; border-bottom: 1px solid #ddd; margin-top:10px; "><label for="validationSample03">조회수</label></td>
            <td style=" border-bottom: 1px solid #ddd; margin-top:10px;">${b.cmntCount}</td>
        </tr>
     <tr>
    <td style="width:100px; margin-top:10px; border-right: 1px solid #ddd; border-bottom: 1px solid #ddd;">
        <label for="validationSample03">첨부파일</label>
    </td>
    <td colspan="2" style="border-bottom: 1px solid #ddd;">
        <c:choose>
            <c:when test="${not empty b.fileList}">
                <c:forEach items="${b.fileList}" var="file">
                    <a href="#" data-gf-no="${file.gfNo}" data-file-no="${file.fileNo}" class="fileObj">${file.fileNm}</a>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <span>첨부파일이 없습니다.</span>
            </c:otherwise>
        </c:choose>
    </td>
</tr>

    <tr style="height: 300px;">
    <td style=" width:100px;margin-top: 10px; border-right: 1px solid #ddd; border-bottom: 1px solid #ddd;"><label class="form-label">내용</label></td>
    <td style="margin-top: 10px; border-bottom: 1px solid #ddd; vertical-align: middle;">
        ${b.cmntContent}
    </td>
</tr>
    </table>
</div>
<div style="display: flex; justify-content: flex-end; margin-top:10px; margin-right:10%;">
    <button id="listBtn" class="btn btn-secondary" style="margin-right:5px;" type="button">목록</button>
    <a id="reply" href="#" class="btn btn-outline-primary mr-2" onclick="openReplyForm('${b.cmntCode}')">답글쓰기</a>
    <button id="modiBtn" class="btn btn-primary" style="margin-right:5px;" type="button">수정</button>
    <button id="deleteBtn" class="btn btn-secondary" type="button">삭제</button>
</div>
</div>
<script>
$('#listBtn').on('click',function(){
	window.location.href = 'http://localhost/lcms/common/complaint/complaintList';
});

document.getElementById("deleteBtn").addEventListener("click", function() {
    if (confirm("정말로 삭제하시겠습니까?")) {
       var urlParams = new URLSearchParams(window.location.search);
       var cmntCode = urlParams.get('cmntCode');
       window.location.href = `<c:url value="/common/board/complaint/delete/\${cmntCode}"/>`;
    } else {
       alert("삭제가 취소되었습니다.");
    }
 });
 
document.getElementById("modiBtn").addEventListener("click",function(event) {
	var urlParams = new URLSearchParams(window.location.search);
	var cmntCode = urlParams.get('cmntCode');
	window.location.href = `<c:url value="/common/board/complaint/updateForm/\${cmntCode}"/>`; //@PV
});

// document.getElementById("modiBtn").addEventListener("click", function(event) {
//     var urlParams = new URLSearchParams(window.location.search);
//     var cmntCode = urlParams.get('cmntCode');
//     var url = "${pageContext.request.contextPath}/common/board/freeboard/updateForm/" + cmntCode;
//     window.location.href = url;
// });


var cPath = "${pageContext.request.contextPath}";
console.log("주소", cPath);

function fn_downloadFile(fileNo) {
   let hiddenA = document.createElement("a");
   hiddenA.href = cPath + "/download/single?fileNo=" + fileNo;
   ;
   hiddenA.click();
   hiddenA.remove();
}

$(document).on("click", ".fileObj", function(event) {
   var clickedElement = $(event.currentTarget);
   var gfNo = clickedElement.data("gfNo");
   var fileNo = clickedElement.data("fileNo");
   fn_downloadFile(fileNo);
});

function openReplyForm(cmntCode) {
	var url = "${pageContext.request.contextPath}/common/board/complaint/cpForm?parentCmntCode=" + cmntCode;
    window.location.href = url;
}

</script>