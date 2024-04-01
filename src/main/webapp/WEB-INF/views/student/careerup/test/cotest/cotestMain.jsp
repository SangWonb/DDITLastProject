<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<style>
   .cotest {
        display: flex;
        justify-content: center;
    }

    .cotest > div {
        margin: 0 10px; /* 필요에 따라 조정 가능 */
    }
</style>
<div class="card card-body">
   <h2 style="text-align:center;">HRU 6대 핵심역량 진단평가</h2>
   <div style="background-color: #f2f2f2; border-radius: 10px; padding: 20px; width:60%; margin-left:20%; margin-top:10px;">
      HRU 6대 핵심역량 진단평가는 인성영역, 글로벌영역, 자기관리역량, 의사소통역량, 대인관계역량, 창의융합역량으로 이루어져 있습니다.
      <br>
      이 설문지는 여러분이 가지고 있는 역량을 알아보기 위한 것입니다. 이 설문지는 시험지가 아니며 또 얼마나 잘하고 못하였는지를 평가하는 것이 아닙니다. 
      <br>그러므로 각각의 질문에는 정답이 없습니다. 여러분의 솔직한 생각을 표시하면 됩니다. 편안한 마음으로 차근차근 자신의 생각과 가장 가까운 곳에 응답해주시기 바랍니다.
   </div>
   <div class="cotest">
      <div id="link1" style="cursor:pointer;">
         <div id="cotestBaro" class="item">
         	<img src="/lcms/resources/images/kce/cotestgo.jpg" style="width: 400px; height: 400px;">
         </div>
      </div>   
       <div id="link2" style="cursor:pointer;">
         <div id="cotestResult" class="item">
        	 <img src="/lcms/resources/images/kce/cotestresult.jpg" style="width: 400px; height: 400px;">	
         </div>
		</div>
	</div>
</div>
<script>
$(document).ready(function() {
    $("#link1").click(function() {
        window.location.href = "cotest/takeAtest";
    });
    
    $("#link2").click(function() {
        window.location.href = "cotest/cotestResult";
    });
});
</script>