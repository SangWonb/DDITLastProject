<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<style>
#stateSpace{
	display: flex;
}
#thisEvalSpace{
	border-radius: 20px;
	width: 50%;
	margin-right: 20px;
	height: 700px;
}
#thisEvalInfo{
	background-color: white;
	width: 100%;
	height: 30%;
	margin-bottom: 15px;
	border-radius: 20px;
	display: flex;
	justify-content: center; 
	align-items: center;
	flex-direction: column;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

#thisEvalChart{
	background-color: white;
	border-radius: 20px;
	width: 100%;
	height: 70%;
	margin-right: 20px;
	display: flex;
	justify-content: center; 
	align-items: center;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

#thisLastEvalSpace{
	border-radius: 20px;
	width: 50%;
	height: 700px;
}

#thisEvalStar{
	display: flex;
}
.starStyle{
	width: 70px;
	color: Gold;
}
#thisLastState{
	background-color: white;
	border-radius: 20px;
	text-align: center; 
	width:100%; 
	height: 700px;
	padding: 20px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);

}
</style>
<div id="stateSpace">
	<div id="thisEvalSpace">
		<div id="thisEvalInfo">
			<div>
				<span style="font-size: 20px; font-weight: 800;">평균 만족도</span>
			</div>
			<div class="satisS">
			</div>
			<div id="thisEvalStar">
			</div>
		</div>
		<div id="thisEvalChart">
			<canvas id="chart1"></canvas>
		</div>
	</div>
	<div id="thisLastEvalSpace">
		<div id="thisLastState">
			<div>
				<span style="font-size: 20px; font-weight: 800; margin-top: 30px;">작년대비 만족도 변화</span>
			</div>
			<canvas id="ColBar" style="width:100%; height:300px; margin-top: 50px;"></canvas>
			<table class="table" style="text-align:center; margin-top: 50px;">
				<tr>
					<th>구분</th>
					<th>교수자특성</th>
					<th>수업내용</th>
					<th>수업흥미</th>
					<th>수업방법</th>
					<th>평가방법</th>
					<th>총만족도</th>
				</tr>
				<tr>
					<td>${thisYear }</td>
					<td>${thisLSR.lsrIc }</td>
					<td>${thisLSR.lsrCc }</td>
					<td>${thisLSR.lsrCi }</td>
					<td>${thisLSR.lsrTm }</td>
					<td>${thisLSR.lsrAm }</td>
					<td>${thisLSR.lsrTotal }</td>
				</tr>     
				<tr>
					<td>${lastYear }</td>
					<td>${lastLSR.lsrIc }</td>
					<td>${lastLSR.lsrCc }</td>
					<td>${lastLSR.lsrCi }</td>
					<td>${lastLSR.lsrTm }</td>
					<td>${lastLSR.lsrAm }</td>
					<td>${lastLSR.lsrTotal }</td>
				</tr>     
			</table>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
$.ajax({
	url:window.location.pathname + "/thisLastLecEvalAvg"
	, method:"get"
	, dataType : "json"
	, success:function(jsonObj){
		
		var thisLSR = jsonObj.thisLSR;
		var lastLSR = jsonObj.lastLSR;
		
		var lsrTotal = thisLSR.lsrTotal;
		
		var totalSatis = "";
		for(var i=0; i<Math.floor(lsrTotal); i++){
			totalSatis += `
				<div>
					<svg class="starStyle" data-v-134867f8="" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="star" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" class="svg-inline--fa fa-star fa-w-18"><path data-v-134867f8="" fill="currentColor" d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z" class=""></path></svg>
				</div>	
			`;
		}
		if(lsrTotal - Math.floor(lsrTotal) > 0){
			totalSatis += `
				<div>
					<svg class="starStyle" data-v-134867f8="" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="star-half" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" class="svg-inline--fa fa-star-half fa-w-18"><path data-v-134867f8="" fill="currentColor" d="M288 0c-11.4 0-22.8 5.9-28.7 17.8L194 150.2 47.9 171.4c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.1 23 46 46.4 33.7L288 439.6V0z" class=""></path></svg>
				</div>	
			`;
		}
		$("#thisEvalStar").empty();
		$("#thisEvalStar").append(totalSatis);
		
		var totalS = `
				<span style="font-size: 40px; font-weight: 800; maring-bottom: 10px;">\${lsrTotal}</span>
		`;
		$(".satisS").empty();
		$(".satisS").append(totalS);
		
		//차트 채우기
		var labels = ["교수자특성","수업내용","수업흥미","수업방법","평가방법"];
		var data = [thisLSR.lsrIc,thisLSR.lsrCc,thisLSR.lsrCi,thisLSR.lsrTm,thisLSR.lsrAm];
		
		var COLOR = {
				  ORANGE_1: 'rgba(255, 108, 61, 0.2)', // 예시에 사용된 색상값
				  GRAY_9E: '#000000', // 예시에 사용된 색상값
				  BLACK: '#000000' // 예시에 사용된 색상값
				};

				// 나머지 코드는 COLOR 객체가 정의되었다고 가정하고 사용
				var data1 = {
				  labels: labels,
				  datasets: [
				    {
				      label: '강의평가 만족도',
				      data: data,
				      backgroundColor: COLOR.ORANGE_1, // COLOR 객체 사용
				    },
				  ],
				};

				var ctx1 = document.getElementById('chart1').getContext('2d');
				var chart1 = new Chart(ctx1, {
				  type: 'radar',
				  data: data1,
				  options: {
				    elements: {
				      line: {
				        borderWidth: 5,
				        borderColor: COLOR.ORANGE_1, // COLOR 객체 사용
				      },
				      point: {
				        pointBackgroundColor: COLOR.ORANGE_1, // COLOR 객체 사용
				      },
				    },
				    scales: {
			    	  r: {
			    	    ticks: {
			    	      stepSize: 1,
			    	      display: false,
			    	    },
			    	    grid: {
			    	        color: COLOR.GRAY_9E,
			    	        borderWidth: 5, 
			    	    },
			    	    pointLabels: {
			    	      font: {
			    	        size: 20,
			    	        weight: '1000',
			    	        family: 'Pretendard',
			    	      },
			    	      color: COLOR.BLACK,
			    	    },
			    	    angleLines: {
			    	      display: false,
			    	    },
			    	    suggestedMin: 0,
			    	    suggestedMax: 5,
			    	  },
			    	},
				    plugins: {
				      legend: {
				        display: false,
				      },
				    },
				    animation: {
				      duration: 0,
				    },
				    scales: {
				      r: {
				        min: 0,
				        max: 5,
				      },
				    },
				    plugins: {
				      title: {
				        display: true,
				        text: "강의평가 만족도"
				      },
				      legend: {
				        display: true,
				        position: 'bottom',
				        labels: {
				          boxWidth: 10,
				          usePointStyle: true
				        }
				      }
				    }
				  }
				});
		  
				
		function getRandomColor() {
		    var colors = ['#FF8981','#5D18FF','#81ABFF','#4FFFA1','#FFD581','#FFB917','#FF9B50','#3E0CFF','#FF9F0B','#FF867D','#FF4A3D','#3DFF97',' #03FFBC','#FF0246','#00A9FF','#FF5500',' #0010FF']; 
			var usedColors = [];
		    var availableColors = colors.filter(color => !usedColors.includes(color));
		    var randomIndex = Math.floor(Math.random() * availableColors.length);
		    var selectedColor = availableColors[randomIndex];
		    usedColors.push(selectedColor); 
		    return selectedColor;
		}
		
		var thisData = [thisLSR.lsrIc,thisLSR.lsrCc,thisLSR.lsrCi,thisLSR.lsrTm,thisLSR.lsrAm];
		var lastData = [lastLSR.lsrIc,lastLSR.lsrCc,lastLSR.lsrCi,lastLSR.lsrTm,lastLSR.lsrAm];
		var labelsC = [jsonObj.thisYear,jsonObj.lastYear];
		var datasetsC = [];
		
	    var thisDataset = {
	        label: jsonObj.thisYear, 
	        data: thisData,
	        fill: false, 
	        borderColor: '#4FFFA1', 
	    };
	    datasetsC.push(thisDataset); 
	    var lastDataset = {
	        label: jsonObj.lastYear, 
	        data:lastData,
	        fill: false, 
	        borderColor: '#FFD581', 
	    };
	    datasetsC.push(lastDataset); 
		
	    console.log("datasetsC : ",datasetsC);
	    
		var dataC = {
			    labels:labels, 
			    datasets: datasetsC 
			};
		
		var configC = {
			    type: 'line', 
			    data: dataC ,
			    options: {
				    scales: {
			    	  r: {
		    		  	min: 0.0,
				        max: 5.0,
			    	    ticks: {
			    	      stepSize: 0.5
			    	    }
			    	  }
			    	}
				  }
			};
				
		const ctxC = document.getElementById('ColBar').getContext('2d');
	    new Chart(ctxC, configC);
		
	}, error : function(jqXHR, txt, status){
		console.log(txt, status, jqXHR);
	}
});	
	
</script>