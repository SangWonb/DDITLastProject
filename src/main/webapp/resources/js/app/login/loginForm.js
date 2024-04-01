/**
 * 
 */


// 이미지 URL 목록
var imageUrls = [
    "/lcms/resources/images/login/login_001.png",
    "/lcms/resources/images/login/login_002.png",
    "/lcms/resources/images/login/login_003.png",
    "/lcms/resources/images/login/login_004.png",
    "/lcms/resources/images/login/login_005.png",
    "/lcms/resources/images/login/login_006.png",
    "/lcms/resources/images/login/login_007.png",
    // 추가 이미지 URL을 필요에 따라 여기에 추가합니다
];

var currentIndex = 0;
var overlay = document.getElementById("overlay");
var overlayFade = document.querySelector(".fullbleed.bg-dark");

// 이미지 변경 함수
function changeImage() {
    currentIndex = (currentIndex + 1) % imageUrls.length; // 다음 이미지 인덱스 계산
    overlay.style.transition = "background-image 1s ease"; // transition 속성 변경
    overlay.style.backgroundImage = "url(" + imageUrls[currentIndex] + ")";
}

// 초기 이미지 설정
overlay.style.backgroundImage = "url(" + imageUrls[currentIndex] + ")";

// 7초마다 배경 이미지 변경
setInterval(changeImage, 7000); // 7000밀리초 = 7초

$("#selectLogin").on("change",function(event){
	
	var memNoValue = $("#selectLogin").val();
	var memPWValue = $("#selectLogin").find("option:selected").data("loginPassword");
	
	$("[name='username']").val(memNoValue);
	$("[name='password']").val(memPWValue);
	
});

//ID 찾기
$("#idFind").on("click",function(event){
	var cpath = $("body").data("bodyCpath");
	window.location.href= cpath + "/idFind";
});

//PW 찾기
$("#pwReset").on("click",function(event){
	var cpath = $("body").data("bodyCpath");
	window.location.href= cpath + "/pwReset";
});

//id 저장하기
$(document).ready(function(){
	// 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var key = getCookie("key");
    $("#id").val(key); 
     
    // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
    if($("#id").val() != ""){ 
        $("#checkId").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#checkId").change(function(){ // 체크박스에 변화가 있다면,
        if($("#checkId").is(":checked")){ // ID 저장하기 체크했을 때,
            setCookie("key", $("#id").val(), 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("key");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("#id").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#checkId").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            setCookie("key", $("#id").val(), 7); // 7일 동안 쿠키 보관
        }
    });

	// 쿠키 저장하기 
	// setCookie => saveid함수에서 넘겨준 시간이 현재시간과 비교해서 쿠키를 생성하고 지워주는 역할
	function setCookie(cookieName, value, exdays) {
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		var cookieValue = escape(value)
				+ ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
		document.cookie = cookieName + "=" + cookieValue;
	}
	
	// 쿠키 삭제
	function deleteCookie(cookieName) {
		var expireDate = new Date();
		expireDate.setDate(expireDate.getDate() - 1);
		document.cookie = cookieName + "= " + "; expires="
				+ expireDate.toGMTString();
	}
	 
	// 쿠키 가져오기
	function getCookie(cookieName) {
		cookieName = cookieName + '=';
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cookieName);
		var cookieValue = '';
		if (start != -1) { // 쿠키가 존재하면
			start += cookieName.length;
			var end = cookieData.indexOf(';', start);
			if (end == -1) // 쿠키 값의 마지막 위치 인덱스 번호 설정 
				end = cookieData.length;
	            console.log("end위치  : " + end);
			cookieValue = cookieData.substring(start, end);
		}
		return unescape(cookieValue);
	}
});






