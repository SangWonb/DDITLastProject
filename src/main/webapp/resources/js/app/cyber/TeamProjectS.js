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
					var fColor = "";
					if(tp.submitStatus == "제출"){
						fColor = "blue";
					}else{
						fColor = "red";
					}
					
					tags += `
						<div class="card" style="margin-bottom:10px;">
							<div class="card-body media align-items-center">
			                    <div style="width: 50%; padding-right: 10px;">
			                        <span style="font-size: 17px;"><strong>${tp.tpName}</strong></span><br>
			                        <span class="text-muted">${tp.tpNo}</span>
			                    </div>
			                    <div style="width: 15%; max-width: 100%; padding-right: 10px;">
			                        <strong><svg data-v-134867f8="" style="width: 25px;" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="pen-nib" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="svg-inline--fa fa-pen-nib fa-w-16"><path data-v-134867f8="" fill="currentColor" d="M136.6 138.79a64.003 64.003 0 0 0-43.31 41.35L0 460l14.69 14.69L164.8 324.58c-2.99-6.26-4.8-13.18-4.8-20.58 0-26.51 21.49-48 48-48s48 21.49 48 48-21.49 48-48 48c-7.4 0-14.32-1.81-20.58-4.8L37.31 497.31 52 512l279.86-93.29a64.003 64.003 0 0 0 41.35-43.31L416 224 288 96l-151.4 42.79zm361.34-64.62l-60.11-60.11c-18.75-18.75-49.16-18.75-67.91 0l-56.55 56.55 128.02 128.02 56.55-56.55c18.75-18.75 18.75-49.15 0-67.91z" class=""></path></svg></strong>
			                        <strong><span class="text-muted" style="font-size: 20px;">${tp.tpAssscore}</span></strong>
			                    </div>
			                    <div style="width: 15%;  max-width: 100%; padding-right: 10px;">
			                        <strong><svg data-v-134867f8="" style="width: 25px;" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="calendar-day" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" class="svg-inline--fa fa-calendar-day fa-w-14"><path data-v-134867f8="" fill="currentColor" d="M0 464c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48V192H0v272zm64-192c0-8.8 7.2-16 16-16h96c8.8 0 16 7.2 16 16v96c0 8.8-7.2 16-16 16H80c-8.8 0-16-7.2-16-16v-96zM400 64h-48V16c0-8.8-7.2-16-16-16h-32c-8.8 0-16 7.2-16 16v48H160V16c0-8.8-7.2-16-16-16h-32c-8.8 0-16 7.2-16 16v48H48C21.5 64 0 85.5 0 112v48h448v-48c0-26.5-21.5-48-48-48z" class=""></path></svg></strong>
			                        <strong><span class="text-muted" style="max-width: 100%; font-size: 15px;">${tp.tpDate}</span></strong>
			                    </div>
			                    <div style="width: 10%;  max-width: 100%; padding-right: 10px; text-align: right;">
									<strong><span style="max-width: 100%; font-size: 15px; color: ${fColor};">${tp.submitStatus}</span></strong>
			                    </div>
								<div style="width: 10%;  max-width: 100%; text-align: center;">
			                        <a href="javascript:fn_tpDetail_${tpStatus}('${tp.tpNo}');" class="chip chip-outline-secondary" style="width: 60px;">조회</a>
								</div>
			                </div>
						</div>
					`;
						
										
					
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


function fn_tpDetail(tpNo, status, callback){
	deletefilesData = [];
	
	var header = "";
	var detailMiddle = "";
	var detailBody = "";
	var detailSide = "";
	
	$("#tpDetailHeader").empty();
	$("#tpDetailMiddle").empty();
	$("#tpDetailBody").empty();
	$("#tpDetailSide").empty();
	
	$.ajax({
		url: window.location.pathname + "/tpData?tpNo=" + tpNo
		, method:"get"
		, dataType : "json"
		, success:function(jsonObj){
			var tp = jsonObj.tp;
			var team = jsonObj.team;
			
			header += `
				<div style="display:flex; width:100%;" onclick="fn_tpDetail('${tp.tpNo}','${status}')">
					<svg style="width: 30px;" data-v-134867f8="" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="home" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" class="svg-inline--fa fa-home fa-w-18"><path data-v-134867f8="" fill="currentColor" d="M280.37 148.26L96 300.11V464a16 16 0 0 0 16 16l112.06-.29a16 16 0 0 0 15.92-16V368a16 16 0 0 1 16-16h64a16 16 0 0 1 16 16v95.64a16 16 0 0 0 16 16.05L464 480a16 16 0 0 0 16-16V300L295.67 148.26a12.19 12.19 0 0 0-15.3 0zM571.6 251.47L488 182.56V44.05a12 12 0 0 0-12-12h-56a12 12 0 0 0-12 12v72.61L318.47 43a48 48 0 0 0-61 0L4.34 251.47a12 12 0 0 0-1.6 16.9l25.5 31A12 12 0 0 0 45.15 301l235.22-193.74a12.19 12.19 0 0 1 15.3 0L530.9 301a12 12 0 0 0 16.9-1.6l25.5-31a12 12 0 0 0-1.7-16.93z" class=""></path></svg>
			        <h3>${tp.tpName}</h3>
				</div>
			`;
			
			detailBody += `
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
					<a href="javascript:fn_downloadFiles('${tp.gfNo}');" class="chip chip-outline-secondary" style="width: 100px; margin-left: 200px;">다운로드</a>
				</div>
			`;
			
			
			detailMiddle += `
				<div><h4>프로젝트 제출</h4></div>`;
			
			if(status == "ST02" && team.submitStatus == "미제출"){
				detailMiddle +=`
					<div class="custom-file" style="margin-bottom: 15px; width:100%;" >
			           <input type="file" name="teamFiles" id="file" class="custom-file-input" multiple>
			           <label for="file" class="custom-file-label"></label>
			       </div>
					<input type="hidden" name="tpNo" value="${tp.tpNo}"/>
					<input type="hidden" name="gfNo" value="${team.gfNo}"/>
					<input type="hidden" name="teamNo" value="${team.teamNo}"/>
				`;
			}
			

			detailMiddle +=`
				<div id="tpfileBox" style="width: 100%; height: 100px; background-color: LightSteelBlue; border-radius: 10px; margin-bottom:5px; padding: 5px;">`;
			
			if(team.submitStatus == "제출"){
				$.each(team.fileList, function(index, f){
					detailMiddle += `
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
			
			
			if(status == "ST02" && team.submitStatus == "미제출"){
				
				$.each(team.fileList, function(index, f){
					detailMiddle += `
			    		<div id="${f.fileNo}" style="width: 100%; max-width:100%; height: 20px; display:flex; background-color: white; border-radius: 10px; margin-bottom:2px; padding-left:10px;" data-gf-no="${f.gfNo}" data-file-no="${f.fileNo}">
							<div style="width: 60%;">${f.fileNm}</div>
							<div style="width: 30%; text-align: right; padding-right:10px;">${f.fancySize}</div>
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
			
				
				
			detailMiddle +=`</div>
				<div style="width: 100%; text-align: right;">
					<a href="javascript:fn_downloadFiles('${team.gfNo}');" class="chip chip-outline-secondary" style="width: 100px; margin-left: 200px;">다운로드</a>
				</div>
			`;
			
			if(status == "ST02"){
				if(team.submitStatus == "미제출"){
					detailMiddle += `
						<div style="width: 100%; text-align: center;">
							<a href="javascript:fn_tpSubmit('${tp.tpNo}');" class="chip chip-outline-secondary" style="width: 100px; margin-top: 100px;">제출</a>
						</div>
					`;
				}else{
					detailMiddle += `
						<div style="width: 100%; text-align: center;">
							<a href="javascript:fn_tpSubmitCancle('${tp.tpNo}','${team.teamNo}');" class="chip chip-outline-secondary" style="width: 100px; margin-top: 150px;">제출취소</a>
						</div>
					`;							
				}
			}
			
			if(status == "ST04"){
				
				var teamComment = team.teamComment;
				if(!teamComment) teamComment = "";
				
				detailMiddle += `
					<div style="margin-bottom: 0px;"><span style="font-size: 20px; font-weight: 700;">교수님 리뷰</span></div>
					<div id="teamComment" name="message" rows="4" cols="50" style="width: 100%; height: 60px; background-color: white; border-radius: 10px; padding: 10px;">
				    ${teamComment}
				    </div>
				`;
			}
			
			detailSide += `
					<div id="tpMiddleFlex" style="width: 100%; height: 370px; margin-top: 10px;">
						<h4 style="margin-left: 10px;">${team.teamName}</h4>
					
					`;
		               
			for(var tm of team.teamMemberList){
				detailSide += `
					<div class="card teamObj" id="${tm.smemNo}" style="height: 60px; width:100%; border-radius: 15px; padding: 5px; margin-left:0px; margin-bottom:5px;" data-smem-no="${tm.smemNo}" data-mem-name="${tm.memName}" data-dept-name="${tm.deptName}">
	                    <span style="font-size: 12px; padding: 5px; "><strong>${tm.memName}</strong><span class="text-muted">${tm.smemNo}</span></span>
						<span class="text-muted" style="margin-left: 5px;">${tm.deptName}</span>
					</div>
				`;
			}

		   detailSide += `</div>
				</div>
			</div>`;
			
			
			tpBody += `
				<div class="card-body" style="width: 100%; display: flex; padding: 0px;">
					${detailBody}
					${detailSide}
				</div>
			`;
			
			$("#tpDetailHeader").html(header);
			$("#tpDetailBody").html(detailBody);
			$("#tpDetailMiddle").html(detailMiddle);
			$("#tpDetailSide").html(detailSide);
			
			
			
			if (callback != null) {
				$(`.teamObject[data-tp-no="${callback}"]`).click();
		    }
			
		}, error : function(jqXHR, txt, status){
			console.log(txt, status, jqXHR);
		}
	});
	
	
}


function fn_tpSubmit(tpNo){
	
	let fileInput = document.getElementById('file');
	if (fileInput.files.length < 1 && $("#tpfileBox").find(".fileObj").length < 1) {
        alert("제출한 과제가 없습니다.");
    	return;
	}
	
	var $form = $(tpForm);
	var formData = new FormData($form[0]);
		if(deletefilesData.length > 0){
		for(var data of deletefilesData)
		formData.append('deleteFiles', data);
	}
	
	let url = window.location.pathname + "/tpSubmit";

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
			
			$("[data-tp-status='ST02']").click();
			fn_tpDetail_ST02(tpNo);
	    },
	    error: function(xhr, status, error) {
	        // 에러 처리 코드
	    }
	});
}

function fn_tpSubmitCancle(tpNo,teamNo){
	
	let url = window.location.pathname + "/tpSubmitCancle?teamNo=" + teamNo ;

	$.ajax({
	    url: url,
	    method: 'get',
		dataType: "json",
	    success: function(response) {
			
			console.log(response.success);
		
			if(response.success){
				
			}else{
				Swal.fire({
			      title: '실패',
			      text: '서버에러',
			      icon: 'error'
			    });
			}
			$("[data-tp-status='ST02']").click();
			fn_tpDetail_ST02(tpNo);
	    },
	    error: function(xhr, status, error) {
	        // 에러 처리 코드
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
























