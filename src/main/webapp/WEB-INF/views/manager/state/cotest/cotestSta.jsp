<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<style>
.resultSta {
	display: flex;
	justify-content: center;
	align-items: center;
}
</style>
<div class="card card-body" style="background-color: #f2f2f2;">
<h2 style="text-align:center;">HRU 역량 통계</h2>
<div class="resultSta" style="margin-bottom:20px; margin-top:10px;">
	<button id="hruBtn" class="btn btn-dark btn-lg" style="margin-right:5%">HRU 평균</button>
	<button id="colBtn" class="btn btn-dark btn-lg" style="margin-right:5%">단과대학별 평균</button>
	<button id="deptBtn" class="btn btn-dark btn-lg">학과별 평균</button>
</div>
<div id="hru" class="card card-body" >
	<h4 style="text-align:center;">HRU 인재 역량결과</h4>
	<div class="resultSta">
		<div style="text-align: center; margin-right: 2%; margin-top:2%;">
			 <canvas id="HRU" width="800" height="300"></canvas>
					<small>
			&lt;그래프1.HRU 인재 평균&gt;
			</small>
		</div>
		<div style="margin-left:5%; margin-top:2%; text-align:center;">
			<table class="table">
				<tr>
						<th>${cate[0].cotestArea}</th>
						<td>${hruAvg.ca01}</td>
				</tr>
				<tr>
					<th>${cate[1].cotestArea}</th>
					<td>${hruAvg.ca02}</td>
				</tr>
				<tr>	
					<th>${cate[2].cotestArea}</th>
					<td>${hruAvg.ca03}</td>
				</tr>
				<tr>	
					<th>${cate[3].cotestArea}</th>
					<td>${hruAvg.ca04}</td>
				</tr>
				<tr>
					<th>${cate[4].cotestArea}</th>	
					<td>${hruAvg.ca05}</td>
				</tr>
				<tr>	
					<th>${cate[5].cotestArea}</th>
					<td>${hruAvg.ca06}</td>
				</tr>
			</table>
			<small>
			&lt;표1.항목별 결과&gt;
			</small>
		</div>
	</div>
</div>
<div id="coll" style=" margin-top:5%;"class="card card-body" >
	<h4 style="text-align:center;">단과대학별 역량결과</h4>	
		<div style="text-align: center; margin-left: 15%; width:70%;">
			<canvas id="ColBar" width="1000" height="300"></canvas>
				<small style="margin-top:10px;">
			&lt;그래프2.단과대학별 평균&gt;
			</small>
		</div>
		<div style="margin-top:2%; margin-left: 15%; width:70%;text-align:center;">
			<table class="table" style="text-align:center;">
				<tr>
					<th>구분</th>
					<th>${cate[0].cotestArea}</th>
					<th>${cate[1].cotestArea}</th>
					<th>${cate[2].cotestArea}</th>
					<th>${cate[3].cotestArea}</th>
					<th>${cate[4].cotestArea}</th>
					<th>${cate[5].cotestArea}</th>
				</tr>
				<c:forEach items="${colAvg}" var="c" >
					<tr>
						<td>${c.colName}</td>
						<td>${c.ca01}</td>
						<td>${c.ca02}</td>
						<td>${c.ca03}</td>
						<td>${c.ca03}</td>
						<td>${c.ca04}</td>
						<td>${c.ca05}</td>
					</tr>     
				</c:forEach>
			</table>
			<small style="margin-top:10px;">
			&lt;표2.단과대학별 평균&gt;
			</small>
</div>
</div>

<div id="dept" style=" margin-top:5%;"class="card card-body" >
	<h4 style="text-align:center;">학과별 역량결과</h4>	
		<div style="text-align: center; margin-left: 15%; width:70%;">
			<canvas id="DeptBar" width="1000" height="300"></canvas>
					<small style="margin-top:10px;">
			&lt;그래프3.학과별 평균&gt;
			</small>
		</div>
		<div style="margin-top:2%; margin-left: 15%; width:70%;text-align:center;">
			<table class="table" style="text-align:center;">
				<tr>
					<th>구분</th>
					<th>${cate[0].cotestArea}</th>
					<th>${cate[1].cotestArea}</th>
					<th>${cate[2].cotestArea}</th>
					<th>${cate[3].cotestArea}</th>
					<th>${cate[4].cotestArea}</th>
					<th>${cate[5].cotestArea}</th>
				</tr>
				<c:forEach items="${deptAvg}" var="d">
					<tr>
						<td>${d.deptName}</td>
						<td>${d.ca01}</td>
						<td>${d.ca02}</td>
						<td>${d.ca03}</td>
						<td>${d.ca03}</td>
						<td>${d.ca04}</td>
						<td>${d.ca05}</td>
					</tr>
				</c:forEach>
			</table>
				<small style="margin-top:10px;">
			&lt;표3.학과별 평균&gt;
			</small>
		</div>
</div>

</div>
<script src="/lcms/resources/js/paging.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src='<c:url value="/resources/js/app/cotest/cotestM.js"/>'></script>
<script>
document.addEventListener("DOMContentLoaded", function() {
    // HRU 평균 버튼 클릭 시
    document.querySelector("#hruBtn").addEventListener("click", function() {
        document.querySelector("#hru").scrollIntoView({ behavior: "smooth" });
    });

    // 단과대학별 평균 버튼 클릭 시
    document.querySelector("#colBtn").addEventListener("click", function() {
        document.querySelector("#coll").scrollIntoView({ behavior: "smooth" });
    });

    // 학과별 평균 버튼 클릭 시
    document.querySelector("#deptBtn").addEventListener("click", function() {
        document.querySelector("#dept").scrollIntoView({ behavior: "smooth" });
    });
});
</script>