<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<div class="container mt-4 bg-white" >
	<form:form id="submitForm" action="" modelAttribute="selected" style="display: none;">
			<input type="text" name="select1" /> 
			<input type="text" name="select2" /> 
	</form:form>
    <div class="row">
        <div class="col-sm-3" data-pg-role="searchUI" data-pg-target="#submitForm">
			<select class="form-control" name="dept" required="required" id="deptCode">
                <option value>전공선택</option>
                <c:forEach items="${deptList }" var="dept">
	                <option value="${dept.deptCode }">${dept.deptName }</option>
                </c:forEach>
            </select>
        </div>
        <div class="col-sm-3">
            <select class="form-control" name="job" required="required" id="job">
               <option value>직무선택</option>
                <c:forEach items="${seniorJobList }" var="job">
	                <option value="${job.companyJob }">${job.companyJob }</option>
                </c:forEach>
            </select>
        </div>
        <div class="col-sm-3">
            <button type="submit" class="btn btn-primary btn-recommend" data-pg-role="searchBtn">
            자격증 추천받기
            </button>
        </div>
            <button id="demoButton" type="button" class="btn btn-primary" onclick="fillFormData()">시연용 데이터</button>
    </div>
</div>

<div id="licenseRecomArea" action=""></div>

<script src="<c:url value='/resources/js/paging.js'/>"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
function fillFormData() {
    
    var value1 = "D04";

    var subjectSelectBox = document.getElementById("deptCode");
    var options = subjectSelectBox.options;
    for (var i = 0; i < options.length; i++) {
        if (options[i].value === value1) {
            subjectSelectBox.selectedIndex = i;
            break;
        }
    }
    var value2 = "개발"; 

    var subjectSelectBox = document.getElementById("job");
    var options = subjectSelectBox.options;
    for (var i = 0; i < options.length; i++) {
        if (options[i].value === value2) {
            subjectSelectBox.selectedIndex = i;
            break;
        }
    }
    
    let $select1 = $('input[name="select1"]');
    let $select2 = $('input[name="select2"]');
    $select1.val("D04");
    $select2.val("개발");
}

var cPath = $('body').data('bodyCpath');

let $dept = $('select[name="dept"]');
let $job = $('select[name="job"]');
let $select1 = $('input[name="select1"]');
let $select2 = $('input[name="select2"]');

$('select[name="dept"]').on("change",(event)=>{ 
	var selectedDept = $dept.val();
	$select1.val(selectedDept);
});

$('select[name="job"]').on("change",(event)=>{ 
	var selectedJob = $job.val();
	$select2.val(selectedJob);
});

$(document).ready(function() {
    $('#licenseRecomArea').hide();
    $('[data-pg-role="searchBtn"]').click(function(event) {
        event.preventDefault();
        var licenDept = $select1.val();
        var licenJob = $select2.val();
        
        console.log(licenDept);
        console.log(licenJob);
        
		if(!licenDept||!licenJob){
			Swal.fire({
      	      title: '전공과 직무를 모두 선택해주세요',
      	      icon: 'error'
      	    });
            return;
		} 
		
        $.ajax({
            type: 'POST',
            url: `\${cPath}/student/careerup/licenserecom/recom`, 
            data: {
            	licenDept: licenDept,
            	licenJob: licenJob
            },
            success: function(response) {
                $('#licenseRecomArea').html(response); 
                $('#licenseRecomArea').fadeIn(2000);
            },
            error: function(xhr, status, error) {
                console.error(error);
            }
        });
	});
});

</script>