<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<style>
#pwResetPage {
    width: 100%;
    height: 700px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}
#pwResetSpace {
    width: 100%;
    max-width: 700px; /* 예시로 너비를 제한함 */
    padding: 20px;
    margin: 20px;
    text-align: center;
    height: 350px;
    justify-content: center;
    align-items: center;
}	
#pwResetTitle{
	font-size: 25px;
	font-weight: 800;
}
#pwResetInputSpace{

	position:absolute;
	top: 80px;
	left: 0;
    right: 0;
    margin-left: auto;
    margin-right: auto;
	width: 600px;
	height: 180px;
	display: flex;
    align-items: center;
	flex-direction: column;
    justify-content: center;
	
}
.inputContent{
 	width: 600px;	
 	max-width: 600px; 
	display: flex;
    align-items: center;
	flex-direction: column;
    justify-content: center;
}
.inputContent .form-control{
	width: 400px;
}
#pwResetBtn{
	margin-top: 50px;
	width: 200px;
}
#errMsg{
	position: absolute;
	top:90px;
	left: 100px;
	color: red;
}
</style>
<div id="pwResetPage">
	<div id="pwResetTitle">
		비밀번호 재설정
	</div>
	<div class="card mb-lg-32pt" id="pwResetSpace">
 		<form method="post"> 
		     <div id="pwResetInputSpace">
	   			<div class="col-12 col-md-6 mb-3 inputContent">
		            <label class="form-label" for="validationSample01">변경할 비밀번호</label>
		            <input type="text" name="memPass" class="form-control" placeholder="비밀번호" required="true"></input>
		            <span style="color:blue;">8~20자, 영문자/숫자/특수문자조합, 특수문자는 (!/_) 만 가능합니다.</span>
		            <span id="errMsg">${errMsg[0]['memPass'] }</span>
	            </div>
	            <div>
			     	<button type="submit"  class="btn btn-outline-primary" id="pwResetBtn">비밀번호재설정</button>
			    </div>
		     </div>
	     </form>
	</div>
</div>






