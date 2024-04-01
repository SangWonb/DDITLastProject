<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<style>
#pwResetPage {
    width: 100%;
    height: 600px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}
#pwResetSpace {
    width: 100%;
    max-width: 700px; /* 예시로 너비를 제한함 */
    padding: 20px;
    margin: 20px;
    text-align: center;
    height: 350px;
    justify-content: center;
    align-items: center;
}	
#pwResetTitle{
	font-size: 25px;
	font-weight: 800;
}
#authMethodSpace{
	position:absolute;
	top: 20px;
	left: 0;
    right: 0;
    margin-left: auto;
    margin-right: auto;
	display: flex;
	flex-direction: row;
    justify-content: center;
}
.custom-radio{
	margin: 20px;
}
#pwResetInputSpace{

	position:absolute;
	top: 80px;
	left: 0;
    right: 0;
    margin-left: auto;
    margin-right: auto;
	width: 500px;
	height: 180px;
	display: flex;
    align-items: center;
	flex-direction: row;
    justify-content: center;
	
}
.inputContent{
 	display: flex; 
 	flex-direction: row; 
 	width: 500px;	
 	max-width: 500px; 
	
}
.inputContent .form-label{
	width: 70px;
	max-width: 70px;
	display: flex;
	flex-direction: column;
	justify-content: center;
    align-items: center;
    white-space: nowrap; /* 줄 바꿈 방지 */
}
.inputContent .form-control{
	width: 300px;
}
#authEmail, #authPhone{
	display: flex;
 	flex-direction: column; 
    align-items: center;

}
#authRequestBtn{
	width: 100px;
	font-size: 10px;
	margin-left: 10px;
}
#authOKSpace{
	position: absolute;
	top: 260px;
	width: 400px;
	left: 0;
    right: 0;
    margin-left: auto;
    margin-right: auto;
}
#authOKBtn{
	width: 100px;
	margin-left: 10px;
}
#authOK{
	width:250px; 
	height:50px; 
	font-size:13px; 
	border: none; 
	outline: none;  
	border-bottom: 1px solid black;
}
#authTime{
	color:red;
	position: absolute;
	top: 15px;
	left: 230px;
}
</style>

<div id="pwResetPage">
	<div id="pwResetTitle">
		비밀번호 재설정
	</div>
	<div class="card mb-lg-32pt" id="pwResetSpace">
		<form id="pwResetForm" method="post">
			<div class="custom-controls-stacked" id="authMethodSpace">
	             <div class="custom-control custom-radio">
	                 <input id="authMethod1" name="authMethod" type="radio" class="custom-control-input" checked="true" value="authEmail">
	                 <label for="authMethod1" class="custom-control-label">이메일</label>
	             </div>
	             <div class="custom-control custom-radio">
	                 <input id="authMethod2" name="authMethod" type="radio" class="custom-control-input" value="authPhone">
	                 <label for="authMethod2" class="custom-control-label">휴대폰</label>
	             </div>
	         </div>
		     <div id="pwResetInputSpace">
		     	<div id="authEmail">
		     		<div class="col-12 col-md-6 mb-3 inputContent">
	                    <label class="form-label" for="validationSample01">아이디</label>
	                    <input type="text" name="EmemNo" class="form-control" placeholder="예) 20240100151" required="true">
                  	</div>
		     		<div class="col-12 col-md-6 mb-3 inputContent">
	                    <label class="form-label" for="validationSample01">이메일</label>
	                    <input type="text" name="memEmail" class="form-control" placeholder="예) hongildong@naver.com" required="true">
	                    <button type="submit"  class="btn btn-outline-primary" value="" id="authRequestBtn">인증번호요청</button>
                  	</div>
		     	</div>
		     	<div id="authPhone">
		     		<div class="col-12 col-md-6 mb-3 inputContent">
	                    <label class="form-label" for="validationSample01">아이디</label>
	                    <input type="text" name="PmemNo" class="form-control" placeholder="예) 20240100151" required="true">
                  	</div>
		     		<div class="col-12 col-md-6 mb-3 inputContent">
	                    <label class="form-label" for="validationSample01">생년월일</label>
	                    <input type="text" name="memReg1" class="form-control" placeholder="예) 980101" required="true">
                  	</div>
                  	<div class="col-12 col-md-6 mb-3 inputContent">
	                    <label class="form-label" for="validationSample01">전화번호</label>
	                    <input type="text" name="memTel" class="form-control" placeholder="예) 010-1111-1111" required="true">
	                    <button type="submit" class="btn btn-outline-primary" value="" id="authRequestBtn">인증번호요청</button>
                  	</div>
		     	</div>
		     </div>
	     </form>   
	     <div id="authOKSpace" hidden="true">
	     	<input id="authOK" type="text" placeholder="인증번호">
	     	<div id="authTime"></div>
	     	<button class="btn btn-outline-primary" id="authOKBtn">확인</button> 
	     </div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript">

function Cuscountdown(elementId, seconds){
	var element, endTime, hours, mins, msLeft, time;
	function updateTimer(){
		msLeft = endTime - (+new Date);
		if ( msLeft < 0 ) {
			console.log('done');
			$("#authOKSpace").attr("hidden","true");
			$("#authOKSpace").find("#authOK").removeAttr("required").val("");
			
		} else {
			time = new Date( msLeft );
			hours = time.getUTCHours();
			mins = time.getUTCMinutes();
			element.innerHTML = +(hours ? hours + ':' + ('0' + mins).slice(-2) : mins) + ':' + ('0' + time.getUTCSeconds()).slice(-2);
			setTimeout( updateTimer, time.getUTCMilliseconds());
		}
	}
	element = document.getElementById(elementId);
	endTime = (+new Date) + 1000 * seconds;
	updateTimer();
}


$(document).ready(function() {
	$("#authPhone").hide().find("[name='PmemNo'], [name='memReg1'], [name='memTel']").removeAttr("required");
	$("#authMethodSpace input[type='radio']").on("change", function(event) {
	    var authMethod = $(this).val();
	    $("#authOKSpace").attr("hidden","true");
		$("#authOKSpace").find("#authOK").removeAttr("required").val("");
	    if(authMethod == "authEmail"){
	        $("#authEmail").show().find("[name='EmemNo'], [name='memEmail']").prop("required", true);
	        $("#authPhone").hide().find("[name='PmemNo'], [name='memReg1'], [name='memTel']").removeAttr("required").val("");
	    } else if(authMethod == "authPhone"){
	        $("#authPhone").show().find("[name='PmemNo'], [name='memReg1'], [name='memTel']").prop("required", true);
	        $("#authEmail").hide().find("[name='EmemNo'], [name='memEmail']").removeAttr("required").val("");
	    }
	}); 
});
$("#pwResetForm").on("submit",function(event){
	event.preventDefault();
	
	console.log("sdf");
	
	var $form = $("#pwResetForm");
	var jsonData = $form.serialize(); 
	
	$.ajax({
		url: window.location.pathname
		, method:"post"
		, contentType: 'application/x-www-form-urlencoded'
		, data : jsonData //serialize
		, success:function(response){
			console.log(response.success);
			if(response.success){
				$("#authOKSpace").removeAttr("hidden");
				$("#authOKSpace").find("#authOK").prop("required", true);
					
				Cuscountdown('authTime', 60*3); 
				
			}else{
				Swal.fire({
			      title: '실패',
			      text: response.message,
			      icon: 'error'
			    });
			}
		}, error : function(jqXHR, txt, status){
			console.log(jqXHR, txt, status);
		}
	});
	
});

$("#authOKBtn").on("click",function(event){
	
	var authNum = $("#authOK").val();
	
	data = {"authNum":authNum};
	
	$.ajax({
		url: window.location.pathname + "/auth"
		, method:"post"
		, data : JSON.stringify(data) //serialize
		, contentType: 'application/json'
		, success:function(response){
			console.log(response.success);
			if(response.success){
				window.location= window.location.pathname + "/pwChange";
			}else{
				Swal.fire({
			      title: '실패',
			      text: response.message,
			      icon: 'error'
			    });
			}
		}, error : function(jqXHR, txt, status){
			console.log(jqXHR, txt, status);
		}
	});
	
	
	
	
	
});


</script>