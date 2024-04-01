/**
 * 
 */
const cpath = $("body").data("bodyCpath");

$("#attend").on("click",function(event){
	console.log("출석");
	
	$.ajax({
		url:window.location.pathname + "/attendDetail"
		, method:"get"
		, dataType : "json"
		, success:function(jsonObj){
			
			var weekMap = jsonObj.weekMap;
			var dayvoList = jsonObj.dayvoList;
			var conducted = jsonObj.conducted;
			var attendInfo = jsonObj.attendInfo;
			var attendList = attendInfo.attendList;
			var classCount = jsonObj.classCount;
			
			
			var attendTag = "";
			attendTag += `
			<div id="attendSpace">
				<div id="attendTableSpace" style="width:60%;">
					<span style="font-size: 15px; font-weight: 800;">출결 상세조회</span>
					<table id="attendTable" border="1" style="width:100%;">
						<thead id="attendThead">
							<tr>
								<th style="width: 15%;">주</th>
								<th style="width: 40%;">날짜</th>
								<th style="width: 15%;">요일</th>
								<th style="width: 15%;">출결</th>
								<th style="width: 15%;"></th>
							</tr>
						</thead>
						<tbody id="attendTbody">
						</tbody>
					</table>
				</div>
				<div id="attendInfoSpace" style="width:40%;">
					<span style="font-size: 15px; font-weight: 800;">출결 정보</span>
					<table id="infoTable" border="1">
						<tr>
							<th>총수업일</th>
							<td id="classCount">${classCount}</td>
						</tr>
						<tr>
							<th>실시일수</th>
							<td id="conducted">${attendInfo.conducted}</td>
						</tr>
						<tr>
							<th>출석(공결)</th>
							<td id="attendance">${attendInfo.attendance}</td>
						</tr>
						<tr>
							<th>결석</th>
							<td id="absent">${attendInfo.absent}</td>
						</tr>
						<tr>
							<th>조퇴</th>
							<td id="leave">${attendInfo.leave}</td>
						</tr>
						<tr>
							<th>지각</th>
							<td id="late">${attendInfo.late}</td>
						</tr>
					</table>
					<div id="percent" style=" margin-top: 20px;"></div>
					<div class="card chart-card" style="width: 100%; height: 270px;">
					    <div class="card-body" style="padding: 0px; display: flex; justify-content: center; align-items: center;">
					        <canvas id="chart1"></canvas>
					    </div>
					</div>
				</div>
			</div>
			`;
			
			$("#tagSpace").empty();
			$("#tagSpace").append(attendTag);
			
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
							<td style="color: ${atColor};">${atCode}</td>`;
				if(attend.atCode){
					tbodyTag += `<td><button type="button" style="height: 20px;" data-com-type="attend" data-at-No="${attend.atNo}" class="btn btn-success complaintBtn" onclick="$('#complaintModal').modal('show');">이의신청</button></td>`;
				}else{
					tbodyTag += `<td></td>`;
				}	
							
						`</tr>
					`;
					
				}else{
					tbodyTag += `
						<tr>
							<td>${attend.atDate}</td>
							<td>${d.dayName}</td>
							<td style="color: ${atColor};">${atCode}</td>`;
					if(attend.atCode){
						tbodyTag += `<td><button type="button" style="height: 20px;" data-com-type="attend" data-at-No="${attend.atNo}" class="btn btn-success complaintBtn" onclick="$('#complaintModal').modal('show');">이의신청</button></td>`;
					}else{
						tbodyTag += `<td></td>`;
					}	
								
							`</tr>
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
}).click();
$("#task").on("click",function(event){
	console.log("과제");
	$("#tagSpace").empty();
	
	$.ajax({
	    url: window.location.pathname + "/taskDetail",
	    method: "get",
	    dataType: "json",
	    success: function (jsonObj) {
		
			var taskListS = jsonObj.taskListS;
			
			var taskTag = "";
			
			$.each(taskListS, function(index,task){
				
				taskTag += `
					
					<div style="width:100%; display:flex; padding: 15px; border-radius: 15px; background-color: lightgray; margin-bottom: 15px;">
						<div style="width:50%; height: 200px; border-radius: 10px; background-color: white; margin-right: 15px; padding: 15px;">
							<div style="width:100%; display:flex;">
								<div style="width: 90%; margin-right: 15px;">
									<span class="fontStyle">${task.taskTitle}</span>
								</div>
								<div style="width: 10%; text-align: right;">
									<span style="width: 100%;" class="fontStyle">${task.totalScore}점</span>
								</div>
							</div>
							<div style="height: 50px; border-radius: 10xp; padding: 10px; background-color: AliceBlue; margin-bottom: 15px;">
								${task.taskContent}
							</div>
							<div class="fileBox" style="width: 100%; height: 80px; background-color: LightSteelBlue; border-radius: 10px; margin-bottom:5px; padding: 5px;">`;
							
				$.each(task.fileList, function(idx, f){
					
					taskTag += `
						<div style="width: 100%; max-width:100%; height: 20px; display:flex; background-color: white; border-radius: 10px; margin-bottom:2px; padding-left:10px;" data-gf-no="${f.gfNo}" data-file-no="${f.fileNo}">
							<div style="width: 80%;">${f.fileNm}</div>
							<div style="width: 15%; text-align: right; padding-right:10px;">${f.fancySize}</div>
							<div style="width: 5%;" data-gf-no="${f.gfNo}" data-file-no="${f.fileNo}" class="fileObj">
								<svg data-v-134867f8="" style="width:10px;" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="file-download" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512" class="svg-inline--fa fa-file-download fa-w-12"><path data-v-134867f8="" fill="currentColor" d="M224 136V0H24C10.7 0 0 10.7 0 24v464c0 13.3 10.7 24 24 24h336c13.3 0 24-10.7 24-24V160H248c-13.2 0-24-10.8-24-24zm76.45 211.36l-96.42 95.7c-6.65 6.61-17.39 6.61-24.04 0l-96.42-95.7C73.42 337.29 80.54 320 94.82 320H160v-80c0-8.84 7.16-16 16-16h32c8.84 0 16 7.16 16 16v80h65.18c14.28 0 21.4 17.29 11.27 27.36zM377 105L279.1 7c-4.5-4.5-10.6-7-17-7H256v128h128v-6.1c0-6.3-2.5-12.4-7-16.9z" class=""></path></svg>
							</div>
			 			</div>
					`;
					
				});
						
				var reply = task.taskSubmit.taskReply;	
				if(!reply) reply = "";
								
				taskTag +=	`</div>
						</div>
						<div style="width:50%; height: 200px; border-radius: 10px; background-color: PowderBlue; padding: 15px;">
							<div style="width:100%; display:flex;">
								<div style="width: 40%; margin-right: 15px;">
									<span class="fontStyle">과제제출</span>
								</div>
								<div style="width: 20%; text-align: right;">
									<span style="width: 100%;" class="fontStyle">${task.taskSubmit.submitStatus}</span>
								</div>
								<div style="width: 20%; text-align: right;">
									<span style="width: 100%;" class="fontStyle">${task.taskSubmit.taskScore}/${task.totalScore}점</span>
								</div>
								<div style="width: 20%; text-align: right;">
									<button type="button" style="height: 25px;" data-com-type="task" data-task-code="${task.taskCode}" class="btn btn-success complaintBtn" onclick="$('#complaintModal').modal('show');">이의신청</button>
								</div>
							</div>
							<div style="height: 50px; padding: 10px; border-radius: 10px; background-color: AliceBlue; margin-bottom: 15px;">
								${reply}
							</div>
							<div class="fileBox" style="width: 100%; height: 80px; background-color: LightSteelBlue; border-radius: 10px; margin-bottom:5px; padding: 5px;">`;
							
				$.each(task.taskSubmit.fileList, function(idx, f){
					
					taskTag += `
						<div style="width: 100%; max-width:100%; height: 20px; display:flex; background-color: white; border-radius: 10px; margin-bottom:2px; padding-left:10px;" data-gf-no="${f.gfNo}" data-file-no="${f.fileNo}">
							<div style="width: 80%;">${f.fileNm}</div>
							<div style="width: 15%; text-align: right; padding-right:10px;">${f.fancySize}</div>
							<div style="width: 5%;" data-gf-no="${f.gfNo}" data-file-no="${f.fileNo}" class="fileObj">
								<svg data-v-134867f8="" style="width:10px;" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="file-download" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512" class="svg-inline--fa fa-file-download fa-w-12"><path data-v-134867f8="" fill="currentColor" d="M224 136V0H24C10.7 0 0 10.7 0 24v464c0 13.3 10.7 24 24 24h336c13.3 0 24-10.7 24-24V160H248c-13.2 0-24-10.8-24-24zm76.45 211.36l-96.42 95.7c-6.65 6.61-17.39 6.61-24.04 0l-96.42-95.7C73.42 337.29 80.54 320 94.82 320H160v-80c0-8.84 7.16-16 16-16h32c8.84 0 16 7.16 16 16v80h65.18c14.28 0 21.4 17.29 11.27 27.36zM377 105L279.1 7c-4.5-4.5-10.6-7-17-7H256v128h128v-6.1c0-6.3-2.5-12.4-7-16.9z" class=""></path></svg>
							</div>
			 			</div>
					`;
					
				});
							
								
				taskTag +=	`</div>
						</div>
					</div>

				`;
				
			});
			
			
			$("#tagSpace").append(taskTag);
	    },
	    error: function (jqXHR, txt, status) {
	        console.log(txt, status, jqXHR);
	    }
	});
	
});
$("#teamproject").on("click",function(event){
	console.log("팀플");
	$("#tagSpace").empty();
	
	$.ajax({
	    url: window.location.pathname + "/teamProjectDetail",
	    method: "get",
	    dataType: "json",
	    success: function (jsonObj) {
		
			var projectListS = jsonObj.projectListS;
			
			var tpTag = "";
			
			$.each(projectListS, function(index,tp){
				
				tpTag += `
					
					<div style="width:100%; display:flex; padding: 15px; border-radius: 15px; background-color: lightgray; margin-bottom: 15px;">
						<div style="width:50%; height: 200px; border-radius: 10px; background-color: white; margin-right: 15px; padding: 15px;">
							<div style="width:100%; display:flex;">
								<div style="width: 90%; margin-right: 15px;">
									<span class="fontStyle">${tp.tpName}</span>
								</div>
								<div style="width: 10%; text-align: right;">
									<span style="width: 100%;" class="fontStyle">${tp.tpAssscore}점</span>
								</div>
							</div>
							<div class="fileBox" style="width: 100%; height: 80px; background-color: LightSteelBlue; border-radius: 10px; margin-bottom:5px; padding: 5px;">`;
							
				$.each(tp.fileList, function(idx, f){
					
					tpTag += `
						<div style="width: 100%; max-width:100%; height: 20px; display:flex; background-color: white; border-radius: 10px; margin-bottom:2px; padding-left:10px;" data-gf-no="${f.gfNo}" data-file-no="${f.fileNo}">
							<div style="width: 80%;">${f.fileNm}</div>
							<div style="width: 15%; text-align: right; padding-right:10px;">${f.fancySize}</div>
							<div style="width: 5%;" data-gf-no="${f.gfNo}" data-file-no="${f.fileNo}" class="fileObj">
								<svg data-v-134867f8="" style="width:10px;" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="file-download" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512" class="svg-inline--fa fa-file-download fa-w-12"><path data-v-134867f8="" fill="currentColor" d="M224 136V0H24C10.7 0 0 10.7 0 24v464c0 13.3 10.7 24 24 24h336c13.3 0 24-10.7 24-24V160H248c-13.2 0-24-10.8-24-24zm76.45 211.36l-96.42 95.7c-6.65 6.61-17.39 6.61-24.04 0l-96.42-95.7C73.42 337.29 80.54 320 94.82 320H160v-80c0-8.84 7.16-16 16-16h32c8.84 0 16 7.16 16 16v80h65.18c14.28 0 21.4 17.29 11.27 27.36zM377 105L279.1 7c-4.5-4.5-10.6-7-17-7H256v128h128v-6.1c0-6.3-2.5-12.4-7-16.9z" class=""></path></svg>
							</div>
			 			</div>
					`;
					
				});
						
				var comment = tp.team.teamComment;	
				if(!comment) comment = "";
								
				tpTag +=	`</div>
						</div>
						<div style="width:50%; height: 200px; border-radius: 10px; background-color: PowderBlue; padding: 15px;">
							<div style="width:100%; display:flex;">
								<div style="width: 40%; margin-right: 15px;">
									<span class="fontStyle">과제제출</span>
								</div>
								<div style="width: 20%; text-align: right;">
									<span style="width: 100%;" class="fontStyle">${tp.team.submitStatus}</span>
								</div>
								<div style="width: 20%; text-align: right;">
									<span style="width: 100%;" class="fontStyle">${tp.team.teamproScore}/${tp.tpAssscore}점</span>
								</div>
								<div style="width: 20%; text-align: right;">
									<button type="button" style="height: 25px;" data-com-type="teamproject" data-tp-no="${tp.tpNo}" class="btn btn-success complaintBtn" onclick="$('#complaintModal').modal('show');">이의신청</button>
								</div>
							</div>
							<div style="height: 50px; padding: 10px; border-radius: 10px; background-color: AliceBlue; margin-bottom: 15px;">
								${comment}
							</div>
							<div class="fileBox" style="width: 100%; height: 80px; background-color: LightSteelBlue; border-radius: 10px; margin-bottom:5px; padding: 5px;">`;
							
				$.each(tp.team.fileList, function(idx, f){
					
					tpTag += `
						<div style="width: 100%; max-width:100%; height: 20px; display:flex; background-color: white; border-radius: 10px; margin-bottom:2px; padding-left:10px;" data-gf-no="${f.gfNo}" data-file-no="${f.fileNo}">
							<div style="width: 80%;">${f.fileNm}</div>
							<div style="width: 15%; text-align: right; padding-right:10px;">${f.fancySize}</div>
							<div style="width: 5%;" data-gf-no="${f.gfNo}" data-file-no="${f.fileNo}" class="fileObj">
								<svg data-v-134867f8="" style="width:10px;" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="file-download" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512" class="svg-inline--fa fa-file-download fa-w-12"><path data-v-134867f8="" fill="currentColor" d="M224 136V0H24C10.7 0 0 10.7 0 24v464c0 13.3 10.7 24 24 24h336c13.3 0 24-10.7 24-24V160H248c-13.2 0-24-10.8-24-24zm76.45 211.36l-96.42 95.7c-6.65 6.61-17.39 6.61-24.04 0l-96.42-95.7C73.42 337.29 80.54 320 94.82 320H160v-80c0-8.84 7.16-16 16-16h32c8.84 0 16 7.16 16 16v80h65.18c14.28 0 21.4 17.29 11.27 27.36zM377 105L279.1 7c-4.5-4.5-10.6-7-17-7H256v128h128v-6.1c0-6.3-2.5-12.4-7-16.9z" class=""></path></svg>
							</div>
			 			</div>
					`;
					
				});
							
								
				tpTag +=	`</div>
						</div>
					</div>

				`;
				
			});
			
			$("#tagSpace").append(tpTag);
	    },
	    error: function (jqXHR, txt, status) {
	        console.log(txt, status, jqXHR);
	    }
	});
	
	
});
$("#test").on("click",function(event){
	console.log("시험");
	$("#tagSpace").empty();
	
	$.ajax({
	    url: window.location.pathname + "/testDetail",
	    method: "get",
	    dataType: "json",
	    success: function (jsonObj) {
		
			var stuTest = jsonObj.stuTest;
			
			var testTag = "";
			testTag += `
			    <div id="testTableSpace">
			        <span class="fontStyle">중간/기말</span>
			        <table id="testTable" border="1" style="width:100%; text-align: center;">
			            <tr style="height: 50px;">
			                <th style="width:50%;">중간</th><th style="width:50%;">기말</th>
			            </tr>
			            <tr style="height: 50px;">
			                <td>${stuTest.lgcMidterm}/100</td><td>${stuTest.lgcFinal}/100</td>
			            </tr>
			        </table>
			    </div>
			`;
			
			$("#tagSpace").append(testTag);
	    },
	    error: function (jqXHR, txt, status) {
	        console.log(txt, status, jqXHR);
	    }
	});
	
});

function getStudentInfoData(){
	
	$.ajax({
		url:window.location.pathname + "/stuGradeData"
		, method:"get"
		, dataType : "json"
		, success:function(jsonObj){
			
			var stuGrade = jsonObj.stuGrade;
			var lecturePlan = jsonObj.lecturePlan;
			var attendF = jsonObj.attendF;
			
			var attendS = stuGrade.lgcAttend;
			if (parseInt(stuGrade.lgcAttend) <= parseInt(attendF)) {
			    attendS = "F";
			}
			
			var stuInfoTableTag = `
				<tr>
					<th>이름</th><td>${stuGrade.memName}</td><th>학번</th><td>${stuGrade.smemNo}</td><th>학과</th><td>${stuGrade.deptName}</td>
				</tr>
			`;
			
			var stuGradeTableTdTag = `
				<td>${attendS}/${lecturePlan.lpAttendRef}</td>
				<td>${stuGrade.lgcTask}/${lecturePlan.lpTaskRef}</td>
				<td>${stuGrade.lgcMidterm}/${lecturePlan.lpTestRef /2}</td>
				<td>${stuGrade.lgcFinal}/${lecturePlan.lpTestRef /2}</td>
				<td>${stuGrade.lgcTotalscore}</td>
				<td>${stuGrade.lgcGrade}</td>
				<td>${stuGrade.lgcRanking}</td>
				<td>${stuGrade.lgcPercent}%</td>
			`;
			
			$("#stuInfoTable").empty();
			$("#stuInfoTable").append(stuInfoTableTag);
			
			$("#stuGradeTableTd").empty();
			$("#stuGradeTableTd").append(stuGradeTableTdTag);
			
		}, error : function(jqXHR, txt, status){
			console.log(txt, status, jqXHR);
		}
	});
	
}

getStudentInfoData();

$(document).on("click",".complaintBtn", function(event){
	
	$("#complaintForm")[0].reset(); 
	$("#complainDetail").find("[name='cptTitle']").val("");
	$("#complainDetail").find("[name='cptComment']").val("");
	
	var target = $(event.target);
	var comType = target.data("comType");
	var cptCode = ""
	
	if(comType == "attend"){
		cptCode = target.data("atNo");
		$("#complaintForm").find("[name='cptType']").val("출결");
	}
	if(comType == "task"){
		cptCode = target.data("taskCode");
		$("#complaintForm").find("[name='cptType']").val("과제");
	}
	if(comType == "teamproject"){
		cptCode = target.data("tpNo");
		$("#complaintForm").find("[name='cptType']").val("팀플");
	}
	$("#complaintForm").find("[name='cptCode']").val(cptCode);
	
	
});

$("#comSubmit").on("click", function(event){
	var cptTitle = $("#complaintModal").find("[name='cptTitle']").val();
	var cptComment = $("#complaintModal").find("[name='cptComment']").val();
	$("#complaintForm").find("[name='cptTitle']").val(cptTitle);
	$("#complaintForm").find("[name='cptComment']").val(cptComment);
	$("#complaintForm").submit();
});

//파일 다운로드
function fn_downloadFile(fileNo){
	let hiddenA = document.createElement("a");
	hiddenA.href = cpath + "/download/single?fileNo=" + fileNo;;
	hiddenA.click();
	hiddenA.remove();
}
function fn_downloadFiles(gfNo){
	let hiddenA = document.createElement("a");
	hiddenA.href = cpath + "/download/multipleGfNo?gfNo=" + gfNo;
	hiddenA.click();
	hiddenA.remove();
}
$(document).on("click", ".fileObj", function(event){
	var clickedElement = $(event.currentTarget); 
	var gfNo = clickedElement.data("gfNo");
	var fileNo = clickedElement.data("fileNo");
	fn_downloadFile(fileNo);
});










