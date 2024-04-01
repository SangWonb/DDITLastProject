<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<style>
    .card {
        margin: 0 auto; /* 가운데 정렬을 위해 추가 */
    }
    .cntAlgin {
    	text-align: center;
    }
</style>

<!-- Page Content -->

<div class="page-section container page__container">

	<div class="page-separator">
        <div class="page-separator__text">방문 발급</div>
    </div>

    <div class="bd-example bg-white">
		<table class="table table-bordered">
			<tbody>
			  <tr>
			    <th scope="row" class="text-center">발급장소</th>
			    <td>미소창조관 1층</td>
			  </tr>
			  <tr>
			    <th scope="row" class="text-center">발급방법</th>
			    <td>학생서비스팀 직접방문</td>
			  </tr>
			</tbody>
		</table>
	</div>
    
    <div class="page-separator">
        <div class="page-separator__text">인터넷 발급</div>
    </div>

    <div class="bd-example bg-white">
		<table class="table table-bordered">
			<tbody>
			  <tr>
			    <th scope="row" class="text-center">발급장소</th>
			    <td>*인터넷 및 프린터기기 설치된 컴퓨터</td>
			  </tr>
			  <tr>
			    <th scope="row" class="text-center">발급방법</th>
			    <td>증명서선택 → 출력</td>
			  </tr>
			  <tr>
			    <th scope="row" class="text-center">이용시간</th>
			    <td>365일</td>
			  </tr>
			</tbody>
		</table>
	</div>
    
    <div class="page-separator">
        <div class="page-separator__text">증명서 신청</div>
    </div>

    <div class="card table-responsive">
        <table class="table table-flush table-nowrap">
            <thead>
                <tr>
                    <th class="text-center">순번</th>
                    <th class="text-center">증명서</th>
                    <th class="text-center">매수</th>
                    <th class="text-center">비고</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${selectCrtfList}" var="crtf">
                   <tr>
                       <td class="text-center">${crtf.rnum}</td>
                       <td class="text-center">${crtf.crtfPName}</td>
                       <td class="text-center">
                           <select name="number" class="userChoice">
                                <option value="1" selected>1</option>
                                <c:forEach begin="2" end="100" var="i">
                                    <option value="${i}">${i}</option>
                                </c:forEach>
                            </select>
                       </td>
                       <td class="text-center">
                           <div class="d-inline-flex align-items-center">
                               <button class="btn btn-sm btn-outline-secondary mr-16pt btnApply" value="${crtf.crtfPCode}" data-crtf-name="${crtf.crtfPName }">신청하기</button>
                           </div>
                       </td>
                   </tr>
               </c:forEach>
            </tbody>
        </table>
    </div>
    
    <div class="card"></div>

    <div class="page-separator">
        <div class="page-separator__text">증명서 출력하기</div>
    </div>
    
    <div class="card table-responsive">
        <table class="table table-flush table-nowrap">
            <thead>
                <tr>
                    <th class="text-center">증명서</th>
                    <th class="text-center">인쇄매수</th>
                    <th class="text-center">잔여매수</th>
                    <th class="text-center">총매수</th>
                    <th class="text-center">발급신청일자</th>
                    <th class="text-center">발급일자</th>
                    <th class="text-center">비고</th>
                </tr>
            </thead>
            <tbody id="dataBody">
            	<c:if test="${empty crtiAllList}">
			        <tr id="dataList">
			            <td colspan="6">증명서 신청내역이 존재하지 않습니다.</td>
			        </tr>
			    </c:if>
			    <c:if test="${not empty crtiAllList}">
			        <c:forEach items="${crtiAllList}" var="crti">
			            <tr>
			            	<td class="cntAlgin">${crti.crtfPName }</td>
			            	<td class="text-center">
	                        	<select name="number" class="printChoice">
	                                <option value="0" selected>0</option>
	                                <c:forEach begin="1" end="${crti.crtfPQtyrg }" var="i">
	                                    <option value="${i}">${i}</option>
	                                </c:forEach>
	                        	</select>
	                        </td>
	                        <td class="cntAlgin">${crti.crtfPQtyrg }</td>
			                <td class="cntAlgin">${crti.crtfPQty }</td>
			                <td class="cntAlgin">${crti.crtfPAppdate }</td>
			                <td>${crti.crtfPDate }</td>
			                <td>
			                <c:choose>
			                	<c:when test="${crti.crtfPQtyrg eq 0}">
				                    <c:if test="${crti.crtfPCode eq 'CEP01'}">
				                        <button id="previewButtonPay" class="btn btn-sm btn-outline-secondary mr-16pt btnRec" 
				                                data-crtfp-recno="${crti.crtfPRecno}" data-crtfp-qty="${crti.crtfPQty}" data-doc-type="${crti.crtfPCode}" disabled>인쇄하기</button>
				                    </c:if>
			                    </c:when>
			                    <c:otherwise>
				                    <c:if test="${crti.crtfPCode eq 'CEP01'}">
				                        <button id="previewButtonPay" class="btn btn-sm btn-outline-secondary mr-16pt btnRec" 
				                                data-crtfp-recno="${crti.crtfPRecno}" data-crtfp-qty="${crti.crtfPQty}" data-doc-type="${crti.crtfPCode}">인쇄하기</button>
				                    </c:if>
			                    </c:otherwise>
			                </c:choose>
			                </td>
			            </tr>
			        </c:forEach>
			    </c:if>
            </tbody>
       </table>
   </div>
</div>

<script type="text/javascript">
$(document).ready(function() {
	$(document).on('click', '.btnApply', async function(event) {
        var crtfPName = $(this).data('crtf-name');
        var selectedButtonValue = $(this).val();
        var selectedValueC = $(this).closest('tr').find('.userChoice').val();
        var quantity = parseInt(selectedValueC); 

        console.log("선택한 증명서이름:", crtfPName);
        console.log("선택한 매수:", selectedValueC);
        
        var data= {
	        "crtfPCode": selectedButtonValue,
	        "crtfPQtypt": 0,
	        "crtfPQtyrg": quantity,
	        "crtfPQty": quantity
        }
        
        console.log("data",data);
        
        $.ajax({
            url: '/lcms/professor/info/certificate/saveCertificateInfo',
            method: 'POST',
            dataType: 'json',
            data: JSON.stringify(data),
            contentType : "application/json",
            success: function(data) {
            	console.log("서버 응답 데이터:", data);

             // AJAX 요청을 통해 데이터를 가져오고, 테이블에 추가하는 함수
                function fetchDataAndAppendToTable(page) {
                    $.ajax({
                        url: '/lcms/professor/info/certificate/jsonbookList',
                        method: 'get',
                        dataType: "json",
                        success: function(jsonObj) {
                       		console.log(jsonObj);
                            console.log(jsonObj.certiRecList[0].crtfPName);

                            var newDataHtml = "";
                           
                            for (var i = 0; i < jsonObj.certiRecList.length; i++) {
                                newDataHtml += "<tr><td class='cntAlgin'>" + jsonObj.certiRecList[i].crtfPName + "</td>";
                                newDataHtml += "<td><select name='number' class='printChoice'>";
                                for (var j = 0; j <= jsonObj.certiRecList[i].crtfPQtyrg; j++) {

                                    if (j == jsonObj.certiRecList[i].crtfPQtypt) {
                                        newDataHtml += "<option value='" + j + "' selected>" + j + "</option>";
                                    } else {
                                        newDataHtml += "<option value='" + j + "'>" + j + "</option>";
                                    }
                                }
                                newDataHtml += "</select></td>";
                                newDataHtml += "<td class='cntAlgin'>" + jsonObj.certiRecList[i].crtfPQtyrg + "</td>";
                                newDataHtml += "<td class='cntAlgin'>" + jsonObj.certiRecList[i].crtfPQty + "</td>";
                                newDataHtml += "<td class='cntAlgin'>" + jsonObj.certiRecList[i].crtfPAppdate + "</td>";
                                newDataHtml += "<td class='cntAlgin'>" + (jsonObj.certiRecList[i].crtfPDate ? jsonObj.certiRecList[i].crtfPDate : "")  + "</td>";
                                newDataHtml += "<td><button class='btn btn-sm btn-outline-secondary mr-16pt btnRec' data-crtfp-recno='" + jsonObj.certiRecList[i].crtfPRecno + "' data-crtfp-qty='" + jsonObj.certiRecList[i].crtfPQty + "' data-doc-type='" + jsonObj.certiRecList[i].crtfPCode + "'>인쇄하기</button></td></tr>";
                            }

                            $('#dataBody').html(newDataHtml);

                        },
                        error: function(jqXHR, txt, status) {
                            console.log(txt, status, jqXHR);
                        }
                    });
                }

                // 페이지가 로드되면 초기 데이터를 가져와서 테이블에 추가
                fetchDataAndAppendToTable(1);

                // 검색 폼이 제출되면 해당 페이지의 데이터를 가져와서 테이블에 추가
                $(document).on("submit", "#searchForm", function(event) {
                    event.preventDefault();
                    fetchDataAndAppendToTable(event.target.page.value);
                    return false;
                });
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error('AJAX 요청 중 오류 발생:', textStatus, errorThrown);
            }

        });
	});
	
	var selectedValue = ""; // 전역 변수로 초기화
	
    // printChoice 이벤트 핸들러를 외부에서 등록합니다.
	$(document).on('change','.printChoice', async function(event) {
	    selectedValue = $(this).val(); // 선택된 값 전역 변수에 업데이트
	});
	
	$(document).on("click", ".btnRec", function(event) {
		var crtfPQtyrg = $(this).closest('tr').find('.cntAlgin:eq(1)').text(); // 잔여 매수
	    // 인쇄 매수가 선택되지 않은 경우
	    if (!selectedValue) {
	    	alert("인쇄 매수를 선택해주세요.");
	        return;
	    }
		
	    var crtfPRecno = $(this).data("crtfpRecno");
	    var docType = $(this).data("docType");

	    // 인쇄하기 버튼을 클릭한 후 URL을 생성하고 새 창을 엽니다.
	    generateCertificateURL(docType, crtfPRecno);
	});
	
	function generateCertificateURL(docType, crtfPRecno) {
	    // 여기에 표시할 증명서의 URL을 지정합니다.
	    var certificateURL = "/lcms/professor/form/crtfForm?docType=" + docType + "&crtfPRecno=" + crtfPRecno + "&crtfPQtypt=" + selectedValue;
	    console.log("certificateURL", certificateURL);
	    // 화면의 중앙에 새 창을 엽니다.
	    var screenWidth = window.screen.availWidth;
	    var screenHeight = window.screen.availHeight;
	    var windowWidth = 600; // 원하는 창의 너비
	    var windowHeight = 400; // 원하는 창의 높이
	    var windowLeft = (screenWidth - windowWidth) / 2;
	    var windowTop = (screenHeight - windowHeight) / 2;
	
	    // 새 창을 엽니다.
	    var newWindow = window.open(certificateURL, "_blank", "width=" + windowWidth + ",height=" + windowHeight + ",left=" + windowLeft + ",top=" + windowTop);
	    // 팝업창이 닫을때 이벤트 주기 (새로고침)
		if (newWindow) {
		    // 부모 창에서 팝업 창이 닫힐 때 이벤트를 감지하여 새로고침합니다.
		    var interval = setInterval(function() {
		        if (newWindow.closed) {
		            clearInterval(interval);
		            location.reload(); // 현재 페이지를 새로 고침합니다.
		        }
		    }, 1000); // 1초마다 확인하여 팝업이 닫혔는지 확인합니다.
		} else {
		    alert("팝업 차단이 감지되었습니다. 팝업 차단을 해제하고 다시 시도하세요.");
		}
	}
	
});
</script>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>