/**
 * 
 */

// 현재 날짜를 가져오기
var today = new Date();

function getAttendData(){
	
	$.ajax({
		url:window.location.pathname + "/attendData"
		, method:"get"
		, dataType : "json"
		, success:function(jsonObj){
			
			var weekMap = jsonObj.weekMap;
			var dayvoList = jsonObj.dayvoList;
			var conducted = jsonObj.conducted;
			var studentList = jsonObj.studentList;
			var attendInfoList = jsonObj.attendInfoList;
			
			var theadTag = "";
			
			//첫줄(주)
			theadTag += `
				<tr>
					<th rowspan="5" style="width: 25px; max-width: 25px;">NO</th>
					<th rowspan="5" style="width: 70px; max-width: 70px;">성명</th>
					<th rowspan="5" style="width: 120px; max-width: 120px;">학번</th>
					<th rowspan="5" style="width: 180px; max-width: 180px;">학과</th>
					<th rowspan="5" style="width: 70px; max-width: 70px;">출석</th>
					<th rowspan="5" style="width: 30px; max-width: 30px;">결석</th>
					<th rowspan="5" style="width: 30px; max-width: 30px;">지각</th>
					<th rowspan="5" style="width: 30px; max-width: 30px;">조퇴</th>
					<th style="width: 30px; max-width: 30px;">주</th>`;
			
			$.each(weekMap, function(index, w){
				theadTag += `
					<th colspan="${w}">${index}주</th>
				`;
			});	
			theadTag += `		
				</tr>
			`;
			
			//둘째줄(월)
			theadTag += `
				<tr>
					<th>월</th>
			`;
			$.each(dayvoList, function(index, d){
				theadTag += `
					<th>${d.month}</th>
				`;
			});
			theadTag += `		
				</tr>
			`;
			
			//셋째줄(일)
			theadTag += `
				<tr>
					<th>일</th>
			`;
			$.each(dayvoList, function(index, d){
				theadTag += `
					<th>${d.day}</th>
				`;
			});
			theadTag += `		
				</tr>
			`;
			
			//넷째줄(요일)
			theadTag += `
				<tr>
					<th>요일</th>
			`;
			$.each(dayvoList, function(index, d){
				theadTag += `
					<th>${d.dayName}</th>
				`;
			});
			theadTag += `		
				</tr>
			`;
			
			//다섯째줄(수정)
			theadTag += `
				<tr>
					<th>수정</th>
			`;
			$.each(dayvoList, function(index, d){
				var date = new Date(d.date);
				if(today >= date){
					theadTag += `
						<th><button data-edit-date="${d.date}" style="width: 20px; height:20px; padding: 1px;">▼</button></th>
					`;
				}else{
					theadTag += `
						<th></th>
					`;
				}
				
			});
			theadTag += `		
				</tr>
			`;
			
			$("#attendThead").empty();
			$("#attendThead").append(theadTag);
			
			
			var tbodyTag = "";
			
			var cnt = 1;
			$.each(attendInfoList, function(index, a){
				tbodyTag += `
					<tr>
						<th>${cnt++}</th>
						<th>${a.memName}</th>
						<th>${a.smemNo}</th>
						<th>${a.deptName}</th>
						<th>${a.attendance}/${a.conducted}</th>
						<th>${a.absent}</th>
						<th>${a.late}</th>
						<th>${a.leave}</th>
						<th></th>
				`;
				
				
				$.each(a.attendList, function(index,al){
					
					var atCode = "";
					
					if(al.atCode) {
						if(al.atCode == "출석") {atCode = "●";}
						if(al.atCode == "결석") {atCode = "X";}
						if(al.atCode == "지각") {atCode = "□";}
						if(al.atCode == "조퇴") {atCode = "△";}
						if(al.atCode == "공결") {atCode = "◎";}
					}else{
						atCode = "-";
					}
					tbodyTag += `
						<th data-smem-no="${al.smemNo}" data-at-date="${al.atDate}" data-at-code="${al.atCode}">${atCode}</th>
					`;
					
				});
				
				tbodyTag += `
					</tr>
				`;
				
			});
			
			$("#attendTbody").empty();
			$("#attendTbody").append(tbodyTag);
			
			
			
			
			
		}, error : function(jqXHR, txt, status){
			console.log(txt, status, jqXHR);
		}
	});
	
}

getAttendData();

$(document).on("click","[data-edit-date]",function(event){
	
	var editDate = $(event.target).data("editDate");
	
	console.log("editDate : ",editDate);
	
	var editThs = $(`[data-at-date="${editDate}"]`)
	
	$.each(editThs, function(index, th){
		//console.log("index, th : ", index, th);
		var atDate = $(th).data("atDate");
		var smemNo = $(th).data("smemNo");
		var atCode = $(th).data("atCode");
		
		console.log(atCode);
		
		var targetElement = $(`[data-smem-no="${smemNo}"][data-at-date="${atDate}"]`);
		targetElement.empty();
		
		var thTag = `
			<select>
				<option value>-</option>
				<option value="출석">●</option>
				<option value="결석">X</option>
				<option value="조퇴">△</option>
				<option value="지각">□</option>
				<option value="공결">◎</option>
			</select>
		`;
		
		targetElement.append(thTag);
		
		targetElement.find("select").val(atCode);
		
	});
	
	var parent = $(event.target).parent("th");
	$(event.target).remove();
	
	editTag = `
		<button data-all-btn="${editDate}" style="width:40px; height:20px; padding: 1px;">일괄</button>
		<button data-fin-btn="${editDate}" style="width:40px; height:20px; padding: 1px;">완료</button>
	`;
	parent.append(editTag);
});

$(document).on("click","[data-all-btn]",function(event){
	var allBtn = $(event.target).data("allBtn");
	
	var allThs = $(`[data-at-date="${allBtn}"]`);
	
	$.each(allThs, function(index, th){
		var atDate = $(th).data("atDate");
		var smemNo = $(th).data("smemNo");
		
		var targetElement = $(`[data-smem-no="${smemNo}"][data-at-date="${atDate}"]`);
		targetElement.find("select").val("출석");
		
	});
	
});

	

$(document).on("click","[data-fin-btn]",function(event){
	var finBtn = $(event.target).data("finBtn");
	console.log(finBtn);
	
	var dataList = [];
	
	var allThs = $(`[data-at-date="${finBtn}"]`);
	
	$.each(allThs, function(index, th){
		var atDate = $(th).data("atDate");
		var smemNo = $(th).data("smemNo");
		var targetElement = $(`[data-smem-no="${smemNo}"][data-at-date="${atDate}"]`);
		var atCode = targetElement.find("select").val();
		
		var data = {
			"atDate" : atDate,
			"smemNo" : smemNo,
			"atCode" : atCode
		};
		dataList.push(data);
	});
	
	console.log(" ===== dataList ==== : ",dataList);
	
	$.ajax({
	    url: window.location.pathname + "/attendDataEdit",
	    method: "POST",
	    data: JSON.stringify(dataList),
	    dataType: "json",
	    contentType: "application/json",
	    success: function(jsonObj) {
			
			if(jsonObj.success){
				Swal.fire({
			      title: '수정 성공',
			      text: "출결내용이 수정되었습니다.",
			      icon: 'success'
			    });
				getAttendData();
			}else{
				Swal.fire({
			      title: '수정 실패',
			      text: "서버에러",
			      icon: 'error'
			    });
			}

	    },
	    error: function(jqXHR, textStatus, errorThrown) {
	        console.error("AJAX 오류:", textStatus, errorThrown);
	    }
	});
	
	
});



































