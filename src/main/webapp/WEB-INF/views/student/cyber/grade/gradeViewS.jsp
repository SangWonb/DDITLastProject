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
	width: 90%;
	margin: auto;
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
<div id="stuDeailPage" data-current-smem-no="${currentSmemNo }" style="width:100%;">
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
	
	<div id="stuGradeDeailSpace" style="width:100%;">
		<div class="card dashboard-area-tabs p-relative o-hidden mb-lg-32pt" style="width:100%;">
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
	
	        <div class="table-responsive" id="tagSpace" style="width:100%;">
				
	            
	        </div>
	    </div>
	</div>
</div>
<div class="modal fade" id="complaintModal" tabindex="-1"
	aria-labelledby="complaintModal" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" style="width: 400px; height: 400px;">
			<div class="modal-header">
				<div  style="width: 100%; text-align: right;">
					<button type="button" id="complaintModalCloseBtn"
						class="btn btn-accent" class="close"
						onclick="$('#complaintModal').modal('hide');">
						<i class="material-icons">close</i>
					</button>
				</div>
			</div>
			<div class="modal-body" style="height: 330px; padding: 20px;">
				<div id="complainDetail" style="height: 250px;">
					<div style="margin-bottom: 15px;">
						<div>
							<span class="fontStyle">이의신청 제목</span>
						</div>
						<div>
							<input type="text" class="form-control form-control-rounded" name="cptTitle"/>
						</div>
					</div>
					<div>
						<div>
							<span class="fontStyle">이의신청 내용</span>
						</div>
						<div>
							<input type="text" class="form-control form-control-rounded" style="height: 100px; border-radius: 15px;" name="cptComment"/>
						</div>
					</div>
				</div>
				<div style="height: 50px; width: 100%; text-align: right;">
					<button type="button" id="comSubmit" class="btn btn-success" onclick="$('#complaintModal').modal('hide');">제출</button>
				</div>
			</div>
		</div>
	</div>
</div>
<form id="complaintForm" hidden="true" method="post" action='<c:url value="/student/cyber/${cyberLecCode}/objectionAppl/complaintAdd"/>'>
	<input type="text" name="cptComment"/>
	<input type="text" name="cptTitle"/>
	<input type="text" name="cptType"/>
	<input type="text" name="cptCode"/>
</form>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src='<c:url value="/resources/js/app/cyber/gradeViewS.js" />'></script>
<c:if test="${not empty success }">
	<c:if test="${success }">
		<script>
			Swal.fire({
		      title: '성공',
		      text: '성공하였습니다.',
		      icon: 'success'
		    });
		</script>
	</c:if>
	<c:if test="${not success }">
		<script>
			Swal.fire({
		      title: '실패',
		      text: '서버에러',
		      icon: 'error'
		    });
		</script>
	</c:if>
</c:if>
