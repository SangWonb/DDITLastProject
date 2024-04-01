	var calendar = null;
	var calendarDept = null;
	var calendarAca = null;
	var initialLocaleCode = 'ko';
	var localeSelectorEl = document.getElementById('locale-selector');

	$(document).ready(function() {

		var calendarEl = document.getElementById('myCalendar');
		calendar = new FullCalendar.Calendar(calendarEl, {
			//                 initialDate: 'dayGridMonth',
			initialView : 'dayGridMonth',
			headerToolbar : {
				left : 'prev,next today',
				center : 'title',
				right : 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
			},
			navLinks : true,
			editable : true,
			selectable : true,
			droppable : true, // this allows things to be dropped onto the calendar

			// eventAdd: function () { // 이벤트가 추가되면 발생하는 이벤트
			//     // console.log()
			// },

			/**
			 * 드래그로 이벤트 수정하기
			 */
			eventDrop : function(info) {
				if (confirm("'" + info.event.title + "' 매니저의 일정을 수정하시겠습니까 ?")) {
				}
				var events = new Array(); // Json 데이터를 받기 위한 배열 선언
				var obj = new Object();

				obj.title = info.event._def.title;
				obj.start = info.event._instance.range.start;
				obj.end = info.event._instance.range.end;
				events.push(obj);

				console.log(events);
				$(function deleteData() {
					$.ajax({
						url : "/full-calendar/calendar-admin-update",
						method : "GET",
						contentType : 'application/json',
					})
				})
			},

			/**
			 * 드래그로 이벤트 추가하기
			 */
			select : function(arg) { // 캘린더에서 이벤트를 생성할 수 있다.

				var title = prompt('일정을 입력해주세요.');
				if (title) {
					calendar.addEvent({
						title : title,
						start : arg.start,
						end : arg.end,
						allDay : arg.allDay,
					})
				}

				var allEvent = calendar.getEvents(); // .getEvents() 함수로 모든 이벤트를 Array 형식으로 가져온다. (FullCalendar 기능 참조)

				var events = new Array(); // Json 데이터를 받기 위한 배열 선언
				for (var i = 0; i < allEvent.length; i++) {
					var obj = new Object(); // Json 을 담기 위해 Object 선언
					// alert(allEvent[i]._def.title); // 이벤트 명칭 알람
					obj.title = allEvent[i]._def.title; // 이벤트 명칭  ConsoleLog 로 확인 가능.
					obj.start = allEvent[i]._instance.range.start; // 시작
					obj.end = allEvent[i]._instance.range.end; // 끝

					events.push(obj);
				}
				var jsondata = JSON.stringify(events);
				console.log(jsondata);
				// saveData(jsondata);

				$(function saveData(jsondata) {
					$.ajax({
						url : "/full-calendar/calendar-admin-update",
						method : "POST",
						dataType : "json",
						data : JSON.stringify(events),
						contentType : 'application/json',
					}).done(function(result) {
						// alert(result);
					}).fail(function(request, status, error) {
						// alert("에러 발생" + error);
					});
					calendar.unselect()
				});
			},

			/**
			 * 이벤트 선택해서 삭제하기
			 */
			eventClick : function(info) {
				if (confirm("'" + info.event.title + "' 매니저의 일정을 삭제하시겠습니까 ?")) {
					// 확인 클릭 시
					info.event.remove();
				}

				console.log(info.event);
				var events = new Array(); // Json 데이터를 받기 위한 배열 선언
				var obj = new Object();
				obj.title = info.event._def.title;
				obj.start = info.event._instance.range.start;
				events.push(obj);

				console.log(events);
				$(function deleteData() {
					$.ajax({
						url : "/full-calendar/calendar-admin-update",
						method : "DELETE",
						dataType : "json",
						data : JSON.stringify(events),
						contentType : 'application/json',
					})
				})
			},
		// eventRemove: function (obj) { // 이벤트가 삭제되면 발생하는 이벤트
		//
		// },

		});

		calendar.render();
		
		  $('a[href="#tab3"]').one('shown.bs.tab', function(e) {
	    	
	    	var calendarElDept = document.getElementById('calendarDept');
	        calendarDept = new FullCalendar.Calendar(calendarElDept, {
	           //                 initialDate: 'dayGridMonth',
	           initialView : 'dayGridMonth',
	           headerToolbar : {
	              left : 'prev,next today',
	              center : 'title',
	              right : 'dayGridMonth,timeGridWeek,timeGridDay'
	           },
	           navLinks : true,
	           editable : true,
	           selectable : true,
	           droppable : true, // this allows things to be dropped onto the calendar
	      
			

	        });
	        calendarDept.render();
	    });
		  
		  $('a[href="#tab2"]').one('shown.bs.tab', function(e) {
		    	
		    	var calendarElAca = document.getElementById('calendarAca');
		    	calendarAca = new FullCalendar.Calendar(calendarElAca, {
		           //                 initialDate: 'dayGridMonth',
		           initialView : 'dayGridMonth',
		           headerToolbar : {
		              left : 'prev,next today',
		              center : 'title',
		              right : 'dayGridMonth,timeGridWeek,timeGridDay'
		           },
		           navLinks : true,
		           editable : true,
		           selectable : true,
		           droppable : true, // this allows things to be dropped onto the calendar
				
				   events: function(info, successCallback, failureCallback){
			    	  // ajax 처리로 데이터를 로딩 시킨다.
			    	  $.ajax({
			    		 type:"get",
			    		 url:"schesule/type=a",
			    		dataType:"json"  
			    	  });
			      }
				
		        });
		    	calendarAca.render();
		    });
	});
