<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="card dashboard-area-tabs p-relative o-hidden mb-lg-32pt"></div>
<div class="card-header p-0 nav">
   <div class="row no-gutters" role="tablist">
      <div class="col-auto">
         <a href="#" data-toggle="tab" role="tab" aria-selected="true"
            class="dashboard-area-tabs__tab card-body d-flex flex-row align-items-center justify-content-start active">
            <span class="h2 mb-0 mr-3">1</span> <span
            class="flex d-flex flex-column"> <strong class="card-title">등록금 내역</strong>
            <small class="card-subtitle text-50">TUITION</small>
         </span>
         </a>
      </div>
   </div>
</div>

<div class="table-responsive bg-white" data-toggle="lists"
    data-lists-sort-desc="true"
   data-lists-values='["js-lists-values-rnum","js-lists-values-project", "js-lists-values-lead", "js-lists-values-status"]'>
   <table class="table mb-0 thead-border-top-0 table-nowrap bg-white" style="margin: 20px;">
      <thead>
         <tr>

            <th style="width: 48px;"><a href="javascript:void(0)"
               class="sort" data-sort="js-lists-values-rnum">순번</a></th>

            <th style="width: 48px;"><a href="javascript:void(0)"
               class="sort" data-sort="js-lists-values-project">년도</a></th>

            <th style="width: 48px;"><a href="javascript:void(0)" class="sort"
               data-sort="js-lists-values-lead">학기</a></th>

            <th style="width: 48px;"><a href="javascript:void(0)"
               class="sort" data-sort="js-lists-values-status">납부일</a></th>
               
            <th style="width: 48px;">상세조회</th>
         </tr>
      </thead>
      
      <tbody class="list" id="projects">
      <c:choose>
      <c:when test="${not empty enrollInvoiceList}">
      <c:forEach items="${enrollInvoiceList}" var="enrollInvoice" varStatus="status">
            <tr>
               <td>
                  <div class="media flex-nowrap align-items-center"
                     style="white-space: nowrap;">
                     <div class="media-body">
                        <div class="d-flex flex-column">
                           <small class="js-lists-values-rnum">${enrollInvoice.rnum }</small>
                        </div>
                     </div>
                  </div>
               </td>
               
               <td>
                  <div class="media flex-nowrap align-items-center"
                     style="white-space: nowrap;">
                     <div class="media-body">
                        <div class="d-flex flex-column">
                           <small class="js-lists-values-project">${enrollInvoice.year} 년도</small>
                        </div>
                     </div>
                  </div>
               </td>

               <td>
                  <div class="media-body">
                     <div class="d-flex align-items-center">
                        <div class="flex d-flex flex-column">
                           <p class="mb-0">
                              <strong class="js-lists-values-lead" >
                              ${enrollInvoice.semester } 학기</strong>
                           </p>
                        </div>
                     </div>
                  </div>
               </td>

               <td>
                  <div class="d-flex flex-column">
                     <small class="js-lists-values-status">
                     <c:choose>
                        <c:when test="${not empty enrollInvoice.enrollRecord[0].enrlDate }">
                           ${enrollInvoice.enrollRecord[0].enrlDate }
                        </c:when>
                        <c:otherwise>
                           미납
                        </c:otherwise>
                     </c:choose>
                     </small>
                  </div>
               </td>
               
               <td>
                 <p class="mb-0">
                     <button class="btn btn-primary" id="billForm" data-enrlNo2="${enrollInvoice.enrlNo }">출력</button>
                 </p>
               </td>
           
            </tr>
         </c:forEach>
         </c:when>
         
         <c:otherwise>
            <td>등록금 내역이 존재하지 않습니다.</td>
         </c:otherwise>
      </c:choose>
         </tbody>
   </table>
</div>

<div id="enrollDetailArea"></div>
<form id="submitForm" action="" style="display: none;">
   <input type="text" name="page"/>
</form>
<script src="<c:url value='/resources/js/paging.js'/>"></script>
<script>
var cPath = $('body').data('bodyCpath');

// 상세조회
$(document).on('click', '#enrollInvoiceCode', function() {
    
     var enrlNo = $(this).attr('data-enrlNo');
     var url = `\${cPath}/student/info/tuition/tuitionDetail/\${enrlNo}`;
     $.ajax({
         url: url,
         type: 'GET',
         success: function(response) {
//              $('#enrollDetailArea').empty();
             $('#enrollDetailArea').html(response);
         },
         error: function(xhr, status, error) {
             console.error('Error detail:', error);
         }
     });
 });
 
// 출력
$(document).on('click', '#billForm', function() {
    
     var enrlNo = $(this).attr('data-enrlNo2');
	// 여기에 표시할 증명서의 URL을 지정
    var billURL = `\${cPath}/student/info/tuition/tuitionBillForm/\${enrlNo}`;
    console.log(billURL)
 	// 화면의 중앙에 새 창
    var screenWidth = window.screen.availWidth;
    var screenHeight = window.screen.availHeight;
    var windowWidth = 600;
    var windowHeight = 400;
    var windowLeft = (screenWidth - windowWidth) / 2;
    var windowTop = (screenHeight - windowHeight) / 2;
    
    // 새 창을 엽니다.
    var newWindow = window.open(billURL, "_blank", "width=" + windowWidth + ",height=" + windowHeight + ",left=" + windowLeft + ",top=" + windowTop);
    
    // 팝업 차단을 방지하기 위해 새 창이 열렸는지 확인
    if (newWindow) {
        newWindow.focus();
    } else {
        alert("팝업 차단이 감지되었습니다. 팝업 차단을 해제하고 다시 시도하세요.");
    }
 });
</script>