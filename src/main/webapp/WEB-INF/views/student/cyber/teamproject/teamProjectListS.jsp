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
</style>
<div id="lecCodeInfo" data-lec-code="${cyberLecCode }">
	<div style="width: 80%">
		<div style="width: 100%; text-align: right;">
			<span>평가로넘기기</span><input type="checkbox" id="tpEval"/>
		</div>
		<div class="card dashboard-area-tabs p-relative o-hidden mb-lg-32pt" style="width: 100%;">
	         <div class="card-header p-0 nav" style="width: 100%;">
	             <div class="row no-gutters" role="tablist" style="width: 100%;">
	                 <div class="col-auto" data-tp-status="ST02">
	                     <a href="#" data-toggle="tab" role="tab" aria-selected="true" class="dashboard-area-tabs__tab card-body d-flex flex-row align-items-center justify-content-start active">
	                         <span class="flex d-flex flex-column">
	                             <strong class="card-title">진행중</strong>
	                         </span>
	                     </a>
	                 </div>
	                 <div class="col-auto border-left border-right" data-tp-status="ST03">
	                     <a href="#" data-toggle="tab" role="tab" aria-selected="true" class="dashboard-area-tabs__tab card-body d-flex flex-row align-items-center justify-content-start">
	                         <span class="flex d-flex flex-column">
	                             <strong class="card-title">평가중</strong>
	                         </span>
	                     </a>
	                 </div>
	                 <div class="col-auto border-left border-right" data-tp-status="ST04">
	                     <a href="#" data-toggle="tab" role="tab" aria-selected="true" class="dashboard-area-tabs__tab card-body d-flex flex-row align-items-center justify-content-start">
	                         <span class="flex d-flex flex-column">
	                             <strong class="card-title">완료</strong>
	                         </span>
	                     </a>
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
        	<form id="tpForm" method="post" enctype="multipart/form-data">
	            <div class="card-header" style="width: 100%; height:60px; padding:10px; background-color: DarkTurquoise; display: flex;" id="tpDetailHeader">
	            </div>
	            <div class="card-body" style="width: 100%; display: flex;" id="tpBody">
					<div style="width: 40%; height: 400px; padding:15px; background-color: PowderBlue; border-radius: 10px; margin-right:10px;" id="tpDetailBody">
				    </div>
				    <div style="width: 40%; height: 400px; padding:10px; background-color: Khaki; border-radius: 10px; margin-right:10px;" id="tpDetailMiddle">
				    </div>						    
				    <div style="width: 20%; height: 400px; background-color: AntiqueWhite; border-radius: 10px; padding: 5px;" id="tpDetailSide">
				    </div>
				</div>
			</form>	
        </div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src='<c:url value="/resources/js/app/cyber/TeamProjectS.js" />'></script>