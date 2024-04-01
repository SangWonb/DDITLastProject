<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<style>
.satisSpace{
	width: 45%;
	margin-right: 20px;
}
.comStyle{
	background-color: white;
	border-radius: 20px;
	width: 100%;
	height: 150px;
	margin-bottom: 20px;
	padding: 40px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}
.satisStyle{
	background-color: white;
	border-radius: 20px;
	width: 100%;
	height: 300px;
	display: flex; 
	flex-direction: column;
	justify-content: center; 
	align-items: center;
	padding: 20px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}
.boxStyle{
	background-color: white;
	border-radius: 20px;
	width: 45%; 
	display: flex; 
	justify-content: center; 
	align-items: center;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}
.starStyle{
	width: 80px;
	color: Gold;
}
.satisDivs{
	display: flex;
	width: 100%;
	justify-content: center; 
	align-items: center;
}
</style>

<div>
	<div style="display: flex;">
		<div class="satisSpace">
			<div class="comStyle">
				
			</div>
			<div class="satisStyle">
				<div>
					<span style="font-size: 20px; font-weight: 800; marign-bottom: 30px;">평균 만족도</span>
				</div>
				<div class="satisS">
				</div>
				<div class="satisDivs">
				</div>
			</div>
		</div>
		 <div class="boxStyle">
	        <canvas id="chart1"></canvas>
	    </div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
$.ajax({
	url:window.location.pathname + "/evalAvg"
	, method:"get"
	, dataType : "json"
	, success:function(jsonObj){
		
		var evalAvg = jsonObj.evalAvg;
		var totalStudent = jsonObj.totalStudent;
		var evalStudentCount = jsonObj.evalStudentCount;
		
		
		var com =  Math.floor(evalStudentCount/totalStudent * 100);
		
		//강의평가 완료율 확인하기
		var progress = `
			<div>
				<span style="font-size: 20px; font-weight: 800; maring-bottom: 10px;">강의평가 참여율</span>
			</div>
			<div class="progress mb-16pt" style="width: 100%; height: 30px; border-radius: 10px; font-size: 15px;">
	            <div class="progress-bar progress-bar-striped bg-primary" role="progressbar" style="width: \${com}%" aria-valuenow="\${com}" aria-valuemin="0" aria-valuemax="100">\${com}%</div>
	        </div>
		`;
		
		$(".comStyle").empty();
		$(".comStyle").append(progress);
		
		
		var lsrTotal = evalAvg.lsrTotal;
		console.log(lsrTotal);
		console.log(Math.floor(lsrTotal));
		console.log(lsrTotal - Math.floor(lsrTotal));
		
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
		
		
		$(".satisDivs").empty();
		$(".satisDivs").append(totalSatis);
		
		var totalS = `
				<span style="font-size: 40px; font-weight: 800; maring-bottom: 10px;">\${lsrTotal}</span>
		`;
		$(".satisS").empty();
		$(".satisS").append(totalS);
		
		
		
		//차트 채우기
		var labels = ["교수자특성","수업내용","수업흥미","수업방법","평가방법"];
		var data = [evalAvg.lsrIc,evalAvg.lsrCc,evalAvg.lsrCi,evalAvg.lsrTm,evalAvg.lsrAm];
		
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
		  
		
	}, error : function(jqXHR, txt, status){
		console.log(txt, status, jqXHR);
	}
});

</script>










