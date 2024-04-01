<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


       <!-- Bootstrap -->
       <script src="${pageContext.request.contextPath }/resources/vendor/popper.min.js"></script>
       <script src="${pageContext.request.contextPath }/resources/vendor/bootstrap.min.js"></script>

       <!-- Perfect Scrollbar -->
       <script src="${pageContext.request.contextPath }/resources/vendor/perfect-scrollbar.min.js"></script>

       <!-- DOM Factory -->
       <script src="${pageContext.request.contextPath }/resources/vendor/dom-factory.js"></script>

       <!-- MDK -->
       <script src="${pageContext.request.contextPath }/resources/vendor/material-design-kit.js"></script>

       <!-- App JS -->
       <script src="${pageContext.request.contextPath }/resources/js/app.js"></script>

       <!-- Preloader -->
       <script src="${pageContext.request.contextPath }/resources/js/preloader.js"></script>
       
       <!-- List.js -->
<%--        <script src="${pageContext.request.contextPath }/resources/vendor/list.min.js"></script> --%>
<%--        <script src="${pageContext.request.contextPath }/resources/js/list.js"></script> --%>
      
 <!-- 카운트 다운 -->
<script src="${pageContext.request.contextPath }/resources/js/customcountdown.js"></script> 


<!-- 모달 설정 >> 모달 이벤트 인식해서 body아래로 위치 이동 -->
<script type="text/javascript">
	$("document").ready(function() {
		$(".modal").on("show.bs.modal", function(event) {
			let modalEl = event.target;
			$("body").append(modalEl);
		});
	});
</script>