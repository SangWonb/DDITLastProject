<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<style>
#userAutoInsertSpace{
	width: 100%;
	height: 600px;
	max-height: 1000px;
}
#userAutoInsertFile{
	width: 100%;
	height: 100px;
	background: LightBlue;
	border-radius: 15px;
	padding: 20px;
	display: flex;
	justify-content: space-between; /* 내부 요소 사이의 간격을 조정합니다. */
	align-items: center; /* 내부 요소를 수직으로 정렬합니다. */
}
#uploadForm{
	width: 100%;
	display: flex;
}
#excelFile{
	width: 100%;
	background-color: white;
	border-radius: 5px;
	border: solid gray 3px;
}

</style>
<div id="userAutoInsertSpace">
	<div id="userAutoInsert">
		<div style="margin-bottom: 10px; display: flex;">
			<div style="margin-right: 10px;"><a href="javascript:fn_downloadFile('00_EXCEL_01');" class="btn btn-success">엑셀양식(학생)</a></div>
			<div style="margin-right: 10px;"><a href="javascript:fn_downloadFile('00_EXCEL_02');" class="btn btn-success">엑셀양식(교수)</a></div>
			<div><a href="javascript:fn_downloadFile('00_EXCEL_03');" class="btn btn-success">엑셀양식(교직원)</a></div>
		</div>
		<div id="userAutoInsertFile">
			<form id="uploadForm" method="post" enctype="multipart/form-data">
				<div style="display: flex; flex-direction: column; width: 50%;">
					<span style="font-size: 15px; font-weight: 800;">파일선택하기</span>
					<input type="file" name="uploadFile" id="excelFile" required="required"/>			
				</div>
				<div style="width: 50%; text-align: right;">
					<button type="submit" class="btn btn-primary">등록하기</button>
				</div>
			</form>
		</div>
	</div>
	
	<div id="userInsertResult">
	</div>
	
	<div id="userFailReason">
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
	const cpath = $("body").data("bodyCpath");
	$("#uploadForm").on("submit", function(event){
		event.preventDefault();
			
		var $form = $(uploadForm);
		var formData = new FormData($form[0]);
		let url = window.location.pathname;

		$.ajax({
		    url: url,
		    method: 'POST',
		    data: formData,
		    processData: false, // 필수: processData를 false로 설정하여 FormData를 직렬화하지 않음
		    contentType: false, // 필수: contentType을 false로 설정하여 기본 타입을 지정하지 않음
		    success: function(response) {
				
				console.log(response.success);
			
				if(response.success){
					Swal.fire({
				      title: '성공',
				      text: '등록되었습니다.',
				      icon: 'success'
				    });
				}else{
					Swal.fire({
				      title: '실패',
				      text: response.message,
				      icon: 'error'
				    });
				}
				
		    },
		    error: function(xhr, status, error) {
		        // 에러 처리 코드
		    }
		});

	});
	
	//파일 다운로드
	function fn_downloadFile(fileNo){
		let hiddenA = document.createElement("a");
		hiddenA.href = cpath + "/download/single?fileNo=" + fileNo;
		hiddenA.click();
		hiddenA.remove();
	}	
	
</script>