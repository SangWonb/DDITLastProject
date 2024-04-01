<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<style>
#signUpPage{
	margin: auto;
	width: 90%;
	height: 1500px;
	max-height: 1500px;
}
#infoSpace,#searchSpace,#lectureListSpace,#directSignUpSpace{
	margin-bottom: 1%;
}
#dateInfoSpace{
	width: 100%;
	max-width: 100%;
	height: 3%;
	max-height: 3%;
	
	display: flex;
}
#dateInfoSpace div{
	margin-right: 2%;
	
	display: flex;
	align-items: center;
}
#infoSpace{
	width: 100%;
	max-width: 100%;
	height: 30px;
	max-height: 30px;
}
#searchSpace{
	width: 100%;
	max-width: 100%;
	height: 5%;
	max-height: 5%;
	padding: 10px;
	background-color: Snow;
	border: solid lightgray 1px;
	display: flex; 
}
#lectureListSpace {
    width: 100%;
    max-width: 100%;
    height: 345px;
    max-height: 345px;
    background-color: Snow;
    border: solid lightgray 1px;
}
#directSignUpSpace{
	width: 100%;
	max-width: 100%;
	height: 4%;
	max-height: 4%;
	display: flex;
	align-items: center;
    background-color: Snow;
    border: solid lightgray 1px;
}
#directSignUpSpace div{
	margin-left: 30px;
}
#chooseSignUpSpace{
	width: 100%;
	max-width: 100%;
	height: 35%;
	max-height: 35%;
	display: flex;
    background-color: Lavender;
    border: solid lightgray 1px;
    padding: 20px;
    padding-left: 30px;
}
.basicFontStyle {
	font-size: 13px;
	font-weight: 800;
}
#infoTable th{
	text-align: center;
	width: 3%;
	height: 30px;
	background-color: Lavender;
	border-color: lightgray;
}
#infoTable td{
	text-align: center;
	width: 5%;
	height: 30px;
	background-color: Snow;
	border-color: lightgray;
}
#searchSpace .form-check{
	margin-left: 50px;
}
#lectureHeadTable th{
    text-align: center;
	height: 40px;
	background-color: Lavender;
	border-color: lightgray;
}
#lectureBodyTable td{
    text-align: center;
	height: 35px;
	max-height: 35px;
	border-color: lightgray;
}
#listScroll {
	width: 100%;
	height: 300px;
    float: left; 
    overflow-y: auto; /* overflow 속성 수정 */
    scrollbar-width: none; 
    -ms-overflow-style: none; 
}

#timeTalbeL thead th:first-child {
	width: 20px;
	height: 10px;
	border-left: none;
}

#timeTalbeL tbody td:first-child {
	width: 20px;
}

#timeTalbeL thead th {
	width: 120px;
	height: 10px;
	border-left: 1px solid lightgray;
}

#timeTalbeL tbody td:last-child {
	border-right: none;
}

#timeTalbeL tbody td {
	width: 120px;
	height: 23px;
	border-right: 1px solid lightgray;
}
#timeTalbeL tbody th {
	height: 20px;
}
#timeTalbeL tbody tr {
	height: 20px;
}

#timeTalbeL th {
	font-size: 10px;
}

#timeTalbeL {
	border-collapse: collapse;
	color: gray;
}
#timeTalbeL tr:nth-child(2n+1) td {
    border-top: 1px solid lightgray;
} 
.timeStyle{
	text-align: right; 
	vertical-align: top; 
	font-size: 10px; 
	color: gray; 
	font-weight: 100;
}
#timeTableBack{
	width: 100%;
	height: 430px;
	background-color: white;
	border-radius: 10px;
	box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.1);
}
#chooseTable{
	text-align: center;
}
#chooseTable th{
	background-color: Orchid;
	border-color: gray;
}
#chooseTable td{
	background-color: LavenderBlush;
	border-color: gray;
}
</style>
<div id="signUpPage">
	<div id="dateInfoSpace">
		<div style="width: 15%;">
			<div style="width: 20%;"><span class="basicFontStyle">년도</span></div>
			<div style="width: 80%; height: 100%;"><span style="text-align: center; height: 70%;" class="form-control form-control-rounded basicFontStyle">${year }</span></div>
		</div>
		<div style="width: 15%;">
			<div style="width: 20%;"><span class="basicFontStyle">학기</span></div>
			<div style="width: 80%; height: 100%;"><span style="text-align: center; height: 70%;" class="form-control form-control-rounded basicFontStyle">${currentSemester }</span></div>
		</div>
	</div>
	
	<div id="infoSpace" data-user-smem-no="${studentInfo.smemNo }">
		<table id="infoTable" border="1">
			<tr>
				<th>학번</th><td>${studentInfo.smemNo }</td>
				<th>성명</th><td>${studentInfo.memName }</td>
				<th>학년</th><td>${studentInfo.grade }</td>
				<th>전공</th><td>${studentInfo.deptName }</td>
				<th>제한학점</th><td>18</td>
			</tr>
		</table>
	</div>
	
	<div id="searchSpace">
		<div style="width: 90%;">
			<div style="display: flex; margin-bottom: 10px;">
				<div class="form-check">
					<input class="form-check-input" type="radio" name="selectPart" id="selectPart1" value="D" checked>
					<label class="form-check-label" for="selectPart1">
						<span class="basicFontStyle">소속학과</span>
					</label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="selectPart" id="selectPart2" value="R">
					<label class="form-check-label" for="selectPart2">
						<span class="basicFontStyle">교양과목</span>
					</label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="selectPart" id="selectPart3" value="O">
					<label class="form-check-label" for="selectPart3">
						<span class="basicFontStyle">전체</span>
					</label>
				</div>
			</div>
			<div style="display: flex; margin-left: 50px;">
				<div style="display: flex; margin-right: 50px;">
					<div><span class="basicFontStyle" style="margin-right: 10px;">교과목번호</span></div>
					<div><input type="text" id="subCode" style="text-align: center; height: 80%;" class="form-control form-control-rounded basicFontStyle"/></div>
				</div>
				<div style="display: flex;">
					<div><span class="basicFontStyle" style="margin-right: 10px;">강의명</span></div>
					<div><input type="text" id="lolName" style="text-align: center; height: 80%;" class="form-control form-control-rounded basicFontStyle"/></div>
				</div>
			</div>
		</div>
		<div style="width: 10%; display: flex; align-items: center;">
			<button type="button" id="searchBtn" class="btn btn-outline-primary">검색</button>		
		</div>
	</div>
	
	<div id="lectureListSpace">
		<table id="lectureHeadTable" border="1" style="width: 100%;">
			<thead style="width: 100%;">
				<tr style="width: 100%;">
					<th style="width: 3%;">NO</th>
					<th style="width: 5%;">신청</th>
					<th style="width: 4%;">학년</th>
					<th style="width: 7%;">강의번호</th>
					<th style="width: 26%;">강의명</th>
					<th style="width: 6%;">이수구분</th>
					<th style="width: 6%;">이수학점</th>
					<th style="width: 7%;">신청/정원</th>
					<th style="width: 8%;">담당교수</th>
					<th style="width: 28%;">강의시간</th>
				</tr>
			</thead>
		</table>
		<div id="listScroll">
			<table id="lectureBodyTable" border="1" style="width: 100%;">
				<tbody id="lecSignUpListArea" style="width: 100%;">
					
				</tbody>
			</table>
		</div>
	</div>
	
	<div id="directSignUpSpace">
		<div>
			<span class="basicFontStyle" style="font-size: 16px;">직접입력</span>
		</div>
		<div style="display: flex; align-items: center;">
			<input type="text" id="directLecCode" class="form-control form-control-rounded basicFontStyle" style="border-radius: 5px; width: 100px;"/>
		</div>
		<div>
			<button type="button" onclick="fn_SignUp_direct(event)" class="btn btn-outline-success">신청</button>
		</div>
	</div>
	
	<div id="chooseSignUpSpace" style="width: 100%;">
		<div style="margin-right: 30px; width: 35%">
			<div style="width: 100%">
				<span class="basicFontStyle" style="font-size: 18px;">시간표 반영</span>
			</div>
			<div id="timeTableBack" style="width: 100%">
			
			</div>
		</div>
		<div style="width: 60%">
			<div style="width: 100%">
				<span class="basicFontStyle" style="font-size: 18px; margin-right: 30px;">제한학점:18</span>
				<span class="basicFontStyle" id="chooseAllCredit" style="font-size: 18px;"></span>
			</div>
			
			<div style="width: 100%">
				<table id="chooseTable" border="1" style="width: 100%">
					<thead>
						<tr>
							<th style="width: 14%;">강의번호</th>
							<th style="width: 48%;">강의명</th>
							<th style="width: 14%;">이수구분</th>
							<th style="width: 14%;">이수학점</th>
							<th style="width: 10%;">취소</th>
						</tr>
					</thead>
					<tbody id="chooseListArea">
						
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<form id="searchForm">
	<input type="hidden" name="selectPart">
	<input type="hidden" name="lolName">
	<input type="hidden" name="subCode">
</form>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript">
//시간표 rowspan, style주는 내용
const userSmemNo = $("#infoSpace").data("userSmemNo");
$(document).ready(function() {
    
	$('input[name="selectPart"]').on("change", function(){
		
		var selectedRadio = $('input[name="selectPart"]:checked');
		var selectPart = selectedRadio.val();
		$("#searchForm").find("[name='selectPart']").val(selectPart);
		
		$("#searchBtn").click();
	}).change();
	
	
	$("#searchBtn").on("click", function(){
		var subCode = $("#subCode").val();
		var lolName = $("#lolName").val();
		$("#searchForm").find("[name='subCode']").val(subCode);
		$("#searchForm").find("[name='lolName']").val(lolName);
		
		let data = $("#searchForm").serialize();
		console.log(data);
		
		$.ajax({
		    url: window.location.pathname + "/signUpListData",
		    method: 'post',
		    data: data,
		    dataType : "json",
		    success: function(response) {
		    	
		    	$("#lecSignUpListArea").empty();
		    	
		    	var classesList = response.classesList;
		    	var signUpedLecCode = response.signUpedLecCode; //수강신청한 목록
		    	var trTag = "";
		    	
		    	console.log("classesList : ",classesList);
		    	console.log("classesList.length : ",classesList.length > 0);
		    	
		    	if(classesList.length > 0){
					for(var clazz of classesList){
						
						trTag += `
							<tr>
								<td style="width: 3%;">\${clazz.rnum}</td>`;
						
						var cancleBtnUse = false;		
						
						for(var lec of signUpedLecCode){
							if(clazz.lecCode == lec){
								cancleBtnUse = true;
							}
						}
								
						if(cancleBtnUse){
							trTag += `
									<td style="width: 5%;"><button type="button" onclick="fn_SignUpCancle('\${clazz.lecCode}')" style="height: 25px; width: 40px; font-size: 12px; padding: 0px; margin:2px;" class="btn btn-outline-danger">취소</button></td>
									`;
							
						}else{
							trTag += `
									<td style="width: 5%;"><button type="button" onclick="fn_SignUp('\${clazz.lecCode}')" style="height: 25px; width: 40px; font-size: 12px; padding: 0px; margin:2px;" class="btn btn-outline-success">신청</button></td>
									`;						
						}
							trTag += `
								<td style="width: 4%;">\${clazz.subSchyear}</td>
								<td style="width: 7%;">\${clazz.lecCode}</td>
								<td style="width: 26%;">\${clazz.lolName}</td>
								<td style="width: 6%;">\${clazz.subMC}</td>
								<td style="width: 6%;">\${clazz.subCredit}</td>
								<td style="width: 7%;">\${clazz.lecSignUp}/\${clazz.lolLimit}</td>
								<td style="width: 8%;">\${clazz.memName}</td>
								<td style="width: 28%;">\${clazz.lectureTime}</td>
							</tr>
						`;
					}
		    	}else{
		    		trTag += `
		    			<tr>
							<td colspan="8">해당하는 강의가 없습니다.</td>
						</tr>
		    		`;
		    		
		    	}
				
				$("#lecSignUpListArea").html(trTag);
		    },
		    error: function(xhr, status, error) {
		        // 에러 처리 코드
		    }
		});
	}).click();
	

		
});


// 특정 열의 특정 행부터 특정 행까지의 td 요소에 class를 추가하는 함수
function addClassToTableCells(dayIndex, startTimeIndex, duringTime, lecCode, lolName) {
    var tableRows = document.querySelectorAll("#timeTableBack tbody tr");
	var rowspanCount = duringTime;
    
    tableRows.forEach(function(row, index) {
        if (index >= startTimeIndex -1  && index < startTimeIndex + duringTime -1 ) { 
            var tdElement = row.querySelectorAll("td")[dayIndex];
            tdElement.classList.add(lecCode);
            if(index == startTimeIndex -1 ){
            	$(tdElement).attr('rowspan', rowspanCount);
            	$(tdElement).text(lolName);
            }else{
            	$(tdElement).addClass('d-none');
            }
        }
    });
}

function styleToClass(className, styleObject) {
    var elements = document.querySelectorAll("." + className);

    elements.forEach(function(element) {
        Object.assign(element.style, styleObject);
    });
}
	
	function fn_chooseLecList(){
		$.ajax({
		    url: window.location.pathname + "/chooseListData",
		    method: 'get',
		    dataType : "json",
		    success: function(response) {
				$("#chooseListArea").empty();
				$("#timeTableBack").empty();
				
				
				var timeTableBackHTML = `
					<table id="timeTalbeL">
						<thead style="text-align: center; color: gray;">
							<tr>
								<th></th>
								<th>월</th><th>화</th><th>수</th><th>목</th><th>금</th>
							</tr>
						</thead>
						<tbody>
							<tr> <td class="timeStyle">9 </td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr>
							<tr> <td class="timeStyle">  </td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr>
							<tr> <td class="timeStyle">10</td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr>
							<tr> <td class="timeStyle">  </td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr>
							<tr> <td class="timeStyle">11</td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr>
							<tr> <td class="timeStyle">  </td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr>
							<tr> <td class="timeStyle">12</td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr>
							<tr> <td class="timeStyle">  </td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr>
							<tr> <td class="timeStyle">13</td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr>
							<tr> <td class="timeStyle">  </td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr>
							<tr> <td class="timeStyle">14</td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr>
							<tr> <td class="timeStyle">  </td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr>
							<tr> <td class="timeStyle">15</td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr>
							<tr> <td class="timeStyle">  </td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr>
							<tr> <td class="timeStyle">16</td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr>
							<tr> <td class="timeStyle">  </td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr>
							<tr> <td class="timeStyle">17</td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr>
							<tr> <td class="timeStyle">  </td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr>
						</tbody>
					</table>
				`;
				
				$("#timeTableBack").html(timeTableBackHTML);
				
				
				
				var listChoose = response.listChoose;
		    	var trTag = "";
		    	
		    	if(listChoose.length > 0){
					for(var clazz of listChoose){
						trTag += `
							<tr>
								<td style="width: 100px;">\${clazz.lecCode}</td>
								<td style="width: 250px;">\${clazz.lolName}</td>
								<td style="width: 100px;">\${clazz.subMC}</td>
								<td style="width: 100px;">\${clazz.subCredit}</td>
								<td style="width: 60px;"><button type="button" onclick="fn_SignUpCancle('\${clazz.lecCode}')" style="height: 25px; width: 40px; font-size: 12px; padding: 0px; margin:2px;" class="btn btn-outline-danger">취소</button></td>
							</tr>
						`;
					}
		    	}else{
		    		trTag += `
		    			<tr>
							<td colspan="5">신청한 강의가 없습니다.</td>
						</tr>
		    		`;
		    	}
				
				
				$("#chooseListArea").html(trTag);
				
				var txt = "수강신청학점:" + response.chooseAllCredit
				$("#chooseAllCredit").text(txt);
				
				var timeDataList = response.timeDataList;
				//rowspan
				for(var timeData of timeDataList){
					console.log(timeData);
					// 선택하려는 요일 (월 화 수 목 금)
				    //              1 2 3  4 5
				    var dayIndex = timeData['dayIndex']; 
				    var startTimeIndex = timeData['startTimeIndex'];  // 시작 행의 인덱스 (1부터 시작)
				    var duringTime = timeData['duringTime'];  // 몇시간동안 하는지 4>> 2시간

				    // td 요소에 추가할 클래스명
				    var lecCode = timeData['lolCode']; // 원하는 클래스명을 입력하세요
					var lolName = timeData['lolName'];
				    
				    // 특정 열의 특정 행부터 특정 행까지의 td 요소에 클래스 추가
				    addClassToTableCells(dayIndex, startTimeIndex, duringTime, lecCode, lolName);
					
				}
				
				//style
				var styleCnt = 0;
				var classList = response.classList;
				var styleObjectArr = [
					{"color":"white", "text-align":"left", "vertical-align":"top", "background-color": "Coral"},
					{"color":"white", "text-align":"left", "vertical-align":"top", "background-color": "DarkOrchid"},
					{"color":"white", "text-align":"left", "vertical-align":"top", "background-color": "DarkOrange"},
					{"color":"white", "text-align":"left", "vertical-align":"top", "background-color": "Aquamarine"},
					{"color":"white", "text-align":"left", "vertical-align":"top", "background-color": "LimeGreen"},
					{"color":"white", "text-align":"left", "vertical-align":"top", "background-color": "MediumTurquoise"},
					{"color":"white", "text-align":"left", "vertical-align":"top", "background-color": "PaleVioletRed"},
					{"color":"white", "text-align":"left", "vertical-align":"top", "background-color": "SteelBlue"},
					{"color":"white", "text-align":"left", "vertical-align":"top", "background-color": "Orange"},
					{"color":"white", "text-align":"left", "vertical-align":"top", "background-color": "YellowGreen"},
					{"color":"white", "text-align":"left", "vertical-align":"top", "background-color": "Teal"},
					{"color":"white", "text-align":"left", "vertical-align":"top", "background-color": "SlateGray"},
				];
				
				for(var clazz of classList){
					
					styleToClass(clazz, styleObjectArr[styleCnt++]);
					
				}
				
				
		    },
		    error: function(xhr, status, error) {
		        // 에러 처리 코드
		    }
		});
	}

	fn_chooseLecList();
	
		
	function fn_SignUp(lecCode){
			
			$.ajax({
			    url: window.location.pathname + "/signUpLecture?lecCode=" + lecCode,
			    method: 'get',
			    dataType : "json",
			    success: function(response) {
			    	if(response.success){
			    		Swal.fire({
					      title: '성공',
					      text: '수강신청이 완료되었습니다.',
					      icon: 'success'
					    });
				    	fn_chooseLecList();
				    	$("#searchBtn").click();
			    		
			    	}else{
			    		Swal.fire({
					      title: '실패',
					      text: response.message,
					      icon: 'error'
					    });
			    	}
			    	fn_chooseLecList();
			    },
			    error: function(xhr, status, error) {
			        // 에러 처리 코드
			    }
			});
			
		}

	function fn_SignUp_direct(event){
		var lecCode = $("#directLecCode").val();
		fn_SignUp(lecCode);
		$("#directLecCode").val("");
	}
	
	function fn_SignUpCancle(lecCode){
		$.ajax({
		    url: window.location.pathname + "/signUpLectureCancle?lecCode=" + lecCode,
		    method: 'get',
		    dataType : "json",
		    success: function(response) {
		    	
		    	if(response.success){
		    		Swal.fire({
				      title: '성공',
				      text: '신청취소되었습니다.',
				      icon: 'success'
				    });
			    	fn_chooseLecList();
			    	$("#searchBtn").click();
		    		
		    	}else{
		    		Swal.fire({
				      title: '실패',
				      text: '서버에러',
				      icon: 'error'
				    });
		    	}
		    	
		    },
		    error: function(xhr, status, error) {
		        // 에러 처리 코드
		    }
		});
	}
	
</script>







































