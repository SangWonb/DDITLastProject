/**
 * 로그인 세션 만료 카운트 다운 

		//시간표현                                      //시간 연장
 <span id="sessionTime"></span><a href="javascript:timeExtension();">시간연장</a>


1. 'KHRUsession'라는 이름의 쿠키에 세션만료 시간을 값으로 넣어서 저장
2. 세션만료시간과 현제 시간을 뺴서 남은 시간을 구함.
3. 시간 연장시 서버에서는 세션을 연장하고, js에서는 기존 쿠키를 삭제 후 새로운 쿠키 생성


 */
$(document).ready(function() {
	
	//초기값 설정
	const sessionCpath = $("body").data("bodyCpath");
	var modalshow = false;
	var sessionTime = document.getElementById("sessionTime");
	
	
	//모달창이 뜨면 안되는 구역이라면
	var canModal = true;
	
	if(window.location.pathname == sessionCpath + "/" ) canModal = false;
	if(window.location.pathname == sessionCpath + "/newStudentID" ) canModal = false;
	if(window.location.pathname == sessionCpath + "/idFind") canModal = false;
	if(window.location.pathname == sessionCpath + "/idFind/show" ) canModal = false;
	if(window.location.pathname == sessionCpath + "/pwReset" ) canModal = false;
	if(window.location.pathname == sessionCpath + "/pwReset/pwChange" ) canModal = false;
	if(window.location.pathname == sessionCpath + "/myLogin") canModal = false;
	if(window.location.pathname == sessionCpath + "/myLogin/newStudentID") canModal = false;
	if(window.location.pathname == sessionCpath + "/myLogin/idFind") canModal = false;
	if(window.location.pathname == sessionCpath + "/myLogin/idFind/show") canModal = false;
	if(window.location.pathname == sessionCpath + "/myLogin/pwReset") canModal = false;
	if(window.location.pathname == sessionCpath + "/myLogin/pwReset/pwChange") canModal = false;
	
	console.log("canModal : ",canModal);
	
	
	 // 세션 만료 시간(밀리초 단위) 설정 (30분)
	 //var expirationTime = ( new Date().getTime() ) + ( 30 * 60 * 1000 );
	
	//쿠키가져오기
	function getCookie(cookieName) {
	    var name = cookieName + "=";
	    var decodedCookie = decodeURIComponent(document.cookie);
	    var cookieArray = decodedCookie.split(';');
	
	    for(var i = 0; i < cookieArray.length; i++) {
	        var cookie = cookieArray[i].trim();
	        if (cookie.indexOf(name) == 0) {
	            return cookie.substring(name.length, cookie.length);
	        }
	    }
	    return "";
	}
	
	//쿠키 생성
	function setCookie(cookieName, cookieValue, expirationDays) {
	    var d = new Date();
	    d.setTime(d.getTime() + (expirationDays * 30 * 60 * 1000));
	    var expires = "expires="+ d.toUTCString();
	    document.cookie = cookieName + "=" + cookieValue + ";" + expires + ";path=/";
	}
	
	//쿠키 삭제
	function deleteCookie(cookieName) {
	    document.cookie = cookieName + "=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
	    document.cookie = cookieName + "=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/lcms;";
	}
	
	
	
	// "KHRUsession" 쿠키 값을 가져옵니다. >> 세션 만료 시간
	var	expirationTime = getCookie("KHRUsession");
		
		
	// 시간 업데이트
	function updateSessionTime() {
		// "KHRUsession" 쿠키 값을 가져옵니다. >> 세션 만료 시간
   		expirationTime = getCookie("KHRUsession");
		
	    // 현재 시간(밀리초 단위) 가져오기
	    var currentTime = new Date().getTime();
	
	    // 세션 만료 시간과 현재 시간의 차이 계산 (남은시간)
	    var timeRemaining = expirationTime - currentTime;
		
	    if(timeRemaining < 0){ //시간이 만료되면
		
			if(canModal){
				//모달이 이미 띄워져있다면
				if(modalshow){
					return;	
				}
				
		    	//세션 만료 모달창 띄우기
				$.ajax({
					
		    		url: sessionCpath + "/session/sessionOverModal"
		    		, method:"get"
		    		, success:function(response){
		    			
		    			let parser = new DOMParser();
						let newDoc = parser.parseFromString(response, "text/html");
						let preTag = newDoc.getElementById('sessionOverModal');
			            // 모달을 DOM에 추가
			            $(document.body).append(preTag);
		
			            // 모달 초기화
			            $('#sessionOverModal').modal('show');
						
						deleteCookie("KHRUsession");
		    			
		    		}, error : function(jqXHR, txt, status){
		    			console.log(jqXHR, txt, status);
		    		}
		    	});    
				modalshow = true; 	
				return;     	
				
			}
				
			
	    }else{//만료가 안되었다면
		
	        // 시간 단위 변환
	        var minutesRemaining = Math.floor((timeRemaining % (1000 * 60 * 60)) / (1000 * 60));
	        var secondsRemaining = Math.floor((timeRemaining % (1000 * 60)) / 1000);
	
			sessionTime.innerHTML =  minutesRemaining + ": " + secondsRemaining ;
	    }
		//1초 후에 다시 시간 업데이트
		setTimeout(updateSessionTime, 1000);
	}
	
	//처음에 시작할때 // 세션 안돌아가도 되는 곳인지
	if(canModal){
		console.log("시작해야지");
		updateSessionTime();	
	}
	
	//시간연장
	$(document).on("click",".timeExtension", function(event){
		//서버에서 세션 시간 늘림.
		$.ajax({
			url: sessionCpath + "/session/timeExtension"
			, method:"get"
			, success:function(response){
				if(response.success){
					//기존 쿠키 삭제
					deleteCookie("KHRUsession");
					//새로운 쿠키 생성
					setCookie("KHRUsession", response.sessionOverTime, 30 * 60 * 1000);
					
		        	expirationTime = getCookie("KHRUsession");	
					console.log("expirationTime : ",expirationTime);
				}
			}, error : function(jqXHR, txt, status){
				console.log(jqXHR, txt, status);
			}
		});
		
	});
	
	
});