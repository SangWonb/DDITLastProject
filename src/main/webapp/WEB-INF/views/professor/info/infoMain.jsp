<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
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
<h1 style="text-align:center;">HRU 학사일정</h1>
  <div id='calendar-container'>
    <div id='calendar'></div>
  </div>
</div>
  <script>
  (function(){
    $(function(){
      // calendar element 취득
      var calendarEl = $('#calendar')[0];
      // full-calendar 생성하기
      var calendar = new FullCalendar.Calendar(calendarEl, {
        height: '700px', // calendar 높이 설정
        expandRows: true, // 화면에 맞게 높이 재설정
        slotMinTime: '08:00', // Day 캘린더에서 시작 시간
        slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
        // 해더에 표시할 툴바
        headerToolbar: {
          left: 'prev,next today',
          center: 'title',
          right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
        },
        initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
        //initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
        navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
        editable: false, // 수정 가능?
        selectable: false, // 달력 일자 드래그 설정가능
        nowIndicator: true, // 현재 시간 마크
        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
        locale: 'ko', // 한국어 설정
        // 이벤트 
events: function(info, successCallback, failureCallback) {
    $.ajax({
        url: 'infoMain/getInfo',
        dataType: 'json',
        success: function(response) {
            // 서버에서 받은 JSON 데이터를 이벤트 배열로 변환
            var events = [];
            response.aList.forEach(function(event) {
         
                events.push({
                    title: event.cldrMemo,
                    start: event.cldrStart,
                    end: event.cldrEnd,
                    backgroundColor: event.cldrColor
                });
            });
            successCallback(events);
        },
        error: function(error) {
            console.error('Error fetching events:', error);
            failureCallback(error);
        }
    });
}
          });
      // 캘린더 랜더링
      calendar.render();
    });
  })();
</script>