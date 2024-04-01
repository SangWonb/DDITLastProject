<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<div id="newStudent" style=" width: 500px; position:absolute; left: 0; right: 0; margin-left: auto; margin-right: auto; display: flex; flex-direction: column; justify-content: center; align-items: center;">
   <div><h2>신입생 학번 조회</h2></div>
   <div><span>수험번호와 생년월일(6자리)를 입력시 학번을 조회합니다.</span></div>
   <div><span style="color: blue;"><span style="font-size:15px;">※</span>로그인 후 비밀번호를 변경해주시기 바랍니다.<span style="font-size:15px;">※</span></span></div>
   <div style="margin-bottom: 10px;">
      <span style="left: 100px;">로그인 ID : 학번</span><br/>
      <span style="left: 100px;">로그인 PW : 생년월일(6자리)</span>
   </div>
   <div style=" width: 300px;">
      <form id="newStudentForm" method="post">
         <div class="col-12 col-md-6 mb-3">
               <label class="form-label" for="validationSample01">수헙번호</label>
               <input type="text" name="stuEnrollno" class="form-control" placeholder="예) 2024030001" required="true" style=" width: 300px;">
              </div>
           <div class="col-12 col-md-6 mb-3">
               <label class="form-label" for="validationSample01">생년월일</label>
               <input type="text" name="memReg1" class="form-control" placeholder="예) 980101" required="true" style=" width: 300px;">
              </div>
         <div style="width: 300px;" class="col-12 col-md-6 mb-3">
            <button type="submit" class="btn btn-outline-primary" style="width:300px;" id="selectIdBtn">학번조회</button>
         </div>
      </form>
   </div>
   <input type="checkbox" id="hidePopupCheckbox">
<label for="hidePopupCheckbox">오늘 하루 동안 보지 않기</label>
<button id="closePopupBtn" class="btn btn-danger">팝업 닫기</button>
  
<div id="studentIdShow"></div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
   $("#newStudentForm").on("submit",function(event){
      event.preventDefault();
      console.log("일단 옴");
      $("#studentIdShow").html("");
      
      var cpath = $("body").data("bodyCpath");
      var formData = $("#newStudentForm").serialize();
      
      $.ajax({
         
          url: window.location.pathname
          , method:"post"
          , data: formData
          , dataType: "json"
            , contentType: "application/x-www-form-urlencoded" // contentType 수정
            , success: function(response) {
            if(response.success){
               
               var txt = "학번은 <span style='color:red;'>" + response.stu.memNo + "</span> 입니다."
               $("#studentIdShow").html(txt);
               
            }else{
               
               var txt = "<span style='color:red;'>" + response.message + "</span>"
               $("#studentIdShow").html(txt);
               
            }
            }, error : function(jqXHR, txt, status){
             console.log(jqXHR, txt, status);
          }
       });    
   });
   $(document).ready(function() {
	   
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
	   
   });
   
   function setHidePopupCookie() {
	    // 체크 박스의 체크 여부 확인
	    var isChecked = $("#hidePopupCheckbox").prop("checked");
	    // 현재 날짜와 시간을 구함
	    var now = new Date();
	    // 만료 시간을 설정함. 현재 시간으로부터 24시간 후로 설정하여 하루 동안 유지됨
	    var expireTime = new Date(now.getTime() + 24 * 60 * 60 * 1000);
	    // 쿠키 문자열을 생성함. 쿠키 이름은 "hidePopup"으로 설정하고, 값은 체크 여부에 따라 "true" 또는 "false"로 설정함
	    var cookieString = "hidePopup=" + isChecked + "; expires=" + expireTime.toUTCString() + "; path=/";
	    // 쿠키를 설정함
	    document.cookie = cookieString;
	}
</script>