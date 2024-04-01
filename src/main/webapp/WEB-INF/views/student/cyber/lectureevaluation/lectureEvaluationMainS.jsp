<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<div style="width: 100%;">
	<div style="width: 100%; text-align: center;">
		<img style="width: 80%;" src="/lcms/resources/images/cybernotice/cyberevaluation.jpg">
	</div>
	<div style="width: 100%; text-align: center; margin-top: 15px;">
		<c:if test="${not empty lsr }">
			<span style="font-size: 15px; color: blue; font-weight: 800;">강의평가가 완료되었습니다.</span>	
		</c:if>
		<c:if test="${empty lsr }">
			<button type="button" id="evaluationStart" style="width: 300px; height: 60px; background-color: LightSeaGreen; border-color: CadetBlue;" class="btn btn-accent btn-lg">평가시작</button>
		</c:if>
	</div>
</div>
<script>
	$(document).on("click", "#evaluationStart", function(){
		window.location.href = window.location.href + "/start";
	});
</script>