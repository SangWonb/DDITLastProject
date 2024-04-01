<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
    .chOne, .chTwo {
        margin-left: 15px;
        margin-right: 15px;
        margin-top: 15px;
        margin-bottom: 15px;
    }
</style>
<div class="container page__container">
<div class="charts">
    <div class="page-section">
        <div class="row mb-lg-8pt">
            <div class="col-lg-6">
                <div class="card container page__container">
                    <div class="container page__container chOne">
                        <canvas id="scholarshipChart" width="600" height="600"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="card container page__container">
                    <div class="container page__container chTwo">    
                        <canvas id="myDoughnutChart" width="300" height="300"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    // 색상을 랜덤으로 생성하는 함수
    function getRandomColor() {
        var letters = '0123456789ABCDEF';
        var color = '#';
        for (var i = 0; i < 6; i++) {
            color += letters[Math.floor(Math.random() * 16)];
        }
        return color;
    }   

    var randomColors = [];
    var labels = [];
    <c:forEach items="${deptCount}" var="dept">
        labels.push("${dept.deptName}");
    </c:forEach>

    var data = [];
    <c:forEach items="${deptCount}" var="dept">
        data.push("${dept.count}");
    </c:forEach>

    var data = {
        labels: labels,
        datasets: [
            {
                label: '장학금 수혜율',
                data: data,
                backgroundColor: '#9966CC',
            },
        ]
    };

    var config = {
        type: 'bar',
        data: data,
        options: {
            plugins: {
                title: {
                    display: true,
                    text: '학과별 장학금 수혜비율'
                },
            },
            responsive: true,
            interaction: {
                intersect: false,
            },
            scales: {
                x: {
                    stacked: true,
                },
                y: {
                    stacked: true
                }
            },
            plugins: {
                legend: {
                    labels: {
                        font: {
                            size: 20
                        }
                    }
                }
            }
        }
    };

    var ctx = document.getElementById('scholarshipChart').getContext('2d');
    new Chart(ctx, config);

    ///////////////////////////////////////////////////////////////////////////

    var randomColors = [];
    labels = [];
    dataForS = [];

    <c:forEach items="${scCount}" var="sc">
        labels.push("${sc.scholName}");
        dataForS.push("${sc.count}");
        randomColors.push(getRandomColor());
    </c:forEach>

    const data2 = {
        labels: labels,
        datasets: [
            {
                label: 'Dataset 1',
                data: dataForS, 
                backgroundColor: randomColors,
                borderColor: randomColors,
                borderWidth: 1
            }
        ]
    };

    const config1 = {
        type: 'doughnut',
        data: data2,
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'top',
                },
                title: {
                    display: true,
                    text: '장학금별 수혜비율'
                }
            },
            plugins: {
                legend: {
                    labels: {
                        font: {
                            size: 20
                        }
                    }
                }
            }
        },
    };

    const ctx1 = document.getElementById('myDoughnutChart').getContext('2d');
    new Chart(ctx1, config1);
</script>
