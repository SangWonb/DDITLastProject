<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<div class="card card-body" id="mainArea">
	   <h2 style="text-align:center;">HRU 6대 핵심역량 진단평가</h2>
   <div style="margin-top:10px; display: flex; justify-content: flex-end; margin-right:15%">
   	  <button id="infoBtn" class="btn btn-outline-secondary" style="margin-right:10px;">시연용</button>
      <button id="submitBtn" class="btn btn-primary">제출하기</button>
   </div>
   <div style="background-color: #f2f2f2; border-radius: 10px; text-align:center; padding: 20px; width:70%;margin-left:15%; margin-top:1%; margin-bottom:1%; max-height:500px; overflow: auto;">
      <div>
         <span style="font-weight:bold; font-size:20px; ">푼문제/총문항수 :  <span id="totalChecked">0</span>/${total}</span>
        <br>
 <c:set var="startNum" value="" />
<c:set var="endNum" value="" />
<c:set var="areaName" value="" />

<c:forEach items="${qList}" var="q">
    <c:if test="${q.cotestAreaCode eq 'CA03'}">
        <c:set var="areaName" value="${q.cotestArea}" />
        <c:set var="quesno" value="${fn:substring(q.cotestQuesno, 2, 5)}" />
        <c:if test="${startNum == ''}">
            <c:set var="startNum" value="${quesno}" />
        </c:if>
        <c:set var="endNum" value="${quesno}" />
    </c:if>
    
</c:forEach>

<c:if test="${areaName ne ''}">
    <c:out value="${areaName} : ${startNum}~${endNum}" escapeXml="false"/>
,
    <c:set var="endNum" value="" />
     <c:set var="startNum" value="" />
     <c:set var="areaName" value="" />
</c:if>

<c:forEach items="${qList}" var="q">
    <c:if test="${q.cotestAreaCode eq 'CA04'}">
        <c:set var="areaName" value="${q.cotestArea}" />
        <c:set var="quesno" value="${fn:substring(q.cotestQuesno, 2, 5)}" />
        <c:if test="${startNum == ''}">
            <c:set var="startNum" value="${quesno}" />
        </c:if>
        <c:set var="endNum" value="${quesno}" />
    </c:if>
    
</c:forEach>

<c:if test="${areaName ne ''}">
    <c:out value="${areaName} : ${startNum}~${endNum}" escapeXml="false"/>
,
     <c:set var="endNum" value="" />
     <c:set var="startNum" value="" />
     <c:set var="areaName" value="" />
</c:if>

<c:forEach items="${qList}" var="q">
    <c:if test="${q.cotestAreaCode eq 'CA05'}">
        <c:set var="areaName" value="${q.cotestArea}" />
        <c:set var="quesno" value="${fn:substring(q.cotestQuesno, 2, 5)}" />
        <c:if test="${startNum == ''}">
            <c:set var="startNum" value="${quesno}" />
        </c:if>
        <c:set var="endNum" value="${quesno}" />
    </c:if>
    
</c:forEach>

<c:if test="${areaName ne ''}">
    <c:out value="${areaName} : ${startNum}~${endNum}" escapeXml="false"/>
,
     <c:set var="endNum" value="" />
     <c:set var="startNum" value="" />
     <c:set var="areaName" value="" />
</c:if>

<c:forEach items="${qList}" var="q">
    <c:if test="${q.cotestAreaCode eq 'CA06'}">
        <c:set var="areaName" value="${q.cotestArea}" />
        <c:set var="quesno" value="${fn:substring(q.cotestQuesno, 2, 5)}" />
        <c:if test="${startNum == ''}">
            <c:set var="startNum" value="${quesno}" />
        </c:if>
        <c:set var="endNum" value="${quesno}" />
    </c:if>
    
</c:forEach>

<c:if test="${areaName ne ''}">
    <c:out value="${areaName} : ${startNum}~${endNum}" escapeXml="false"/>
,
     <c:set var="endNum" value="" />
     <c:set var="startNum" value="" />
     <c:set var="areaName" value="" />
</c:if>

<c:forEach items="${qList}" var="q">
    <c:if test="${q.cotestAreaCode eq 'CA01'}">
        <c:set var="areaName" value="${q.cotestArea}" />
        <c:set var="quesno" value="${fn:substring(q.cotestQuesno, 2, 5)}" />
        <c:if test="${startNum == ''}">
            <c:set var="startNum" value="${quesno}" />
        </c:if>
        <c:set var="endNum" value="${quesno}" />
    </c:if>
    
</c:forEach>

<c:if test="${areaName ne ''}">
    <c:out value="${areaName} : ${startNum}~${endNum}" escapeXml="false"/>
,
     <c:set var="endNum" value="" />
     <c:set var="startNum" value="" />
     <c:set var="areaName" value="" />
</c:if>

<c:forEach items="${qList}" var="q">
    <c:if test="${q.cotestAreaCode eq 'CA02'}">
        <c:set var="areaName" value="${q.cotestArea}" />
        <c:set var="quesno" value="${fn:substring(q.cotestQuesno, 2, 5)}" />
        <c:if test="${startNum == ''}">
            <c:set var="startNum" value="${quesno}" />
        </c:if>
        <c:set var="endNum" value="${quesno}" />
    </c:if>
    
</c:forEach>

<c:if test="${areaName ne ''}">
     <c:out value="${areaName} : ${startNum}~${endNum}" escapeXml="false"/>
<br/>
     <c:set var="endNum" value="" />
     <c:set var="startNum" value="" />
     <c:set var="areaName" value="" />
</c:if>
      </div>

   </div>
   <div style="width:99%; margin-left:12.5%; margin-top:10px;">
      <button class="btn btn-primary btn-lg" style="margin-right:5px;" id="tab1btn">1.자기관리영역</button>
      <button class="btn btn-primary btn-lg" style="margin-right:5px;" id="tab2btn">2.의사소통역역</button>
      <button class="btn btn-primary btn-lg" style="margin-right:5px;" id="tab3btn">3.대인관계영역</button>
      <button class="btn btn-primary btn-lg" style="margin-right:5px;"id="tab4btn">4.창의융합영역</button>
      <button class="btn btn-primary btn-lg" style="margin-right:5px;"id="tab5btn">5.인성영역</button>
      <button class="btn btn-primary btn-lg" style="margin-right:5px;"id="tab6btn">6.글로벌영역</button>
   </div>
   <span style="text-align:center; margin-top:10px;"> * 버튼을 누르면 해당 영역으로 이동할 수 있습니다. </span>
   <div  style="max-height: 500px; overflow: auto; border: 1px solid #ccc; border-radius: 10px;">
         <h3 id="tab1" style="text-align:center; margin-top:2%">1.자기관리영역</h3>
      <div style="background-color: #f2f2f2; border-radius: 10px; width:85%; margin-left:7.5%">
      <table  style="width:80%; margin-left:25%;">
     <c:forEach items="${qList}" var="q" varStatus="status">
     	<c:if test="${q.cotestAreaCode eq 'CA03'}">
     <tr>
            <th style="font-size:20px; padding:20px;">${fn:substring(q.cotestQuesno, 2, 5)}.${q.cotestQues}</th>
         </tr>
         <tr>
            <td class="answer" style="padding:30px;" >
           	<c:forEach items="${tList}" var="t">
           		<div style="display: inline-block; margin-right: 10px;">
               		<input type="radio" name="${q.cotestQuesno}" value="${t.textScore}">&nbsp;&nbsp;${t.rnum}.&nbsp;${t.textNm}
           		</div>
           	</c:forEach>
            </td>
         </tr>
     	</c:if>
     </c:forEach>
</table>
      </div>
           <h3  id="tab2" style="text-align:center; margin-top:2%">2.의사소통영역</h3>
      <div style="background-color: #f2f2f2; border-radius: 10px; width:90%; margin-left:5%">
      <table  style="width:80%; margin-left:25%;">
     <c:forEach items="${qList}" var="q" varStatus="status">
     	<c:if test="${q.cotestAreaCode eq 'CA04'}">
     <tr>
            <th style="font-size:20px; padding:20px;">${fn:substring(q.cotestQuesno, 2, 5)}.${q.cotestQues}</th>
         </tr>
         <tr>
            <td class="answer" style="padding:30px;" >
           	<c:forEach items="${tList}" var="t">
           		<div style="display: inline-block; margin-right: 10px;">
               		<input type="radio" name="${q.cotestQuesno}" value="${t.textScore}">&nbsp;&nbsp;${t.rnum}.&nbsp;${t.textNm}
           		</div>
           	</c:forEach>
            </td>
         </tr>
     	</c:if>
     </c:forEach>
</table>
      </div>
              <h3 id="tab3" style="text-align:center; margin-top:2%">3.대인관계영역</h3>
      <div style="background-color: #f2f2f2; border-radius: 10px; width:90%; margin-left:5%">
      <table id="tab3" style="width:80%; margin-left:25%;">
     <c:forEach items="${qList}" var="q" varStatus="status">
     	<c:if test="${q.cotestAreaCode eq 'CA05'}">
     <tr>
            <th style="font-size:20px; padding:20px;">${fn:substring(q.cotestQuesno, 2, 5)}.${q.cotestQues}</th>
         </tr>
         <tr>
            <td class="answer" style="padding:30px;" >
           	<c:forEach items="${tList}" var="t">
           		<div style="display: inline-block; margin-right: 10px;">
               		<input type="radio" name="${q.cotestQuesno}" value="${t.textScore}">&nbsp;&nbsp;${t.rnum}.&nbsp;${t.textNm}
           		</div>
           	</c:forEach>
            </td>
         </tr>
     	</c:if>
     </c:forEach>
</table>
      </div>
   
           <h3 id="tab4" style="text-align:center; margin-top:2%">4.창의융합영역</h3>
      <div style="background-color: #f2f2f2; border-radius: 10px; width:90%; margin-left:5%">
      <table id="tab4" style="width:80%; margin-left:25%;">
     <c:forEach items="${qList}" var="q" varStatus="status">
     	<c:if test="${q.cotestAreaCode eq 'CA06'}">
     <tr>
            <th style="font-size:20px; padding:20px;">${fn:substring(q.cotestQuesno, 2, 5)}.${q.cotestQues}</th>
         </tr>
         <tr>
            <td class="answer" style="padding:30px;" >
           	<c:forEach items="${tList}" var="t">
           		<div style="display: inline-block; margin-right: 10px;">
               		<input type="radio" name="${q.cotestQuesno}" value="${t.textScore}">&nbsp;&nbsp;${t.rnum}.&nbsp;${t.textNm}
           		</div>
           	</c:forEach>
            </td>
         </tr>
     	</c:if>
     </c:forEach>
</table>
      </div>
   
           <h3 id="tab5" style="text-align:center; margin-top:2%">5.인성영역</h3>
      <div style="background-color: #f2f2f2; border-radius: 10px; width:90%; margin-left:5%">
      <table id="tab5" style="width:80%; margin-left:25%;">
     <c:forEach items="${qList}" var="q" varStatus="status">
     	<c:if test="${q.cotestAreaCode eq 'CA01'}">
     <tr>
            <th style="font-size:20px; padding:20px;">${fn:substring(q.cotestQuesno, 2, 5)}.${q.cotestQues}</th>
         </tr>
         <tr>
            <td class="answer" style="padding:30px;" >
           	<c:forEach items="${tList}" var="t">
           		<div style="display: inline-block; margin-right: 10px;">
               		<input type="radio" name="${q.cotestQuesno}" value="${t.textScore}">&nbsp;&nbsp;${t.rnum}.&nbsp;${t.textNm}
           		</div>
           	</c:forEach>
            </td>
         </tr>
     	</c:if>
     </c:forEach>
</table>
      </div>
   
           <h3  id="tab6" style="text-align:center;  margin-top:2%">6.글로벌영역</h3>
      <div style="background-color: #f2f2f2; border-radius: 10px; width:90%; margin-left:5%">
      <table id="tab6" style="width:80%; margin-left:25%;">
     <c:forEach items="${qList}" var="q" varStatus="status">
     	<c:if test="${q.cotestAreaCode eq 'CA02'}">
     <tr>
            <th style="font-size:20px; padding:20px;">${fn:substring(q.cotestQuesno, 2, 5)}.${q.cotestQues}</th>
         </tr>
         <tr>
            <td class="answer" style="padding:30px;" >
           	<c:forEach items="${tList}" var="t">
           		<div style="display: inline-block; margin-right: 10px;">
               		<input type="radio" name="${q.cotestQuesno}" value="${t.textScore}">&nbsp;&nbsp;${t.rnum}.&nbsp;${t.textNm}
           		</div>
           	</c:forEach>
            </td>
         </tr>
     	</c:if>
     </c:forEach>
</table>
      </div>
   
   </div>
   
   
</div>

<script>
    document.getElementById('tab1btn').addEventListener('click', function() {
        document.getElementById('tab1').scrollIntoView({ behavior: 'smooth' });
    });

    document.getElementById('tab2btn').addEventListener('click', function() {
        document.getElementById('tab2').scrollIntoView({ behavior: 'smooth' });
    });

    document.getElementById('tab3btn').addEventListener('click', function() {
        document.getElementById('tab3').scrollIntoView({ behavior: 'smooth' });
    });


    document.getElementById('tab4btn').addEventListener('click', function() {
        document.getElementById('tab4').scrollIntoView({ behavior: 'smooth' });
    });


    document.getElementById('tab5btn').addEventListener('click', function() {
        document.getElementById('tab5').scrollIntoView({ behavior: 'smooth' });
    });


    document.getElementById('tab6btn').addEventListener('click', function() {
        document.getElementById('tab6').scrollIntoView({ behavior: 'smooth' });
    });
    
    
    document.addEventListener('DOMContentLoaded', function() {
        var totalChecked = 0;

        // 문항 별로 라디오 버튼이 선택되었는지 확인하는 함수
        function isQuestionChecked(questionId) {
            var questionRadios = document.getElementsByName(questionId);
            var checkedRadios = Array.from(questionRadios).filter(radio => radio.checked);
            return checkedRadios.length > 0;
        }

        // 라디오 버튼 클릭 시 실행되는 함수
        function updateTotalChecked() {
            // 선택된 라디오 버튼 개수를 초기화
            totalChecked = 0;

            // 문항 목록을 순회하면서 라디오 버튼이 선택된 문항 개수를 다시 계산
            <c:forEach items="${qList}" var="q">
                var questionId = "${q.cotestQuesno}";
                if (isQuestionChecked(questionId)) {
                    totalChecked++;
                }
            </c:forEach>

            // 선택된 라디오 버튼 개수를 콘솔에 출력
//             console.log("전체 문항 중 선택된 라디오 버튼 개수:", totalChecked);

            // 선택된 라디오 버튼 개수를 페이지에 표시
            var totalSpan = document.getElementById('totalChecked');
            if (totalSpan) {
                totalSpan.textContent = totalChecked;
            }
        }

        // 모든 라디오 버튼에 대해 클릭 이벤트를 추가
        var radioButtons = document.querySelectorAll('input[type="radio"]');
        radioButtons.forEach(function(radioButton) {
            radioButton.addEventListener('click', updateTotalChecked);
        });

        document.getElementById('infoBtn').addEventListener('click', function() {
            // Q037을 제외한 이름들의 배열 생성
            var radioNames = [];
            <c:forEach items="${qList}" var="q">
                var questionId = "${q.cotestQuesno}";
                if (questionId !== 'Q037') {
                    radioNames.push(questionId);
                }
            </c:forEach>

            // 랜덤으로 선택된 라디오 버튼 설정
          	radioNames.forEach(function(questionId, index) {
            var questionRadios = document.getElementsByName(questionId);
            var randomIndex = Math.floor(Math.random() * questionRadios.length);
            questionRadios[randomIndex].checked = true;
            
            // 모든 라디오 버튼을 선택한 후에만 updateTotalChecked() 함수 호출
            if (index === radioNames.length - 1) {
                updateTotalChecked();
            }
            });
            
        });

        
        // 제출 버튼 클릭 시 실행되는 함수
        document.getElementById('submitBtn').addEventListener('click', function() {
            // 선택되지 않은 문제의 번호와 내용을 저장할 배열 초기화
            var uncheckedQuestions = [];
        	 // 각 영역의 선택된 라디오 버튼 값의 배열을 저장할 객체
            var areaScores = {};

            // 문항 목록을 순회하면서 선택되지 않은 문제를 찾아서 배열에 추가
            <c:forEach items="${qList}" var="q">
            	var areaCode = "${q.cotestAreaCode}";
                var questionId = "${q.cotestQuesno}";
                if (!isQuestionChecked(questionId)) {
                    uncheckedQuestions.push({
                        number: "${fn:substring(q.cotestQuesno, 2, 5)}",
                        content: "${q.cotestQues}"
                    });
                }else {
                    // 선택된 라디오 버튼 값 가져오기
                    var selectedValue = document.querySelector('input[name="' + questionId + '"]:checked').value;
                    // 해당 영역의 선택된 값이 있는지 확인 후 배열에 추가
                    if (areaScores[areaCode]) {
                        areaScores[areaCode].push(parseInt(selectedValue));
                    } else {
                        areaScores[areaCode] = [parseInt(selectedValue)];
                    }
                }
            </c:forEach>

            var uncheckedCount = uncheckedQuestions.length;
            var data = {};


            if (uncheckedCount > 0) {
            	var alertMessage = uncheckedCount === 1 ? "다음 문제가 아직 선택되지 않았습니다:\n\n" : "다음 문제들이 아직 선택되지 않았습니다:\n\n";
                uncheckedQuestions.forEach(function(question, index) {
                    if (index === uncheckedQuestions.length - 1) {
                        alertMessage += question.number;
                    } else {
                        alertMessage += question.number + ", ";
                    }
                });
                alert(alertMessage);
            } else {
                for (var areaCode in areaScores) {
                    var scores = areaScores[areaCode];
                    var sum = scores.reduce((a, b) => a + b, 0);
                    var average = Math.round(sum / scores.length); // 평균을 정수형으로 변환
                    
                    var modifiedAreaCode = areaCode.substring(0, 2).toLowerCase()+areaCode.substring(2, 4);
//                     console.log("영역 코드:", modifiedAreaCode, "평균:", average);
                    data[modifiedAreaCode] = average;
               
                }
                console.log("data",data);
                
                $.ajax({
                	type : "POST",
					url : "addResult",
				  	data: JSON.stringify(data),
				    dataType: "json",
				    contentType: "application/json",
					success : function(response) {
// 						console.log(response);
					if(response.result==='OK'){
						window.location.href="http://localhost/lcms/student/careerup/test/cotest/cotestResult";
					}
					},
					error : function(xhr, status, error) {
						console.error(error);
						alert("등록에 오류가 생겼습니다. 다시 시도해주세요.");
					}
                });
            }
            
        });
    }); 
    
</script>