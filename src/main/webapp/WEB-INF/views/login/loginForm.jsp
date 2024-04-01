<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<style>
    .layout-login-image__overlay {
        background-size: cover; /* 이미지가 100% 꽉 차도록 설정 */
        background-position: center; /* 이미지를 가운데 정렬 */
    }
    .overlay-transition {
    	width: 0px;
    	height: 0px;
        animation: slideLeft 10s infinite;
    	transition: background-image 10s ease; 
    }
    @keyframes slideLeft {
	    0% {
	        background-position: 100% 50%;
	    }
	    100% {
	        background-position: 0 50%;
	    }
	} 
    #loginSpace {
        position: absolute;
        top: 50%;
        right: 20px; /* 오른쪽으로 20px만큼 이동 */
        width: 400px;
        height: 250px;
        background-color: white;
        opacity: 0.8;
        transform: translateY(-50%); /* 수직 정렬을 위해 translateY 이용 */
    }
    #logSpace {
        #logSpace {
        position: absolute;
        top: 50%;
        left: 50%; /* 가운데로 이동 */
        transform: translate(-50%, -50%); /* 가운데 정렬을 위한 transform */
        width: 400px;
        height: 250px;
        background-color: white;
    }
    .nanum-gothic-extrabold {
	  font-family: "Nanum Gothic", sans-serif;
	  font-weight: 800;
	  font-style: normal;
	}
	
	.nanum-gothic-bold {
	  font-family: "Nanum Gothic", sans-serif;
	  font-weight: 700;
	  font-style: normal;
	}
	
	.nanum-gothic-regular {
	  font-family: "Nanum Gothic", sans-serif;
	  font-weight: 400;
	  font-style: normal;
	}

</style>
<div>
	<div id="logSpace" >
	   	<div class="d-flex justify-content-center mt-2 mb-5 navbar-light">
            <a href="index-student.html"
               class="navbar-brand flex-column mb-2 align-items-center mr-0"
               style="min-width: 0">
                <span class="nanum-gothic-bold" style="position: absolute; top:50px; font-size: 50px; color: white; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);">한국인재대학교</span>
                <span style="position: absolute; top:115px; font-size: 20px; color: white; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);">Korea Human Resource UniverSity</span>
            </a>
        </div>
	</div>
	<div id="loginSpace" style="width: 400px; height: 250px; right: 50px; top:170px; background-color: white; opacity: 0.9;" >
	   	
        <span style="position: absolute; top:30px; left:30px; font-size: 15px; font-weight: 800;">포털시스템 로그인</span>
		
		<form method="post" action='<c:url value="myLogin"/>'>
			<input name="username" id="id" style="width:210px; height:50px; font-size:15px; position: absolute; top:70px; left:30px; border: none; outline: none; border-bottom: 1px solid black;" type="text" placeholder="로그인ID">
			<input name="password" style="width:210px; height:50px; font-size:15px; position: absolute; top:120px; left:30px; border: none; outline: none; border-bottom: 1px solid black;" type="password" placeholder="비밀번호">
		   	<button type="submit" style="opacity: 1; width:110px; height:110px; position: absolute; right: 25px; top: 70px;" class="btn btn-outline-primary"><span style="font-size: 15px;">로그인</span></button>
		</form>
	   	
	   	
	   	<input type="checkbox" id="checkId" class="form-check-input" style="width: 20px; height: 20px; position: absolute; top: 195px; left: 50px;">
		<span style="position: absolute; top: 200px; left: 60px;">ID저장</span>
		
		<button type="button" id="idFind" style="opacity: 1; height:20px; position: absolute; left: 150px; top: 200px; border: none; outline: none; background-color: transparent;">
			<span style="font-size: 15px;">아이디 찾기</span>
		</button>
		<span style="position: absolute; left: 245px; top: 200px; font-size: 15px;">|</span>
		<button type="button" id="pwReset" style="opacity: 1; height:20px; position: absolute; left: 250px; top: 200px; border: none; outline: none; background-color: transparent;">
			<span style="font-size: 15px;">비밀번호 재설정</span>
		</button>
	   	
	</div>
	
	<div style="position:absolute; right: 50px; top:300px;">
		<c:if test="${not empty memList }">
			<select id="selectLogin">
				<option value>선택</option>
				<option value="202204033" data-login-password="1234">202204033&nbsp;&nbsp;나현규[학생][주인공]</option>
				<option value="202008503" data-login-password="bokbok1313!">202008503&nbsp;&nbsp;김재한[교수][주인공]</option>
				<option value="199899001" data-login-password="rlacjawl99!">199899001&nbsp;&nbsp;김첨지[교직원][주인공]</option>
				<option value="202404030" data-login-password="as099999@">202404030&nbsp;&nbsp;광춘참[학생]</option>
				<option value="202201050" data-login-password="abcd1234!">202201050&nbsp;&nbsp;박지원[학생]</option>
				<option value="202315009" data-login-password="as099999@">202315009&nbsp;&nbsp;허심해[학생]</option>
				<option value="202303082" data-login-password="as099999!!">202303082&nbsp;&nbsp;박세은[학생]</option>
				<option value="202213005" data-login-password="abcd1234!">202213005&nbsp;&nbsp;김유정[학생]</option>
				<option value="201304020" data-login-password="hoho123!">201304020&nbsp;&nbsp;이현지[졸업생]</option>
				<option value="201404005" data-login-password="yeon981127!">201404005&nbsp;&nbsp;김연찬[졸업생]</option>
				<option value="200204513" data-login-password="1234">200204513&nbsp;&nbsp;장태권[교수]</option>
				<option value="201104511" data-login-password="1234">201104511&nbsp;&nbsp;이선영[교수]</option>
				<option value="201804501" data-login-password="1234">201804501&nbsp;&nbsp;이성엽[교수]</option>
				<!-- 
					<c:forEach items="${memList }" var="mem">
						<option value="${mem.memNo }" data-login-password="${mem.memPass }">${mem.memNo }&nbsp;${mem.memName }</option>
					</c:forEach>
				 -->
			</select>
		</c:if>
	</div>
	
	<div class="layout-login-image__overlay" id="overlay" style="background-image: url(/lcms/resources/images/login/login_001.png)">
	    <div class="fullbleed bg-dark overlay-transition"></div>
	</div>
</div>
<button onclick="window.open('newStudentID','_blank','width=500, height=500, top=50, left=500, scrollbars=yes')" 
id="loginPopup" style="display: none;">
팝업 열기
</button>
<script src='<c:url value="/resources/js/app/login/loginForm.js" />'></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	// 페이지가 로드될 때 실행되는 함수
	$(document).ready(function() {
	    // 쿠키에서 hidePopup의 값을 가져옴
	    var hidePopupCookie = document.cookie.replace(/(?:(?:^|.*;\s*)hidePopup\s*\=\s*([^;]*).*$)|^.*$/, "$1");
	    // 만약 쿠키에 hidePopup의 값이 "true"이면 팝업을 숨김
	    if (hidePopupCookie === "true") {
	        return;
	    } else {
	    	document.getElementById("loginPopup").click();
	    }
	    
	    // 오늘 하루 안보기 체크 박스의 변경 이벤트를 등록함
	    $("#hidePopupCheckbox").change(function() {
	        setHidePopupCookie();
	    });

	    // 팝업 닫기 버튼의 클릭 이벤트 핸들러
	    $("#closePopupBtn").click(function() {
	        // 팝업을 닫고 오늘 하루 안보기 체크 박스를 설정함
	        setHidePopupCookie();
	        $("#newStudent").hide();
	    });
	});
</script>