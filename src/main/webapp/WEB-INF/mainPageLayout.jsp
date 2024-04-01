<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Main</title>

<!-- Prevent the demo from appearing in search engines -->
<meta name="robots" content="noindex">

<title><tiles:getAsString name="title" /></title>
<tiles:insertAttribute name="preScript" />
<c:if test="${not empty message }">
	<script>
		alert("${message}");
	</script>
</c:if>


<style>
.grid-container {
	padding: 15px;
	border: 1px solid white;
	width: 100%; /* 화면 가로 전체를 차지하도록 설정 */
	margin-left: 15px; /* 왼쪽 여백 추가 */
	margin-right: auto; /* 오른쪽 여백 자동 조정 */
}

/* 본문 텍스트 스타일 */
.sidebar p {
	font-size: 16px;
	color: #666; /* 텍스트 색상 */
}

/* 챗봇 스타일 */
#chatbot {
	padding: 10px;
	cursor: pointer; /* 클릭 가능한 요소로 설정 */
}

/* 팝업 스타일 */
.popup {
	display: none; /* 초기에는 숨김 */
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 300px;
	height: 200px;
	background-color: #fff;
	border: 1px solid #ccc;
	padding: 20px;
	z-index: 9999;
}

.bg-primary {
	background-color: white !important;
}

.page-section {
	width: 100%;
	min-height: calc(50vh - 50px); /* 화면 세로 크기의 절반을 최소 높이로 설정합니다. */
}

.portlet-wrapper {
	width: calc(100% - 50px);
	/* 포틀릿 요소의 너비를 화면 전체 너비에서 50px을 뺀 값으로 설정합니다. */
	max-width: 1000px; /* 최대 너비를 설정합니다. */
	margin: 0 auto; /* 가운데 정렬합니다. */
}
.pageContent {
}
</style>

</head>

<body class="layout-app has-drawer-opened"
	data-body-cpath="<%=request.getContextPath()%>">
	<div class="preloader" style="display: none;">
		<div class="sk-chase">
			<div class="sk-chase-dot"></div>
			<div class="sk-chase-dot"></div>
			<div class="sk-chase-dot"></div>
			<div class="sk-chase-dot"></div>
			<div class="sk-chase-dot"></div>
			<div class="sk-chase-dot"></div>
		</div>
	</div>
	<jsp:include
		page="${pageContext.request.contextPath}/common/portlet/portlet" />
	<!-- Drawer Layout -->
	<div class="mdk-header-layout js-mdk-header-layout">
		<tiles:insertAttribute name="headerMenuMainPage" />
		<div class="mdk-drawer-layout__content page-content">
			<div>
				<img src="" alt="" width="1" height="90">
			</div>
			<!-- Header -->
			<!-- // END Header -->

			<!-- // END BEFORE Page Content -->
			<div class="page-section pageContent" style="background-image: url('/lcms/resources/images/debora-pilati-dOG0z4-gqp0-unspla.jpg');">
			    <div id="layout-content" class="container page__container">
			        <tiles:insertAttribute name="contentPage" />
			        	<jsp:include page="/WEB-INF/views/common/portlet/fixedPortlet.jsp" />
			        	<jsp:include page="/WEB-INF/views/common/portlet/movePortlet.jsp" />
			    </div>
			</div>
		</div>
	</div>


	<tiles:insertAttribute name="footerMenu" />

	<tiles:insertAttribute name="postScript" />
</body>

</html>