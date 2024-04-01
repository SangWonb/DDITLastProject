<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
  <style>
  .chart-card {
    width: 300px;
    height: 300px;
    margin-bottom: 20px;
  }
  .chart-title {
    text-align: center;
    font-weight: bold;
  }
  .chart-card {
  	margin-left: 180px;
  }
</style>
<div>

<div class="chartTb bg-white card card-body" style="">
	<div class="row">
		<div class="col-md-3">
			<div class="card chart-card">
				<div class="card-body">
					<canvas id="chart1"></canvas>
				</div>
			</div>
		</div>
		<div class="col-md-3">
			<div class="card chart-card">
				<div class="card-body">
					<canvas id="chart2"></canvas>
				</div>
			</div>
		</div>
		<div class="col-md-3">
			<div class="card chart-card">
				<div class="card-body">
					<canvas id="chart3"></canvas>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="card card-body">
<div class="bg-white " >
				<div class="col d-flex" data-pg-role="searchUI" data-pg-target="#submitForm" >
                     <div class="col-1" style="margin-right: 50px;">
                        <form:select class="form-control" path="paging.simpleCondition.searchType" style="width: 100px;">
                           <form:option value="all" label="전체" selected="true"/>
                           <form:option value="title" label="회사명" />
                           <form:option value="content" label="부서명" />
                        </form:select>
                     </div>

					<div class="col-3 d-flex align-items-start">
                        <form:input type="search" class="form-control" path="paging.simpleCondition.searchWord" aria-label="Search"  style="margin-right: 10px;"/>
                        <input type="button"  class="btn btn-outline-primary" data-pg-role="searchBtn" value="검색"/>
                     </div>
				</div>
			<form:form id="submitForm" action="" modelAttribute="paging" method="get">
	           <input type='hidden' name="page" />
	           <form:input type='hidden' path="simpleCondition.searchType"/>
	           <form:input type='hidden' path="simpleCondition.searchWord"/>
        </form:form> 
		</div>
		
        <div id="mentorList" class="table-responsive" data-toggle="lists"
            data-lists-sort-by="js-lists-values-date" data-lists-sort-desc="true"
            data-lists-values='["js-lists-values-lead", "js-lists-values-project", "js-lists-values-status", "js-lists-values-budget", "js-lists-values-date"]'>
            <table class="table mb-0 thead-border-top-0 table-nowrap bg-white">
		<thead>
			<tr>
				<th style="width: 18px;" class="pr-0">
					<div class="custom-control custom-checkbox">
						<input type="checkbox"
							class="custom-control-input js-toggle-check-all"
							data-target="#projects" id="customCheckAll">
					</div>
				</th>

				<th style="width: 150px;"><a href="javascript:void(0)"
					class="sort" data-sort="js-lists-values-project">순번</a></th>

				<th><a href="javascript:void(0)" class="sort"
					data-sort="js-lists-values-a">회사명</a></th>
					
				<th><a href="javascript:void(0)" class="sort"
					data-sort="js-lists-values-lead">부서명</a></th>

				<th style="width: 48px;"><a href="javascript:void(0)"
					class="sort" data-sort="js-lists-values-status">회사구분</a></th>

				<th style="width: 48px;"><a href="javascript:void(0)"
					class="sort" data-sort="js-lists-values-budget">근무지</a></th>

			</tr>
		</thead>
		<c:forEach items="${graduateEmploymentList }" var="graduate">
			<tbody class="list" id="projects">

				<tr>

					<td class="pr-0">
						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input js-check-selected-row" id="customCheck1_1">
						</div>
					</td>

					<td>

						<div class="media flex-nowrap align-items-center"
							style="white-space: nowrap;">
							<div class="media-body">
								<div class="d-flex flex-column">
									<small class="js-lists-values-project"><strong>${graduate.rnum }</strong></small>
								</div>
							</div>
						</div>
					</td>
					
					<td>
					    <div class="media-body">
					        <div class="d-flex align-items-center">
					            <div class="flex d-flex flex-column">
					                <p class="mb-0">
					                    <strong style="cursor: pointer;" class="js-lists-values-a" id="companyDetail" data-srNo="${graduate.srNo}">
					                        ${graduate.companyNm}
					                    </strong>
					                </p>
					            </div>
					        </div>
					    </div>
					</td>

					<td>
					<div class="media-body">
						<div class="d-flex align-items-center">
							<div class="flex d-flex flex-column">
								<p class="mb-0">
									<strong class="js-lists-values-lead">
									${graduate.companyDept }
									</strong>
								</p>
							</div>
						</div>
					</div>
					</td>

					<td>
						<div class="d-flex flex-column">
							<small class="js-lists-values-status">
								${graduate.companyType }
							</small>
						</div>
					</td>

					<td>
						<div class="d-flex flex-column">
							<small class="js-lists-values-budget"><strong>${graduate.companyLoc }</strong></small>
						</div>
					</td>
			</tbody>
		</c:forEach>
	</table>
		${pagingHTML }
</div>
</div>
</div>
<div id="detailArea"></div>
<script src="<c:url value='/resources/js/paging.js'/>"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
var cPath = $('body').data('bodyCpath')
var companyType = "";
var companyLoc = "";
var companyJob = "";

chart();
  
function chart() {
		
    var url = `\${cPath}/student/careerup/employment/graduateemployment/chart`;
    $.ajax({
        url: url,
        type: 'GET',
        success: function(response) {
        	companyType = response.companyType;
        	companyLoc = response.companyLoc;
        	companyJob = response.companyJob;
			var data1 = {
				    labels: companyJob.map(item => item.companyJob),
				    datasets: [{
				      data: companyJob.map(item => item.count),
				      backgroundColor: [
				    	    '#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0',
				    	    '#9966FF', '#FF8C00', '#32CD32', '#FFD700'
				    	  ]
				    }]
				  };
		  var data2 = {
			    labels: companyLoc.map(item => item.companyLoc),
			    datasets: [{
			      data: companyLoc.map(item => item.count),
			      backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0', '#9966FF']
			    }]
			  };
			
		  var data3 = {
			    labels: companyType.map(item => item.companyType),
			    datasets: [{
			      data: companyType.map(item => item.count),
			      backgroundColor: [ '#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0', '#9966FF', '#FF8C00' ]
			    }]
			  };
			
			  var ctx1 = document.getElementById('chart1').getContext('2d');
			  var chart1 = new Chart(ctx1, {
			    type: 'pie',
			    data: data1,
			    options: {
				      plugins: {
				          title: {
				              display: true,
				              text: '직무'
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
			
			  var ctx2 = document.getElementById('chart2').getContext('2d');
			  var chart2 = new Chart(ctx2, {
			    type: 'pie',
			    data: data2,
			    options: {
				      plugins: {
				          title: {
				              display: true,
				              text: '근무지'
				          },
				          legend: {
				              display: true,
				              position: 'bottom',
				              labels: {
				                  boxWidth: 5,
				                  usePointStyle: true
				                }
				          }
				      }
				  }
			  });
			
			  var ctx3 = document.getElementById('chart3').getContext('2d');
			  var chart3 = new Chart(ctx3, {
			    type: 'pie',
			    data: data3,
			    options: {
				      plugins: {
				          title: {
				              display: true,
				              text: '회사구분'
				          },
				          legend: {
				              display: true,
				              position: 'bottom',
				              labels: {
				                  boxWidth: 6,
				                  usePointStyle: true
				                }
				          }
				      }
				  }
			  });
        },
        error: function(xhr, status, error) {
            console.error('Error chart:', error);
        }
    });
};

//제목 클릭 이벤트
$(document).on('click', '#companyDetail', function() {
	
    var srNo = $(this).attr('data-srNo');
    console.log(srNo);
    var url = `\${cPath}/student/careerup/employment/graduateemployment/graduateEmploymentDetail/\${srNo}`;
    $.ajax({
        url: url,
        type: 'GET',
        success: function(response) {
            $('#detailArea').html(response);
        },
        error: function(xhr, status, error) {
            console.error('Error detail:', error);
        }
    });
});
</script>