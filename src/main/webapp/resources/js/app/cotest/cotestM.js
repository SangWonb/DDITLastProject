

function getRandomColor() {
    var colors = ['#FF8981','#5D18FF','#81ABFF','#4FFFA1','#FFD581','#FFB917','#FF9B50','#3E0CFF','#FF9F0B','#FF867D','#FF4A3D','#3DFF97',' #03FFBC','#FF0246','#00A9FF','#FF5500',' #0010FF']; 
	var usedColors = [];
    var availableColors = colors.filter(color => !usedColors.includes(color));
    var randomIndex = Math.floor(Math.random() * availableColors.length);
    var selectedColor = availableColors[randomIndex];
    usedColors.push(selectedColor); 
    return selectedColor;
}

function getStaData(){
	
	$.ajax({
		url:'cotest/getInfo',
		method:"get",
		dataType:"json",
		success:function(jsonObj){

		var cate = jsonObj.cate;
		var hruAvg = jsonObj.hruAvg;
		var deptAvg = jsonObj.deptAvg;
		var colAvg = jsonObj.colAvg;
			
		var labels =[];
		var labelsD = [];
		var labelsC = [];
		var valuesH = [];
		var datasetsD = [];
		var datasetsC = [];
		
		cate.forEach(function(c) {
		      labels.push(c.cotestArea);
		});
		
		deptAvg.forEach(function(dept, index) {
		    labelsD.push(dept.deptName); 

		    var datasetD = {
		        label: dept.deptName, 
		        data: [ 
		            dept.ca01,
		            dept.ca02,
		            dept.ca03,
		            dept.ca04,
		            dept.ca05,
		            dept.ca06
		        ],
		        fill: false, 
		        borderColor: getRandomColor(), 
		        tension: 0.1 
		    };

		    datasetsD.push(datasetD); 
		});
		
		var data = {
			    labels:labels, 
			    datasets: datasetsD 
			};
		
		colAvg.forEach(function(col, index) {
		    labelsC.push(col.colName); 

		    var datasetC = {
		        label: col.colName, 
		        data: [ 
		        	col.ca01,
		        	col.ca02,
		        	col.ca03,
		        	col.ca04,
		        	col.ca05,
		        	col.ca06
		        ],
		        fill: false, 
		        borderColor: getRandomColor(), 
		        tension: 0.1 
		    };

		    datasetsC.push(datasetC); 
		});
		
		var dataC = {
			    labels:labels, 
			    datasets: datasetsC 
			};
				
		valuesH.push(hruAvg.ca01);
		valuesH.push(hruAvg.ca02);
		valuesH.push(hruAvg.ca03);
		valuesH.push(hruAvg.ca04);
		valuesH.push(hruAvg.ca05);
		valuesH.push(hruAvg.ca06);
		
		
// 		console.log("labelsD==>", labelsD);

		var config = {
			    type: 'line', 
			    data: data 
			};
		
		var configC = {
			    type: 'line', 
			    data: dataC 
			};
		
	    const ctx = document.getElementById('DeptBar').getContext('2d');
	    new Chart(ctx, config);
	    
	    const ctxC = document.getElementById('ColBar').getContext('2d');
	    new Chart(ctxC, configC);
	    
			var ctxH = document.getElementById('HRU').getContext('2d');
		    var HRU = new Chart(ctxH, {
		        type: 'bar',
		        data:{
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

window.addEventListener('load', getStaData);
