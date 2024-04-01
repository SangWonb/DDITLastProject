
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<form method="POST" id="submitForm">

	<div class="form-container">

		<div class="select-box-wrapper">
			<label for="select1">이수구분</label> <select id="majorCultural"
				name="majorCultural"
				class="form-control custom-select custom-small-select">
				<option selected disabled>선택하세요</option>
				<c:forEach var="single" items="${result}">
					<c:if test="${not empty single.majorCultural}">
						<option value="${single.majorCultural}">${single.majorCultural}</option>
					</c:if>
				</c:forEach>
			</select> <label for="select2">필수여부</label> <select id="choiceRequire"
				name="choiceRequire"
				class="form-control custom-select custom-small-select">
				<option selected disabled>선택하세요</option>
				<c:forEach var="single" items="${result}">
					<c:if test="${not empty single.choiceRequire}">
						<option value="${single.choiceRequire}">${single.choiceRequire}</option>
					</c:if>
				</c:forEach>
			</select> <label for="select3">학과전공</label> <select id="deptCode"
				name="deptCode"
				class="form-control custom-select custom-small-select">
				<option selected disabled>선택하세요</option>
				<c:forEach var="single" items="${result2}">
					<c:if test="${not empty single.deptName}">
						<option value="${single.deptCode}">${single.deptName}</option>
					</c:if>
				</c:forEach>
			</select>
			<!-- 검색 기능을 위한 텍스트 입력란 -->
			<br />
			<!-- 			<div style="display: flex;"> -->
			<!-- 				<label for="subjectNumber">과목번호/명</label> <input type="text" -->
			<!-- 					style="width: 150px;" id="subjectNumber" name="subjectNumber" -->
			<!-- 					class="form-control custom-input"> -->
			<!-- 			</div> -->
		</div>
	</div>

	<div class="table-title">
		<h3>수강 신청 목록</h3>
	</div>
	<table class="table table-bordered table-striped fs-10 mb-0">
		<thead class="bg-200">
			<tr>
				<th data-sort="lecCode">강의코드</th>
				<th data-sort="subName">과목명</th>
				<th data-sort="majorCultural">이수</th>
				<th data-sort="ltTime">강의시간</th>
			</tr>
		</thead>
		<tbody class="list" id="listBody">
			<c:forEach var="e" items="${enrollmentData}">
				<%-- 				<c:forEach var="ltTime" items="${e.ltTimes}"> --%>
				<tr>
					<td>${e.lecCode}</td>
					<td>${e.subName}</td>
					<td>${e.majorCultural}</td>
					<td>${e.ltTime}</td>
					<td>
					<button class="deleteButton btn btn-accent btn-rounded" type="button" data-lecaCode="${e.lecaCode}">수강취소</button>

					</td>
				</tr>
				<%-- 				</c:forEach> --%>
			</c:forEach>
<!-- 		</tbody> -->
	</table>

	<button id="join" type="button" class="btn btn-primary"
		style="float: right;">수강조회</button>

</form>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<br>
<br>
<form method="POST">
	<div id="enrollmentResult" class="table-responsive" data-toggle="lists"
		data-lists-sort-by="js-lists-values-date" data-lists-sort-desc="true"
		data-lists-values='["js-lists-values-lead", "js-lists-values-project", "js-lists-values-status", "js-lists-values-budget", "js-lists-values-date"]'>

		<h3>수강목록 조회</h3>
	</div>
	<div>
		<table class="table table-flush table-nowrap">
			<thead>

				<tr>
					<th>번호</th>
					<th>강의코드</th>
					<th>교과목코드</th>
					<th>과목명</th>
					<th>이수</th>
					<th>강의시간</th>
				</tr>
			</thead>
			<tbody class="list" id="projects">
				<c:if test="${not empty enrollmentResult}">
					<c:forEach items="${enrollmentResult}" var="e">
						<tr>
							<td><a href="#" class="number"><strong>${e.rnum}</strong></a></td>
							<td>${e.lecCode }</td>
							<td>${e.subCode }</td>
							<td>${e.subName }</td>
							<td>${e.majorCultural }</td>
							<td><c:forEach items="${e.ltTimes}" var="ltTime">
	                    ${ltTime.ltTime} 
	                </c:forEach></td>
						</tr>
					</c:forEach>
				</c:if>

			</tbody>


		</table>
		<button id="apply" type="button" class="btn btn-primary"
			style="float: right;">수강신청</button>
	</div>


</form>




<style>
.form-container {
	position: relative;
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 100%;
	max-width: 1000px;
	margin: 0 auto;
}

.select-box-wrapper {
	flex: 1;
	margin: 10px;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.custom-small-select {
	width: 20%;
	font-size: 12px;
}

.custom-input {
	width: 50%;
	font-size: 12px;
}

/*     .btn { */
/*         margin-top: 10px; */
/*     } */
#enrollmentResult {
	margin-top: 10px;
	max-width: 1000px;
	margin-left: auto;
	margin-right: auto;
}
</style>


<script>
		document.getElementById("join").addEventListener("click", function (event) {
		    var select1Value = document.getElementById("majorCultural").value;
		    var select2Value = document.getElementById("choiceRequire").value;
		    var select3Value = document.getElementById("deptCode").value;
		    var url = window.location.href;
	
		    var requestData = {
		        majorCultural: select1Value,
		        choiceRequire: select2Value,
		        deptCode: select3Value
		    };
	
		    fetch(url, {
		        method: 'POST',
		        headers: {
		            'Content-Type': 'application/json',
		        },
		        body: JSON.stringify(requestData),
		    })
		    .then(response => response.json())
		    .then(data => {
		        console.log(data);
		        var projectsBody = document.getElementById('projects');
	
		        // 기존 내용 삭제
		        projectsBody.innerHTML = '';
	
		        for (var r of data) {
		        	console.log(" r : ",  r);
		        	
		            for (var i = 0; i < r.lecOpenList.length; i++) {
		                var lecOpen = r.lecOpenList[i];
		                var tr = document.createElement('tr');
	
		                var tdCheckbox = document.createElement('td');
		                var checkbox = document.createElement('input');
		                checkbox.type = 'checkbox';
		                checkbox.value = r.lecture[i].lecCode; // 강의코드를 값으로 사용
		                tdCheckbox.appendChild(checkbox);
		                tr.appendChild(tdCheckbox);
						
		                // 강의코드
		                var tdLecCode = document.createElement('td');
		                tdLecCode.textContent = r.lecture[i].lecCode;
		                tr.appendChild(tdLecCode);
		                console.log(tdLecCode)
	
		                // 교과목코드
		                var tdSubCode = document.createElement('td');
		                tdSubCode.textContent = r.subCode;
		                tr.appendChild(tdSubCode);
	
		                // 과목명
		                var tdSubName = document.createElement('td');
		                tdSubName.textContent = r.subName;
		                tr.appendChild(tdSubName);
	
		                // 이수
		                var tdMajorCultural = document.createElement('td');
		                tdMajorCultural.textContent = r.majorCultural;
		                tr.appendChild(tdMajorCultural);
	
		                // 강의시간
		                var tdLtTime = document.createElement('td');
		                tdLtTime.textContent = r.ltTimes[i].ltTime; // 해당 강의에 대한 강의시간 사용
		                tr.appendChild(tdLtTime);
	
		                projectsBody.appendChild(tr);
		            }
		        }
		    })
		    .catch(error => {
		    });
		});
		
		document.getElementById('apply').addEventListener("click", function (event) {
			event.preventDefault();
			
	        // 체크된 강의코드를 담을 배열
// 	        $('#join').trigger('click');
	        
	        var selectedCourses = [];
	
	        // 체크된 체크박스를 찾아서 배열에 추가
	        var checkboxes = document.querySelectorAll('#projects input[type="checkbox"]:checked');
	        checkboxes.forEach(function (checkbox) {
	        	var selectedCours = {};
				selectedCours.lecCode = checkbox.value
	            selectedCourses.push(selectedCours);
	            console.log("asdasdad",checkbox.value);
	            console.log("====selectedCourses : ",selectedCourses);
	            
	            console.log("===cValue : ", checkbox.value);
	        });
		            var currentUrl = window.location.href + "/apply";
			console.log('===selectedCourses : ',selectedCourses);
			var confirmation = confirm('수강을 신청하시겠습니까?');

		    if (confirmation) {
		        if (selectedCourses.length > 0) {

		        	console.log("selectedCourses : ", selectedCourses.length);
		        	
		            fetch(currentUrl, {
		                method: 'POST',
		                headers: {
		                	'Content-Type': 'application/json', 
		                },
		                body: JSON.stringify(selectedCourses),
		            })
		            .then(response => response.json())
		            .then(data => {
		                console.log(data);
// 		                fetchDataForEnrollment();
		              window.location.reload();
		            })
		            .catch(error => {
		                console.error('Error:', error);
		            });
		        } else {
		            console.log('No courses selected for enrollment.');
		        }
		  
		                }
		});

		
// 			function fetchDataForEnrollment() {
// 			    var enrollmentUrl = window.location.href + "/result"; 
// 			    fetch(enrollmentUrl, {
// 			        method: 'GET', 
// 			        headers: {
// 			            'Content-Type': 'application/json',
// 			        },
// 			    })
// 			    .then(response => response.json())
// 			    .then(enrollmentData => {
// 			        })
// 			}
			        
document.getElementById('listBody').addEventListener('click', function (event) {
    if (event.target.classList.contains('deleteButton')) {
        var lecaCode = event.target.getAttribute('data-lecaCode');
        var confirmation = confirm('정말로 삭제하시겠습니까?');
        var currentUrl = window.location.href + "/delete";


        if (confirmation) {
            // 서버로 삭제 요청을 보내는 부분
            fetch(currentUrl, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    
                },
                body: JSON.stringify({ lecaCode: lecaCode }),
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    event.target.closest('tr').remove();
                } else {
                	
                    console.error('삭제 요청이 실패했습니다.');
                }
            })
            .catch(error => {
            	
                console.error('삭제 요청 중 오류 발생:', error);
            });
        }
    }
});


	</script>

<%-- 	<script src="<c:url value='/resources/js/cstmrList.js'/>"></script> --%>