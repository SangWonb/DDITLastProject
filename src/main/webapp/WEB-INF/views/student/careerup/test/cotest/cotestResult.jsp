<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<style>
.resultSta {
	display: flex;
	justify-content: center;
}

.twins {
	display: flex;
}

.btw {
	display: flex;
	   flex: 1;
       margin: 10px;
       background-color: #FFFFFF;
}

  #cotestTable th, #cotestTable td {
    width: 50%; /* 전체 너비의 절반으로 설정 */
    padding: 8px; /* 선택적으로 셀의 안쪽 여백을 추가할 수 있습니다 */
  }


</style>
<div class="card card-body">
	<h2 style="text-align: center;">진단평가결과</h2>
	<div class="resultSta">
		<div style="text-align: center; margin-right: 2%">
			 <canvas id="HRU" width="300" height="300"></canvas>
				<p>HRU 인재 평균</p>
		</div>
		<div style="text-align: center; margin-right: 2%">
			<canvas id="DeptBar" width="300" height="300"></canvas>
				<p>학과 평균</p>
		</div>
		<div style="text-align: center; margin-right: 2%">
			<canvas id="MineSta" width="300" height="300"></canvas>
				<p>나의 역량(평균)</p>
		</div>
		<div style="text-align: center; margin-right: 2%">
			<canvas id="Compared" width="400" height="300"></canvas>
				<p>나의 역량(비교)</p>
		</div>
	</div>
	<div class="card card-body" style="background-color: #f2f2f2;" >
		<h5 style="text-align: center; ">최근결과</h5>
		<h6  id="currentDate" style="text-align: center; "></h6>
		<div class="twins" style="width:60%; margin-left:20%" >
			<div class="btw" >
				<canvas id="recent" width="400" height="400"></canvas>
			</div>
			<div class="btw" style="display: block; ">
				<table class="table" id="cotestTable" style="text-align:center; width:400px; height:300px; margin-top:15%; margin-left:10px; margin-right:10px; ">
					<tr>
						<th  style="border-bottom: 1px solid lightgray;  border-right: 1px solid lightgray;">영역구분</th>
						<td style="border-bottom: 1px solid lightgray;">점수</td>
					</tr>
					<tr>
						<th  style="border-bottom: 1px solid lightgray;  border-right: 1px solid lightgray;">인성영역</th>
						<td style="border-bottom: 1px solid lightgray;">${resultList[0].ca01}</td>
					</tr>
					<tr>
						<th style=" border-bottom: 1px solid lightgray; border-right: 1px solid lightgray;">글로벌영역</th>
						<td style="border-bottom: 1px solid lightgray;">${resultList[0].ca02}</td>
					</tr>
					
					<tr>
						<th style="border-bottom: 1px solid lightgray;  border-right: 1px solid lightgray;">자기관리영역</th>
						<td style="border-bottom: 1px solid lightgray;">${resultList[0].ca03}</td>
					</tr>
					<tr>
						<th  style="border-bottom: 1px solid lightgray;  border-right: 1px solid lightgray;">의사소통영역</th>
						<td style="border-bottom: 1px solid lightgray;">${resultList[0].ca04}</td>
					</tr>
					<tr>
						<th  style="border-bottom: 1px solid lightgray;  border-right: 1px solid lightgray;">대인관계영역</th>
				 		<td style="border-bottom: 1px solid lightgray;">${resultList[0].ca05}</td>
					</tr>
					<tr>
						<th  style="border-bottom: 1px solid lightgray;  border-right: 1px solid lightgray;">창의융합영역</th>
						<td style="border-bottom: 1px solid lightgray;"> ${resultList[0].ca06}</td>
					</tr>
				</table>
				<div style="display: flex; justify-content: flex-end; margin-right:10px;">
				<p>(&nbsp;${resultList[0].cotestDate} 실시 }</p>
				</div>
			</div>
		
		</div>
	</div>
	<div class="card card-bpdy" style="margin-top:20px; max-height:30%; overflow: auto;overflow: auto; background-color: #f2f2f2;">
	<h5 style="text-align: center; margin-top:10px; ">평가결과목록</h5>
		<table class="table" style="text-align: center; background-color: #FFFFFF; width:80%; margin-left:10%;">
			<thead>
				<tr>
					<th>No.</th>
					<th>인성영역</th>
					<th>글로벌영역</th>
					<th>자기관리영역</th>
					<th>의사소통영역</th>
					<th>대인관계영역</th>
					<th>창의융합영역</th>
					<th>실시날짜</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${resultList}" var="r" varStatus="status">
				<tr>
					<td>${status.index+1}</td>
					<td>${r.ca01}</td>
					<td>${r.ca02}</td>
					<td>${r.ca03}</td>
					<td>${r.ca04}</td>
					<td>${r.ca05}</td>
					<td>${r.ca06}</td>
					<td>${r.cotestDate}</td>
				</tr>			
			</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<script src="/lcms/resources/js/paging.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src='<c:url value="/resources/js/app/file/imgShow.js"/>'></script>
<script type="text/javascript">
	
	function getCurrentDate() {
	    var today = new Date();
	    var year = today.getFullYear();
	    var month = today.getMonth() + 1; // 월은 0부터 시작하므로 1을 더해줌
	    var day = today.getDate();

	    month = month < 10 ? '0' + month : month;
	    day = day < 10 ? '0' + day : day;

	    return year + '-' + month + '-' + day;
	}

	function setCurrentDate() {
	    var currentDateElement = document.getElementById('currentDate');
	    if (currentDateElement) {
	    	 var currentDate = getCurrentDate();
	        currentDateElement.textContent = '('+currentDate+'기준)'; 
	    }
	}

	function getStaData(){
		
		$.ajax({
			url:'getInfo',
			method:"get",
			dataType:"json",
			success:function(jsonObj){
// 				console.log(jsonObj);

				var cate = jsonObj.cate;
				var avg = jsonObj.avg;
				var deptAvg = jsonObj.deptAvg;
				var myAvg = jsonObj.myAvg;
				var myRecent = jsonObj.resultList[0];
				
// 				console.log("cate===============>",cate);
// 				console.log("avg===============>",avg);
// 				console.log("deptAvg===============>",deptAvg);
// 				console.log("myAvg===============>",myAvg);
// 				console.log("myRecent===============>",myRecent);
				
				var labels = [];
				var values = [];
				var valuesD = [];
				var valuesM = [];
				var valuesH = [];
				
				 cate.forEach(function(c) {
// 		                console.log("=================================");
		                labels.push(c.cotestArea);
		                
		                var areaCode = c.cotestAreaCode;
		                var value = ""; //나의 최근
		                var valueD = ""; //학과 평균
		                var valueM = ""; //나의 평균
		                var valueH = ""; //학교 평균
		                
		                switch (areaCode) {
		                    case "CA03":
		                        value = myRecent.ca03;
		                        valueD = deptAvg.ca03;
		                        valueM = myAvg.ca03;
		                        valueH = avg.ca03;
		                        break;
		                    case "CA04":
		                        value = myRecent.ca04;
		                        valueD = deptAvg.ca04;
		                        valueM = myAvg.ca04;
		                        valueH = avg.ca04;
		                        break;
		                    case "CA05":
		                        value = myRecent.ca05;
		                        valueD = deptAvg.ca05;
		                        valueM = myAvg.ca05;
		                        valueH = avg.ca05;
		                        break;
		                    case "CA06":
		                        value = myRecent.ca06;
		                        valueD = deptAvg.ca06;
		                        valueM = myAvg.ca06;
		                        valueH = avg.ca06;
		                        break;
		                    case "CA01":
		                        value = myRecent.ca01; 
		                        valueD = deptAvg.ca01;
		                        valueM = myAvg.ca01;
		                        valueH = avg.ca01;
		                        break;
		                    case "CA02":
		                        value = myRecent.ca02;
		                        valueD = deptAvg.ca02;
		                        valueM = myAvg.ca02;
		                        valueH = avg.ca02;
		                        break;
		                    default:
		                        break;
		                }
		                
		                values.push(value);
		                valuesD.push(valueD);
		                valuesM.push(valueM);
		                valuesH.push(valueH);
// 		                console.log(labels);
// 		                console.log("value : ", value);
		            });
		            
// 		            console.log(labels); 
// 		            console.log(values);
				  var ctx = document.getElementById('recent').getContext('2d');
			    var recent = new Chart(ctx, {
			        type: 'bar',
			        data:{
				    labels: labels,
				    datasets: [{
				    	 label: '학과 평균',
					      data: valuesD,
					      backgroundColor: [
					    	  '#FFCE56'
					    	  ]
				    	
				    },{
				      label: '나의 역량',
				      data: values,
				      backgroundColor: [
				    	     '#36A2EB'
				    	  ]
				    }]
				  },
			        options: {
			            scales: {
			                y: {
			                    beginAtZero: true
			                }
			            }
			        }
			    });
				
			    var ctx = document.getElementById('Compared').getContext('2d');
			    var Compared = new Chart(ctx, {
			        type: 'bar',
			        data:{
				    labels: labels,
				    datasets: [{
				    	
				    	 label: 'HRU 인재 평균',
			                data: valuesH,
			                backgroundColor: [
			                	'#FF3628'
			                ]
				    
				    },{
				    	 label: '학과 평균',
					      data: valuesD,
					      backgroundColor: [
					    	  '#FFCE56'
					    	  ]
				    	
				    },{
				    	  label: '나의 역량(평균)',
					      data: valuesM,
					      backgroundColor: [
					    	     '#4BC0C0'
					    	  ]
				    }]
				  },
			        options: {
			            scales: {
			                y: {
			                    beginAtZero: true
			                }
			            }
			        }
			    });
			    
			    var ctxD = document.getElementById('DeptBar').getContext('2d');
			    var DeptBar = new Chart(ctxD, {
			        type: 'bar',
			        data: {
			            labels: labels,
			            datasets: [{
			                label: '학과 평균',
			                data: valuesD,
			                backgroundColor: [
			                    '#FFCE56'
			                ]
			            }]
			        },
			        options: {
			            scales: {
			                y: {
			                    beginAtZero: true
			                }
			            }
			        }
			    });
			    
			    var ctxD = document.getElementById('MineSta').getContext('2d');
			    var MineSta = new Chart(ctxD, {
			        type: 'bar',
			        data: {
			            labels: labels,
			            datasets: [{
			                label: '나의 역량(평균)',
			                data: valuesM,
			                backgroundColor: [
			                	'#4BC0C0'
			                ]
			            }]
			        },
			        options: {
			            scales: {
			                y: {
			                    beginAtZero: true
			                }
			            }
			        }
			    });
			    
			    var ctxD = document.getElementById('HRU').getContext('2d');
			    var HRU = new Chart(ctxD, {
			        type: 'bar',
			        data: {
			            labels: labels,
			            datasets: [{
			                label: 'HRU 인재 평균',
			                data: valuesH,
			                backgroundColor: [
			                	'#FF3628'
			                ]
			            }]
			        },
			        options: {
			            scales: {
			                y: {
			                    beginAtZero: true
			                }
			            }
			        }
			    });
			    
			    
			    
			    
			}, error : function(jqXHR, txt, status){
				console.log(txt, status, jqXHR);
			}
		});
	}
	
	window.addEventListener('load', setCurrentDate);
	window.addEventListener('load', getStaData);
	
	


</script>

