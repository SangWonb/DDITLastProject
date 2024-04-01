<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<div id="viewPopup" style=" width: 500px; position:absolute; left: 0; right: 0; 
margin-left: auto; margin-right: auto; display: flex; flex-direction: column; 
justify-content: center; align-items: center;">
	
	<div id="imgshoww" data-img-width="500" data-img-height="500" data-file-no="00_POPUP_IMG_01">
		
	</div>
    <!-- 체크박스 및 버튼 -->
    <div style="margin-top: 10px;">
        <input type="checkbox" id="hidePopupCheckbox" style="margin-right: 5px;">
        <label for="hidePopupCheckbox">오늘 하루 동안 보지 않기</label>
    </div>

    <div style="margin-top: 10px;">
        <button id="closePopupBtn" class="btn btn-danger" style="padding: 5px 10px; font-size: 14px;">팝업 닫기</button>
    </div>
    
    
    <!-- Bootstrap 및 jQuery 스크립트 추가 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.cycle2/2.1.6/jquery.cycle2.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</div>
<script>
function imgShow(showTarget){
	
	var imgTarget = $(`#\${showTarget}`);
	var fileNo = imgTarget.data("fileNo");
	
	console.log("fileNo : ",fileNo);
    
    $.ajax({
        url: window.location.pathname + "/getImage?fileNo="+fileNo,
        type: "GET",
        success: function(data) {
            // 이미지를 받아왔을 때의 처리
            displayImage(data,showTarget);
        },
        error: function(xhr, status, error) {
            // 오류 발생 시 처리
            console.error("Error fetching image: " + error);
        }
    });
}

function displayImage(imageData,showTarget) {
	
	var imgTarget = $(`#\${showTarget}`);
	var width = imgTarget.data("imgWidth");
	var height = imgTarget.data("imgHeight");
	
	console.log("width : ",width);
	console.log("height : ",height);
	
    // 이미지를 표시할 div 요소 선택
    var imageDiv = document.getElementById(showTarget);

    // 이미지를 표시할 img 요소 생성
    var img = document.createElement("img");
    
    // 이미지 데이터를 src 속성에 설정
    img.src = "data:image/jpeg;base64," + imageData; // 이미지 데이터는 Base64로 인코딩되어 있어야 함
    img.width = width;
    img.height = height;
    
    // 이미지를 div에 추가
    imageDiv.appendChild(img);
}

    // 오늘 하루 안보기 체크 박스의 변경 이벤트를 등록함
    $("#hidePopupCheckbox").change(function() {
        setHidePopupCookie();
    });

    // 팝업 닫기 버튼의 클릭 이벤트 핸들러
    $("#closePopupBtn").click(function() {
        // 팝업을 닫고 오늘 하루 안보기 체크 박스를 설정함
        setHidePopupCookie();
        window.close(); 
    });
    
function setHidePopupCookie() {
    // 체크 박스의 체크 여부 확인
    var isChecked = $("#hidePopupCheckbox").prop("checked");
    console.log(isChecked);
    // 현재 날짜와 시간을 구함
    var now = new Date();
    // 만료 시간을 설정함. 현재 시간으로부터 24시간 후로 설정하여 하루 동안 유지됨
    var expireTime = new Date(now.getTime() + 24 * 60 * 60 * 1000);
    // 쿠키 문자열을 생성함. 쿠키 이름은 "hidePopup"으로 설정하고, 값은 체크 여부에 따라 "true" 또는 "false"로 설정함
    var cookieString = "hideMainPopup=" + isChecked + "; expires=" + expireTime.toUTCString() + "; path=/";
    // 쿠키를 설정함
    document.cookie = cookieString;
}
</script>
<script type="text/javascript">
imgShow("imgshoww"); //함수 호출해야만 사진 나옴.
</script>