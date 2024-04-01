<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!-- 기본 설정 -->
<div id="imgshoww" data-img-width="300" data-img-height="300" data-file-no="F2403190003"></div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script> /* imgShow.js << 이거 내용임 : 해당 jsp는 tiles를 안타서 이렇게 함.*/
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
</script>
<script type="text/javascript">
	imgShow("imgshoww"); //함수 호출해야만 사진 나옴.
</script>
