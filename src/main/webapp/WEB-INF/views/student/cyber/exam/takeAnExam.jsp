<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<style>
.btwExam { 
  display: flex; 
 } 
 
</style>
<div class="card card-body">
<div class="btwExam">
    <div>
        <h1>${testInfo.ltName}</h1>
    </div>
    <div style="margin-top: 10px; margin-left: auto;">
        <button class="btn btn-accent btn-lg">제출하기</button>
    </div>
</div>
<div class="card card-body" style="background-color: #f2f2f2; border-radius: 10px;">
	<div class="btwExam">
		<div class="card card-body" style="width:60%; margin-right:1%; text-align:center;">
			<div class="item">
				<img src="/lcms/resources/images/cybernotice/testimage01.jpg" style="width: 1100px; height: 1200px;">
			</div>
		</div>
		<div class="card card-body" style="width:10%">
			<div class="card card-body" style="background-color: #FFCCCC; border-radius: 10px; height:210px;">
				<div class="card card-body" style="margin-bottom:10px;"  >
					<h5 style="text-align:center;">&lt;&lt;응시정보&gt;&gt;</h5>
					<span>응시자명 : ${memName}&nbsp;&nbsp;(${memNo})</span>				
					<span>총문항수 : ${testInfo.ltTotalQ}</span>				
					<span>총&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;점 : ${testInfo.ltTotalScore} 점</span>				
					<span>총&nbsp;&nbsp;시&nbsp;&nbsp;간 : ${testInfo.ltTotalTime}분</span>
					<span>응시날짜 :<span id="currentDate"></span></span>
				</div>
				<div class="card card-body" style="text-align:center;">
					<h5 id="pastTime">경과시간 : <span id="elapsedTime">00:00:00</span> </h5>
					<h5 id="pastTime">남은시간: <span id="remaining">00:00:00</span> </h5>
					<h4><span id="selectedRadioCount">0</span>/${testInfo.ltTotalQ}</h4>
					<div class="card card-body" style="background-color: #f2f2f2; border-radius: 10px;">
						<h6>미선택 문항</h6>
						<div class="card card-body" style="height:3%">
							<span id="unselectedQuestions"></span>
						</div>
					</div>
				</div>
			</div>
			<div class="card card-body" style=" border-radius: 10px;">
			<div style="margin-top:10px;">
				<h5>입력답안</h5>
				<div class="card card-body" style="background-color: #f2f2f2; border-radius: 10px;">
					<table class="table" style="background-color:#FFFFFF; text-align:center;">
					    <tr>
					        <th>문제번호</th>
					        <th>입력답안</th>
					    </tr>
 						<c:forEach items="${qList}" var="q">
					    <tr>
					        <th>문${q.tqNo}</th>
					        <td>
					            <c:choose>
					             <c:when test="${testInfo.ltType eq 'FIVE'}">
								    <c:forEach var="i" begin="1" end="5" step="1">
								        <input type="radio" name="answer-${q.tqNo}" id="answer-${q.tqNo}-${i}" value="${i}" data-score="${q.tqScore}"  >
								        <label for="answer-${q.tqNo}-${i}">${i}</label>
								    </c:forEach>
								</c:when>
					                <c:otherwise>
					                    <c:forEach var="i" begin="1" end="4" step="1">
								        	<label for="answer-${q.tqNo}-${i}">${i}</label>
					                        <input type="radio" name="answer-${q.tqNo}" id="answer-${q.tqNo}-${i}" value="${i}" data-score="${q.tqScore}">
					                    </c:forEach>
					                </c:otherwise>
					            </c:choose>
					        </td>
					    </tr>
					    </c:forEach>
					</table>
				</div>
				</div>
			</div>
			</div>
		</div>
	</div>
</div>
<script>
    // JavaScript로 클릭 이벤트 처리
    var circles = document.querySelectorAll('.number-circle');

    circles.forEach(function(circle) {
        circle.addEventListener('click', function() {
            // 선택된 항목에 selected 클래스 추가
            circles.forEach(function(c) {
                c.classList.remove('selected');
            });
            this.classList.add('selected');
        });
    });
    
    function getCurrentDate() {
        var currentDate = new Date(); // 현재 날짜 및 시간을 가져옵니다.
        var year = currentDate.getFullYear(); // 연도를 가져옵니다.
        var month = currentDate.getMonth() + 1; // 월을 가져옵니다. (0부터 시작하므로 1을 더해줍니다.)
        var day = currentDate.getDate(); // 일을 가져옵니다.

        // 날짜를 YYYY-MM-DD 형식으로 변환합니다.
        var formattedDate = year + '-' + (month < 10 ? '0' : '') + month + '-' + (day < 10 ? '0' : '') + day;

        return formattedDate;
    }

    // HTML 요소에 현재 날짜를 표시하는 함수
    function displayCurrentDate() {
        var currentDateElement = document.getElementById('currentDate');
        if (currentDateElement) {
            currentDateElement.textContent = getCurrentDate();
        }
    }

    // 페이지 로드 시 현재 날짜 표시
    displayCurrentDate();
    
    var entryTime = new Date();
    var totalSeconds = parseInt("${testInfo.ltTotalTime}") * 60; // 총 시험 시간 (초 단위)
    var remainingTimeDisplay = document.getElementById('remaining');

    function updateElapsedTime() {
        var elapsedTime = new Date() - entryTime;
        var hours = Math.floor((elapsedTime / (1000 * 60 * 60)) % 24);
        var minutes = Math.floor((elapsedTime / (1000 * 60)) % 60);
        var seconds = Math.floor((elapsedTime / 1000) % 60);
        var elapsedTimeString = (hours < 10 ? '0' : '') + hours + ':' +
                                (minutes < 10 ? '0' : '') + minutes + ':' +
                                (seconds < 10 ? '0' : '') + seconds;
        document.getElementById('elapsedTime').textContent = elapsedTimeString;

        // 남은 시간 계산
        var remainingSeconds = totalSeconds - Math.floor(elapsedTime / 1000); // 남은 초 단위 시간
        var remainingHours = Math.floor(remainingSeconds / 3600); // 시간 단위로 변환
        var remainingMinutes = Math.floor((remainingSeconds % 3600) / 60); // 분 단위로 변환
        var remainingSecondsMod = remainingSeconds % 60;
        var remainingTimeString = (remainingHours < 10 ? '0' : '') + remainingHours + ':' +
                                    (remainingMinutes < 10 ? '0' : '') + remainingMinutes + ':' +
                                    (remainingSecondsMod < 10 ? '0' : '') + remainingSecondsMod;
        remainingTimeDisplay.textContent = remainingTimeString;
    }

    setInterval(updateElapsedTime, 1000);

    updateElapsedTime();

    var selectedRadioCount = 0;

    // 페이지 로드 시 선택된 라디오 버튼의 개수 초기화
    window.onload = function() {
        updateSelectedRadioCount();
    };

    // 라디오 버튼의 선택 여부를 확인하고 개수를 업데이트하는 함수
    function updateSelectedRadioCount() {
        selectedRadioCount = document.querySelectorAll('input[type="radio"]:checked').length;
        document.getElementById('selectedRadioCount').textContent = selectedRadioCount;
    }

    // 라디오 버튼에 대한 이벤트 핸들러 등록
	 var radioButtons = document.querySelectorAll('input[type="radio"]');
	 radioButtons.forEach(function(button) {
	    button.addEventListener('change', function() {
	        updateSelectedRadioCount(); // 라디오 버튼이 변경될 때마다 선택된 개수 업데이트
	        displayUnselectedQuestions(); // 선택되지 않은 문항 업데이트
	    });
	});

    // 선택되지 않은 문항의 번호를 추적하는 함수
    function findUnselectedQuestions() {
        var unselectedQuestions = [];
        var totalQuestions = parseInt("${testInfo.ltTotalQ}");

        // 모든 문항을 검사하여 선택되지 않은 문항을 찾음
        for (var i = 1; i <= totalQuestions; i++) {
            var radioButtonsForQuestion = document.querySelectorAll('input[name="answer-' + i + '"]');
            var checked = false;
            radioButtonsForQuestion.forEach(function(button) {
                if (button.checked) {
                    checked = true;
                }
            });
            if (!checked) {
                unselectedQuestions.push(i);
            }
        }

        return unselectedQuestions;
    }

    // 선택되지 않은 문항의 번호를 표시하는 함수
    function displayUnselectedQuestions() {
        var unselectedQuestions = findUnselectedQuestions();
        var unselectedQuestionsElement = document.getElementById('unselectedQuestions');
        
        if (unselectedQuestions.length > 0) {
            var formattedQuestions = unselectedQuestions.map(function(questionNo) {
                return questionNo + "번";
            });
            unselectedQuestionsElement.textContent = formattedQuestions.join(', ');
        } else {
            unselectedQuestionsElement.textContent = "없음.";
        }
    }

    // 페이지 로드 시 선택되지 않은 문항 표시
    window.onload = function() {
        displayUnselectedQuestions();
    };
    
    var submitButton = document.querySelector('.btn.btn-accent.btn-lg');
    submitButton.addEventListener('click', function() {
        // 모든 문제에 대해 반복
        var totalScore = 0;
        var totalQuestions = parseInt("${testInfo.ltTotalQ}");

        var selectAnswerList = []; // 답변을 저장할 배열

     // 모든 문제에 대해 반복
     for (var i = 0; i < totalQuestions; i++) {
         var selectedAnswer = document.querySelector('input[name="answer-' + (i + 1) + '"]:checked');
         if (selectedAnswer) {
             // 선택된 답변이 있는 경우 해당 답변을 배열에 추가
             selectAnswerList.push(selectedAnswer.value);
         } else {
             // 선택된 답변이 없는 경우 0을 배열에 추가
             selectAnswerList.push('0');
         }
     }

	console.log("여기야",selectAnswerList);

	$.ajax({
                url: 'getAnswer', 
                type: 'GET',
                success: function(response) { 
                	var answerList = response.answerList;
                    var scores = response.score;

                    var totalScore = 0;

                    for (var i = 0; i < answerList.length; i++) {
                        var Answer = parseInt(answerList[i]); // 정답
                        var selected = parseInt(selectAnswerList[i]);//선택한 값
                        var score = parseInt(scores[i]); // 해당 문제의 점수
//                            	console.log("비교", selected === Answer);
//                            	console.log("비교", score);
//                            	console.log("비교", selected);
//                            	console.log("비교", Answer);
                        if (selected === Answer) {
                           	totalScore += score;
                        }
//                         console.log("totalScore:야양야야야",totalScore)
                    }
                    
                    $.ajax({
                        url: 'insertScore', // 요청을 보낼 URL
                        type: 'POST', // 요청 방식
                        data : JSON.stringify(totalScore),
                        dataType: "json",
    				    contentType: "application/json",
                        success: function(response) { 
//                         	console.log("여기왔니?");
                        	window.location.href="http://localhost/lcms/student/cyber/exam/exam";
                },
                error: function(jqXHR, textStatus, errorThrown) { // 요청 실패 시 실행할 콜백 함수
                    console.error("Request failed:", textStatus, errorThrown);
                }
            });

                }, error: function(jqXHR, textStatus, errorThrown) { // 요청 실패 시 실행할 콜백 함수
                    console.error("Request failed:", textStatus, errorThrown);
                }

        
    });
    });
    
    function checkRemainingTime() {
        var remainingTime = document.getElementById('remaining').textContent;
        if (remainingTime === '00:00:00') {
            var submitButton = document.querySelector('.btn.btn-accent.btn-lg');
            submitButton.click(); // 제출하기 버튼 클릭
        }
    }

    setInterval(checkRemainingTime, 1000);


</script>