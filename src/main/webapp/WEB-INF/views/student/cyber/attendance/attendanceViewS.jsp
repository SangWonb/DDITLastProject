<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<style>
#attendPage{
	width: 100%;
	display: flex;
	justify-content: center;
}
#attendSpace{
	width: 95%;
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

</style>
<div id="attendPage">
	<div id="attendSpace">
		<div id="attendTableSpace">
			<span style="font-size: 15px; font-weight: 800;">출결 상세조회</span>
			<table id="attendTable" border="1">
				<thead id="attendThead">
					<tr>
						<th style="width: 100px;">주</th>
						<th style="width: 200px;">날짜</th>
						<th style="width: 50px;">요일</th>
						<th style="width: 100px;">출결</th>
					</tr>
				</thead>
				<tbody id="attendTbody">
				</tbody>
			</table>
		</div>
		<div id="attendInfoSpace">
			<span style="font-size: 15px; font-weight: 800;">출결 정보</span>
			<table id="infoTable" border="1">
				<tr>
					<th>총수업일</th>
					<td id="classCount"></td>
				</tr>
				<tr>
					<th>실시일수</th>
					<td id="conducted"></td>
				</tr>
				<tr>
					<th>출석(공결)</th>
					<td id="attendance"></td>
				</tr>
				<tr>
					<th>결석</th>
					<td id="absent"></td>
				</tr>
				<tr>
					<th>조퇴</th>
					<td id="leave"></td>
				</tr>
				<tr>
					<th>지각</th>
					<td id="late"></td>
				</tr>
			</table>
			<div id="percent" style=" margin-top: 20px;"></div>
			<div class="card chart-card" style="width: 100%; height: 270px;">
			    <div class="card-body" style="padding: 0px; display: flex; justify-content: center; align-items: center;">
			        <canvas id="chart1"></canvas>
			    </div>
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src='<c:url value="/resources/js/app/cyber/AttendS.js" />'></script>


