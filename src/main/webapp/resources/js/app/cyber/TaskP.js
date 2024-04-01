/**
 * 
 */
const cpath = $("body").data("bodyCpath");
var currentTaskCode = "";
var deletefilesData = [];
var isnew = ""; //첫등록인지 임시저장 내용인지

//과제목록 탬 클릭시 선택된 내용의 과제목록이 띄워져야함
$("[data-task-status]").on("click",function(event){
	
	var clickedElement = $(event.currentTarget); 
	var taskStatus = clickedElement.data("taskStatus");
	
	let url = window.location.pathname + "/taskListData?taskStatus=" + taskStatus;
	let method = "get";
	let $taskListBody = $("#taskListBody");
	
	$.ajax({
		url:url
		, method:method
		, dataType : "json"
		, success:function(jsonObj){
			$taskListBody.empty();
			
			let dataList = jsonObj.taskList;
			
			let tags = "";
			
			if(dataList.length > 0){
				$.each(dataList, function(index, tsk){ //jquery 아닐떄 >> dataList.forEach(function(member)
					
					console.log(tsk.progressStatus.completionRate);
					
					if(taskStatus == "ST02" || taskStatus == "ST03" || taskStatus == "ST04"){
						tags += `
							<div class="card" style="margin-bottom:10px;">
								<div class="card-body media align-items-center">
				                    <div style="width: 30%; padding-right: 10px;">
				                        <span style="font-size: 17px;"><strong>${tsk.taskTitle}</strong></span><br>
				                        <span class="text-muted">${tsk.taskCode}</span>
				                    </div>
				                    <div style="width: 10%; max-width: 100%; padding-right: 10px;">
				                        <strong><svg data-v-134867f8="" style="width: 25px;" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="pen-nib" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="svg-inline--fa fa-pen-nib fa-w-16"><path data-v-134867f8="" fill="currentColor" d="M136.6 138.79a64.003 64.003 0 0 0-43.31 41.35L0 460l14.69 14.69L164.8 324.58c-2.99-6.26-4.8-13.18-4.8-20.58 0-26.51 21.49-48 48-48s48 21.49 48 48-21.49 48-48 48c-7.4 0-14.32-1.81-20.58-4.8L37.31 497.31 52 512l279.86-93.29a64.003 64.003 0 0 0 41.35-43.31L416 224 288 96l-151.4 42.79zm361.34-64.62l-60.11-60.11c-18.75-18.75-49.16-18.75-67.91 0l-56.55 56.55 128.02 128.02 56.55-56.55c18.75-18.75 18.75-49.15 0-67.91z" class=""></path></svg></strong>
				                        <strong><span class="text-muted" style="font-size: 20px;">${tsk.totalScore}</span></strong>
				                    </div>
				                    <div style="width: 20%;  max-width: 100%; padding-right: 10px;">
				                        <strong><svg data-v-134867f8="" style="width: 25px;" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="calendar-day" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" class="svg-inline--fa fa-calendar-day fa-w-14"><path data-v-134867f8="" fill="currentColor" d="M0 464c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48V192H0v272zm64-192c0-8.8 7.2-16 16-16h96c8.8 0 16 7.2 16 16v96c0 8.8-7.2 16-16 16H80c-8.8 0-16-7.2-16-16v-96zM400 64h-48V16c0-8.8-7.2-16-16-16h-32c-8.8 0-16 7.2-16 16v48H160V16c0-8.8-7.2-16-16-16h-32c-8.8 0-16 7.2-16 16v48H48C21.5 64 0 85.5 0 112v48h448v-48c0-26.5-21.5-48-48-48z" class=""></path></svg></strong>
				                        <strong><span class="text-muted" style="max-width: 100%; font-size: 15px;">${tsk.taskPeriod}</span></strong>
				                    </div>
				                    <div style="width: 30%;  max-width: 100%; padding-right: 10px; text-align: right;">
				                        <strong><span class="text-muted" style="max-width: 100%;">${tsk.progressStatus.completion}/${tsk.progressStatus.allCount}</span></strong>
					                    <div class="flex" style="max-width: 100%;">
				
			                                <div class="progress" style="height: 20px;">
			                                    <div class="progress-bar" role="progressbar" style="width: ${tsk.progressStatus.completionRate}%;" aria-valuenow="${tsk.progressStatus.completionRate}" aria-valuemin="0" aria-valuemax="100">${tsk.progressStatus.completionRate}%</div>
			                                </div>
			
			                            </div>
				                    </div>`;

						if(taskStatus == "ST03"){
							tags +=`
									 	<div style="width: 10%;  max-width: 100%; text-align: center;">
					                        <a href="javascript:fn_taskDetail_${taskStatus}('${tsk.taskCode}');" class="chip chip-outline-secondary" style="width: 60px;">평가</a>
										</div>
					                </div>
								</div>
							`;
						}else{
							tags +=`
									 	<div style="width: 10%;  max-width: 100%; text-align: center;">
					                        <a href="javascript:fn_taskDetail_${taskStatus}('${tsk.taskCode}');" class="chip chip-outline-secondary" style="width: 60px;">조회</a>
										</div>
					                </div>
								</div>
							`;
						}
						


				                   
										
					}else if(taskStatus == "ST01"){
						tags += `
							<div class="card" style="margin-bottom:10px;">
								<div class="card-body media align-items-center">
				                    <div style="width: 30%; padding-right: 10px;">
				                        <span style="font-size: 17px;"><strong>${tsk.taskTitle}</strong></span><br>
				                        <span class="text-muted">${tsk.taskCode}</span>
				                    </div>
				                    <div style="width: 10%; max-width: 100%; padding-right: 10px;">
				                        <strong><svg data-v-134867f8="" style="width: 25px;" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="pen-nib" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="svg-inline--fa fa-pen-nib fa-w-16"><path data-v-134867f8="" fill="currentColor" d="M136.6 138.79a64.003 64.003 0 0 0-43.31 41.35L0 460l14.69 14.69L164.8 324.58c-2.99-6.26-4.8-13.18-4.8-20.58 0-26.51 21.49-48 48-48s48 21.49 48 48-21.49 48-48 48c-7.4 0-14.32-1.81-20.58-4.8L37.31 497.31 52 512l279.86-93.29a64.003 64.003 0 0 0 41.35-43.31L416 224 288 96l-151.4 42.79zm361.34-64.62l-60.11-60.11c-18.75-18.75-49.16-18.75-67.91 0l-56.55 56.55 128.02 128.02 56.55-56.55c18.75-18.75 18.75-49.15 0-67.91z" class=""></path></svg></strong>
				                        <strong><span class="text-muted" style="font-size: 20px;">${tsk.totalScore}</span></strong>
				                    </div>
				                    <div style="width: 20%;  max-width: 100%; padding-right: 10px;">
				                        <strong><svg data-v-134867f8="" style="width: 25px;" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="calendar-day" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" class="svg-inline--fa fa-calendar-day fa-w-14"><path data-v-134867f8="" fill="currentColor" d="M0 464c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48V192H0v272zm64-192c0-8.8 7.2-16 16-16h96c8.8 0 16 7.2 16 16v96c0 8.8-7.2 16-16 16H80c-8.8 0-16-7.2-16-16v-96zM400 64h-48V16c0-8.8-7.2-16-16-16h-32c-8.8 0-16 7.2-16 16v48H160V16c0-8.8-7.2-16-16-16h-32c-8.8 0-16 7.2-16 16v48H48C21.5 64 0 85.5 0 112v48h448v-48c0-26.5-21.5-48-48-48z" class=""></path></svg></strong>
				                        <strong><span class="text-muted" style="max-width: 100%; font-size: 15px;">${tsk.taskPeriod}</span></strong>
				                    </div>
				                    <div style="width: 20%;  max-width: 100%; padding-right: 10px; text-align: right;">
				                    </div>
				                    <div style="width: 10%;  max-width: 100%; text-align: center;">
				                        <a href="javascript:fn_taskDetail_ST01('${tsk.taskCode}');" class="chip chip-outline-secondary" style="width: 60px;">조회</a>
				                    </div>
				                    <div style="width: 10%;  max-width: 100%; text-align: center;">
				                        <a href="javascript:fn_taskDelete('${tsk.taskCode}');" class="chip chip-outline-secondary" style="width: 60px;">삭제</a>
				                    </div>
				                </div>
							</div>
						`;
					}
					
				});
			}else{
				tags = `
					<span>과제가 없습니다.</span>
				`;
			}
			$taskListBody.append(tags);
		}, error : function(jqXHR, txt, status){
			console.log(txt, status, jqXHR);
		}
	});
	
	
});
//진행중 클릭(로딩하자마자)
$("[data-task-status=ST02]").click(); 

//과제 상세조회
function fn_taskDetail_ST02(taskCode){
	currentTaskCode = taskCode;
	fn_taskDetail(taskCode, "ST02");
}
function fn_taskDetail_ST03(taskCode){
	currentTaskCode = taskCode;
	fn_taskDetail(taskCode, "ST03");
}
function fn_taskDetail_ST04(taskCode){
	currentTaskCode = taskCode;
	fn_taskDetail(taskCode, "ST04");
}
function fn_taskDetail_ST01(taskCode){
	deletefilesData = [];
	currentTaskCode = taskCode;
	fn_taskDetailEdit(taskCode);
}


function fn_taskDetail(taskCode,status,callback){
	deletefilesData = [];
	let url = window.location.pathname + "/taskData?taskCode=" + taskCode;
	let method = "get";
	
	$.ajax({
		url:url
		, method:method
		, dataType : "json"
		, success:function(jsonObj){
			$("#taskDetailHeader").empty();
			$("#taskDetailBody").empty();
			$("#taskDetailSide").empty();
			
			var task = jsonObj.task;
			var taskSubmitList = jsonObj.taskSubmitList;
			
			var headerTag = "";
			var bodyTag = "";
			var sideTag = "";
			
			if(task != null){
				
				headerTag = `
					<div style="display:flex; width: 30%;" onclick="fn_taskDetail('${task.taskCode}','${status}')">
					<svg style="width: 30px;" data-v-134867f8="" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="home" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" class="svg-inline--fa fa-home fa-w-18"><path data-v-134867f8="" fill="currentColor" d="M280.37 148.26L96 300.11V464a16 16 0 0 0 16 16l112.06-.29a16 16 0 0 0 15.92-16V368a16 16 0 0 1 16-16h64a16 16 0 0 1 16 16v95.64a16 16 0 0 0 16 16.05L464 480a16 16 0 0 0 16-16V300L295.67 148.26a12.19 12.19 0 0 0-15.3 0zM571.6 251.47L488 182.56V44.05a12 12 0 0 0-12-12h-56a12 12 0 0 0-12 12v72.61L318.47 43a48 48 0 0 0-61 0L4.34 251.47a12 12 0 0 0-1.6 16.9l25.5 31A12 12 0 0 0 45.15 301l235.22-193.74a12.19 12.19 0 0 1 15.3 0L530.9 301a12 12 0 0 0 16.9-1.6l25.5-31a12 12 0 0 0-1.7-16.93z" class=""></path></svg>
			        <h3>${task.taskTitle}</h3>
					</div>
				`;
				
				if(status=="ST03"){
					headerTag += `
					<div style="margin-right:15px; width: 70%; text-align:right; margin-bottom:15px;">
						<button type="button" onclick="fn_taskEvaluationComplate('${task.taskCode}')" class="btn btn-outline-primary btn-rounded" style="width: 100px; margin-bottom:15px;">평가 적용</button>
					</div>
				`;
				}
				
				bodyTag = `
					
					<div style="display: flex; margin: 15px; width: 100%;">
					    <div id="taskScore" style="margin-bottom: 10px; width: 50%;">
					    	<strong><svg data-v-134867f8="" style="width: 30px;" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="pen-nib" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="svg-inline--fa fa-pen-nib fa-w-16"><path data-v-134867f8="" fill="currentColor" d="M136.6 138.79a64.003 64.003 0 0 0-43.31 41.35L0 460l14.69 14.69L164.8 324.58c-2.99-6.26-4.8-13.18-4.8-20.58 0-26.51 21.49-48 48-48s48 21.49 48 48-21.49 48-48 48c-7.4 0-14.32-1.81-20.58-4.8L37.31 497.31 52 512l279.86-93.29a64.003 64.003 0 0 0 41.35-43.31L416 224 288 96l-151.4 42.79zm361.34-64.62l-60.11-60.11c-18.75-18.75-49.16-18.75-67.91 0l-56.55 56.55 128.02 128.02 56.55-56.55c18.75-18.75 18.75-49.15 0-67.91z" class=""></path></svg></strong>
			                <strong><span class="text-muted" style="font-size: 20px; margin-left: 10px;">${task.totalScore}</span></strong>
					    </div>
					    <div id="taskPeriod" style="margin-bottom: 10px; width: 50%;">
					    	<strong><svg data-v-134867f8="" style="width: 30px;" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="calendar-day" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" class="svg-inline--fa fa-calendar-day fa-w-14"><path data-v-134867f8="" fill="currentColor" d="M0 464c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48V192H0v272zm64-192c0-8.8 7.2-16 16-16h96c8.8 0 16 7.2 16 16v96c0 8.8-7.2 16-16 16H80c-8.8 0-16-7.2-16-16v-96zM400 64h-48V16c0-8.8-7.2-16-16-16h-32c-8.8 0-16 7.2-16 16v48H160V16c0-8.8-7.2-16-16-16h-32c-8.8 0-16 7.2-16 16v48H48C21.5 64 0 85.5 0 112v48h448v-48c0-26.5-21.5-48-48-48z" class=""></path></svg></strong>
			                <strong><span class="text-muted" style="max-width: 100%; font-size: 20px; margin-left: 10px;">${task.taskPeriod}</span></strong>
					    </div>
				    </div>
				    <div id="taskContent" style="width: 100%; height: 150px; background-color: white; border-radius: 15px; margin-bottom: 15px; padding: 15px; ">
				    	${task.taskContent}
				    </div>
			    	<div id="fileBox" style="width: 100%; height: 100px; background-color: LightSteelBlue; border-radius: 10px; margin-bottom:5px; padding: 5px;">`;
				
				if(task.fileList.length > 0){
					$.each(task.fileList, function(index, f){
						bodyTag += `
				    		<div style="width: 100%; max-width:100%; height: 20px; display:flex; background-color: white; border-radius: 10px; margin-bottom:2px; padding-left:10px;" data-gf-no="${f.gfNo}" data-file-no="${f.fileNo}">
								<div style="width: 80%;">${f.fileNm}</div>
								<div style="width: 15%; text-align: right; padding-right:10px;">${f.fancySize}</div>
								<div style="width: 5%;" data-gf-no="${f.gfNo}" data-file-no="${f.fileNo}" class="fileObj">
									<svg data-v-134867f8="" style="width:10px;" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="file-download" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512" class="svg-inline--fa fa-file-download fa-w-12"><path data-v-134867f8="" fill="currentColor" d="M224 136V0H24C10.7 0 0 10.7 0 24v464c0 13.3 10.7 24 24 24h336c13.3 0 24-10.7 24-24V160H248c-13.2 0-24-10.8-24-24zm76.45 211.36l-96.42 95.7c-6.65 6.61-17.39 6.61-24.04 0l-96.42-95.7C73.42 337.29 80.54 320 94.82 320H160v-80c0-8.84 7.16-16 16-16h32c8.84 0 16 7.16 16 16v80h65.18c14.28 0 21.4 17.29 11.27 27.36zM377 105L279.1 7c-4.5-4.5-10.6-7-17-7H256v128h128v-6.1c0-6.3-2.5-12.4-7-16.9z" class=""></path></svg>
								</div>
				 			</div>
						`;
					});
				}
			
				bodyTag += `
					</div>
					<div style="width: 100%; text-align: right;">
				    	<a href="javascript:fn_downloadFiles('${task.gfNo}');" class="chip chip-outline-secondary" style="width: 100px;">다운로드</a>
					</div>
					`;
				
				if(taskSubmitList.length > 0){
					$.each(taskSubmitList, function(index, taskSubmit){
						
						var score = taskSubmit.taskScore;
						var scoreStatus = "";
						var sColor = "";
						if(score!=null){
							scoreStatus = "평가완료";
							sColor = "blue";
						}else{
							score = "0";
							scoreStatus = "평가미완";				
							sColor = "red";
						}	
						
						
						sideTag += `
							<div class="card taskSubmitObj" style="height: 50px; border-radius: 25px; margin:5px;" data-total-score="${task.totalScore}" data-status="${status}" data-smem-no="${taskSubmit.student.smemNo}" data-mem-name="${taskSubmit.student.memName}" data-dept-name="${taskSubmit.student.deptName}">
								<div class="card-body media align-items-center" style="padding: 5px; padding-left: 15px;">
				                    <div style="width: 70%; padding-right: 10px;">
				                        <span style="font-size: 12px;"><strong>${taskSubmit.student.memName}</strong><span class="text-muted">${taskSubmit.student.smemNo}</span></span><br>
				                        <span class="text-muted">${taskSubmit.student.deptName}</span>
				                    </div>
				                    <div style="width: 30%;  max-width: 100%; padding-right: 10px; text-align: right;">
				                    	<span style="font-size: 13px;"><strong>${taskSubmit.submitStatus}</strong></span><br>`;
					if(status == "ST03"){
				        sideTag += `    <span style="font-size: 10px;"><strong style="color:${sColor};">${scoreStatus}</strong></span>`;						
					}
				       	sideTag += `</div>
				                </div>
							</div>
						`;
					});
				}else{
					sideTag += '정보가 없습니다.';
				}
				
			
			}else{
				bodyTag = '정보가 없습니다.';
			}
			
			$("#taskDetailHeader").html(headerTag);
			$("#taskDetailBody").html(bodyTag);
			$("#taskDetailSide").html(sideTag);
			
			if (callback != null) {
				console.log("sdfsdfsdfsd=== : ",callback);
				$(`.taskSubmitObj[data-smem-no="${callback}"]`).click();
		    }
			
		}, error : function(jqXHR, txt, status){
			console.log(txt, status, jqXHR);
		}
	});
	
}

//ST01 >> 임시저장
function fn_taskDetailEdit(taskCode){
	
	isnew = false;
	
	let url = window.location.pathname + "/taskData?taskCode=" + taskCode;
	let method = "get";
	
	$.ajax({
		url:url
		, method:method
		, dataType : "json"
		, success:function(jsonObj){
			$("#taskDetailHeader").empty();
			$("#taskDetailBody").empty();
			$("#taskDetailSide").empty();
			
			var task = jsonObj.task;
			var taskSubmitList = jsonObj.taskSubmitList;
			
			var headerTag = "";
			var bodyTag = "";
			var sideTag = "";
			
			if(task != null){
				
				headerTag = `
					<div style="display:flex; width:100%;">
						<div style="width:30%;">
							<input type="text" name="taskTitle" class="form-control form-control-rounded" placeholder="과제제목" style=" margin-left: 10px; width: 100%;" value="${task.taskTitle}" required>
						</div>
						<div style="width:0%;">
							<input type="hidden" name="gfNo" value="${task.gfNo}">
						</div>
						<div style="width:60%; text-align: right;">
							<button type="submit" id="saveBtn" class="btn btn-outline-primary btn-rounded" style="width:100px; height: 40px; margin-left: 520px;">저장</button>
						</div>
						<div style="width:10%; text-align: right;">
							<button type="submit" id="uploadBtn" class="btn btn-outline-primary btn-rounded" style="width:100px; height: 40px; margin-left: 10px;">업로드</button>
						</div>
					</div>
				`;
				
				
				let formattedDate = formatDate(task.taskPeriod);
				
				
				bodyTag = `
					
					<div style="display: flex; margin: 15px;">
					    <div id="taskScore" style="margin-bottom: 10px; width: 50%; display:flex;">
					    	<strong><svg data-v-134867f8="" style="width: 30px;" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="pen-nib" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="svg-inline--fa fa-pen-nib fa-w-16"><path data-v-134867f8="" fill="currentColor" d="M136.6 138.79a64.003 64.003 0 0 0-43.31 41.35L0 460l14.69 14.69L164.8 324.58c-2.99-6.26-4.8-13.18-4.8-20.58 0-26.51 21.49-48 48-48s48 21.49 48 48-21.49 48-48 48c-7.4 0-14.32-1.81-20.58-4.8L37.31 497.31 52 512l279.86-93.29a64.003 64.003 0 0 0 41.35-43.31L416 224 288 96l-151.4 42.79zm361.34-64.62l-60.11-60.11c-18.75-18.75-49.16-18.75-67.91 0l-56.55 56.55 128.02 128.02 56.55-56.55c18.75-18.75 18.75-49.15 0-67.91z" class=""></path></svg></strong>
							<input type="number" name="totalScore" required class="form-control form-control-rounded" style="width:100px; margin-left: 10px;" placeholder="과제점수" value="${task.totalScore}">
					    </div>
					    <div id="taskPeriod" style="margin-bottom: 10px; width: 50%; display:flex;">
					    	<strong><svg data-v-134867f8="" style="width: 30px;" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="calendar-day" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" class="svg-inline--fa fa-calendar-day fa-w-14"><path data-v-134867f8="" fill="currentColor" d="M0 464c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48V192H0v272zm64-192c0-8.8 7.2-16 16-16h96c8.8 0 16 7.2 16 16v96c0 8.8-7.2 16-16 16H80c-8.8 0-16-7.2-16-16v-96zM400 64h-48V16c0-8.8-7.2-16-16-16h-32c-8.8 0-16 7.2-16 16v48H160V16c0-8.8-7.2-16-16-16h-32c-8.8 0-16 7.2-16 16v48H48C21.5 64 0 85.5 0 112v48h448v-48c0-26.5-21.5-48-48-48z" class=""></path></svg></strong>
							<input type="date" name="taskPeriod" required class="form-control form-control-rounded" style="width:200px; margin-left: 10px;" placeholder="과제기한" value="${formattedDate}">
					    </div>
				    </div>
					<textarea id="taskContent" name="taskContent" rows="2" cols="50" required style="width: 100%; height: 80px; background-color: white; border-radius: 10px; padding: 10px;">${task.taskContent}</textarea>
			    	<div id="fileBox" style="width: 100%; height: 100px; background-color: LightSteelBlue; border-radius: 10px; margin-bottom:10px; padding: 5px;">`;
				
				if(task.fileList.length > 0){
					$.each(task.fileList, function(index, f){
						bodyTag += `
				    		<div id="${f.fileNo}" style="width: 100%; max-width:100%; height: 20px; display:flex; background-color: white; border-radius: 10px; margin-bottom:2px; padding-left:10px;" data-gf-no="${f.gfNo}" data-file-no="${f.fileNo}">
								<div style="width: 75%;">${f.fileNm}</div>
								<div style="width: 15%; text-align: right; padding-right:10px;">${f.fancySize}</div>
								<div style="width: 5%;" data-gf-no="${f.gfNo}" data-file-no="${f.fileNo}" class="fileObj">
									<svg data-v-134867f8="" style="width:10px;" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="file-download" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512" class="svg-inline--fa fa-file-download fa-w-12"><path data-v-134867f8="" fill="currentColor" d="M224 136V0H24C10.7 0 0 10.7 0 24v464c0 13.3 10.7 24 24 24h336c13.3 0 24-10.7 24-24V160H248c-13.2 0-24-10.8-24-24zm76.45 211.36l-96.42 95.7c-6.65 6.61-17.39 6.61-24.04 0l-96.42-95.7C73.42 337.29 80.54 320 94.82 320H160v-80c0-8.84 7.16-16 16-16h32c8.84 0 16 7.16 16 16v80h65.18c14.28 0 21.4 17.29 11.27 27.36zM377 105L279.1 7c-4.5-4.5-10.6-7-17-7H256v128h128v-6.1c0-6.3-2.5-12.4-7-16.9z" class=""></path></svg>
								</div>
								<div style="width: 5%;" data-gf-no="${f.gfNo}" data-file-no="${f.fileNo}" class="deletefileObj">
									<svg data-v-134867f8="" style="width:10px;" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="times" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 352 512" class="svg-inline--fa fa-times fa-w-11"><path data-v-134867f8="" fill="currentColor" d="M242.72 256l100.07-100.07c12.28-12.28 12.28-32.19 0-44.48l-22.24-22.24c-12.28-12.28-32.19-12.28-44.48 0L176 189.28 75.93 89.21c-12.28-12.28-32.19-12.28-44.48 0L9.21 111.45c-12.28 12.28-12.28 32.19 0 44.48L109.28 256 9.21 356.07c-12.28 12.28-12.28 32.19 0 44.48l22.24 22.24c12.28 12.28 32.2 12.28 44.48 0L176 322.72l100.07 100.07c12.28 12.28 32.2 12.28 44.48 0l22.24-22.24c12.28-12.28 12.28-32.19 0-44.48L242.72 256z" class=""></path></svg>
								</div>
				 			</div>
						`;
					});
				}
			
				bodyTag += `
					</div>
					<div style="width: 100%; text-align: right;">
			    		<a href="javascript:fn_downloadFiles('${task.gfNo}');" class="chip chip-outline-secondary" style="width: 100px; margin-left: 470px;">다운로드</a>
					</div>
					<div class="custom-file" style="margin-top: 15px;" >
                       <input type="file" name="taskFiles" id="file" class="custom-file-input" multiple>
                       <label for="file" class="custom-file-label"></label>
                   </div>
				`;
			
			}else{
				bodyTag = '정보가 없습니다.';
			}
			
			$("#taskDetailHeader").html(headerTag);
			$("#taskDetailBody").html(bodyTag);
			$("#taskDetailSide").html(sideTag);
			
		}, error : function(jqXHR, txt, status){
			console.log(txt, status, jqXHR);
		}
	});
	
}

$(document).on("click", ".taskSubmitObj", function(event){
	
	var clickedElement = $(event.currentTarget); 
	var smemNo = clickedElement.data("smemNo");
	var memName = clickedElement.data("memName");
	var deptName = clickedElement.data("deptName");
	var totalScore = clickedElement.data("totalScore");
	var status = clickedElement.data("status");
	
	let url = window.location.pathname + "/taskSubmitData?taskCode=" + currentTaskCode + "&smemNo=" + smemNo;
	let method = "get";
	
	$.ajax({
		url:url
		, method:method
		, dataType : "json"
		, success:function(jsonObj){
			
			$("#taskDetailBody").empty();
			
			
			var taskSubmit = jsonObj.taskSubmit;
			var bodyTag = "";
			
			var score = taskSubmit.taskScore;
			var scoreStatus = "";
			var sColor = "";
			
			console.log("score   : ",score);
			if(score!=null){
				scoreStatus = "평가완료";
				sColor = "blue";
			}else{
				score = "0";
				scoreStatus = "평가미완";				
				sColor = "red";
			}	
			
			var taskReply = taskSubmit.taskReply;
			if(!taskReply){
				taskReply = "";
			}
			
			if(taskSubmit){
				bodyTag += `
					<div style="display: flex; margin: 15px;">
					    <div style="margin-bottom: 10px; width: 50%;">
			                <strong><span class="text-muted" style="font-size: 30px; margin-left: 10px; color:black;">${memName}<span style="font-size:15px; color:gray;">${smemNo}</span></span></strong><br/>
			                <strong><span class="text-muted" style="max-width: 100%; font-size: 15px; margin-left: 10px; color:gray;">${deptName}</span></strong>
					    </div>`;
				
				if(status == "ST03"){
					bodyTag += `<div style="margin-bottom: 10px; width: 50%; text-align:right;">
				                <strong><span style="max-width: 100%; font-size: 15px; margin-left: 10px;  color:${sColor};">${scoreStatus}</span><br></strong>
				                <strong><span class="text-muted" style="max-width: 100%; font-size: 25px; margin-left: 10px; color:gray;"><input id="taskScoreData" data-total-score="${totalScore}" style="font-size:20px; width: 50px; height: 30px; border-radius: 3px;" type="number" value="${score}" min="0" max="${totalScore}"/>/${totalScore}</span></strong>
						    </div>`;
				}else if(status == "ST04"){
					bodyTag += `<div style="margin-bottom: 10px; width: 50%; text-align:right;">
				                <strong><span style="max-width: 100%; font-size: 15px; margin-left: 10px; color:gray;">점수</span><br></strong></div>
				                <strong><span class="text-muted" style="max-width: 100%; font-size: 25px; margin-left: 10px; color:gray;">${score}/${totalScore}</span></strong>
							</div>`;
				}
	
				bodyTag += `</div>
			    	<div id="fileBox" style="width: 100%; height: 100px; background-color: LightSteelBlue; border-radius: 10px; margin-bottom:5px; padding: 5px;">
				`;
				
				if(taskSubmit.fileList.length > 0 && taskSubmit.submitStatus == "제출"){
					$.each(taskSubmit.fileList, function(index, f){
						bodyTag += `
				    		<div style="width: 100%; max-width:100%; height: 20px; display:flex; background-color: white; border-radius: 10px; margin-bottom:2px; padding-left:10px;" data-gf-no="${f.gfNo}" data-file-no="${f.fileNo}">
								<div style="width: 80%;">${f.fileNm}</div>
								<div style="width: 15%; text-align: right; padding-right:10px;">${f.fancySize}</div>
								<div style="width: 5%;" data-gf-no="${f.gfNo}" data-file-no="${f.fileNo}" class="fileObj">
									<svg data-v-134867f8="" style="width:10px;" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="file-download" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512" class="svg-inline--fa fa-file-download fa-w-12"><path data-v-134867f8="" fill="currentColor" d="M224 136V0H24C10.7 0 0 10.7 0 24v464c0 13.3 10.7 24 24 24h336c13.3 0 24-10.7 24-24V160H248c-13.2 0-24-10.8-24-24zm76.45 211.36l-96.42 95.7c-6.65 6.61-17.39 6.61-24.04 0l-96.42-95.7C73.42 337.29 80.54 320 94.82 320H160v-80c0-8.84 7.16-16 16-16h32c8.84 0 16 7.16 16 16v80h65.18c14.28 0 21.4 17.29 11.27 27.36zM377 105L279.1 7c-4.5-4.5-10.6-7-17-7H256v128h128v-6.1c0-6.3-2.5-12.4-7-16.9z" class=""></path></svg>
								</div>
				 			</div>
						`;
					});
				}
			
				bodyTag += `
					</div>
					<div style="width: 100%; text-align: right;">
			    		<a href="javascript:fn_downloadFiles('${taskSubmit.gfNo}');" class="chip chip-outline-secondary" style="width: 100px; margin-left: 470px;">다운로드</a>
					</div>`;
				
				
				//평가 댓글 쓰는 부분
				if(status == "ST03"){
					bodyTag += `
						<div style="margin-bottom: 0px;"><span style="font-size: 20px; font-weight: 700;">교수님 리뷰</span></div>
						<textarea id="taskReplyData" name="message" rows="2" cols="50" style="width: 100%; height: 60px; background-color: white; border-radius: 10px; padding: 10px;">${taskReply}</textarea>
						<div style="width:100%; text-align: center; margin-top:5px;">
							<button type="button" onclick="fn_oneScorefinish('${smemNo}')" class="btn btn-outline-primary btn-rounded" style="height: 30px; width: 100px; margin-right:0px;">평가 완료</button>
						</div>
					`;
				}else if(status == "ST04"){
					bodyTag += `
						<div style="margin-bottom: 0px;"><span style="font-size: 20px; font-weight: 700;">교수님 리뷰</span></div>
						<div id="taskReply" name="message" rows="4" cols="50" style="width: 100%; height: 60px; background-color: white; border-radius: 10px; padding: 10px;">
					    ${taskReply}
					    </div>
					`;
				}
				
			}else{
				
				bodyTag = "정보가 없습니다.";
				
			}
			
			$("#taskDetailBody").html(bodyTag);
			
		}, error : function(jqXHR, txt, status){
			console.log(txt, status, jqXHR);
		}
	});
	
});

//과제 등록
function fn_taskDetailForm(){
	
	isnew = true;
	
	$("#taskDetailHeader").empty();
	$("#taskDetailBody").empty();
	$("#taskDetailSide").empty();
	
	var headerTag = "";
	var bodyTag = "";
	var sideTag = "";
	
	
	headerTag = `
		<div style="display:flex; width:100%;">
			<div style="width:30%;">
				<input type="text" name="taskTitle" class="form-control form-control-rounded" placeholder="과제제목" style=" margin-left: 10px; width: 100%;">
			</div>
			<div style="width:60%; text-align: right;">
				<button type="submit" id="saveBtn" class="btn btn-outline-primary btn-rounded" style="width:100px; height: 40px; margin-left: 520px;">저장</button>
			</div>
			<div style="width:10%; text-align: right;">
				<button type="submit" id="uploadBtn" class="btn btn-outline-primary btn-rounded" style="width:100px; height: 40px; margin-left: 10px;">업로드</button>
			</div>
		</div>
	`;
	
	
	bodyTag = `
		
		<div style="display: flex; margin: 15px;">
		    <div id="taskScore" style="margin-bottom: 10px; width: 50%; display:flex;">
		    	<strong><svg data-v-134867f8="" style="width: 30px;" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="pen-nib" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="svg-inline--fa fa-pen-nib fa-w-16"><path data-v-134867f8="" fill="currentColor" d="M136.6 138.79a64.003 64.003 0 0 0-43.31 41.35L0 460l14.69 14.69L164.8 324.58c-2.99-6.26-4.8-13.18-4.8-20.58 0-26.51 21.49-48 48-48s48 21.49 48 48-21.49 48-48 48c-7.4 0-14.32-1.81-20.58-4.8L37.31 497.31 52 512l279.86-93.29a64.003 64.003 0 0 0 41.35-43.31L416 224 288 96l-151.4 42.79zm361.34-64.62l-60.11-60.11c-18.75-18.75-49.16-18.75-67.91 0l-56.55 56.55 128.02 128.02 56.55-56.55c18.75-18.75 18.75-49.15 0-67.91z" class=""></path></svg></strong>
				<input type="number" name="totalScore" class="form-control form-control-rounded" style="width:100px; margin-left: 10px;" placeholder="과제점수">
		    </div>
		    <div id="taskPeriod" style="margin-bottom: 10px; width: 50%; display:flex;">
		    	<strong><svg data-v-134867f8="" style="width: 30px;" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="calendar-day" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" class="svg-inline--fa fa-calendar-day fa-w-14"><path data-v-134867f8="" fill="currentColor" d="M0 464c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48V192H0v272zm64-192c0-8.8 7.2-16 16-16h96c8.8 0 16 7.2 16 16v96c0 8.8-7.2 16-16 16H80c-8.8 0-16-7.2-16-16v-96zM400 64h-48V16c0-8.8-7.2-16-16-16h-32c-8.8 0-16 7.2-16 16v48H160V16c0-8.8-7.2-16-16-16h-32c-8.8 0-16 7.2-16 16v48H48C21.5 64 0 85.5 0 112v48h448v-48c0-26.5-21.5-48-48-48z" class=""></path></svg></strong>
				<input type="date" name="taskPeriod" class="form-control form-control-rounded" style="width:200px; margin-left: 10px;" placeholder="과제기한">
		    </div>
	    </div>
		<textarea id="taskContent" name="taskContent" rows="2" cols="50" style="width: 100%; height: 80px; background-color: white; border-radius: 10px; padding: 10px;">과제내용을 입력해주세요</textarea>
    	`;
	
	bodyTag += `
		<div class="custom-file" style="margin-top: 15px;;" >
           <input type="file" name="taskFiles" id="file" class="custom-file-input" multiple>
           <label for="file" class="custom-file-label"></label>
       </div>
	`;
	
	
	$("#taskDetailHeader").html(headerTag);
	$("#taskDetailBody").html(bodyTag);
	$("#taskDetailSide").html(sideTag);

}


//평가 완료(한개에 대해서)
function fn_oneScorefinish(smemNo){
	var taskScore = $("#taskDetailBody").find("#taskScoreData").val();
	var taskReply = $("#taskDetailBody").find("#taskReplyData").val();
	var totalScore = $("#taskDetailBody").find("#taskScoreData").data("totalScore");
	
	if(taskScore > totalScore || taskScore < 0){
		alert("줄수 있는 점수는 0~" +totalScore + "점 입니다.");
		return;
	}
	
	data = {
		"taskScore":taskScore,
		"taskReply":taskReply,
		"taskCode":currentTaskCode,
		"smemNo":smemNo
	};
	
	let url = window.location.pathname + "/taskEvaluation";
	let method = "post";
	
	$.ajax({
		url:url
		, method:method
		, data:JSON.stringify(data)
		, dataType : "json"
		, contentType: "application/json"
		, success:function(jsonObj){
			console.log(jsonObj.success);
			if(jsonObj.success){
				fn_taskDetail(currentTaskCode, "ST03", smemNo);
			}else{
				alert(jsonObj.message);
			}
		}, error : function(jqXHR, txt, status){
			console.log(txt, status, jqXHR);
		}
	});
}


function fn_taskEvaluationComplate(taskCode){
	
	var notEvaluationCount = "";
	console.log(taskCode);
	
	let url = window.location.pathname + "/taskNotEvaluationCount?taskCode=" + taskCode;
	let method = "get";
	
	$.ajax({
		url:url
		, method:method
		, dataType : "json"
		, success:function(jsonObj){
			notEvaluationCount = jsonObj.count;
			
			if(notEvaluationCount > 0){
				Swal.fire({
						      title: '평가 실패',
						      text: "아직 모두 평가가 완료되지 않았습니다.",
						      icon: 'error'
						    });
				
				return;
			}
			
			url = window.location.pathname + "/taskStatusChange?taskCode=" + taskCode + "&taskStatus=" + "ST04";
			method = "get";
			
			$.ajax({
				url:url
				, method:method
				, dataType : "json"
				, success:function(jsonObj){
					console.log(jsonObj.success);
					if(jsonObj.success){
						Swal.fire({
						      title: '평가 완료',
						      text: '과제 평가가 완료되었습니다.',
						      icon: 'success'
						    });
						
						$("#taskDetailHeader").empty();
						$("#taskDetailBody").empty();
						$("#taskDetailSide").empty();
						
						$("[data-task-status='ST03']").click();
						
					}else{
						
						Swal.fire({
						      title: '평가 실패',
						      text: jsonObj.message,
						      icon: 'error'
						    });
					}
				}, error : function(jqXHR, txt, status){
					console.log(txt, status, jqXHR);
				}
			});
			
		}, error : function(jqXHR, txt, status){
			console.log(txt, status, jqXHR);
		}
	});
	
}

//파일삭제 클릭 임시 삭제 폼
$(document).on("click",".deletefileObj", function(event){
	var clickedElement = $(event.currentTarget); 
	var gfNo = clickedElement.data("gfNo");
	var fileNo = clickedElement.data("fileNo");
	
	deletefilesData.push(fileNo);
	
	$(`#${fileNo}`).remove();
	
});


var wantAction = "";
$(document).on("click","#saveBtn", function(event){
	wantAction = "save";
});
$(document).on("click","#uploadBtn", function(event){
	wantAction = "upload";
});
$(taskForm).on("submit",function(event){
	event.preventDefault();
	
	var $form = $(event.target);
	var formData = new FormData($form[0]);
	
	formData.append('isnew', isnew);
	formData.append('wantAction', wantAction);
	formData.append('taskCode', currentTaskCode);
	if(deletefilesData.length > 0){
		for(var data of deletefilesData)
		formData.append('deleteFiles', data);
	}
	
	var taskPeriod =  $(event.target).find("[name='taskPeriod']").val();
	var today = todayDate();
	
	//선택한 기한이 오늘날짜보다 더 전인지
	if(taskPeriod < today){
		alert("과제기한이 지났습니다.");
		return;
	}
	
	var url = window.location.pathname + "/taskSaveUpload";
	
	$.ajax({
	    url: url,
	    method: 'POST',
	    data: formData,
	    processData: false, // 필수: processData를 false로 설정하여 FormData를 직렬화하지 않음
	    contentType: false, // 필수: contentType을 false로 설정하여 기본 타입을 지정하지 않음
	    success: function(response) {
			
			console.log(response.success);
		
			if(response.success){
				Swal.fire({
			      title: '성공',
			      text: '성공하였습니다.',
			      icon: 'success'
			    });
			}else{
				Swal.fire({
			      title: '실패',
			      text: '서버에러',
			      icon: 'error'
			    });
			}
			
			$("#taskDetailHeader").empty();
			$("#taskDetailBody").empty();
			$("#taskDetailSide").empty();
			$("[data-task-status='ST01']").click();
			
	    },
	    error: function(xhr, status, error) {
	        // 에러 처리 코드
	    }
	});
		
	
});


function fn_taskDelete(taskCode){
	
	let url = window.location.pathname + "/taskDelete?taskCode=" + taskCode;
	let method = "get";
	
	$.ajax({
		url:url
		, method:method
		, dataType : "json"
		, success:function(jsonObj){
			if(jsonObj.success){
				Swal.fire({
			      title: '삭제 성공',
			      text: "삭제 성공하였습니다.",
			      icon: 'success'
			    });

			$("[data-task-status='ST01']").click();
			$("#taskpDetailHeader").empty();
			$("#taskDetailBody").empty();
			$("#taskDetailSide").empty();
			

			}else{
				
				Swal.fire({
			      title: '삭제 실패',
			      text: "서버에러",
			      icon: 'error'
			    })
	
			}
			
		}, error : function(jqXHR, txt, status){
			console.log(txt, status, jqXHR);
		}
	});
	
	
}

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



// 24/02/01 >> 2024-02-01
function formatDate(dateString) {
    // "24/01/26" 형식의 날짜 문자열을 "YYYY-MM-DD" 형식으로 변환
    let parts = dateString.split('/');
    let year = parts[0];
    let month = parts[1];
    let day = parts[2];
    return `20${year}-${month}-${day}`;
}
//2024-02-01
function todayDate(){
	var today = new Date();
	var year = today.getFullYear(); // 년도 가져오기
	var month = today.getMonth() + 1; // 월 가져오기 (0부터 시작하므로 +1)
	var day = today.getDate(); // 일 가져오기
	
	// 날짜를 원하는 형식으로 조합하여 출력
	var formattedDate = year + '-' + addZero(month) + '-' + addZero(day);
	
	return formattedDate;
}
// 숫자가 한 자리인 경우 앞에 0을 붙이는 함수
function addZero(num) {
    return num < 10 ? '0' + num : num;
}



/*시연데이터용*/
$("#taskEval").on("change", function(){
	$.ajax({
		url: window.location.pathname + "/taskEval"
		, method:"get"
		, dataType : "json"
		, success:function(jsonObj){
			$("[data-task-status='ST02']").click();
		}, error : function(jqXHR, txt, status){
			console.log(txt, status, jqXHR);
		}
	});
});










