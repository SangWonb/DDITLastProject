<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- ES5 support for IE -->
<script src="https://gridstackjs.com/node_modules/gridstack/dist/es5/gridstack-poly.js"></script>
<script src="https://gridstackjs.com/node_modules/gridstack/dist/es5/gridstack-all.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://getbootstrap.com/docs/4.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-xrRywqdh3PHs8keKZN+8zzc5TX0GRTLCcmivcbNJWm2rs5C8PRhcEn3czEjhAO9o"
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.16.2/build/highlight.min.js"></script>
<script type="module"
		src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule="" src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons/ionicons.js"></script>
	
<!-- jQuery -->
<script src="${pageContext.request.contextPath}/resources/vendor/jquery.min.js"></script>

<!-- Bootstrap -->
<script src="${pageContext.request.contextPath}/resources/vendor/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap.min.js"></script>

<script src="<c:url value='/resources/js/paging.js' />"></script>		


<!-- Bootstrap core CSS -->
<link href="https://bootswatch.com/4/yeti/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="https://gridstackjs.com/node_modules/gridstack/dist/gridstack.min.css"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.16.2/build/styles/default.min.css"
	rel="stylesheet" />
	
<style type="text/css">

.table-responsive {
    max-height: 200px; /* 원하는 높이로 조절 */
    overflow-y: auto; /* 세로 스크롤 표시 */
}
html {
    font-size: calc(100% + 2px); 
    scrollbar-width: none;
    -ms-overlow-style: none;
}

body{
	-ms-overflow-style: none;
}
 
::-webkit-scrollbar {
	display: none;
}

.conMar {
    margin-top: 18px;
    scrollbar-width: none;
}

.conMar::-webkit-scrollbar,
.conMar::-moz-scrollbar {
    display: none;
    scrollbar-width: none;
    -ms-overflow-style: none; 
}
  
.grid-container {
	padding: 15px;
	border: 1px solid white;
	width: 100%; /* 화면 가로 전체를 차지하도록 설정 */
}

.advancedDemo {
	margin-right: 20px;
}

.center {
	margin-left: auto;
	margin-right: auto;
}

.grid-stack-item-content {
	background-color: white;
	text-align: center;
	border-radius: 15px; /* 포틀릿의 모서리를 둥글게 만듭니다. */
}

h1 {
	text-align: center;
	font-size: 3rem;
	margin-top: 2rem;
	margin-bottom: 1.5rem;
}

.card {
	background: none;
}

section {
	padding: 0 15px 0 15px;
}

.grid-stack-item-removing {
	opacity: 0.8;
	filter: blur(5px);
}

@media all and (max-width: 575px) {
	#hero {
		margin-top: 32px;
	}
}

.logo {
	display: inline;
	margin-right: 15px;
}

#trash {
	background-color: #cc6857;
}

.newWidget>.grid-stack-item-content {
	background-color: #6cad84;
}

main.container-fluid {
	width: 120%; /* 가로 너비를 120%로 설정 */
}
/* 모달 스타일 업데이트 */
.modal {
    display: none; /* 기본적으로 숨김 */
    position: fixed; /* 고정 위치 */
    z-index: 1000; /* 다른 요소들 위에 표시 */
    left: 0;
    top: 0;
    width: 100%; /* 전체 너비 */
    height: 100%; /* 전체 높이 */
    overflow: auto; /* 필요시 스크롤 생성 */
    background-color: rgba(0, 0, 0, 0.5); /* 반투명 검은색 배경 */
}

/* 모달 내용 스타일 */
.modal-content {
    position: relative;
    background-color: #fff;
    margin: 10% auto; /* 위, 아래 마진으로 중앙 정렬 */
    padding: 40px;
    border-radius: 8px; /* 모서리 둥글게 */
    width: 50%; /* 모달 너비 */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
}

/* 닫기 버튼 스타일 */
.close {
    color: #777;
    position: absolute;
    top: 10px;
    right: 25px;
    font-size: 35px;
    font-weight: normal;
}

.close:hover,
.close:focus {
    color: #f44336; /* 호버시 색상 변경 */
    text-decoration: none;
    cursor: pointer;
}

/* 반응형 디자인 */
@media screen and (max-width: 768px) {
    .modal-content {
        width: 90%; /* 화면이 작을 때 모달 너비 조정 */
        margin: 20% auto; /* 작은 화면에서는 더 많은 공간 */
    }
}

/* 챗봇 메뉴 */
#chatbot-btn {
    position: fixed;
    top: 50%;
    right: 70px;
    transform: translateY(-50%);
    z-index: 900;
}

.fab-container {
  display: flex;
  flex-direction: column;
  justify-content: flex-end;
  align-items: center;
  user-select: none;
  position: absolute;
  bottom: 30px;
  right: 80px;
}
/* 메인 메뉴바 이벤트 */
.fab-container:hover {
  height: 100%;
}
.fab-container:hover .sub-button:nth-child(2) {
  transform: translateY(-80px);
}
.fab-container:hover .sub-button:nth-child(3) {
  transform: translateY(-140px);
}
.fab-container:hover .sub-button:nth-child(4) {
  transform: translateY(-200px);
}
.fab-container:hover .sub-button:nth-child(5) {
  transform: translateY(-260px);
}
.fab-container:hover .sub-button:nth-child(6) {
  transform: translateY(-320px);
}
.fab-container .fab {
  position: relative;
  height: 70px;
  width: 70px;
  background-color: #4ba2ff;
  border-radius: 50%;
  z-index: 2;
}
.fab-container .fab::before {
  content: " ";
  position: absolute;
  bottom: 0;
  right: 0;
  height: 35px;
  width: 35px;
  background-color: inherit;
  border-radius: 0 0 10px 0;
  z-index: -1;
}
.fab-container .fab .fab-content {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100%;
  width: 100%;
  border-radius: 50%;
}
.fab-container .fab .fab-content .material-icons {
  color: white;
  font-size: 48px;
}
.fab-container .sub-button {
  position: absolute;
  display: flex;
  align-items: center;
  justify-content: center;
  bottom: 10px;
  right: 10px;
  height: 50px;
  width: 50px;
  background-color: #4ba2ff;
  border-radius: 50%;
  transition: all 0.3s ease;
}
.fab-container .sub-button:hover {
  cursor: pointer;
}
.fab-container .sub-button .material-icons {
  color: white;
  padding-top: 6px;
}
.bookBtn {
	float: right;
	margin-top: 5px;
	margin-right: 5px;
	margin-bottom: 5px;
}
.btnAgn {
	float: right;
}
.btnAgnTwo {
	float: right;
}
.potMainT {
	font-size: 18px;
	font-weight: bold;
}

.chartWrap {
  position: relative;
  width: 80px; /* 더 작은 너비 값 */
  height: 80px; /* 더 작은 높이 값 */
  margin: 100px;
}

.chart {
  position: relative;
  width: 80px; /* 더 작은 너비 값 */
  height: 80px; /* 더 작은 높이 값 */
  border-radius: 50%;
  transition: 0.3s;
  background: lightgray;
  display: inline-block;
  margin-top: 5px;
  margin-left: 10px;
}

.chart:after {
  content: '';
  background: #fff;
  position: absolute;
  top: 50%;
  left: 50%;
  width: 30px; /* 더 작은 크기 값 */
  height: 30px; /* 더 작은 크기 값 */
  border-radius: 50%;
  transform: translate(-50%, -50%);
}

.chart-bar {
  width: inherit;
  height: inherit;
  border-radius: 50%;
  position: relative;
}

.chart-total {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background: gray;
  width: 100%;
}

.chart-total span {
  position: absolute;
  color: #777;
}

.chart-total-num {
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  font-size: 1rem; /* 더 작은 폰트 크기 */
  font-weight: bold;
  color: #333;
}

/* Webkit 기반 브라우저(Chrome, Safari 등) */
::-webkit-scrollbar {
    width: 5px; /* 작은 크기의 스크롤바 */
}

/* Firefox */
::-moz-scrollbar {
    width: 5px; /* 작은 크기의 스크롤바 */
}

#imageSpace {
	width: 250px;
	height: 250px;
	background-size: contain; /* 이미지가 100% 꽉 차도록 설정 */
	background-position: center; /* 이미지를 가운데 정렬 */
	background-image:
		url(/lcms/resources/images/cybernotice/cybernotice1.png);
	animation: slideLeft 5s infinite;
	transition: background-image 1s ease;
	/* 부드러운 전환을 위한 transition 속성 추가 */
}

.card-body {
    background-size: 10%; /* 이미지 크기를 50%로 설정합니다. */
}
.pImg {
	width: 150px;
    height: 150px; 
}
</style>

</head>

<body>
	<main role="main" class="container-fluid"
		style="padding-left: 0; padding-right: 0;">
		<section class="container-fluid advancedDemo">
			<div class="col-sm-12 col-md-10" style="padding-bottom: 25px;">
				<div class="container">
					<div class="grid-stack" id="advanced-grid">
					<!-- 챗봇 메뉴 -->
					<ul class="nav navbar-nav d-none d-sm-flex flex justify-content-start ml-8pt d-flex justify-content-end">
                    <li id="chatbot-btn">
                        <div class="fab-container">
						    <div class="fab shadow">
						        <div class="fab-content">
						        	<a href="javascript:void(0);" onclick="openChatbot()">
						            	<span class="material-icons">support_agent</span>
						            </a>
						        </div>
						    </div>
						</div>
                    </li>
                    </ul>
                    </div>
				</div>
			</div>
		</section>
	</main>
	<!-- /.container --> 
	<script type="text/javascript">
	var cPath = $('body').data('bodyCpath')
		/* 포틀릿 내용 */
		var role = `${role }`;
		var memName = "${memName}"
		var deptName = "${member.deptName}"
		var logo = '<img src="${pageContext.request.contextPath}/resources/images/university/portletlogo.png" alt="University Image" style="width: 70px; height: auto;">';		
		var majorN = parseInt("${member.stuMnl}");
		var majorC = parseInt("${member.stuMcl}");
		var cnl = parseInt("${member.stuCnl}");
		var ccl = parseInt("${member.stuCcl}");
		var m = '<img src="${pageContext.request.contextPath}/resources/images/university/m.png" alt="University Image" style="width: 20px; height: auto;">';
		var totalC = cnl+ccl;
		var totalMajor = majorN + majorC;
		var totalF = totalC + totalMajor;
		var advanced = [];
		
		if(role == "ROLE_S"){
			
		 var roleData = {
	        x : 0,
	        y : 0,
	        w : 4, 
	        h : 4, 
	        noMove : true,
	        noResize : true,
	        locked : true,
	        content: '<div class="potMainT" style="background-color: #3498db; color: white; padding: 10px; border-radius: 5px;">프로필</div>' +
	        '<div class="container page__container conMar">' +
	        '<div style="float: left; margin-right: 20px; border-radius: 10px; font-weight: bold; color: black;">&nbsp;' + memName + '</div>' +
	        '<br>' +
	        '<div style="float: left; margin-right: 20px; border-radius: 10px; font-weight: bold; color: gray;">&nbsp;' + deptName + '</div>' +
	        '<div style="float: right; margin-top: -20px;">' +
	        '<a href="/lcms/student/info/mypage" style="display: inline-block; background-color: #3498db; padding: 5px 10px; border-radius: 5px; text-align: center; color: #fff; text-decoration: none; font-size: 14px;">마이페이지</a>' +
	        '</div>' +
	        '<br>' +
	        '<div style="border-radius: 10px; color: black; border: 2px solid #3498db; padding: 10px;">학점취득현황<br>' +
	        '<div style="display: flex; align-items: center;">' +
	        '<div class="chart">' +
	        '<div class="chart-bar" style="background: conic-gradient(#e9608c 60%, #fbb871 60%);" data-deg="50"></div>' + 
	        '</div>' +
	        '<div class="card-body flex-0 ml-1">' +
	        '<div class="d-flex align-items-center font-weight-bold text-muted mb-1">' +
	        '<span class="text-body">전공:</span>' +
	        '<span class="ml-2" style="color: #fbb871;">' + totalMajor + '</span>' + 
	        '</div>' +
	        '<div class="d-flex align-items-center font-weight-bold text-muted mb-1">' +
	        '<span class="text-body">교양:</span>' +
	        '<span class="ml-2" style="color: #e9608c;">' + totalC + '</span>' + 
	        '</div>' +
	        '<div class="d-flex align-items-center font-weight-bold text-muted">' +
	        '<span class="text-body">이수학점:</span>' +
	        '<span class="ml-2" style="color: red;">' + totalF + '</span>' +
	        '</div>' +
	        '</div>' +
	        '</div>' +
	        '</div>' +
	        '</div>'
		};
		 
		 
		 advanced.push(roleData);
		 
	} else{
		
		 var roleData = {
	        x : 0,
	        y : 0,
	        w : 4, 
	        h : 4, 
	        noMove : true,
	        noResize : true,
	        locked : true,
	        content: '<div class="potMainT" style="background-color: #3498db; color: white; padding: 10px; border-radius: 5px;">프로필</div>' +
	        '<div class="container page__container conMar">' +
	        '<div style="margin-bottom: 5px; border-radius: 10px; font-weight: bold; color: black;">&nbsp;' + memName + '</div>' +
	        '<br>' +
	        '<div style="margin-top: -20px;">' +
			'<div>' +
	        '<img src="/lcms/resources/images/illustration/achievement/128/manman.png" class="img-fluid pImg" alt="이미지" />' +
	        '</div>' +
	        '</div>' +
	        '</div>'
		};
		 
		 advanced.push(roleData);
	}
		 
	    var roleData1 = {
	        x : 4,
	        y : 0,
	        w : 4, // 너비를 4으로 변경
	        h : 4, // 높이를 3으로 변경
	        noMove : true,
	        noResize : true,
	        locked : true,
	        content :  `<div class="potMainT" class="potMainT" style="background-color: #3498db; color: white; padding: 10px; border-radius: 5px;">나의 경력개발 현황</div>
	        	<button type="button" class="btn btn-white btnAgn">
			    	more
				</button>
	    	<div class="table-responsive"
	        data-toggle="lists"
	        data-lists-values='["js-lists-values-lead", "js-lists-values-project", "js-lists-values-status", "js-lists-values-budget", "js-lists-values-date"]'>
	           <table class="table table-flush table-nowrap table-bordered table-secondary table-striped table-hover">
	               <thead>
	                   <tr>
	                       <th>역량개발</th>
	                       <th>시간</th>
	                       <th>점수</th>
	                   </tr>
	               </thead>
	               <tbody class="list"
	                      id="projects">
	                         <tr>
	                           <td>역량개발프로그램현황</td>
	                           <td>-</td>
	                           <td>-</td>
	                         </tr>
	                         <tr>
	                           <td>역량개발프로그램현황</td>
	                           <td>-</td>
	                           <td>-</td>
	                         </tr>
	                         <tr>
	                           <td>상담현황</td>
	                           <td>-</td>
	                           <td>-</td>
	                         </tr>
	               </tbody>
	           </table>
	`
	    };
	    var roleData2 = {
	    	x : 8,
	        y : 0,
	        w : 4, 
	        h : 4, 
	        noMove : true,
	        noResize : true,
	        locked : true,
	        content : `<div class="potMainT" style="background-color: #3498db; color: white; padding: 10px; border-radius: 5px;">공지사항</div>
	        	<button type="button" class="btn btn-white btnAgn">
			    	more
				</button>
			<div class="table-responsive">		
	    		<table class="table table-flush table-nowrap table-bordered table-secondary table-striped table-hover">
					<thead>
						<tr>
						<th>제목</th>
					</tr>
				</thead>
				<tbody class="list" id="projects">
				     <tr>
				       <td><a href="\${cPath}/common/board/academicnotice/academicNotice">${academicNoticeList[0].cmntTitle}</a></td>
				     </tr>
				     <tr>
				       <td><a href="\${cPath}/common/board/academicnotice/academicNotice">${academicNoticeList[1].cmntTitle}</a></td>
				     </tr>
				     <tr>
				       <td><a href="\${cPath}/common/board/academicnotice/academicNotice">${academicNoticeList[2].cmntTitle}</a></td>
				     </tr>
				   	</tbody>
				</table>
			</div>
	`
	    };
	    var roleData3 = {
	        x : 0,
	        y : 4,
	        w : 4, 
	        h : 4, 
	        noMove : true,
	        noResize : true,
	        locked : true,
	        content : '<div class="potMainT" style="background-color: #3498db; color: white; padding: 10px; border-radius: 5px;">오늘의 식단</div>'+
	        			'<div class="container page__container conMar">' +
	        			'<p id="currentDate"></p>' +
	        			'<div class="card">' +
	        			'<a href="/lcms/common/menu/diet" style="display: inline-block; background-color: #FEAFA2; padding: 5px 10px; border-radius: 5px; text-align: center; color: #fff; text-decoration: none; font-size: 14px;">조식</a>' +
	        			'<p class="pText">치즈닭갈비덮밥</p>' +
	        			'</div>' +
	        			'<div class="card">' +
	        			'<a href="/lcms/common/menu/diet" style="display: inline-block; background-color: #EF7860; padding: 5px 10px; border-radius: 5px; text-align: center; color: #fff; text-decoration: none; font-size: 14px;">중식</a>' +
	        			'<p class="pText">된장시래기국밥</p>' +
	        			'</div>' +
	        			'<div class="card">' +
	        			'<a href="/lcms/common/menu/diet" style="display: inline-block; background-color: #FEAFA2; padding: 5px 10px; border-radius: 5px; text-align: center; color: #fff; text-decoration: none; font-size: 14px;">석식</a>' +
	        			'<p class="pText">미역줄기볶음</p>' +
	        			'</div>' +
	        			'</div>'
	    };
	    var roleData4 = {
	        x : 4,
	        y : 4,
	        w : 4, 
	        h : 4,
	        noMove : true,
	        noResize : true,
	        locked : true,
	        content :`<div class="potMainT" style="background-color: #3498db; color: white; padding: 10px; border-radius: 5px;">동아리</div>
	        <button type="button" id="get" class="btn btn-white btnAgnTwo">
			    more
			</button>
	        <div class="container page__container">		
	        <div id="imageSpace" class="card" style="width: 200px; height: 200px; margin-left: 20px;">
				<div class="card-body media"
				style="flex-direction: row; justify-content: center; align-items: center;">
				<svg data-v-134867f8="" onclick="changeImageBack()"
					style="width: 20px; position: absolute; left: 10px; color: gray;"
					aria-hidden="true" focusable="false" data-prefix="fas"
					data-icon="angle-left" role="img"
					xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 512"
					class="svg-inline--fa fa-angle-left fa-w-8">
					<path data-v-134867f8="" fill="currentColor"
						d="M31.7 239l136-136c9.4-9.4 24.6-9.4 33.9 0l22.6 22.6c9.4 9.4 9.4 24.6 0 33.9L127.9 256l96.4 96.4c9.4 9.4 9.4 24.6 0 33.9L201.7 409c-9.4 9.4-24.6 9.4-33.9 0l-136-136c-9.5-9.4-9.5-24.6-.1-34z"
						class=""></path></svg>
				<svg data-v-134867f8="" onclick="changeImage()"
					style="width: 20px; position: absolute; right: 10px; color: gray;"
					aria-hidden="true" focusable="false" data-prefix="fas"
					data-icon="angle-right" role="img"
					xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 512"
					class="svg-inline--fa fa-angle-right fa-w-8">
					<path data-v-134867f8="" fill="currentColor"
						d="M224.3 273l-136 136c-9.4 9.4-24.6 9.4-33.9 0l-22.6-22.6c-9.4-9.4-9.4-24.6 0-33.9l96.4-96.4-96.4-96.4c-9.4-9.4-9.4-24.6 0-33.9L54.3 103c9.4-9.4 24.6-9.4 33.9 0l136 136c9.5 9.4 9.5 24.6.1 34z"
						class=""></path></svg>
			</div>
		</div> 
	    `
	    };
	    var roleData5 = {
	        x : 12,
	        y : 4,
	        w : 4,
	        h : 4, 
	        noMove : true,
	        noResize : true,
	        locked : true,
	        content : `<div class="potMainT" style="background-color: #3498db; color: white; padding: 10px; border-radius: 5px;">도서</div>		        	
				<!-- more 버튼 -->
				<div class="table-responsive">
				<button type="button" id="get" class="btn btn-white bookBtn">
	        	    more
	        	</button>
	        		<table class="table table-flush table-nowrap table-bordered table-secondary table-striped table-hover">
	        		<thead>
	        			<tr>
	        				<th>제목</th>
	        				<th>저자</th>
	        			</tr>
	        		</thead>
	        		<tbody>
	        			<tr>
	        				<td>기도는 사라지지 않는다.</td>
	        				<td>최상훈</td>
	        			</tr>
	        			<tr>
	        				<td>잠들기 전에 읽는 니체</td>
	        				<td>예저우</td>
	        			</tr>
	        		</tbody>
	        		</table>
	        		
	        		<!-- 모달 창 -->
	         	    <div id="myModal" class="modal">
	         	      <div class="modal-content">
	         	        <span class="close">&times;</span>
	         	        	<div id="modalTable">
	         	    			<div id="bookList">
	         	    			    <table class="table table-flush table-nowrap table-bordered table-secondary table-striped table-hover">
	         	    			        <thead>
	         	    			            <tr>
	         	    			                <th>번호</th>
	         	    			                <th>제목</th>
	         	    			                <th>저자</th>
	         	    			                <th>출판사</th>
	         	    			                <th>카테고리</th>
	         	    			                <th>대출여부</th>
	         	    			            </tr>
	         	    			        </thead>
	         	    			        <tbody class="list" id="listBody">
	         	    			            <!-- 도서 목록 데이터 들어오는 곳 -->
	         	    			        </tbody>
	         	    			        <tfoot>
	         	    					    <tr>
	         	    					        <td colspan="6">
	         	    					        	<!-- Ajax로 페이지 이동 시 사용할 폼 -->
	         	    								<form id="searchForm" method="get">
	         	    								    <input type="number" name="page" style="display: none;" /> 
	         	    								    <input type="text" name="bookCode" style="display: none;" />
	         	    								    <input type="text" name="bookName" style="display: none;" />
	         	    								    <input type="text" name="bookWriter" style="display: none;" />
	         	    							        <div data-pg-role="searchUI" data-pg-target="#searchForm">
	         	    						                <input type="text" placeholder="제목" name="bookName" />
	         	    						                <input type="text" placeholder="저자" name="bookWriter" />
	         	    						                <button class="btn btn-white" type="button" data-pg-role='searchBtn'>검색</button>
	         	    						            </div>
	         	    								</form>
	         	    					            
	         	    					            <!-- 페이징 영역 -->
	         	    								<div class="pagination-container">
	         	    								    <div id="pagingArea"></div>
	         	    								</div>
	         	    								<!-- 도서 상세 정보를 표시하는 영역 -->
	         	    								<div class="book-detail" style="display: none;"></div>
	         	    					        </td>
	         	    					    </tr>
	         	    					</tfoot>
	         	    			    </table>
	         	    			</div>
	         	    		</div>
	         	    	</div>
	         	    </div>  
	        	</div>  
	`
	    };
	
	    advanced.push(roleData1);
	    advanced.push(roleData2);
	    advanced.push(roleData3);
	    advanced.push(roleData4);
	    advanced.push(roleData5);
		
		<!-- Google Analytics -->

		/* 대시보드 생성 */
		var advGrid = GridStack.init({
			margin : 5,
			disableOneColumnMode : true,
			acceptWidgets : true,
			removable : '#trash',
			removeTimeout : 100
		}, '#advanced-grid').load(advanced);
		
		GridStack.setupDragIn('.newWidget', {
			appendTo : 'body',
			helper : 'clone'
		});

		hljs.initHighlightingOnLoad();
		
		(function(i, s, o, g, r, a, m) {
			i['GoogleAnalyticsObject'] = r;
			(i[r] = i[r] || function() {
				(i[r].q = i[r].q || []).push(arguments);
			}), (i[r].l = 1 * new Date());
			(a = s.createElement(o)), (m = s.getElementsByTagName(o)[0]);
			a.async = 1;
			a.src = g;
			m.parentNode.insertBefore(a, m);
		})(window, document, 'script',
				'https://www.google-analytics.com/analytics.js', 'ga');

		ga('create', 'UA-1891156-8', 'auto');
		ga('send', 'pageview');

		
		/* save 버튼을 누르면 해당 대시보드의 정보를 추출 .. 저장은 알아서 */
		$("#save").on("click", function(){
			var grid = document.querySelector('#advanced-grid');
			console.log(grid);
			let grids = $(grid).find(".grid-stack-item");
			for(var g of grids){
				console.log("======================");
				var gg = $(g)['0'].gridstackNode;
			    console.log("content : "+gg.content);
			    console.log("x : "+gg.x);
			    console.log("y : "+gg.y);
			    console.log("w : "+gg.w);
			    console.log("h : "+gg.h);
			    console.log("locked : "+(gg.locked ? "true" : "false"));
			    console.log("noMove : "+(gg.noMove ? "true" : "false"));
			    console.log("noResize : "+(gg.noResize ? "true" : "false"));
			    console.log("minW : "+(gg.minW ?? null));
			    console.log("minH : "+(gg.minH ?? null));
			}
		});
		<!-- End Google Analytics -->	
		/* 도서 */
		$(document).ready(function() {
		    // 모달 창 표시
		    $("#get").click(function() {
		        $("#myModal").css("display", "block");
		    });
		
		    // 모달 닫기 버튼에 대한 클릭 이벤트 처리
		    $(".close").click(function() {
		        $("#myModal").css("display", "none");
		    });
		
		});
		
		$(document).ready(function() {
			
		    // 검색 폼 제출 이벤트
		    $(searchForm).on("submit", function(event) {
		        event.preventDefault();
		        let $listBody = $("#listBody");
		        let $pagingArea = $("#pagingArea");
		
		        $.ajax({
		            url: '/lcms/common/book/jsonbookList',
		            method: 'get',
		            dataType: "json",
		            data: $(this).serialize(), // 폼 데이터 직렬화
		            success: function(jsonObj) {
		                $listBody.empty();
		                $pagingArea.empty();
		
		                let dataList = jsonObj.bookList;
		                let pagingHTML = jsonObj.pagingHTML;
		                let trTags = "";
		                if (dataList.length > 0) {
		                    $.each(dataList, function(index, book) {
		                        trTags += `
		                            <tr>
		                                <td>\${book.rnum}</td>
		                                <td>\${book.bookName}</td>
		                                <td>\${book.bookWriter}</td>
		                                <td>\${book.bookCompany}</td>
		                                <td>\${book.bookCategory}</td>
		                                <td>\${book.bookState}</td>
		                            </tr>
		                        `;
		                    });
		                } else {
		                    trTags = `
		                        <tr>
		                            <td colspan="6">등록된 책이 없습니다.</td>
		                        </tr>
		                    `;
		                }
						
		                $listBody.append(trTags);                
		                $pagingArea.append(pagingHTML);
		            },
		            error: function(jqXHR, txt, status) {
		                console.log(txt, status, jqXHR);
		            }
		        }).done(() => {
		            $(this).find("input[name='page']").val("");
		        });
		        return false;
		    }).submit();
		    
			// 책 제목 클릭 시 bookView 로드
		    $(document).on('click', '.bookLink', function(event) {
		        event.preventDefault();
		        let bookCode = $(this).data('book-code');
		        loadBookDetail(bookCode);
		    });
			
		});
		
		//책 상세정보
		var cPath = $('body').data('bodyCpath');
		
		function loadBookDetail(bookCode) {
		    $.ajax({
		        type: 'GET',
		        url: `\${cPath}/common/book/bookView/\${bookCode}`,
		        success: function(response) {
		            $('.book-detail').html(response).toggle();
		        },
		        error: function(xhr, status, error) {
		            console.error('AJAX request failed: ', status, error);
		        }
		    });
		}	
		
		$(document).ready(function() {
		    // 요일을 포함한 날짜 형식으로 변환 (예: "2024년 3월 26일 일요일")
		    var options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
		    $("#currentDate").text(new Date().toLocaleDateString('ko-KR', options));
		});
		
		var imageUrls = [ "/lcms/resources/images/kce/강냥펀치.jpg",
			"/lcms/resources/images/kce/교양독서회.jpg",
			"/lcms/resources/images/kce/교과서 위주로 공부했어요.jpg",
	// 추가 이미지 URL을 필요에 따라 여기에 추가합니다
	];

	var currentIndex = 0;
	var overlay = document.getElementById("imageSpace");
	var overlayFade = document.querySelector(".fullbleed.bg-dark");

	function changeImage() {
		if (currentIndex == 2)
			currentIndex = -1;
		currentIndex = (currentIndex + 1)
		overlay.style.transition = "background-image 1s ease"; // transition 속성 변경
		overlay.style.backgroundImage = "url(" + imageUrls[currentIndex] + ")";
	}

	function changeImageBack() {
		if (currentIndex == 0)
			currentIndex = 3;
		currentIndex = (currentIndex - 1);
		overlay.style.transition = "background-image 1s ease"; // transition 속성 변경
		overlay.style.backgroundImage = "url(" + imageUrls[currentIndex] + ")";
	}

	// 초기 이미지 설정
	overlay.style.backgroundImage = "url(" + imageUrls[currentIndex] + ")";

	// 5초마다 배경 이미지 변경
	setInterval(changeImage, 5000);
		
	</script>
