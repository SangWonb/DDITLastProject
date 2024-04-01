<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<style>
#idFindPage {
    width: 100%;
    height: 600px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}
#idFindSpace {
    width: 100%;
    max-width: 700px; /* 예시로 너비를 제한함 */
    padding: 20px;
    margin: 20px;
    text-align: center;
    height: 350px;
    justify-content: center;
    align-items: center;
}	
#idFindTitle{
	font-size: 25px;
	font-weight: 800;
}
#authMethodSpace{
	position:absolute;
	top: 20px;
	left: 0;
    right: 0;
    margin-left: auto;
    margin-right: auto;
	display: flex;
	flex-direction: row;
    justify-content: center;
}
.custom-radio{
	margin: 20px;
}
#idFindInputSpace{

	position:absolute;
	top: 80px;
	left: 0;
    right: 0;
    margin-left: auto;
    margin-right: auto;
	width: 500px;
	height: 180px;
	display: flex;
    align-items: center;
	flex-direction: row;
    justify-content: center;
	
}
.inputContent{
 	display: flex; 
 	flex-direction: row; 
 	width: 400px;	
 	max-width: 400px; 
	
}
.inputContent .form-label{
	width: 70px;
	max-width: 70px;
	display: flex;
	flex-direction: column;
	justify-content: center;
    align-items: center;
    white-space: nowrap; /* 줄 바꿈 방지 */
}
.inputContent .form-control{
	width: 300px;
}
#authEmail, #authPhone{
	display: flex;
 	flex-direction: column; 
    align-items: center;

}
#idFindBtn{
	width: 200px;
	position: absolute;
	top: 290px;
	left: 0;
    right: 0;
    margin-left: auto;
    margin-right: auto;
}
</style>
<c:if test="${not empty message }">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script>
		Swal.fire({
	      title: '실패',
	      text: '${message }',
	      icon: 'error'
	    });
	</script>
</c:if>
<div id="idFindPage">
	<div id="idFindTitle">
		아이디 찾기
	</div>
	<div class="card mb-lg-32pt" id="idFindSpace">
		<form id="idFindForm" method="post">
			<div class="custom-controls-stacked" id="authMethodSpace">
	             <div class="custom-control custom-radio">
	                 <input id="authMethod1" name="authMethod" type="radio" class="custom-control-input" checked="true" value="authEmail">
	                 <label for="authMethod1" class="custom-control-label">이메일</label>
	             </div>
	             <div class="custom-control custom-radio">
	                 <input id="authMethod2" name="authMethod" type="radio" class="custom-control-input" value="authPhone">
	                 <label for="authMethod2" class="custom-control-label">휴대폰</label>
	             </div>
	         </div>
		     <div id="idFindInputSpace">
		     	<div id="authEmail">
		     		<div class="col-12 col-md-6 mb-3 inputContent">
	                    <label class="form-label" for="validationSample01">이름</label>
	                    <input type="text" name="EmemName" class="form-control" placeholder="예) 홍길동" required>
                  	</div>
		     		<div class="col-12 col-md-6 mb-3 inputContent">
	                    <label class="form-label" for="validationSample01">이메일</label>
	                    <input type="text" name="memEmail" class="form-control" placeholder="예) hongildong@naver.com" required>
                  	</div>
		     	</div>
		     	<div id="authPhone">
		     		<div class="col-12 col-md-6 mb-3 inputContent">
	                    <label class="form-label" for="validationSample01">이름</label>
	                    <input type="text" name="PmemName" class="form-control" placeholder="예) 홍길동" required>
                  	</div>
		     		<div class="col-12 col-md-6 mb-3 inputContent">
	                    <label class="form-label" for="validationSample01">생년월일</label>
	                    <input type="text" name="memReg1" class="form-control" placeholder="예) 980101" required>
                  	</div>
                  	<div class="col-12 col-md-6 mb-3 inputContent">
	                    <label class="form-label" for="validationSample01">전화번호</label>
	                    <input type="text" name="memTel" class="form-control" placeholder="예) 010-1111-1111" required>
                  	</div>
		     	</div>
		     </div>
		     <div>
		     	<button type="submit"  class="btn btn-outline-primary" value="아이디 찾기" id="idFindBtn">아이디찾기</button>
		     </div>
	     </form>   
	</div>
</div>
<script type="text/javascript">
$("#authPhone").hide().find("[name='PmemName'], [name='memReg1'], [name='memTel']").removeAttr("required");
$("#authMethodSpace input[type='radio']").on("change", function(event) {
    var authMethod = $(this).val();
    if(authMethod == "authEmail"){
        $("#authEmail").show().find("[name='EmemName'], [name='memEmail']").prop("required", true);
        $("#authPhone").hide().find("[name='PmemName'], [name='memReg1'], [name='memTel']").removeAttr("required").val("");
    } else if(authMethod == "authPhone"){
        $("#authPhone").show().find("[name='PmemName'], [name='memReg1'], [name='memTel']").prop("required", true);
        $("#authEmail").hide().find("[name='EmemName'], [name='memEmail']").removeAttr("required").val("");
    }
});

</script>




































