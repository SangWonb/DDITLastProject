/**
 * 
 */
const cpath = $("body").data("bodyCpath");
var currentTpNo = "";
var deletefilesData = [];
var isnew = "";
const currentLecCode = $("#lecCodeInfo").data("lecCode");

//탬 클릭 시 해당 내용의 목록 조회
$("[data-tp-status]").on("click",function(event){
	
	var clickedElement = $(event.currentTarget); 
	var tpStatus = clickedElement.data("tpStatus");
	
	let url = window.location.pathname + "/tpListData?tpStatus=" + tpStatus;
	let method = "get";
	let $tpListBody = $("#tpListBody");
	
	$.ajax({
		url:url
		, method:method
		, dataType : "json"
		, success:function(jsonObj){
			$tpListBody.empty();
			
			let dataList = jsonObj.tpList;
			
			let tags = "";
			
			if(dataList.length > 0){
				$.each(dataList, function(index, tp){ //jquery 아닐떄 >> dataList.forEach(function(member)
					
					console.log(tp.progressStatus.completionRate);
					
					if(tpStatus == "ST02" || tpStatus == "ST03" || tpStatus == "ST04"){
						tags += `
							<div class="card" style="margin-bottom:10px;">
								<div class="card-body media align-items-center">
				                    <div style="width: 30%; padding-right: 10px;">
				                        <span style="font-size: 17px;"><strong>${tp.tpName}</strong></span><br>
				                        <span class="text-muted">${tp.tpNo}</span>
				                    </div>
				                    <div style="width: 10%; max-width: 100%; padding-right: 10px;">
				                        <strong><svg data-v-134867f8="" style="width: 25px;" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="pen-nib" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="svg-inline--fa fa-pen-nib fa-w-16"><path data-v-134867f8="" fill="currentColor" d="M136.6 138.79a64.003 64.003 0 0 0-43.31 41.35L0 460l14.69 14.69L164.8 324.58c-2.99-6.26-4.8-13.18-4.8-20.58 0-26.51 21.49-48 48-48s48 21.49 48 48-21.49 48-48 48c-7.4 0-14.32-1.81-20.58-4.8L37.31 497.31 52 512l279.86-93.29a64.003 64.003 0 0 0 41.35-43.31L416 224 288 96l-151.4 42.79zm361.34-64.62l-60.11-60.11c-18.75-18.75-49.16-18.75-67.91 0l-56.55 56.55 128.02 128.02 56.55-56.55c18.75-18.75 18.75-49.15 0-67.91z" class=""></path></svg></strong>
				                        <strong><span class="text-muted" style="font-size: 20px;">${tp.tpAssscore}</span></strong>
				                    </div>
				                    <div style="width: 20%;  max-width: 100%; padding-right: 10px;">
				                        <strong><svg data-v-134867f8="" style="width: 25px;" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="calendar-day" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" class="svg-inline--fa fa-calendar-day fa-w-14"><path data-v-134867f8="" fill="currentColor" d="M0 464c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48V192H0v272zm64-192c0-8.8 7.2-16 16-16h96c8.8 0 16 7.2 16 16v96c0 8.8-7.2 16-16 16H80c-8.8 0-16-7.2-16-16v-96zM400 64h-48V16c0-8.8-7.2-16-16-16h-32c-8.8 0-16 7.2-16 16v48H160V16c0-8.8-7.2-16-16-16h-32c-8.8 0-16 7.2-16 16v48H48C21.5 64 0 85.5 0 112v48h448v-48c0-26.5-21.5-48-48-48z" class=""></path></svg></strong>
				                        <strong><span class="text-muted" style="max-width: 100%; font-size: 15px;">${tp.tpDate}</span></strong>
				                    </div>
				                    <div style="width: 30%;  max-width: 100%; padding-right: 10px; text-align: right;">
				                        <strong><span class="text-muted" style="max-width: 100%;">${tp.progressStatus.completion}/${tp.progressStatus.allCount}</span></strong>
					                    <div class="flex" style="max-width: 100%;">
				
			                                <div class="progress" style="height: 20px;">
			                                    <div class="progress-bar" role="progressbar" style="width: ${tp.progressStatus.completionRate}%;" aria-valuenow="${tp.progressStatus.completionRate}" aria-valuemin="0" aria-valuemax="100">${tp.progressStatus.completionRate}%</div>
			                                </div>
			
			                            </div>
				                    </div>`;

						if(tpStatus == "ST03"){
							tags +=`
									 	<div style="width: 10%;  max-width: 100%; text-align: center;">
					                        <a href="javascript:fn_tpDetail_${tpStatus}('${tp.tpNo}');" class="chip chip-outline-secondary" style="width: 60px;">평가</a>
										</div>
					                </div>
								</div>
							`;
						}else{
							tags +=`
									 	<div style="width: 10%;  max-width: 100%; text-align: center;">
					                        <a href="javascript:fn_tpDetail_${tpStatus}('${tp.tpNo}');" class="chip chip-outline-secondary" style="width: 60px;">조회</a>
										</div>
					                </div>
								</div>
							`;
						}
						
										
					}else if(tpStatus == "ST01"){
						tags += `
							<div class="card" style="margin-bottom:10px;">
								<div class="card-body media align-items-center">
				                    <div style="width: 30%; padding-right: 10px;">
				                        <span style="font-size: 17px;"><strong>${tp.tpName}</strong></span><br>
				                        <span class="text-muted">${tp.tpNo}</span>
				                    </div>
				                    <div style="width: 10%; max-width: 100%; padding-right: 10px;">
				                        <strong><svg data-v-134867f8="" style="width: 25px;" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="pen-nib" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="svg-inline--fa fa-pen-nib fa-w-16"><path data-v-134867f8="" fill="currentColor" d="M136.6 138.79a64.003 64.003 0 0 0-43.31 41.35L0 460l14.69 14.69L164.8 324.58c-2.99-6.26-4.8-13.18-4.8-20.58 0-26.51 21.49-48 48-48s48 21.49 48 48-21.49 48-48 48c-7.4 0-14.32-1.81-20.58-4.8L37.31 497.31 52 512l279.86-93.29a64.003 64.003 0 0 0 41.35-43.31L416 224 288 96l-151.4 42.79zm361.34-64.62l-60.11-60.11c-18.75-18.75-49.16-18.75-67.91 0l-56.55 56.55 128.02 128.02 56.55-56.55c18.75-18.75 18.75-49.15 0-67.91z" class=""></path></svg></strong>
				                        <strong><span class="text-muted" style="font-size: 20px;">${tp.tpAssscore}</span></strong>
				                    </div>
				                    <div style="width: 20%;  max-width: 100%; padding-right: 10px;">
				                        <strong><svg data-v-134867f8="" style="width: 25px;" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="calendar-day" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" class="svg-inline--fa fa-calendar-day fa-w-14"><path data-v-134867f8="" fill="currentColor" d="M0 464c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48V192H0v272zm64-192c0-8.8 7.2-16 16-16h96c8.8 0 16 7.2 16 16v96c0 8.8-7.2 16-16 16H80c-8.8 0-16-7.2-16-16v-96zM400 64h-48V16c0-8.8-7.2-16-16-16h-32c-8.8 0-16 7.2-16 16v48H160V16c0-8.8-7.2-16-16-16h-32c-8.8 0-16 7.2-16 16v48H48C21.5 64 0 85.5 0 112v48h448v-48c0-26.5-21.5-48-48-48z" class=""></path></svg></strong>
				                        <strong><span class="text-muted" style="max-width: 100%; font-size: 15px;">${tp.tpDate}</span></strong>
				                    </div>
				                    <div style="width: 20%;  max-width: 100%; padding-right: 10px; text-align: right;">
				                    </div>
				                    <div style="width: 10%;  max-width: 100%; text-align: center;">
				                        <a href="javascript:fn_tpDetail_ST01('${tp.tpNo}');" class="chip chip-outline-secondary" style="width: 60px;">조회</a>
				                    </div>
				                    <div style="width: 10%;  max-width: 100%; text-align: center;">
				                        <a href="javascript:fn_tpDelete('${tp.tpNo}');" class="chip chip-outline-secondary" style="width: 60px;">삭제</a>
				                    </div>
				                </div>
							</div>
						`;
					}
					
				});
			}else{
				tags = `
					<span>프로젝트가 없습니다.</span>
				`;
			}
			$tpListBody.append(tags);
		}, error : function(jqXHR, txt, status){
			console.log(txt, status, jqXHR);
		}
	});
	
	
});

//진행중 클릭(로딩하자마자)
$("[data-tp-status=ST02]").click(); 

function fn_tpDetail_ST02(tpNo){
	currentTpNo = tpNo;
	fn_tpDetail(tpNo, "ST02");
}
function fn_tpDetail_ST03(tpNo){
	currentTpNo = tpNo;
	fn_tpDetail(tpNo, "ST03");
}
function fn_tpDetail_ST04(tpNo){
	currentTpNo = tpNo;
	fn_tpDetail(tpNo, "ST04");
}
function fn_tpDetail_ST01(tpNo){
	deletefilesData = [];
	currentTpNo = tpNo;
	fn_tpDetailForm(tpNo, "ST01");
}
function fn_tpAddAction(){ // 첫 등록
	fn_tpDetailForm('new', "ST00");
}


function fn_tpDetail(tpNo, status, callback){
	deletefilesData = [];
	
	var header = "";
	var tpBody = ""; // detailBody + detailMiddle + detailSide
	var detailBody = "";
	var detailSide = "";
	
	$("#tpDetailHeader").empty();
	$("#tpBody").empty();
	
	$.ajax({
		url: window.location.pathname + "/tpData?tpNo=" + tpNo
		, method:"get"
		, dataType : "json"
		, success:function(jsonObj){
			var tp = jsonObj.tp;
			var teamList = jsonObj.teamList;
			var tpDate = formatDate(tp.tpDate);
			
			header += `
				<div style="display:flex; width:80%;" onclick="fn_tpDetail('${tp.tpNo}','${status}')">
					<svg style="width: 30px;" data-v-134867f8="" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="home" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" class="svg-inline--fa fa-home fa-w-18"><path data-v-134867f8="" fill="currentColor" d="M280.37 148.26L96 300.11V464a16 16 0 0 0 16 16l112.06-.29a16 16 0 0 0 15.92-16V368a16 16 0 0 1 16-16h64a16 16 0 0 1 16 16v95.64a16 16 0 0 0 16 16.05L464 480a16 16 0 0 0 16-16V300L295.67 148.26a12.19 12.19 0 0 0-15.3 0zM571.6 251.47L488 182.56V44.05a12 12 0 0 0-12-12h-56a12 12 0 0 0-12 12v72.61L318.47 43a48 48 0 0 0-61 0L4.34 251.47a12 12 0 0 0-1.6 16.9l25.5 31A12 12 0 0 0 45.15 301l235.22-193.74a12.19 12.19 0 0 1 15.3 0L530.9 301a12 12 0 0 0 16.9-1.6l25.5-31a12 12 0 0 0-1.7-16.93z" class=""></path></svg>
			        <h3>${tp.tpName}</h3>
				</div>
			`;
			
			if(status=="ST03"){
				header += `
				<div style="margin-right:15px; margin-bottom:15px; width:20%; text-align: right;">
					<button type="button" onclick="fn_tpEvaluationComplate('${tp.tpNo}')" class="btn btn-outline-primary btn-rounded" style="width: 100px; margin-bottom:15px;">평가 적용</button>
				</div>
			`;
			}
			
			detailBody += `
				<div style="width: 70%; height: 400px; padding:15px; background-color: PowderBlue; border-radius: 10px; margin-right:10px;" id="tpDetailBody">
					<div style="display: flex; margin: 5px;">
					    <div id="tpAssscore" style="margin-bottom: 10px; width: 50%; display:flex;">
					    	<strong><svg data-v-134867f8="" style="width: 30px;" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="pen-nib" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="svg-inline--fa fa-pen-nib fa-w-16"><path data-v-134867f8="" fill="currentColor" d="M136.6 138.79a64.003 64.003 0 0 0-43.31 41.35L0 460l14.69 14.69L164.8 324.58c-2.99-6.26-4.8-13.18-4.8-20.58 0-26.51 21.49-48 48-48s48 21.49 48 48-21.49 48-48 48c-7.4 0-14.32-1.81-20.58-4.8L37.31 497.31 52 512l279.86-93.29a64.003 64.003 0 0 0 41.35-43.31L416 224 288 96l-151.4 42.79zm361.34-64.62l-60.11-60.11c-18.75-18.75-49.16-18.75-67.91 0l-56.55 56.55 128.02 128.02 56.55-56.55c18.75-18.75 18.75-49.15 0-67.91z" class=""></path></svg></strong>
					    	<strong><span class="text-muted" style="font-size: 20px; margin-left: 10px;">${tp.tpAssscore}</span></strong>
						</div>
					    <div id="tpDate" style="margin-bottom: 10px; width: 50%; display:flex;">
					    	<strong><svg data-v-134867f8="" style="width: 30px;" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="calendar-day" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" class="svg-inline--fa fa-calendar-day fa-w-14"><path data-v-134867f8="" fill="currentColor" d="M0 464c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48V192H0v272zm64-192c0-8.8 7.2-16 16-16h96c8.8 0 16 7.2 16 16v96c0 8.8-7.2 16-16 16H80c-8.8 0-16-7.2-16-16v-96zM400 64h-48V16c0-8.8-7.2-16-16-16h-32c-8.8 0-16 7.2-16 16v48H160V16c0-8.8-7.2-16-16-16h-32c-8.8 0-16 7.2-16 16v48H48C21.5 64 0 85.5 0 112v48h448v-48c0-26.5-21.5-48-48-48z" class=""></path></svg></strong>
							<strong><span class="text-muted" style="max-width: 100%; font-size: 20px; margin-left: 10px;">${tp.tpDate}</span></strong>
					    </div>
				    </div>
					<div>
						<span style="font-size: 15px; font-weight: 800; ">첨부파일</span>
					</div>
					<div id="fileBox" style="width: 100%; height: 100px; background-color: LightSteelBlue; border-radius: 10px; margin-bottom:5px; padding: 5px;">`;
					
			if(tp.fileList.length > 0){
				$.each(tp.fileList, function(index, f){
					detailBody += `
			    		<div id="${f.fileNo}" style="width: 100%; max-width:100%; height: 20px; display:flex; background-color: white; border-radius: 10px; margin-bottom:2px; padding-left:10px;" data-gf-no="${f.gfNo}" data-file-no="${f.fileNo}">
							<div style="width: 65%;">${f.fileNm}</div>
							<div style="width: 30%; text-align: right; padding-right:10px;">${f.fancySize}</div>
							<div style="width: 5%;" data-gf-no="${f.gfNo}" data-file-no="${f.fileNo}" class="fileObj">
								<svg data-v-134867f8="" style="width:10px;" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="file-download" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512" class="svg-inline--fa fa-file-download fa-w-12"><path data-v-134867f8="" fill="currentColor" d="M224 136V0H24C10.7 0 0 10.7 0 24v464c0 13.3 10.7 24 24 24h336c13.3 0 24-10.7 24-24V160H248c-13.2 0-24-10.8-24-24zm76.45 211.36l-96.42 95.7c-6.65 6.61-17.39 6.61-24.04 0l-96.42-95.7C73.42 337.29 80.54 320 94.82 320H160v-80c0-8.84 7.16-16 16-16h32c8.84 0 16 7.16 16 16v80h65.18c14.28 0 21.4 17.29 11.27 27.36zM377 105L279.1 7c-4.5-4.5-10.6-7-17-7H256v128h128v-6.1c0-6.3-2.5-12.4-7-16.9z" class=""></path></svg>
							</div>
			 			</div>
					`;
				});
			}
					
			detailBody += `</div>
					<div style="width: 100%; text-align: right;">
						<a href="javascript:fn_downloadFiles('${tp.gfNo}');" class="chip chip-outline-secondary" style="width: 100px; margin-left: 470px;">다운로드</a>
					</div>
				</div>
			`;
			
			detailSide += `
				<div style="width: 30%; height: 400px; padding:10px; background-color: AntiqueWhite; border-radius: 10px; margin-right:10px;" id="tpDetailMiddle">
					<div id="tpMiddleFlex" style="width: 100%; height: 370px; margin-top: 10px;">`;
			
			for(var team of teamList){
				
				var score = team.teamproScore;
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
				
				detailSide += `
					<div class="card teamObject" data-team-no="${team.teamNo}" data-tp-assscore="${tp.tpAssscore}" data-status="${status}" style="width: 100%; display: flex; padding: 0px; margin: 3px;">
			            <div class="card-header" style="height: 30px; display: flex; background-color: skyblue; padding-top: 5px; padding-bottom: 5px;">
			               <div>
							<span style="width:100px; height: 20px; font-size: 15px; font-weight: 800;">${team.teamName}</span>
							<span style="font-size: 13px; margin-left: 10px;"><strong>${team.submitStatus}</strong></span>
							</div>
							`;
							
				if(status == "ST03"){
			        detailSide += `<div><span style="font-size: 10px; position:absolute; right: 10px;"><strong style="color:${sColor};">${scoreStatus}</strong></span></div>`;						
				}
							
							
			    detailSide += `</div>
			            <div class="card-body" style="padding: 10px; min-height: 40px;">`;
			               
				for(var tm of team.teamMemberList){
					detailSide += `
						<div class="card teamObj" id="${tm.smemNo}" style="height: 30px; width:100%; border-radius: 15px; margin-left:0px; margin-bottom:5px;" data-smem-no="${tm.smemNo}" data-mem-name="${tm.memName}" data-dept-name="${tm.deptName}">
		                    <span style="font-size: 12px; padding: 5px; padding-left: 10px;"><strong>${tm.memName}</strong><span class="text-muted">${tm.smemNo}</span>|<span class="text-muted">${tm.deptName}</span></span><br>
						</div>
					`;
				}

			   detailSide += `</div>
					</div>
				`;
			}
					
			detailSide +=`</div>    	
				</div>`;
			
			
			tpBody += `
				<div class="card-body" style="width: 100%; display: flex; padding: 0px;">
					${detailBody}
					${detailSide}
				</div>
			`;
			
			$("#tpDetailHeader").html(header);
			$("#tpBody").html(tpBody);
			
			if (callback != null) {
				console.log("sdfsdfsdfsd=== : ",callback);
				$(`.teamObject[data-tp-no="${callback}"]`).click();
		    }
			
		}, error : function(jqXHR, txt, status){
			console.log(txt, status, jqXHR);
		}
	});
	
	
}

function fn_tpDetailForm(tpNo,status){
	
	deletefilesData = [];
	
	var header = "";
	var tpBody = ""; // detailBody + detailMiddle + detailSide
	var detailBody = "";
	var detailMiddle = "";
	var detailSide = "";
	
	$("#tpDetailHeader").empty();
	$("#tpBody").empty();
	
	if(status == "ST01"){
		isnew = false;
		
		$.ajax({
			url: window.location.pathname + "/tpData?tpNo=" + tpNo
			, method:"get"
			, dataType : "json"
			, success:function(jsonObj){
				var tp = jsonObj.tp;
				var teamList = jsonObj.teamList;
				var tpDate = formatDate(tp.tpDate);
				
				header += `
					<div style="display:flex; width:100%;">
						<div style="width:30%;">
							<input type="text" name="tpName" class="form-control form-control-rounded" placeholder="팀프로젝트 이름" style=" margin-left: 10px; width: 100%;" value="${tp.tpName}" required>
						</div>
						<div style="width:0%;">
							<input type="hidden" name="gfNo" value="${tp.gfNo}">
						</div>
						<div style="width:60%; text-align: right;">
							<button type="submit" id="saveBtn" class="btn btn-outline-primary btn-rounded" style="width:100px; height: 40px;">저장</button>
						</div>
						<div style="width:10%; text-align: right;">
							<button type="submit" id="uploadBtn" class="btn btn-outline-primary btn-rounded" style="width:100px; height: 40px;">업로드</button>
						</div>
					</div>
				`;
				
				detailBody += `
					<div style="width: 50%; height: 400px; padding:15px; background-color: PowderBlue; border-radius: 10px; margin-right:10px;" id="tpDetailBody">
						<div style="display:flex; margin: 5px;">
						    <div id="tpAssscore" style="margin-bottom: 10px; width: 50%; display:flex;">
						    	<strong><svg data-v-134867f8="" style="width: 30px;" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="pen-nib" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="svg-inline--fa fa-pen-nib fa-w-16"><path data-v-134867f8="" fill="currentColor" d="M136.6 138.79a64.003 64.003 0 0 0-43.31 41.35L0 460l14.69 14.69L164.8 324.58c-2.99-6.26-4.8-13.18-4.8-20.58 0-26.51 21.49-48 48-48s48 21.49 48 48-21.49 48-48 48c-7.4 0-14.32-1.81-20.58-4.8L37.31 497.31 52 512l279.86-93.29a64.003 64.003 0 0 0 41.35-43.31L416 224 288 96l-151.4 42.79zm361.34-64.62l-60.11-60.11c-18.75-18.75-49.16-18.75-67.91 0l-56.55 56.55 128.02 128.02 56.55-56.55c18.75-18.75 18.75-49.15 0-67.91z" class=""></path></svg></strong>
								<input type="number" name="tpAssscore" value="${tp.tpAssscore}" required class="form-control form-control-rounded" style="width:100px; margin-left: 10px;" placeholder="점수">
						    </div>
						    <div id="tpDate" style="margin-bottom: 10px; width: 50%; display:flex;">
						    	<strong><svg data-v-134867f8="" style="width: 30px;" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="calendar-day" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" class="svg-inline--fa fa-calendar-day fa-w-14"><path data-v-134867f8="" fill="currentColor" d="M0 464c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48V192H0v272zm64-192c0-8.8 7.2-16 16-16h96c8.8 0 16 7.2 16 16v96c0 8.8-7.2 16-16 16H80c-8.8 0-16-7.2-16-16v-96zM400 64h-48V16c0-8.8-7.2-16-16-16h-32c-8.8 0-16 7.2-16 16v48H160V16c0-8.8-7.2-16-16-16h-32c-8.8 0-16 7.2-16 16v48H48C21.5 64 0 85.5 0 112v48h448v-48c0-26.5-21.5-48-48-48z" class=""></path></svg></strong>
								<input type="date" name="tpDate" value="${tpDate}" required class="form-control form-control-rounded" style="width:200px; margin-left: 10px;" placeholder="기한">
						    </div>
					    </div>
						<div>
							<span style="font-size: 15px; font-weight: 800; ">첨부파일</span>
						</div>
						<div id="fileBox" style="width: 100%; height: 100px; background-color: LightSteelBlue; border-radius: 10px; margin-bottom:5px; padding: 5px;">`;
						
				if(tp.fileList.length > 0){
					$.each(tp.fileList, function(index, f){
						detailBody += `
				    		<div id="${f.fileNo}" style="width: 100%; max-width:100%; height: 20px; display:flex; background-color: white; border-radius: 10px; margin-bottom:2px; padding-left:10px;" data-gf-no="${f.gfNo}" data-file-no="${f.fileNo}">
								<div style="width: 70%;">${f.fileNm}</div>
								<div style="width: 20%; text-align: right; padding-right:10px;">${f.fancySize}</div>
								<div style="width: 5%; text-align: right;" data-gf-no="${f.gfNo}" data-file-no="${f.fileNo}" class="fileObj">
									<svg data-v-134867f8="" style="width:10px;" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="file-download" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512" class="svg-inline--fa fa-file-download fa-w-12"><path data-v-134867f8="" fill="currentColor" d="M224 136V0H24C10.7 0 0 10.7 0 24v464c0 13.3 10.7 24 24 24h336c13.3 0 24-10.7 24-24V160H248c-13.2 0-24-10.8-24-24zm76.45 211.36l-96.42 95.7c-6.65 6.61-17.39 6.61-24.04 0l-96.42-95.7C73.42 337.29 80.54 320 94.82 320H160v-80c0-8.84 7.16-16 16-16h32c8.84 0 16 7.16 16 16v80h65.18c14.28 0 21.4 17.29 11.27 27.36zM377 105L279.1 7c-4.5-4.5-10.6-7-17-7H256v128h128v-6.1c0-6.3-2.5-12.4-7-16.9z" class=""></path></svg>
								</div>
								<div style="width: 5%; text-align: right; margin-right: 10px;" data-gf-no="${f.gfNo}" data-file-no="${f.fileNo}" class="deletefileObj">
									<svg data-v-134867f8="" style="width:10px;" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="times" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 352 512" class="svg-inline--fa fa-times fa-w-11"><path data-v-134867f8="" fill="currentColor" d="M242.72 256l100.07-100.07c12.28-12.28 12.28-32.19 0-44.48l-22.24-22.24c-12.28-12.28-32.19-12.28-44.48 0L176 189.28 75.93 89.21c-12.28-12.28-32.19-12.28-44.48 0L9.21 111.45c-12.28 12.28-12.28 32.19 0 44.48L109.28 256 9.21 356.07c-12.28 12.28-12.28 32.19 0 44.48l22.24 22.24c12.28 12.28 32.2 12.28 44.48 0L176 322.72l100.07 100.07c12.28 12.28 32.2 12.28 44.48 0l22.24-22.24c12.28-12.28 12.28-32.19 0-44.48L242.72 256z" class=""></path></svg>
								</div>
				 			</div>
						`;
					});
				}
						
				detailBody += `</div>
						<a href="javascript:fn_downloadFiles('${tp.gfNo}');" class="chip chip-outline-secondary" style="width: 100px; margin-left: 470px;">다운로드</a>
						<div class="custom-file" style="margin-top: 15px;" >
			               <input type="file" name="teamProjectFiles" id="file" class="custom-file-input" multiple>
			               <label for="file" class="custom-file-label"></label>
			           </div>
					</div>
				`;
				
				detailMiddle += `
					<div style="width: 25%; height: 400px; padding:10px; background-color: Khaki; border-radius: 10px; margin-right:10px;" id="tpDetailMiddle">
						<div onmouseover="this.style.color = 'lightgray';" onmouseleave="this.style.color = 'black';" onclick="fn_tpAddTeam()">
			             	<span style="font-size: 15px; font-weight: 800;">팀 추가</span>
			             	<svg style="width:25px;" data-v-134867f8="" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="plus" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" class="svg-inline--fa fa-plus fa-w-14"><path data-v-134867f8="" fill="currentColor" d="M416 208H272V64c0-17.67-14.33-32-32-32h-32c-17.67 0-32 14.33-32 32v144H32c-17.67 0-32 14.33-32 32v32c0 17.67 14.33 32 32 32h144v144c0 17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32V304h144c17.67 0 32-14.33 32-32v-32c0-17.67-14.33-32-32-32z" class=""></path></svg>
			             </div>
						<div id="tpMiddleFlex" style="width: 100%; height: 340px; margin-top: 10px;">`;
				
				for(var team of teamList){
					detailMiddle += `
						<div class="card teamObject" style="width: 100%; display: flex; padding: 0px; margin: 3px;">
				            <div class="card-header" style="height: 30px; display: flex; background-color: skyblue; padding-top: 5px; padding-bottom: 5px;">
				               <div style="width: 60%;">
									<span><input type="text" name="teamName" value="${team.teamName}" data-team-no="${team.teamNo}" required class="form-control form-control-rounded" style="width:100px; height: 20px;" placeholder="팀명"/></span>
								</div>
								<div style="width: 40%; text-align: right;">
									<svg class="tpDelTeam" style="width: 15px; margin-left: 80px;" data-v-134867f8="" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="times" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 352 512" class="svg-inline--fa fa-times fa-w-11"><path data-v-134867f8="" fill="currentColor" d="M242.72 256l100.07-100.07c12.28-12.28 12.28-32.19 0-44.48l-22.24-22.24c-12.28-12.28-32.19-12.28-44.48 0L176 189.28 75.93 89.21c-12.28-12.28-32.19-12.28-44.48 0L9.21 111.45c-12.28 12.28-12.28 32.19 0 44.48L109.28 256 9.21 356.07c-12.28 12.28-12.28 32.19 0 44.48l22.24 22.24c12.28 12.28 32.2 12.28 44.48 0L176 322.72l100.07 100.07c12.28 12.28 32.2 12.28 44.48 0l22.24-22.24c12.28-12.28 12.28-32.19 0-44.48L242.72 256z" class=""></path></svg>
								</div>
				            </div>
				            <div class="card-body drop" style="padding: 10px; min-height: 40px;">`;
				               
					for(var tm of team.teamMemberList){
						detailMiddle += `
							<div class="card teamObj ele" id="${tm.smemNo}" draggable="true" style="height: 30px; width:100%; border-radius: 15px; margin-left:0px; margin-bottom:5px;" data-smem-no="${tm.smemNo}" data-mem-name="${tm.memName}" data-dept-name="${tm.deptName}">
			                    <span style="font-size: 12px; padding: 5px; padding-left: 10px;"><strong>${tm.memName}</strong><span class="text-muted">${tm.smemNo}</span>|<span class="text-muted">${tm.deptName}</span></span><br>
							</div>
						`;
					}

				   detailMiddle += `</div>
						</div>
					`;
				}
						
				detailMiddle +=`</div>    	
					</div>`;
				
				
				detailSide += `<div style="width: 25%; height: 400px; background-color: AntiqueWhite; border-radius: 10px; padding: 5px;" id="taskDetailSide">
									<div id="tpSideFlex" class="drop" style="width: 100%; height: 380px;">
									</div>
								</div>`;
				
				tpBody += `
					<div class="card-body" style="width: 100%; display: flex; padding: 0px;">
						${detailBody}
						${detailMiddle}
						${detailSide}
					</div>
				`;
				
				$("#tpDetailHeader").html(header);
				$("#tpBody").html(tpBody);
				
				
			}, error : function(jqXHR, txt, status){
				console.log(txt, status, jqXHR);
			}
		});
	}else{
		isnew = true;
		$.ajax({
			url: window.location.pathname + "/allStudentData"
			, method: "get"
			, dataType : "json"
			, success:function(jsonObj){
				var allStudent = jsonObj.allStudent;
				
				header += `
					<div style="display:flex; width:100%;">
						<div style="width:30%;">
							<input type="text" name="tpName" class="form-control form-control-rounded" placeholder="팀프로젝트 이름" style=" margin-left: 10px; width: 100%;" required>
						</div>
						<div style="width:0%;">
							<input type="hidden" name="gfNo">
						</div>
						<div style="width:60%; text-align: right;">
							<button type="submit" id="saveBtn" class="btn btn-outline-primary btn-rounded" style="width:100px; height: 40px;">저장</button>
						</div>
						<div style="width:10%; text-align: right;">
							<button type="submit" id="uploadBtn" class="btn btn-outline-primary btn-rounded" style="width:100px; height: 40px;">업로드</button>
						</div>
					</div>
				`;
				
				detailBody += `
					<div style="width: 50%; height: 400px; padding:15px; background-color: PowderBlue; border-radius: 10px; margin-right:10px;" id="tpDetailBody">
						<div style="display: flex; margin: 5px; width: 80%;">
						    <div id="tpAssscore" style="margin-bottom: 0px; width: 50%; display:flex; margin-right: 10px;">
						    	<strong><svg data-v-134867f8="" style="width: 25px;" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="pen-nib" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="svg-inline--fa fa-pen-nib fa-w-16"><path data-v-134867f8="" fill="currentColor" d="M136.6 138.79a64.003 64.003 0 0 0-43.31 41.35L0 460l14.69 14.69L164.8 324.58c-2.99-6.26-4.8-13.18-4.8-20.58 0-26.51 21.49-48 48-48s48 21.49 48 48-21.49 48-48 48c-7.4 0-14.32-1.81-20.58-4.8L37.31 497.31 52 512l279.86-93.29a64.003 64.003 0 0 0 41.35-43.31L416 224 288 96l-151.4 42.79zm361.34-64.62l-60.11-60.11c-18.75-18.75-49.16-18.75-67.91 0l-56.55 56.55 128.02 128.02 56.55-56.55c18.75-18.75 18.75-49.15 0-67.91z" class=""></path></svg></strong>
								<input type="number" name="tpAssscore" required class="form-control form-control-rounded" style="width:100px; margin -left: 5px;" placeholder="점수">
						    </div><br>
						    <div id="tpDate" style="margin-bottom: 10px; width: 50%; display:flex;">
						    	<strong><svg data-v-134867f8="" style="width: 25px;" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="calendar-day" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" class="svg-inline--fa fa-calendar-day fa-w-14"><path data-v-134867f8="" fill="currentColor" d="M0 464c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48V192H0v272zm64-192c0-8.8 7.2-16 16-16h96c8.8 0 16 7.2 16 16v96c0 8.8-7.2 16-16 16H80c-8.8 0-16-7.2-16-16v-96zM400 64h-48V16c0-8.8-7.2-16-16-16h-32c-8.8 0-16 7.2-16 16v48H160V16c0-8.8-7.2-16-16-16h-32c-8.8 0-16 7.2-16 16v48H48C21.5 64 0 85.5 0 112v48h448v-48c0-26.5-21.5-48-48-48z" class=""></path></svg></strong>
								<input type="date" name="tpDate" required class="form-control form-control-rounded" style="width:200px; margin-left: 5px;" placeholder="기한">
						    </div>
					    </div>
						<div>
							<span style="font-size: 15px; font-weight: 800; ">첨부파일</span>
						</div>
						<div class="custom-file" style="margin-top: 15px;" >
			               <input type="file" name="teamProjectFiles" id="file" class="custom-file-input" multiple>
			               <label for="file" class="custom-file-label"></label>
			           </div>
					</div>
				`;
				
				detailMiddle += `
					<div style="width: 25%; height: 400px; padding:10px; background-color: Khaki; border-radius: 10px; margin-right:10px;" id="tpDetailMiddle">
						<div onmouseover="this.style.color = 'lightgray';" onmouseleave="this.style.color = 'black';" onclick="fn_tpAddTeam()">
			             	<span style="font-size: 15px; font-weight: 800;">팀 추가</span>
			             	<svg style="width:25px;" data-v-134867f8="" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="plus" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" class="svg-inline--fa fa-plus fa-w-14"><path data-v-134867f8="" fill="currentColor" d="M416 208H272V64c0-17.67-14.33-32-32-32h-32c-17.67 0-32 14.33-32 32v144H32c-17.67 0-32 14.33-32 32v32c0 17.67 14.33 32 32 32h144v144c0 17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32V304h144c17.67 0 32-14.33 32-32v-32c0-17.67-14.33-32-32-32z" class=""></path></svg>
			             </div>
						<div id="tpMiddleFlex" style="width: 100%; height: 340px; margin-top: 10px;">
						</div>    	
					</div>
				`;
				
				detailSide += `<div style="width: 25%; height: 400px; background-color: AntiqueWhite; border-radius: 10px; padding: 5px;" id="taskDetailSide">
									<div id="tpSideFlex" class="drop" style="width: 100%; height: 380px;">`;
				for(var stu of allStudent){
					detailSide += `
						<div class="card teamObj ele" id="${stu.smemNo}" draggable="true" style="height: 30px; width:100%; border-radius: 15px; margin-left:0px; margin-bottom:5px;" data-smem-no="${stu.smemNo}" data-mem-name="${stu.memName}" data-dept-name="${stu.deptName}">
		                    <span style="font-size: 12px; padding: 5px; padding-left: 10px;"><strong>${stu.memName}</strong><span class="text-muted">${stu.smemNo}</span>|<span class="text-muted">${stu.deptName}</span></span><br>
						</div>
					`;	
				}
				detailSide += `		</div>
								</div>`;
				
				tpBody += `
					<div class="card-body" style="width: 100%; display: flex; padding: 0px;">
						${detailBody}
						${detailMiddle}
						${detailSide}
					</div>
				`;
				
				$("#tpDetailHeader").html(header);
				$("#tpBody").html(tpBody);
				
				
			}, error : function(jqXHR, txt, status){
				console.log(txt, status, jqXHR);
			}
		});
	}
	
}

$(document).on("click", ".teamObject", function(event){
	
	var clickedElement = $(event.currentTarget); 
	var teamNo = clickedElement.data("teamNo");
	var tpAssscore = clickedElement.data("tpAssscore");
	var status = clickedElement.data("status");
	
	let url = window.location.pathname + "/teamData?teamNo=" + teamNo;
	let method = "get";
	
	$.ajax({
		url:url
		, method:method
		, dataType : "json"
		, success:function(jsonObj){
			
			var team = jsonObj.team;
			tpDetailBody = $("#tpBody").find("#tpDetailBody");
			tpDetailBody.empty();
			var detailBody = "";
			
			var score = team.teamproScore;
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
			
			var teamComment = team.teamComment;
			if(!teamComment){
				teamComment = "";
			}
			
			if(team){
				detailBody += `
				
					<div style="display: flex; margin: 15px;">
					    <div style="margin-bottom: 10px; width: 50%;">
			                <strong><span class="text-muted" style="font-size: 30px; margin-left: 10px; color:black;">${team.teamName}</span></strong><br/>
					    </div>
				
				`;
				
				if(status == "ST03"){
					detailBody += `<div style="margin-bottom: 10px; width: 50%; text-align:right;">
				                <strong><span style="max-width: 100%; font-size: 15px; margin-left: 10px;  color:${sColor};">${scoreStatus}</span><br></strong>
				                <strong><span class="text-muted" style="max-width: 100%; font-size: 25px; margin-left: 10px; color:gray;"><input id="teamScoreData" data-tp-assscore="${tpAssscore}" style="font-size:20px; width: 50px; height: 30px; border-radius: 3px;" type="number" value="${score}" min="0" max="${tpAssscore}"/>/${tpAssscore}</span></strong>
						    </div>`;
				}else if(status == "ST04"){
					detailBody += `<div style="margin-bottom: 10px; width: 50%; text-align:right;">
				                <strong><span style="max-width: 100%; font-size: 15px; margin-left: 10px; color:gray;">점수</span><br></strong></div>
				                <strong><span class="text-muted" style="max-width: 100%; font-size: 25px; margin-left: 10px; color:gray;">${score}/${tpAssscore}</span></strong>
							</div>`;
				}
				
				detailBody += `</div>
			    	<div id="fileBox" style="width: 100%; height: 100px; background-color: LightSteelBlue; border-radius: 10px; margin-bottom:5px; padding: 5px;">
				`;
				
				if(team.fileList.length > 0 && team.submitStatus == "제출"){
					$.each(team.fileList, function(index, f){
						detailBody += `
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
				
				detailBody += `
					</div>
					<div style="width: 100%; text-align: right;">
			    		<a href="javascript:fn_downloadFiles('${team.gfNo}');" class="chip chip-outline-secondary" style="width: 100px; margin-left: 470px;">다운로드</a>
					</div>`;
				
				console.log(status);
				
				//평가 댓글 쓰는 부분
				if(status == "ST03"){
					detailBody += `
						<div style="margin-bottom: 0px;"><span style="font-size: 20px; font-weight: 700;">교수님 리뷰</span></div>
						<textarea id="teamCommentData" name="message" rows="2" cols="50" style="width: 100%; height: 60px; background-color: white; border-radius: 10px; padding: 10px;">${teamComment}</textarea>
						<div style="width:100%; text-align: center; margin-top:5px;">
							<button type="button" onclick="fn_oneScorefinish('${teamNo}')" class="btn btn-outline-primary btn-rounded" style="height: 30px; width: 100px; margin-right:0px;">평가 완료</button>
						</div>
					`;
				}else if(status == "ST04"){
					detailBody += `
						<div style="margin-bottom: 0px;"><span style="font-size: 20px; font-weight: 700;">교수님 리뷰</span></div>
						<div id="teamContent" name="message" rows="4" cols="50" style="width: 100%; height: 60px; background-color: white; border-radius: 10px; padding: 10px;">
					    ${teamComment}
					    </div>
					`;
				}
				
			}else{
				detailBody = "정보가 없습니다.";
			}
			
			tpDetailBody.html(detailBody);
			
			
		}, error : function(jqXHR, txt, status){
			console.log(txt, status, jqXHR);
		}
	});
	
	
});

//평가 완료(한개에 대해서)
function fn_oneScorefinish(teamNo){
	var teamScoreData = $("#tpDetailBody").find("#teamScoreData").val();
	var teamCommentData = $("#tpDetailBody").find("#teamCommentData").val();
	var totalScore = $("#tpDetailBody").find("#teamScoreData").data("tpAssscore");
	
	if(teamScoreData > totalScore || teamScoreData < 0){
		alert("줄수 있는 점수는 0~" +totalScore + "점 입니다.");
		return;
	}
	
	data = {
		"teamproScore":teamScoreData,
		"teamComment":teamCommentData,
		"teamNo":teamNo
	};
	
	let url = window.location.pathname + "/teamEvaluation";
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
				fn_tpDetail(currentTpNo, "ST03", teamNo);
			}else{
				alert(jsonObj.message);
			}
		}, error : function(jqXHR, txt, status){
			console.log(txt, status, jqXHR);
		}
	});
}


function fn_tpEvaluationComplate(tpNo){
	
	var notEvaluationCount = "";
	
	let url = window.location.pathname + "/tpNotEvaluationCount?tpNo=" + tpNo;
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
			
			url = window.location.pathname + "/tpStatusChange?tpNo=" + tpNo + "&tpStatus=" + "ST04";
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
						
						$("#tpDetailHeader").empty();
						$("#tpBody").empty();
						
						$("[data-tp-status='ST03']").click();
						
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



function fn_tpDelete(tpNo){
	
	let url = window.location.pathname + "/tpDelete?tpNo=" + tpNo;
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

			$("[data-tp-status='ST01']").click();
			$("#tpDetailHeader").empty();
			$("#tpBody").empty();
			
			

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


function fn_tpAddTeam(){
	
	var teamObj = `
		<div class="card teamObject" style="width: 100%; display: flex; padding: 0px; margin: 3px;">
            <div class="card-header" style="height: 30px; display: flex; background-color: skyblue; padding-top: 5px; padding-bottom: 5px;">
               <div style="width: 60%;">
					<span><input type="text" name="teamName" data-team-no="" required class="form-control form-control-rounded" style="width:100px; height: 20px;" placeholder="팀명"/></span>
				</div>
				<div style="width: 40%; text-align: right;">
					<svg class="tpDelTeam" style="width: 15px;" data-v-134867f8="" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="times" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 352 512" class="svg-inline--fa fa-times fa-w-11"><path data-v-134867f8="" fill="currentColor" d="M242.72 256l100.07-100.07c12.28-12.28 12.28-32.19 0-44.48l-22.24-22.24c-12.28-12.28-32.19-12.28-44.48 0L176 189.28 75.93 89.21c-12.28-12.28-32.19-12.28-44.48 0L9.21 111.45c-12.28 12.28-12.28 32.19 0 44.48L109.28 256 9.21 356.07c-12.28 12.28-12.28 32.19 0 44.48l22.24 22.24c12.28 12.28 32.2 12.28 44.48 0L176 322.72l100.07 100.07c12.28 12.28 32.2 12.28 44.48 0l22.24-22.24c12.28-12.28 12.28-32.19 0-44.48L242.72 256z" class=""></path></svg>
				</div>
            </div>
            <div class="card-body drop" style="padding: 10px; min-height: 40px;">
               
            </div>
		</div>
	`;
	$("#tpMiddleFlex").append(teamObj);
}

$(document).on("click",".card .tpDelTeam", function(){
	$(this).closest(".card").remove();
});

var wantAction = "";
$(document).on("click","#saveBtn",function(){
	wantAction = "save";
});
$(document).on("click","#uploadBtn",function(){
	wantAction = "upload";
});
$(tpForm).on("submit", function(event){
	event.preventDefault();
	
	var $form = $(event.target);
	var formData = new FormData($form[0]);
	
	
	var listTeamvo = [];
	
	var teams = $("#tpMiddleFlex").find(".card.teamObject");
	for (var team of teams) {
		var smemNos = [];
	    var teamName = $(team).find("input[name='teamName']").val();
	    var teamNo = $(team).find("input[name='teamName']").data("teamNo");
	    var tms = $(team).find(".card.teamObj.ele");
	    for (var tm of tms) {
	        var smemNo = $(tm).data("smemNo");
			smemNos.push(smemNo);
	    }
		var teamvo = {
			"teamNo" : teamNo,
			"teamName" : teamName,
			"smemNos" : smemNos
		};
		listTeamvo.push(teamvo);
	}
	
	formData.append('listTeamvo', JSON.stringify(listTeamvo));
	formData.append('isnew', isnew);
	formData.append('wantAction', wantAction);
	formData.append('tpNo', currentTpNo);
	if(deletefilesData.length > 0){
		for(var data of deletefilesData)
		formData.append('deleteFiles', data);
	}
	
	var tpDate =  $(event.target).find("[name='tpDate']").val();
	var today = todayDate();
	
	//선택한 기한이 오늘날짜보다 더 전인지
	if(tpDate < today){
		alert("과제기한이 지났습니다.");
		return;
	}
	
	$.ajax({
	    url: window.location.pathname + "/tpSaveUpload",
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
			
			$("#tpDetailHeader").empty();
			$("#tpBody").empty();
			$("[data-tp-status='ST01']").click();
			
	    },
	    error: function(xhr, status, error) {
	        // 에러 처리 코드
	    }
	});
	
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

//파일삭제 클릭 임시 삭제 폼
$(document).on("click",".deletefileObj", function(event){
	console.log("오긴하니?");
	
	var clickedElement = $(event.currentTarget); 
	var gfNo = clickedElement.data("gfNo");
	var fileNo = clickedElement.data("fileNo");
	
	deletefilesData.push(fileNo);
	
	$(`#${fileNo}`).remove();
	
	console.log("==del== : ",deletefilesData);
	
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
$("#tpEval").on("change", function(){
	$.ajax({
		url: window.location.pathname + "/tpEval"
		, method:"get"
		, dataType : "json"
		, success:function(jsonObj){
			$("[data-tp-status='ST02']").click();
		}, error : function(jqXHR, txt, status){
			console.log(txt, status, jqXHR);
		}
	});
});


/*시연데이터용*/
$("#tpInsert").on("change", function(){
	var today = new Date();
	var formattedDate = today.toISOString().split('T')[0];
	
	$("#tpForm").find("input[name='tpName']").val("협동의 이해");
	$("#tpForm").find("input[name='tpAssscore']").val(10);
	$("#tpForm").find("input[name='tpDate']").val(formattedDate);
});








