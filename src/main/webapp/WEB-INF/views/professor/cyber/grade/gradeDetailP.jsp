<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<style>
#stuDeailPage{
	width: 100%;
}

#stuInfoSpace{
	width: 100%;
	margin-bottom: 15px;
}
#stuInfoTableSpace{
	width: 100%;
}
#stuInfoTable{
	font-size: 15px;
	width: 100%;
}
#stuInfoTable tr{
	height: 40px;
}
#stuInfoTable th{
	text-align: center;
}
#stuInfoTable td{
	padding: 10px;
}

#stuGradeSpace{
	width: 100%;
	margin-bottom: 15px;
}
#stuGradeTableSpace{
	width: 100%;
}
#stuGradeTable{
	font-size: 15px;
	width: 100%;
	text-align: center;
}
#stuGradeTable tr{
	height: 30px;
}
#stuGradeTable th{
	width: 12.5%;
}
#stuGradeTable td{
}

#stuGradeDeailSpace{
	width: 100%;
}
.fontStyle{
	font-size: 18px;
	font-weight: 800;
}
.table-responsive{
	padding: 15px;
	min-height: 200px;
	max-height: 900px;
}

/* 출결 */
#attendSpace{
	width: 100%;
	max-width: 1100px;
	display: flex;
}
#attendTableSpace{
	width: 60%;
	padding: 25px;
	border-radius: 15px;
	background-color: white;
	margin-right: 20px;
}
#attendInfoSpace{
	width: 40%;
	height: 530px;
	padding: 25px;
	border-radius: 15px;
	background-color: Lavender;
}
#attendTable{
	width: 100%;
	text-align: center;
}
#attendTable thead{
	background-color: LightCoral;	
}
#attendTable tbody{
	background-color: LavenderBlush;	
}
#infoTable{
	width: 100%;
	text-align: center;
}
#infoTable th{
	width: 180px;
	background-color: PaleTurquoise;
}
#infoTable td{
	width: 180px;	
	background-color: white;
}


/* 시험 */
#testTable {
	font-size: 15px;
	text-align: center;
	border-radius: 15px;
}
#testTable th{
	background-color: pink;
}
#testTable td{
	background-color: MistyRose;
}
</style>
<div id="stuDeailPage" data-current-smem-no="${currentSmemNo }">
	<div id="stuInfoSpace">
		<div>
			<span class="fontStyle">학생정보</span>
		</div>
		<div id="stuInfoTableSpace">
			<table border="1" id="stuInfoTable">
			</table>
		</div>
	</div>
	
	<div id="stuGradeSpace">
		<div>
			<span class="fontStyle">학생성적</span>
		</div>
		<div id="stuGradeTableSpace">
			<table border="1" id="stuGradeTable">
				<tr>
					<th>출결</th><th>과제(팀플)</th><th>중간</th><th>기말</th><th>총점</th><th>등급</th><th>석차</th><th>백분율</th>
				</tr>
				<tr id="stuGradeTableTd">
				</tr>
			</table>
		</div>
	</div>
	
	<div id="stuGradeDeailSpace">
		<div class="card dashboard-area-tabs p-relative o-hidden mb-lg-32pt">
	        <div class="card-header p-0 nav">
	            <div class="row no-gutters" role="tablist">
	                <div class="col-auto" id="attend">
	                    <a href="#" data-toggle="tab" role="tab" aria-selected="true" class="dashboard-area-tabs__tab card-body d-flex flex-row align-items-center justify-content-start active">
	                        <span class="fontStyle">출결</span>
	                    </a>
	                </div>
	                <div class="col-auto border-left border-right" id="task">
	                    <a href="#" data-toggle="tab" role="tab" aria-selected="false" class="dashboard-area-tabs__tab card-body d-flex flex-row align-items-center justify-content-start">
	                    	<span class="fontStyle">과제</span>
	                    </a>
	                </div>
	                <div class="col-auto border-left border-right" id="teamproject">
	                    <a href="#" data-toggle="tab" role="tab" aria-selected="false" class="dashboard-area-tabs__tab card-body d-flex flex-row align-items-center justify-content-start">
	                    	<span class="fontStyle">팀프로젝트</span>
	                    </a>
	                </div>
	                <div class="col-auto border-left border-right" id="test">
	                    <a href="#" data-toggle="tab" role="tab" aria-selected="false" class="dashboard-area-tabs__tab card-body d-flex flex-row align-items-center justify-content-start">
	                    	<span class="fontStyle">시험</span>
	                    </a>
	                </div>
	            </div>
	        </div>
	
	        <div class="table-responsive" id="tagSpace">
				
	            
	        </div>
	    </div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src='<c:url value="/resources/js/app/cyber/gradeDetailP.js" />'></script>
