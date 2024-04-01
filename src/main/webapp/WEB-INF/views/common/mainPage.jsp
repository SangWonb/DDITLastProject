<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<style>
html {
	scrollbar-width: none;
    -ms-overlow-style: none;
}
</style>

<button onclick="window.open('<%=request.getContextPath()%>/manager/com/popup/mainpopup/viewPopup','_blank','width=500, height=600, top=50, left=500, scrollbars=yes')" 
id="mainPopup" style="display: none;">
팝업 열기
</button>

<script>
// 페이지가 로드될 때 실행되는 함수
$(document).ready(function() {
    // 쿠키에서 hidePopup의 값을 가져옴
    var hideMainPopupCookie = document.cookie.replace(/(?:(?:^|.*;\s*)hideMainPopup\s*\=\s*([^;]*).*$)|^.*$/, "$1");
    // 만약 쿠키에 hidePopup의 값이 "true"이면 팝업을 숨김
    if (hideMainPopupCookie === "true") {
        return;
    } else {
    	document.getElementById("mainPopup").click();
    }
    
    // 오늘 하루 안보기 체크 박스의 변경 이벤트를 등록함
    $("#hidePopupCheckbox").change(function() {
        setHidePopupCookie();
    });

    // 팝업 닫기 버튼의 클릭 이벤트 핸들러
    $("#closePopupBtn").click(function() {
        // 팝업을 닫고 오늘 하루 안보기 체크 박스를 설정함
        setHidePopupCookie();
        $("#viewPopup").hide();
    });
});


	const sidebarWrapper = document.getElementById('sidebarWrapper');
	const sidebar = document.getElementById('sidebar');
	const chatbot = document.getElementById('chatbot');
	const popup = document.getElementById('popup');
	const closeButton = document.getElementById('closeButton');

	
</script>