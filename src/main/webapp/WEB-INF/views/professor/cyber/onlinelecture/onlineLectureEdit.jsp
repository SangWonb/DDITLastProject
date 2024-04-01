<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<form id="update">
   <input type="hidden" name="lecoCode" id="lecoCode"  value="${lec.lecoCode }"> 
      <input type="hidden" name="lecCode" id="lecoCode" value="${lec.lecCode }">
<div style="width: 100%; background-color: #FFFFFF;">
	<div style="margin-left: 10%; width: 80%;">
		<h2>${contentTitle}</h2>
	</div>
	<div style="margin-left: 10%; width: 80%;" class="page-separator"></div>
	<div style="margin-left: 10%; width: 80%; background-color: #f0f0f0;">
		<p style="overflow-x: auto; white-space: pre-wrap;">
			<br> 게시판에 작성되는 본문 내용 및 첨부파일 내에 성명, 주민등록번호, 핸드폰 번호, 이메일 등 2개 이상의
			개인정보 작성 시 개인정보보호법 제2조제1호에 의거 개인정보에 해당되어 작성 및 등록을 제한하고 관리자에 의해 삭제 처리될
			수 있습니다. 게시판 사용에 유의하시기 바랍니다. ※ 개인정보를 위조 또는 도용, 외부에 유출한 자는 관련법에 의거 법적
			처벌을 받을 수 있으며, 게시 글에 포함된 개인정보 또한 책임은 게시자에게 있으며 정보 노출을 원하지 않으실 경우에는 수정
			및 삭제하시기 바랍니다. (개인정보보호법 제71조에 의거 개인정보를 유출한 자는 5년 이하의 징역 또는 5천만원 이하의
			벌금이 부과될 수 있습니다.) <br>
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
					<input type="text" id="lecoTitle" name="lecoTitle"
					class="form-control" value="${lec.lecoTitle}">
				</td>

			</tr>
			<tr>
				<td
					style="border-right: 1px solid #ddd; border-bottom: 1px solid #ddd; margin-top: 10px;"><label
					for="validationSample03">작성자</label></td>
				<td style="border-bottom: 1px solid #ddd; margin-top: 10px;">${lec.memName}</td>
			</tr>
			<tr>
				<td
					style="border-right: 1px solid #ddd; border-bottom: 1px solid #ddd; margin-top: 10px;"><label
					for="validationSample03">작성일</label></td>
				<td style="border-bottom: 1px solid #ddd; margin-top: 10px;">${lec.lecoDate}</td>
			</tr>
			<!--           <tr> -->
			<!--             <td style=" border-right: 1px solid #ddd; border-bottom: 1px solid #ddd; margin-top:10px; "><label for="validationSample03">조회수</label></td> -->
			<%--             <td style=" border-bottom: 1px solid #ddd; margin-top:10px;">${la.cmntCount}</td> --%>
			<!--         </tr> -->
			<tr>
				<td
						style="margin-top: 10px; border-right: 1px solid #ddd; border-bottom: 1px solid #ddd;"><label
						for="validationSample03">첨부파일</label></td>
					  <td colspan="2" style="border-bottom: 1px solid #ddd;">
					  <div class="custom-file" style="display: flex; margin-top: 10px;">
							<input type="file" id="lecFiles" class="custom-file-input"
								style="width: 50%;" name="lecFiles" >
							<button type="button" id="plusFiles" class="btn"
								style="border: none; outline: none;" >
								<svg data-v-134867f8="" aria-hidden="true" focusable="false"
									data-prefix="fas" data-icon="plus" role="img"
									xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"
									class="svg-inline--fa fa-plus fa-w-14" style="width: 11px;">
		            <path data-v-134867f8="" fill="currentColor"
										d="M416 208H272V64c0-17.67-14.33-32-32-32h-32c-17.67 0-32 14.33-32 32v144H32c-17.67 0-32 14.33-32 32v32c0 17.67 14.33 32 32 32h144v144c0 17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32V304h144c17.67 0 32-14.33 32-32v-32c0-17.67-14.33-32-32-32z"
										class=""></path>
						
		        </svg>
		        	
							</button>
						</div><c:forEach
                     items="${lec.fileList}" var="file">
                     <a href="#" data-gf-no="${file.gfNo}" data-file-no="${file.fileNo}" class="fileObj">${file.fileNm}</a>
                  </c:forEach></td>
					
						
				</tr>
				<tr>
					<td
						style="margin-top: 10px; border-right: 1px solid #ddd; border-bottom: 1px solid #ddd;"><label
						class="form-label">내용</label></td>
					<td style="margin-top: 5px; border-bottom: 1px solid #ddd;">
						<textArea
						 class="form-control" 
						style="width: 100%; height: 300px" placeholder="" name = "lecoContent" ></textArea>
					</td>
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
</form>
<script>
$('#listBtn').on('click',function(){
	window.location.href = 'http://localhost/lcms/professor/cyber/onlinelecture/onlineLectureList/${lec.lecCode}';
});
$('#plusFiles')
.on(
		'click',
		function() {
			var fileNow = $(this).parent().nextAll('.custom-file').length;
			if (fileNow < 2) {
				var fileInput = $('<input type="file" id="file" class="custom-file-input" style="width: 50%;" name="laFiles">');
				var label = $('<label for="file" class="custom-file-label" style="width: 50%;">선택된 파일 없음</label>');
				var customFileDiv = $(
						'<div class="custom-file" style="display: flex; margin-top:10px;"></div>')
						.append(fileInput).append(label);
				$(this).parent().after(customFileDiv);
			} else {
				alert("최대 개수를 초과하여 추가할 수 없습니다.");
			}

		});
		
		
    // 수정 버튼 클릭 시
//       document.getElementById("updateBtn").addEventListener("click", function (event) {
//         event.preventDefault(); // 링크의 기본 동작 방지
//         var lecannTitle = document.getElementById("lecoTitle").value;
//         var lecannContent = document.getElementById("lecoContent").value;
//         var lecCode = "${lec.lecCode}";
//         var lecoCode = "${lec.lecoCode}";
//         var lecFiles = "${lec.lecFiles}";
//         console.log("프라이머리키",lecoCode);
//         $.ajax({
//             type: 'POST',
//             url: '${pageContext.request.contextPath}/professor/cyber/onlinelecture/onlineLectureEdit.do',
//             processData : false, // 필수: processData를 false로 설정하여 FormData를 직렬화하지 않음
// 			contentType : false, // 필수: contentType을 false로 설정하여 기본 타입을 지정하지 않음
//             data: {
//                 lecoCode: lecoCode,
//                 lecoTitle: lecoTitle,
//                 lecoContent: lecoContent,
//                 lecFiles : lecFiles
//             },
//             success: function () {
//                 window.location.href = '${pageContext.request.contextPath}/professor/cyber/onlinelecture/onlineLectureList'+lecCode;
//             },
//             error: function () {
//                 alert('게시글 정보를 업데이트하는데 실패했습니다.');
//             }
//         });
//     });
    
  	document
	.getElementById('updateBtn').addEventListener('click',function(event) {
				event.preventDefault();
				var $form = $('#update');
				var formData = new FormData($form[0]);
				console.log("동영상",formData);
				$.ajax({
							type : "POST",
							url : '${pageContext.request.contextPath}/professor/cyber/onlinelecture/onlineLectureEdit.do',
							data : formData,
							processData : false, // 필수: processData를 false로 설정하여 FormData를 직렬화하지 않음
							contentType : false, // 필수: contentType을 false로 설정하여 기본 타입을 지정하지 않음
							success : function(response) {
								console.log(response);
								alert("등록이 완료되었습니다.");
								window.location.href = 'http://localhost/lcms/professor/cyber/onlinelecture/onlineLectureList/${lec.lecCode}';
							},
							error : function(xhr, status, error) {
								console.error(error);
								alert("등록에 실패했습니다.");
							}
						});
			});
    

</script>
