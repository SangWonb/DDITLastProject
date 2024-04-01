<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<style>
#taskPage{
	width: 100%; 
	display: flex;
	flex-direction: column;
	justify-content: center; 
	align-items: center;
}
.taskListBody{
	height:400px; 
	float: left; 
	soverflow-y: auto; 
	overflow-y: scroll; /* 세로 스크롤을 항상 표시하는 속성 */
	scrollbar-width: none; /* Firefox에서 스크롤바를 숨기는 속성 */
	-ms-overflow-style: none; /* IE 및 Edge에서 스크롤바를 숨기는 속성 */
}
#fileBox, #taskSideFlex{
	float: left; 
	soverflow-y: auto; 
	overflow-y: scroll; /* 세로 스크롤을 항상 표시하는 속성 */
	scrollbar-width: none; /* Firefox에서 스크롤바를 숨기는 속성 */
	-ms-overflow-style: none; /* IE 및 Edge에서 스크롤바를 숨기는 속성 */
}
.taskListBody::-webkit-scrollbar {
    display: none; /* Chrome 및 Safari에서 스크롤바를 숨기는 속성 */
}
</style>
<div id="taskPage">
	<div style="width: 80%;">
		<div style="width: 100%; text-align: right;">
			<span>평가로넘기기</span><input type="checkbox" id="taskEval"/>
		</div>
		<div class="card dashboard-area-tabs p-relative o-hidden mb-lg-32pt">
	         <div class="card-header p-0 nav">
	             <div class="row no-gutters" role="tablist">
	                 <div class="col-auto" data-task-status="ST02">
	                     <a href="#" data-toggle="tab" role="tab" aria-selected="true" class="dashboard-area-tabs__tab card-body d-flex flex-row align-items-center justify-content-start active">
	                         <span class="flex d-flex flex-column">
	                             <strong class="card-title">진행중</strong>
	                         </span>
	                     </a>
	                 </div>
	                 <div class="col-auto border-left border-right" data-task-status="ST03">
	                     <a href="#" data-toggle="tab" role="tab" aria-selected="true" class="dashboard-area-tabs__tab card-body d-flex flex-row align-items-center justify-content-start">
	                         <span class="flex d-flex flex-column">
	                             <strong class="card-title">평가중</strong>
	                         </span>
	                     </a>
	                 </div>
	                 <div class="col-auto border-left border-right" data-task-status="ST04">
	                     <a href="#" data-toggle="tab" role="tab" aria-selected="true" class="dashboard-area-tabs__tab card-body d-flex flex-row align-items-center justify-content-start">
	                         <span class="flex d-flex flex-column">
	                             <strong class="card-title">완료</strong>
	                         </span>
	                     </a>
	                 </div>
	             </div>
	         </div>
             <div class="card-body taskListBody" id="taskListBody">
             	
             </div>
	
	     </div>
	</div>
	
	<!-- 상세조회 -->
	<div style="width: 80%">
        <div class="card m-0" style="width: 100%; height: 500px;">
            <div class="card-header" style="width: 100%; height:60px; padding:10px; background-color: DarkTurquoise; display: flex;" id="taskDetailHeader">
            </div>
            
            <div class="card-body" style="width: 100%; display: flex;">
			    <div style="width: 50%; height: 400px; padding:15px; background-color: PowderBlue; border-radius: 10px; margin-right:10px;" id="taskDetailBody">
			    </div>
			    
	        	<form id="taskSubmitForm" method="post" enctype="multipart/form-data" style="width: 50%;">
				    <div style="width: 100%;  height: 400px; background-color: AntiqueWhite; border-radius: 10px; padding: 10px;" id="taskDetailSide">
				    </div>
				</form>	
			    
			</div>
        </div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src='<c:url value="/resources/js/app/cyber/TaskS.js" />'></script>