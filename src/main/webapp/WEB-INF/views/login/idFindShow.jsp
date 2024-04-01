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
#idFindShowSpace{

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
	flex-direction: column;
    justify-content: center;
    
    color:gray;
	
}
#btnSpace{
	width: 400px;
	position: absolute;
	top: 290px;
	left: 0;
    right: 0;
    margin-left: auto;
    margin-right: auto;
}
#pwResetBtn, #loginBtn{
	width: 150px;
}
.hrLine{
	width: 600px;
	height: 1px;
	background-color: gray;
	margin: 35px;
}
</style>
<div id="idFindPage">
	<div id="idFindTitle">
		아이디 찾기
	</div>
	<div class="card mb-lg-32pt" id="idFindSpace">
	     <div id="idFindShowSpace">
	     	<c:if test="${not empty memNo }">
	     		개인정보 도용에 대한 피해방지를 위하여 아이디 끝 두자리에서 네자리는 **처리합니다.
	     		<div class="hrLine"></div>
	     		<div>
	     			<span>아이디는 <span style="color:red;">${memNo }</span>(으)로 등록되어있습니다.</span>
	     		</div>
	     		<div class="hrLine"></div>	     		
	     	</c:if>
	     	<c:if test="${empty memNo }">
	     		<div class="hrLine"></div>
	     		<div>
                    <span>정보가 없습니다.</span>
                </div>
	     		<div class="hrLine"></div>
	     	</c:if>
	     </div>
	     <div id="btnSpace">
	     	<a href='<c:url value="/"/>' class="btn btn-outline-primary" value="로그인" id="loginBtn">로그인</a>
	     	<a href='<c:url value="/pwReset"/>' class="btn btn-outline-primary" value="비밀번호재설정" id="pwResetBtn">비밀번호재설정</a>
	     </div>
	</div>
</div>