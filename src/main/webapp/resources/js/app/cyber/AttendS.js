/**
 * 
 */
const cpath = $("body").data("bodyCpath");
console.log(cpath);
var attendance = "";
var absent = "";
var leave = "";
var late = "";

function getAttendData(){
	
	$.ajax({
		url:window.location.pathname + "/attendData"
		, method:"get"
		, dataType : "json"
		, success:function(jsonObj){
			
			var weekMap = jsonObj.weekMap;
			var dayvoList = jsonObj.dayvoList;
			var conducted = jsonObj.conducted;
			var attendInfo = jsonObj.attendInfo;
			var attendList = attendInfo.attendList;
			var classCount = jsonObj.classCount;
			
			$("#classCount").empty();
			$("#classCount").append(classCount);
			$("#conducted").empty();
			$("#conducted").append(attendInfo.conducted);
			$("#attendance").empty();
			$("#attendance").append(attendInfo.attendance);
			$("#absent").empty();
			$("#absent").append(attendInfo.absent);
			$("#leave").empty();
			$("#leave").append(attendInfo.leave);
			$("#late").empty();
			$("#late").append(attendInfo.late);
			
			attendance = attendInfo.attendance;
			absent = attendInfo.absent;
			leave = attendInfo.leave;
			late = attendInfo.late;
			
			var tbodyTag = "";
			
			var wCnt = 1;
			$.each(dayvoList, function(index,d){
				
				var week = Math.ceil((index + 1) / 2);
				var wNo = weekMap[week]; //주차별 수업일수
				var attend = attendList[index];
				
				var atColor = "black";
				var atCode = "";
				if(attend.atCode){
					atCode = attend.atCode;
					if(attend.atCode == "출석"){
						atColor = "blue";
					}else{
						atColor = "red";
					}
				}else{
					atCode = "-";
				}
				
				if(wCnt > wNo) wCnt = 1;
				
				if(wCnt == 1){
					
					tbodyTag += `
						<tr>
							<th rowspan="${wNo}">${week}주차</th>
							<td>${attend.atDate}</td>
							<td>${d.dayName}</td>
							<td style="color: ${atColor};">${atCode}</td>
						</tr>
					`;
					
				}else{
					tbodyTag += `
						<tr>
							<td>${attend.atDate}</td>
							<td>${d.dayName}</td>
							<td style="color: ${atColor};">${atCode}</td>
						</tr>
					`;
				}
				
				wCnt++;
			});
			
			$("#attendTbody").empty();
			$("#attendTbody").append(tbodyTag);
			
			$.ajax({
				url: cpath + "/manager/stu/criteria/attendancecriteria/attendCriteriaData"
				, method:"get"
				, dataType : "json"
				, success:function(jsonObj){
					
					var attendP = "";
					var leaveP = "";
					var lateP = "";
					var absentP = "";
					var f = "";
					
					attendCriteria = jsonObj.attendCriteria;
					$.each(attendCriteria, function(index, atc){
						if(atc.atcCode == "출석") {attendP = atc.atcPercent};
						if(atc.atcCode == "결석") {absentP = atc.atcPercent};
						if(atc.atcCode == "조퇴") {leaveP = atc.atcPercent};
						if(atc.atcCode == "지각") {lateP = atc.atcPercent};
						if(atc.atcCode == "F") {f = atc.atcPercent};
					});
					
					
					//나중에 수정해야함
					var percent = 0;
					percent += absent * (absentP/100);
					percent += attendance * (attendP/100);
					percent += leave * (leaveP/100);
					percent += late * (lateP/100);
					
					percent = (percent / conducted) * 100;
					percent = Math.ceil(percent); 
					
					if(percent <= f){
						percentTag = `
							<span style="font-size: 15px; font-weight: 800; color: red;">출석률 : F (${percent}%)</span>
						`;
					}else{
						percentTag = `
							<span style="font-size: 15px; font-weight: 800;">출석률 : ${percent}%</span>
						`;
					}
					
					
					$("#percent").append(percentTag);
					
					
				}, error : function(jqXHR, txt, status){
					console.log(txt, status, jqXHR);
				}
			});
			
			
			//차트 채우기
			var atCodes = ["출석","결석","조퇴","지각"];
			var atCodeData = [attendance,absent,leave,late];
			
			console.log(atCodeData);
				
			var data1 = {
				    labels: atCodes,
				    datasets: [{
				      data: atCodeData,
				      backgroundColor: [
				    	    '#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0'
				    	  ]
				    }]
				  };
			  var ctx1 = document.getElementById('chart1').getContext('2d');
			  var chart1 = new Chart(ctx1, {
			    type: 'pie',
			    data: data1,
			    options: {
				      plugins: {
				          title: {
				              display: true,
							  text: "출결"
				          },
				          legend: {
				              display: true,
				              position: 'bottom',
				              labels: {
				                  boxWidth: 10,
				                  usePointStyle: true
				                }
				          }
				      }
				  }
			  });
			
			
		}, error : function(jqXHR, txt, status){
			console.log(txt, status, jqXHR);
		}
	});
	
}

getAttendData();
























