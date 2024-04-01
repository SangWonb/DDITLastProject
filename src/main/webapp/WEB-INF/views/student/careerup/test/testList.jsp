<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<style>
.testList { 
  display: flex; 
 } 

.item {
  flex: 1; 
  margin: 10px; 
}
</style>
<div class="card card-body">
   <h2 style="text-align:center;">HRU진단테스트</h2>
<div style="background-color: #f2f2f2; border-radius: 10px; padding: 25px; width:70%;margin-left:15%;">
   <span style="font-weight: bold;"><strong>HRU 6대 핵심역량 진단 평가의 결과는 역량개발 프로그램과 교양 교육과정을 개발하는데 활용되며, 이를 바탕으로 우리 대학 학생들에게 보다 질 높은 교육 서비스를 제공하고자 합니다.
   <br>
   또한, 한국고용정보원 직업심리검사를 이용하여 개인의 능력과 흥미, 성격 등의 심리적인 특성들이 각 직업에서 요구하는 능력수준 및 특성에 얼마나 적합한지를 과학적인 방법으로
측정하여 보다 성공 가능성이 높고 만족할 만한 직업들을 탐색하도록 도와드립니다.
</strong></span>
   <br><br>
   *각 항목을 클릭하면 해당 페이지로 이동합니다.
   
</div>
<!-- <div class="card card-body"> -->
	<div class="testList" style="margin-top:30px; display: felx; justify-content: center; align-items: center;">
		<div id="link1" style="cursor:pointer;">
			<div id="cotest" class="item">
				<img src="/lcms/resources/images/kce/cotestimage.jpg" style="width: 480px; height: 650px;">
			</div>
		</div>
		<div id="link2" style="cursor:pointer; margin-left:5%">
			<div id="votest" class="item">
				<img src="/lcms/resources/images/kce/worknetimage.jpg" style="width: 480px; height: 650px;">
			</div>
		</div>
	</div>
</div>
<script>
$(document).ready(function() {
    $("#link1").click(function() {
        window.location.href = "test/cotest";
    });
    
    $("#link2").click(function() {
        window.location.href = "test/votest";
    });
});
</script>
