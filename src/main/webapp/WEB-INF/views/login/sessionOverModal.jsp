<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<style>
.nanum-gothic-extrabold {
	font-family: "Nanum Gothic", sans-serif;
	font-weight: 800;
	font-style: normal;
}

.nanum-gothic-bold {
	font-family: "Nanum Gothic", sans-serif;
	font-weight: 700;
	font-style: normal;
}

.nanum-gothic-regular {
	font-family: "Nanum Gothic", sans-serif;
	font-weight: 400;
	font-style: normal;
}
</style>
<div class="modal fade" id=sessionOverModal tabindex="-1"
	aria-labelledby="sessionOverModal" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" style="width: 600px; height: 400px;">
			<div class="modal-body" style="height: 400px; display: flex; flex-direction: column; justify-content: center; align-items: center;">

				<span class="nanum-gothic-extrabold" style="font-size: 50px; margin-bottom: 10px;">로그인 세션 만료</span>
				<span class="nanum-gothic-bold" style="font-size: 25px; margin-bottom: 50px;">로그인 세션이 만료되었습니다.</span>
				
				<a href='<c:url value="/logout"/>'  class="btn btn-outline-primary" id="logoutBtn" style="width: 350px;">로그아웃</a>
				
			</div>
		</div>
	</div>
</div>