/**
 * 
 */

//시간표 rowspan, style주는 내용
$(document).ready(function() {
	
    // 특정 열의 특정 행부터 특정 행까지의 td 요소에 class를 추가하는 함수
    function addClassToTableCells(dayIndex, startTimeIndex, duringTime, lolCode, lolName) {
        var tableRows = document.querySelectorAll("#table tbody tr");
		var rowspanCount = duringTime;
        
        tableRows.forEach(function(row, index) {
            if (index >= startTimeIndex -1  && index < startTimeIndex + duringTime -1 ) { 
                var tdElement = row.querySelectorAll("td")[dayIndex];
                tdElement.classList.add(lolCode);
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

    getTimeData();
    function getTimeData(){
		
		$.ajax({
			url: window.location.pathname + "/timeData"
			, method:"get"
			, success:function(response){
				
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
				    var lolCode = timeData['lolCode']; // 원하는 클래스명을 입력하세요
					var lolName = timeData['lolName'];
				    
				    // 특정 열의 특정 행부터 특정 행까지의 td 요소에 클래스 추가
				    addClassToTableCells(dayIndex, startTimeIndex, duringTime, lolCode, lolName);
					
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
				
			}, error : function(jqXHR, txt, status){
				console.log(jqXHR, txt, status);
			}
		});
		
		
	}
    
});


//강의 목록 비동기로 가져오는 내용(페이징처리)
$(searchForm).on("submit", function(event){
	event.preventDefault();
	
	let form = this;
	let url = form.action;
	let method = form.method;
	let data = $(form).serialize(); //fetch에서는 사용 불가 //ajax는 formdata 사용가능
	let $listBody = $(listBody);
	let $pagingArea = $(pagingArea);
	
	$.ajax({
		url:url
		, method:method
		, data : data
		, dataType : "json"
		, success:function(jsonObj){
			$listBody.empty();
			$pagingArea.empty();
			
			let dataList = jsonObj.lecList;
			let pagingHTML = jsonObj.pagingHTML;
			
			let trTags = null;
			
			
			if(dataList.length > 0){
				$.each(dataList, function(index, lec){ //jquery 아닐떄 >> dataList.forEach(function(member)

					trTags += `
						<tr data-lec-code="${lec.lecCode }">
                            <td style="width: 50px; text-align: center;" >
                                <small class="js-lists-values-phone text-50">${lec.rnum }</small>
                            </td>
                            <td style="width: 270px;">
                                <div class="media flex-nowrap align-items-center" style="white-space: nowrap;">
                                    <div class="media-body">
                                        <div class="d-flex flex-column">
                                            <p class="mb-0"><strong class="js-lists-values-name">${lec.lol.lolName }</strong></p>
                                            <small class="js-lists-values-email text-50">${lec.lecCode }</small>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td style="width: 100px; text-align: center;">
                                <small class="js-lists-values-date text-50">${lec.memName }</small>
                            </td>
                        </tr>
					`;
				});
			}else{
				trTags = `
					<tr>
						<td colspan="3">신청한 강의가 없습니다.</td>
					</tr>
				`;
			}
			
			$listBody.append(trTags);
			$pagingArea.append(pagingHTML);
			
		}, error : function(jqXHR, txt, status){
			console.log(txt, status, jqXHR);
		}
	}).done(()=>{ //fetch의 filnally와 같은놈. 
		$(this).find("input[name='page']").val("");
	});
	return false;
}).submit(); //초기값 !! 페이지 로딩하자마다 바로 실행됨

//강의목록 클릭시 해당 강의 관리 페이지로 이동
$(document).on("click","[data-lec-code]", function(event){
	
	var lecCode = $(this).data("lecCode");
	console.log(lecCode);
	
	var cpath = $("body").data("bodyCpath");
	console.log(cpath);
	
	$.ajax({
		url:window.location.pathname + "/sessionLecCode/" + lecCode
		, method:'get'
		, success:function(jsonObj){
			
		}, error : function(jqXHR, txt, status){
			console.log(txt, status, jqXHR);
		}
	});
	
	
	window.location.href = cpath + "/student/cyber/syllabus/syllabusDetail/" + lecCode;
	
});


//이미지 URL 목록
var imageUrls = [ "/lcms/resources/images/cybernotice/cybernotice2.png",
		"/lcms/resources/images/cybernotice/cybernotice3.png",
		"/lcms/resources/images/cybernotice/cybernotice1.png",
// 추가 이미지 URL을 필요에 따라 여기에 추가합니다
];

var currentIndex = 0;
var overlay = document.getElementById("imageSpace");
var overlayFade = document.querySelector(".fullbleed.bg-dark");

function changeImage() {
	if (currentIndex == 2)
		currentIndex = -1;
	currentIndex = (currentIndex + 1)
	overlay.style.transition = "background-image 1s ease"; // transition 속성 변경
	overlay.style.backgroundImage = "url(" + imageUrls[currentIndex] + ")";
}

function changeImageBack() {
	if (currentIndex == 0)
		currentIndex = 3;
	currentIndex = (currentIndex - 1);
	overlay.style.transition = "background-image 1s ease"; // transition 속성 변경
	overlay.style.backgroundImage = "url(" + imageUrls[currentIndex] + ")";
}

// 초기 이미지 설정
overlay.style.backgroundImage = "url(" + imageUrls[currentIndex] + ")";

// 5초마다 배경 이미지 변경
setInterval(changeImage, 5000);