<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
  /* body 스타일 */
  html, body {
    overflow: hidden;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }
  /* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
  .fc-header-toolbar {
    padding-top: 1em;
    padding-left: 1em;
    padding-right: 1em;
  }
</style>
<div class="card card-body">
<h1 style="text-align:center;">HRU 학사일정관리 (교직원)</h1>
  <div id='calendar-container'>
    <div id='calendar'></div>
  </div>
</div>
<div class="modal fade schdlModal" id="exampleModal" tabindex="-1"
   aria-labelledby="exampleModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <h5 class="modal-title" id="exampleModal">일정 추가하기</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal"
               aria-label="Close"></button>
         </div>
         <div class="modal-body">
            <input type="text" id="cldrMemo" placeholder="내용"
               class="dateInput">
            <!--             <label>내용</label> -->
            <span></span> <br /> <input type="date" id="cldrStart"
               placeholder="날짜 선택" required aria-required="true"
               class="dateInput my-2" /><br /> <input type="date" id="cldrEnd"
               placeholder="날짜 선택" required aria-required="true"
               class="dateInput mb-2" /><br /> <select id="cldrColor"
               class="cldrColor">
               <option>색상선택</option>
               <option value="#f6714f">빨강색</option>
               <option value="#f9cb71">주황색</option>
               <option value="#d8fe66">노랑색</option>
               <option value="#a9fa83">초록색</option>
               <option value="#77c4f7">파랑색</option>
               <option value="#fa75c7">남색</option>
               <option value="#cca7fa">보라색</option>
            </select>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-light btn-close" data-bs-dismiss="modal">
               취소</button>
            <button type="button" class="btn btn-warning" id="saveChanges">
               추가</button>
         </div>
      </div>
   </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
$(document).ready(function(){
    $('.btn-close').click(function(){
        $('.modal').modal('hide');
    });
});
  (function(){
    $(function(){
      // 캘린더 엘리먼트 가져오기
      var calendarEl = $('#calendar')[0];
      // 풀캘린더 생성
      var calendar = new FullCalendar.Calendar(calendarEl, {
        height: '700px', // 캘린더 높이 설정
        expandRows: true, // 화면에 맞게 높이 조절
        slotMinTime: '09:00', // 일간 캘린더에서 시작 시간
        slotMaxTime: '18:00', // 일간 캘린더에서 종료 시간
        
        // 이벤트 
        events: function(info, successCallback, failureCallback) {
            $.ajax({
                url: 'acaCalendar/getInfo',
                dataType: 'json',
                success: function(response) {
                    // 서버에서 받은 JSON 데이터를 이벤트 배열로 변환
                    var events = [];
                    response.aList.forEach(function(event) {
                 
                        events.push({
                            title: event.cldrMemo,
                            start: event.cldrStart,
                            end: event.cldrEnd,
                            backgroundColor: event.cldrColor,
                            cldrCode: event.cldrCode 
                        });
                    });
                    successCallback(events);
                },
                error: function(error) {
                    console.error('이벤트 불러오기 오류:', error);
                    failureCallback(error);
                }
            });
        },
        
        // 해더에 표시할 툴바
        headerToolbar: {
          left: 'prev,next today',
          center: 'title',
          right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
        },
        initialView: 'dayGridMonth', // 초기 로드될 때 보여지는 캘린더 화면(기본 설정: 월간)
        //initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보임)
        navLinks: true, // 날짜를 선택하면 일간 캘린더나 주간 캘린더로 링크
        editable: true, // 수정 가능?
        selectable: true, // 캘린더 일자 선택 가능
        nowIndicator: true, // 현재 시간 표시
        dayMaxEvents: true, // 이벤트가 많을 때 높이 제한 (+ 몇 개식으로 표시)
        locale: 'ko', // 한국어 설정
        eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
            console.log(obj);
          },
          eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
            console.log(obj);
          },
          eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트

          },
          select: function(arg) {
            // 모달 대신 기본 프롬프트 열기
            $("#cldrStart").val(arg.startStr);
             $("#cldrEnd").val(arg.endStr);
        
            $("#exampleModal").modal("show");
            
             },
             
             // 일정 삭제시
             eventClick : function(arg) {
            	 var cldrCode = arg.event.extendedProps.cldrCode;
                console.log(cldrCode);
                
                Swal.fire({
                  title:'일정을 삭제하시겠습니까?'
                  , icon:"info"
                  , cancelButtonText:"취소"
                  , confirmButtonText:"확인"
                  , showCancelButton: true
                  , allowOutsideClick : false
               }).then((result)=>{
                  if(result.isConfirmed){
                   $.ajax({
                      url : "acaCalendar/delInfo"
                      , method : "POST"
                      , contentType : "application/json"
                      , data : JSON.stringify(cldrCode)
                      , success : function(jsonObj) {
                         Swal.fire({
                           title:'일정이 삭제되었습니다.',
                           icon:"success",
                           confirmButtonText:"확인",
                           allowOutsideClick : false
                        }).then((result)=>{
                           if(result.isConfirmed){
                        	   setTimeout(function() {
                                   window.location.reload();
                               }, 40);
                           }
                        });      
                         
                        
                      },
                      error: function(jqXHR, txt, status){
                        console.log("오류 텍스트: ", txt);
                        console.log("HTTP 상태: ", status);   
                        console.log("XHR 오브젝트: ", jqXHR);
                        console.log("제목: ", cldrCode);
                     }
                   });
                } 
            });      
             }
         });
      calendar.render();
      $("#saveChanges").on("click", function () {
          var eventData = {
             title: $("#cldrMemo").val(),
             start: $("#cldrStart").val(),
             end: $("#cldrEnd").val(),
             color: $("#cldrColor").val(),
          };
          console.log("eventData", eventData);
          // 빈 값 입력시 오류
          if ( eventData.title == "" || eventData.start == "" ) {
             Swal.fire({
                title:'입력하지 않은 값이 있습니다.',
                icon:"error",
                confirmButtonText:"확인",
                allowOutsideClick : false
             }).then((result)=>{
                if(result.isConfirmed){
                }
             });      
             
          // 끝나는 날짜가 시작하는 날짜보다 값이 크면 안됨
          } else if ($("#cldrStart").val() > $("#cldrEnd").val()) {
             Swal.fire({
                title:'기간을 제대로 입력해주세요.',
                icon:"error",
                confirmButtonText:"확인",
                allowOutsideClick : false
             }).then((result)=>{
                if(result.isConfirmed){
                }
             });      
          } else {
             // 이벤트 추가
             var newInfo = {
            		 cldrMemo: $("#cldrMemo").val(),
            		 cldrStart: $("#cldrStart").val(),
            		 cldrEnd: $("#cldrEnd").val(),
            		 cldrColor: $("#cldrColor").val(),
             };
             $.ajax({
                url : "acaCalendar/saveInfo"
                , method : "POST"
                 , contentType : "application/json"
                , data : JSON.stringify(newInfo)
                , success : function(jsonObj){
                   Swal.fire({
                      title:'일정이 저장되었습니다.',
                      icon:"success",
                      confirmButtonText:"확인",
                      allowOutsideClick : false
                   }).then((result)=>{
                       if(result.isConfirmed){
                       }
                    });      
                    calendar.addEvent(eventData);
             },
                error: function(jqXHR, txt, status){
                   console.log("오류 텍스트: ", txt);
                   console.log("HTTP 상태: ", status);   
                   console.log("XHR 오브젝트: ", jqXHR);
                }
             });


                $("#exampleModal").modal("hide");
                $("#cldrMemo").val("");
                $("#cldrStart").val("");
                $("#cldrEnd").val("");
                $("#cldrColor").val("");
             }
          });
    });
  })();
  </script>