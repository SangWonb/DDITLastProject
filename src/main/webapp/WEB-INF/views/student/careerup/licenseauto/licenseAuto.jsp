<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<style>
	.infoStyle{
		font-size: 13px; 
		font-weight: 500;
	}
	.licFont{
		padding-top: 8px;
		font-size: 15px;
		font-weight: 800;
		margin-right: 15px;
	}
</style>
<div style="width: 100%; height: 700px; padding: 20px; background-color: Beige; border-radius: 15px;">
	<div style="margin-bottom: 30px; width: 100%; height: 100px; background-color: lightgray; border-radius: 15px; padding: 10px; padding-left: 20px;">
		<span style="font-size: 15px; font-weight: 800;">이용안내</span><br>
		<span class="infoStyle">해당 자동등록 서비스는 '국가기술자격증' 중에 발급기관이 '대한상공회의소'인 자격증에 대해서만 이용이 가능합니다.</span><br>
		<span class="infoStyle">1. 자격증 사진을 첨부하여 '적용'버튼을 누른다.</span><br>
		<span class="infoStyle">2. 결과가 출력되면 수정사항을 수정 후 등록 버튼을 누른다.</span>
	</div>
    <form id="licForm" style="display: flex; flex-direction: column; justify-content: space-around; align-items: center; height: 100px;">
        <span style="font-size: 15px; font-weight: 800;">자격증 파일 첨부</span>
        <div style="display: flex;">
	        <div class="custom-file" style="display: flex; gap: 5px; width: 400px;">
	            <input type="file" name="licFile" id="file" class="custom-file-input" style="width: 400px;" required="required">
	            <label for="file" class="custom-file-label"></label>
	        </div>
	        <button class="btn btn-outline-primary btn-rounded" type="submit" style="width: 150px; margin-left: 20px;">적용</button>
    	</div>
    </form>
    <form id="licArea" style="margin-top: 30px; display: flex; flex-direction: column; align-items: center;">
	</form>
</div>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>

$("#licForm").on("submit", function(event){
	
	event.preventDefault();
	console.log("왜");
	var form = event.target;
	var formData = new FormData(form);
	
	$.ajax({
		url: 'http://localhost:5000/ai_license.ajax',
		type: 'POST',
		data: formData,
		contentType: false,
		processData: false,
		success: function(response) {
			if(response.success){
				var licenNm = response.lic_name;
				var licenNo =response.lic_code;
				var licenDate = response.lic_date_ymd;
				
				var html = `
					<span style="font-size: 15px; font-weight: 800; margin-bottom: 20px;">자격증등록내용</span>
					<div style="width: 70%; height: 300px; background-color: Khaki; border-radius: 15px; padding: 20px; display: flex; flex-direction: column; align-items: center; justify-content: center;">
				        <div style="display: flex; margin: 10px;">
				            <span class="licFont">자격종목</span><input type="text" name="licenNm" value="\${licenNm}" class="form-control form-control-rounded" style="width: 300px;" required="required"/>
				        </div>
				        <div style="display: flex; margin: 10px;">
				            <span class="licFont">자격번호</span><input type="text" name="licenNo" value="\${licenNo}" class="form-control form-control-rounded" style="width: 300px;" required="required"/>
				        </div>
				        <div style="display: flex; margin: 10px;">
				            <span class="licFont">합격일자</span><input type="date" name="licenDate" value="\${licenDate}" class="form-control form-control-rounded" style="width: 300px;" required="required"/>
				        </div>
				        <div style="display: flex; margin: 10px;">
				            <span class="licFont">발급기관</span><span class="form-control form-control-rounded" style="width: 300px;"/>대한상공회의소</span>
				        </div>
				    </div>
				    <button class="btn btn-outline-primary btn-rounded" type="submit" style="width: 150px; margin-top: 20px;">등록</button>
				`;
				document.querySelector("#licForm").reset();
				$("#licArea").empty();
				$("#licArea").html(html);
			}
			
			
		}
	});
	
});

$("#licArea").on("submit", function(event){
    event.preventDefault();
    
    var form = $(this); // 현재 요소에 대한 참조를 가져옴
    var formData = new FormData(form[0]); // FormData 객체 생성
    console.log(formData);

    var basicUrl = window.location.pathname;
    
    $.ajax({
        url: basicUrl + "/findCode",
        type: 'POST',
        data: formData,
        dataType: "json",
        contentType: false,
        processData: false,
        success: function(response) {
            if(response.success){
                console.log("code : ", response.licenCode);
                var licenCode = response.licenCode;
                formData.append("licenCode", licenCode);

                $.ajax({
                    url: basicUrl + "/licenseAdd",
                    type: 'POST',
                    data: formData,
                    dataType: "json",
                    contentType: false,
                    processData: false,
                    success: function(response) {
                        if(response.success){
                            Swal.fire({
              			      title: '성공',
              			      text: "자격증 등록 성공",
              			      icon: 'success'
              			    })
                        }else{
                            Swal.fire({
              			      title: '실패',
              			      text: "서버에러",
              			      icon: 'error'
               			    })
                        }
                    }
                });

            } else {
                alert("없습니다.");
                return;
            }
        }
    });
});

</script>