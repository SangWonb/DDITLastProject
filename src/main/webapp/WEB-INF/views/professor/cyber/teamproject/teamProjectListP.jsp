<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<style>
#lecCodeInfo{
	width: 100%; 
	display: flex;
	flex-direction: column;
	justify-content: center; 
	align-items: center;
}
.tpListBody{
	height:400px; 
	float: left; 
	soverflow-y: auto; 
	overflow-y: scroll; /* 세로 스크롤을 항상 표시하는 속성 */
	scrollbar-width: none; /* Firefox에서 스크롤바를 숨기는 속성 */
	-ms-overflow-style: none; /* IE 및 Edge에서 스크롤바를 숨기는 속성 */
}
#fileBox, #tpSideFlex, #tpMiddleFlex{
	float: left; 
	soverflow-y: auto; 
	overflow-y: scroll; /* 세로 스크롤을 항상 표시하는 속성 */
	scrollbar-width: none; /* Firefox에서 스크롤바를 숨기는 속성 */
	-ms-overflow-style: none; /* IE 및 Edge에서 스크롤바를 숨기는 속성 */
}
.tpListBody::-webkit-scrollbar {
    display: none; /* Chrome 및 Safari에서 스크롤바를 숨기는 속성 */
}
.drop {
    height: auto;
    padding: 5px;
    width: 100%;
}

.ele {
    height: 20px;
    border: 3px solid blue;
    margin : 10px;
    width: 90%;
}
</style>
<div id="lecCodeInfo" data-lec-code="${cyberLecCode }">
	<div style="width: 80%">
		<div style="width: 100%; text-align: right;">
			<span>평가로넘기기</span><input type="checkbox" id="tpEval"/>
			<span>팀프로젝트입력</span><input type="checkbox" id="tpInsert"/>
		</div>
		<div class="card dashboard-area-tabs p-relative o-hidden mb-lg-32pt" style="width: 100%;">
	         <div class="card-header p-0 nav" style="width: 100%;">
	             <div class="row no-gutters" role="tablist" style="width: 100%; text-align: center;">
	                 <div class="col-auto" data-tp-status="ST02" style="width: 10%;">
	                     <a href="#" data-toggle="tab" role="tab" aria-selected="true" class="dashboard-area-tabs__tab card-body d-flex flex-row align-items-center justify-content-start active">
	                         <span class="flex d-flex flex-column">
	                             <strong class="card-title">진행중</strong>
	                         </span>
	                     </a>
	                 </div>
	                 <div class="col-auto border-left border-right" data-tp-status="ST03" style="width: 10%;">
	                     <a href="#" data-toggle="tab" role="tab" aria-selected="true" class="dashboard-area-tabs__tab card-body d-flex flex-row align-items-center justify-content-start">
	                         <span class="flex d-flex flex-column">
	                             <strong class="card-title">평가중</strong>
	                         </span>
	                     </a>
	                 </div>
	                 <div class="col-auto border-left border-right" data-tp-status="ST04" style="width: 10%;">
	                     <a href="#" data-toggle="tab" role="tab" aria-selected="true" class="dashboard-area-tabs__tab card-body d-flex flex-row align-items-center justify-content-start">
	                         <span class="flex d-flex flex-column">
	                             <strong class="card-title">완료</strong>
	                         </span>
	                     </a>
	                 </div>
	                 <div class="col-auto border-left border-right" data-tp-status="ST01" style="width: 10%;">
	                     <a href="#" data-toggle="tab" role="tab" aria-selected="true" class="dashboard-area-tabs__tab card-body d-flex flex-row align-items-center justify-content-start">
	                         <span class="flex d-flex flex-column">
	                             <strong class="card-title">임시저장</strong>
	                         </span>
	                     </a>
	                 </div>
	                 <div style="padding: 10px; width: 60%; text-align: right;"  onmouseover="this.style.color = 'lightgray';" onmouseleave="this.style.color = 'black';" onclick="fn_tpAddAction()">
	                 	<span style="font-size: 18px;">팀프로젝트등록</span>
	                 	<svg style="width:30px;" data-v-134867f8="" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="plus" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" class="svg-inline--fa fa-plus fa-w-14"><path data-v-134867f8="" fill="currentColor" d="M416 208H272V64c0-17.67-14.33-32-32-32h-32c-17.67 0-32 14.33-32 32v144H32c-17.67 0-32 14.33-32 32v32c0 17.67 14.33 32 32 32h144v144c0 17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32V304h144c17.67 0 32-14.33 32-32v-32c0-17.67-14.33-32-32-32z" class=""></path></svg>
	                 </div>
	             </div>
	         </div>
             <div class="card-body tpListBody" id="tpListBody">
             	
             </div>
	
	     </div>
	</div>
	
	<!-- 상세조회 -->
	<div style="width: 80%">
        <div class="card m-0" style="width: 100%; height: 500px;">
        	<form id="tpForm" method="post" enctype="multipart/form-data" style="width: 100%;">
	            <div class="card-header" style="width: 100%; height:60px; padding:10px; background-color: DarkTurquoise; display: flex;" id="tpDetailHeader">
	            </div>
	            <div class="card-body" style="width: 100%; display: flex;" id="tpBody">
				</div>
			</form>	
        </div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src='<c:url value="/resources/js/app/cyber/TeamProjectP.js" />'></script>
<script>
	document.addEventListener('dragstart', function (e) {
	    if (e.target.classList.contains('ele')) {
	        e.dataTransfer.setData("tgId", e.target.id);
	    }
	});
	
	document.addEventListener('dragover', function (e) {
	    e.preventDefault();
	});
	
	document.addEventListener('drop', function (e) {
	    e.preventDefault();
	    let targetId = e.dataTransfer.getData('tgId');
	    let draggedElement = document.getElementById(targetId);
	
	    if (e.target.classList.contains('drop') && draggedElement.classList.contains('ele')) {
	        e.target.appendChild(draggedElement);
	    }
	    if (e.target.classList.contains('ele') && draggedElement.classList.contains('ele')) {
	        let dropZone = e.target.closest('.drop');
	        if (dropZone) {
	            dropZone.appendChild(draggedElement);
	        }
	    }
	});
</script>