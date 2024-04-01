<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="col-lg-8 d-flex align-items-center">
    <h2 class="mb-0">과목 추천</h2>
</div>
<hr>
<br>
<br>
<br>

<form method="POST">
    <div class="form-group">
        <label class="form-label" for="custom-select">희망직무선택</label>
        <select id="job" name="companyJob" class="form-control custom-select">
            <!-- 기본 선택 옵션 -->
            <option selected>직무선택</option>
            <!-- SeniorCoworkerVO에 대한 옵션 목록 -->
            <c:forEach items="${seniorList}" var="senior">
                <c:if test="${not uniqueCompanyJobs.contains(senior.companyJob)}">
                    <option value="${senior.companyJob}">${senior.companyJob}</option>
                    <c:set var="uniqueCompanyJobs" value="${uniqueCompanyJobs},${senior.companyJob}" />
                </c:if>
            </c:forEach>
        </select>
    </div>
    <div class="form-group">
        <label class="form-label" for="custom-select">회사종류선택</label>
        <select id="type" name="companyType" class="form-control custom-select">
            <c:set var="uniqueCompanyTypes" value="" />
            <!-- 기본 선택 옵션 -->
            <option selected>회사종류</option>
            <!-- SeniorCoworkerVO에 대한 중복되지 않은 회사종류 목록 -->
            <c:forEach items="${seniorList}" var="senior">
                <c:if test="${not uniqueCompanyTypes.contains(senior.companyType)}">
                    <option value="${senior.companyType}">${senior.companyType}</option>
                    <c:set var="uniqueCompanyTypes" value="${uniqueCompanyTypes},${senior.companyType}" />
                </c:if>
            </c:forEach>
        </select>
    </div>
    <button id="recom" type="button" class="btn btn-primary">추천받기</button>
</form>

<script>
document.getElementById("recom").addEventListener("click", function(event) {

    var selectedJob = document.getElementById("job").value;
    var selectedCompanyType = document.getElementById("type").value;
    var currentUrl = window.location.href;
	var resultTd = document.getElementById("resultTd")
	var one = document.getElementById("one");
	var two = document.getElementById("two");
	var three = document.getElementById("three");
    var sdf = JSON.stringify({
        "companyJob": selectedJob,
        "companyType": selectedCompanyType
    });
    console.log("URL : ", currentUrl);

    fetch(currentUrl, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: sdf,
    })
    .then(response => response.json())
    .then(data => {
        console.log(data);

        var resultElement = document.getElementById("result");

        if (resultElement) {
            console.log(data);
            var formData = "과목 추천 1순위 : " + data.one + "<br>" +
            "과목 추천 2순위 : " + data.two + "<br>" +
            "과목 추천 3순위 : " + data.three + "<br>"
            
            one.innerHTML = data.one;
            two.innerHTML = data.two;
            three.innerHTML = data.three;
            
            resultElement.style.fontFamily = "Arial, sans-serif";
            resultElement.style.fontSize = "16px";
            resultElement.style.color = "#333";
        } else {
        	
        }
    })
    .catch((error) => {
        console.error('Error:', error);
    });
});
</script>

<br>
<br>
<hr>

<div id="result"
class="table-responsive"
       data-toggle="lists"
       data-lists-sort-by="js-lists-values-date"
       data-lists-sort-desc="true"
       data-lists-values='["js-lists-values-lead", "js-lists-values-project", "js-lists-values-status", "js-lists-values-budget", "js-lists-values-date"]'>

      <table class="table table-flush table-nowrap">
          <thead>
              <tr>
                  <th>1순위</th>
                  <th>2순위</th>
                  <th>3순위</th>
              </tr>
          </thead>
                    <tr>
                      <td id = "one"></td>
                      <td id = "two"></td>
                      <td id = "three"></td>
                    </tr>
      </table>




</div>
