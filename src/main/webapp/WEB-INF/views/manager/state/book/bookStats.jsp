<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<style>
	.memCnt{
		text-align: center;
		margin-top: 40px;
		
	}
	.divContent{
		text-align: center;
	}
	.headText {
		text-align: center;
	}
</style>
<div class="page-separator">
    <div class="page-separator__text">Overview</div>
		</div>
	<div class="container page__container">
		
		<div class="row card-group-row mb-lg-8pt divContent">
			<div class="col-md-6 card-group-row__col">
		
		        <div class="card card-group-row__card">
		            <div class="card-header p-0 nav border-0">
		                <div class="row no-gutters flex"
		                     role="tablist">
		                    <div class="col-auto">
		                        <div class="p-card-header d-flex align-items-center">
		                            <div class="h2 mb-0 mr-3 headText">월별 도서 통계</div>
		                            <div class="flex d-flex flex-column">
		                            </div>
		                        </div>
		                    </div>
		                    <div class="col-auto ml-sm-auto">
		                        <div class="p-card-header"></div>
		                    </div>
		                </div>
		            </div>
		            <div class="card-body">
		                <canvas id="myChart" width="400" height="400"></canvas>
		            </div>
		        </div>
		
		    </div>
			<div class="col-md-6 card-group-row__col">
		
		        <div class="card card-group-row__card">
		            <div class="card-header p-0 nav border-0">
		                <div class="row no-gutters flex"
		                     role="tablist">
		                    <div class="col-auto">
		                        <div class="p-card-header d-flex align-items-center headText">
		                            <div class="h2 mb-0 mr-3">작년 도서 통계</div>
		                        </div>
		                    </div>
		                    <div class="col-auto ml-sm-auto">
		                        <div class="p-card-header"></div>
		                    </div>
		                </div>
		            </div>
		            <div class="card-body">
		                <canvas id="myChartOne" width="400" height="400"></canvas>
		            </div>
		        </div>
		
		    </div>
			<div class="col-md-6 card-group-row__col">
		
		        <div class="card card-group-row__card">
		            <div class="card-header p-0 nav border-0">
		                <div class="row no-gutters flex"
		                     role="tablist">
		                    <div class="col-auto">
		                        <div class="p-card-header d-flex align-items-center">
		                            <div class="h2 mb-0 mr-3">지난 달 인기 있는 도서</div>
		                        </div>
		                    </div>
		                    <div class="col-auto ml-sm-auto">
		                        <div class="p-card-header"></div>
		                    </div>
		                </div>
		            </div>
		            <div class="card-body">
		                <canvas id="myChartTwo" width="400" height="400"></canvas>
		            </div>
		        </div>
		
		    </div>
			<div class="col-md-6 card-group-row__col">
		
		        <div class="card card-group-row__card">
		            <div class="card-header p-0 nav border-0">
		                <div class="row no-gutters flex"
		                     role="tablist">
		                    <div class="col-auto">
		                        <div class="p-card-header d-flex align-items-center">
		                            <div class="h2 mb-0 mr-3">지난 달 인기 있는도서<br> 카테고리</div>
		                        </div>
		                    </div>
		                    <div class="col-auto ml-sm-auto">
		                        <div class="p-card-header"></div>
		                    </div>
		                </div>
		            </div>
		            <div class="card-body">
		                <canvas id="myChartThree" width="400" height="400"></canvas>
		            </div>
		        </div>
		
		    </div>
		    
		    
		</div>
	</div>
			
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<%-- ${monthlyStats } --%>
<%-- ${lastYearStats } --%>
<%-- ${mostPopularBooksLastMonth } --%>
<%-- ${mostPopularCategoryLastMonth } --%>
<script>
// rentalCounts 변수에 도서 대여량 데이터를 할당
var rentalCounts = [];
var rentalMonth = [];
var LastYearCounts = [];
var mostBookCnt = [];
var mostBooks = [];
var mostCategoryCnt = [];
var mostCategory = [];

<c:forEach items="${monthlyStats }" var="rental">
	rentalCounts.push(${rental.rentCount})
</c:forEach>
<c:forEach items="${monthlyStats }" var="rental">
	rentalMonth.push(${rental.month})
</c:forEach>	
<c:forEach items="${lastYearStats }" var="rentalLast">
	LastYearCounts.push(${rentalLast.rentCount})
</c:forEach>
<c:forEach items="${mostPopularBooksLastMonth }" var="mostPopBook">
	mostBookCnt.push(${mostPopBook.stats})
</c:forEach>
<c:forEach items="${mostPopularBooksLastMonth }" var="mostPopBookList">
	mostBooks.push("${mostPopBookList.bookName}")
</c:forEach>
<c:forEach items="${mostPopularCategoryLastMonth }" var="mostPopCate">
	mostCategoryCnt.push(${mostPopCate.stats})
</c:forEach>
<c:forEach items="${mostPopularCategoryLastMonth }" var="mostPop">
	mostCategory.push("${mostPop.bookCategory}")
</c:forEach>
	
var ctx = document.getElementById('myChart').getContext('2d');
var ctxOne = document.getElementById('myChartOne').getContext('2d');
var ctxTwo = document.getElementById('myChartTwo').getContext('2d');
var ctxThree = document.getElementById('myChartThree').getContext('2d');

// 차트에 사용할 데이터 설정
var data1 = {
    labels: rentalMonth.map(month => month + '월'),
    datasets: [{
        label: '# of Rentals',
        data: rentalCounts,
        backgroundColor: 'rgba(255, 99, 132, 0.2)',
        borderColor: 'rgba(255, 99, 132, 1)',
        borderWidth: 1
    }]
};


var data2 = {
    labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    datasets: [{
        label: '# of Votes',
        data: LastYearCounts,
        backgroundColor: 'rgba(54, 162, 235, 0.2)',
        borderColor: 'rgba(54, 162, 235, 1)',
        borderWidth: 1
    }]
};

var data3 = {
//     labels: ['헤테로토피아', '파브르 식물기', '기도는 사라지지 않는다', '최소한 그러나 더 나은', '7인 1역', '언어의 온도', '잠들기 전에 읽는 니체', '호흡의 기술', '뇌과학 기반 동기와 학습', '마침내, 교회가 희망이다', '총 균 쇠'],
    labels: mostBooks,
    datasets: [{
        label: '# of Votes',
        data: mostBookCnt,
        backgroundColor: [
            'rgba(255, 99, 132, 0.2)',
            'rgba(54, 162, 235, 0.2)',
            'rgba(255, 206, 86, 0.2)',
            'rgba(75, 192, 192, 0.2)',
            'rgba(153, 102, 255, 0.2)',
            'rgba(255, 159, 64, 0.2)',
            'rgba(201, 203, 207, 0.2)',
            'rgba(255, 255, 000, 0.2)',
            'rgba(135, 206, 250, 0.2)',
            'rgba(152, 251, 152, 0.2)',
            'rgba(240, 230, 140, 0.2)'
        ],
        borderColor: [
            'rgba(255, 99, 132, 1)',
            'rgba(54, 162, 235, 1)',
            'rgba(255, 206, 86, 1)',
            'rgba(75, 192, 192, 1)',
            'rgba(153, 102, 255, 1)',
            'rgba(255, 159, 64, 1)',
            'rgba(201, 203, 207, 1)',
            'rgba(255, 255, 000, 1)',
            'rgba(135, 206, 250, 1)',
            'rgba(152, 251, 152, 1)',
            'rgba(240, 230, 140, 1)'
        ],
        borderWidth: 1
    }]
};


var data4 = {
//     labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
    labels: mostCategory,
    datasets: [{
        label: '# of Votes',
        data: mostCategoryCnt,
        backgroundColor: [
            'rgba(255, 99, 132, 0.2)',
            'rgba(54, 162, 235, 0.2)',
            'rgba(255, 206, 86, 0.2)',
            'rgba(75, 192, 192, 0.2)',
            'rgba(255, 255, 000, 0.2)',
            'rgba(153, 102, 255, 0.2)',
            'rgba(201, 203, 207, 0.2)',
            'rgba(000, 051, 204, 0.2)',
            'rgba(152, 251, 152, 0.2)'
        ],
        borderColor: [
            'rgba(255, 99, 132, 1)',
            'rgba(54, 162, 235, 1)',
            'rgba(255, 206, 86, 1)',
            'rgba(75, 192, 192, 1)',
            'rgba(255, 255, 000, 0.2)',
            'rgba(153, 102, 255, 1)',
            'rgba(201, 203, 207, 1)',
            'rgba(000, 051, 204, 0.2)',
            'rgba(152, 251, 152, 0.2)'
        ],
        borderWidth: 1
    }]
};

// 각 차트 생성
var myChart = new Chart(ctx, {
    type: 'bar',
    data: data1,
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});

var myChartOne = new Chart(ctxOne, {
    type: 'bar',
    data: data2,
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});

var myChartTwo = new Chart(ctxTwo, {
    type: 'doughnut',
    data: data3,
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});

var myChartThree = new Chart(ctxThree, {
    type: 'polarArea',
    data: data4,
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});
</script>
