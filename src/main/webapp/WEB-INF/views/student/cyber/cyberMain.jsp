<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<style type="text/css">
#table {
	border-radius: 10px;
	font-size: 13px;
	background-color: white;
	box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.1);
}

#table thead th:first-child {
	width: 15px;
	height: 10px;
	border-left: none;
}

#table tbody td:first-child {
	width: 15px;
}

#table thead th {
	width: 90px;
	height: 10px;
	border-left: 1px solid lightgray;
}

#table tbody td:last-child {
	border-right: none;
}

#table tbody td {
	width: 90px;
	height: 25px;
	border-right: 1px solid lightgray;
}
#table tbody th {
	height: 25px;
}
#table tbody tr {
	height: 25px;
}

#table th {
	font-size: 10px;
}

#table {
	border-collapse: collapse;
	color: gray;
}
#table tr:nth-child(2n+1) td {
    border-top: 1px solid lightgray;
} 

#cyberHeaderSpace {
	display: flex;
	flex-direction: row;
	justify-content: center;
	background-color: snow;
	border-radius: 20px;
	width: 940px;
	height: 300px;
	padding: 20px;
	margin: 5px;
	margin-bottom: 15px;
	box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.1);
}

#infomation {
	width: 450px;
	height: 210px;
	margin-right: 20px;
}

#infomationSpace {
	width: 420px;
	height: 210px;
}

#imageNotice {
	width: 450px;
	height: 210px;
}

#imageSpace {
	width: 420px;
	height: 210px;
	background-size: contain; /* 이미지가 100% 꽉 차도록 설정 */
	background-position: center; /* 이미지를 가운데 정렬 */
	background-image:
		url(/lcms/resources/images/cybernotice/cybernotice1.png);
	animation: slideLeft 5s infinite;
	transition: background-image 1s ease;
	/* 부드러운 전환을 위한 transition 속성 추가 */
}

#cyberMainSpace {
	display: flex;
	flex-direction: row;
	width: 950px;
	justify-content: center;
	align-items: center;
}

#timeTable {
	width: 420px;
	height: 558px;
	margin: 5px;
}

#lecutreTable {
	width: 420px;
	height: 558px;
	margin: 5px;
	border-radius: 7px;
}

@
keyframes slideLeft { 0% {
	background-position: 100% 50%;
}

100
%
{
background-position
:
0
50%;
}
}
.simpleTitle {
	font-family: "Nanum Gothic", sans-serif;
	font-weight: 800;
	font-style: normal;
	font-size: 20px;
	margin-bottom: 10px;
}

.infoLine {
	margin-bottom: 10px;
}
.timeStyle{
	text-align: right; 
	vertical-align: top; 
	font-size: 10px; 
	color: gray; 
	font-weight: 100;
}
#lecListTableCard{
	
	background-color: lightgray;
	border-radius: 10px;
	border-bottom-left-radius: 0px;
	border-bottom-right-radius: 0px;
	height: 420px;
	
}
#lecListTable{
	
	border-radius: 7px; 	
}
#lecListTableStyle{
	box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.1);
}
#lecutreTable tbody tr{
	
	height: 60px;
	
}
#lecutreTableFoot{
	height: 47px;
}
</style>

<div id="cyberHeaderSpace">
	<div id="infomation">
		<div class="simpleTitle">
			<span>프로필</span>
		</div>
		<div id="infomationSpace" class="card">
			<div class="card-body media"
				style="justify-content: center; align-items: center;">
				<div class="media-left mr-3" style="width: 150px; height: 120px;">
					<div class="avatar">
						<img
							src="/lcms/resources/images/illustration/achievement/128/man.png"
							alt="Avatar" class="avatar-img rounded-circle"
							style="margin-left: 15px; width: 120px; height: 120px;">
					</div>
				</div>
				<div class="media-body">
					<div class="infoLine">
						<strong>이름<span class="text-muted"> ·
								${student.memName }</span></strong>
					</div>
					<div class="infoLine">
						<strong>학번<span class="text-muted"> ·
								${student.smemNo }</span></strong>
					</div>
					<div class="infoLine">
						<strong>학과<span class="text-muted"> ·
								${student.deptName }</span></strong>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="imageNotice">

		<div class="simpleTitle">
			<span>한인대 소식지</span>
		</div>

		<div id="imageSpace" class="card">
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
	</div>
</div>
<div id="cyberMainSpace">
	<div id="timeTable">
		<div class="simpleTitle">
			<span>강의 시간표</span>
		</div>
		<table id="table">
			<thead style="text-align: center; color: gray;">
				<tr>
					<th></th>
					<th>월</th><th>화</th><th>수</th><th>목</th><th>금</th>
				</tr>
			</thead>
			<tbody>
				<tr> <td class="timeStyle">9 </td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr>
				<tr> <td class="timeStyle">  </td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr>
				<tr> <td class="timeStyle">10</td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr>
				<tr> <td class="timeStyle">  </td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr>
				<tr> <td class="timeStyle">11</td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr>
				<tr> <td class="timeStyle">  </td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr>
				<tr> <td class="timeStyle">12</td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr>
				<tr> <td class="timeStyle">  </td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr>
				<tr> <td class="timeStyle">13</td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr>
				<tr> <td class="timeStyle">  </td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr>
				<tr> <td class="timeStyle">14</td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr>
				<tr> <td class="timeStyle">  </td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr>
				<tr> <td class="timeStyle">15</td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr>
				<tr> <td class="timeStyle">  </td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr>
				<tr> <td class="timeStyle">16</td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr>
				<tr> <td class="timeStyle">  </td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr>
				<tr> <td class="timeStyle">17</td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr>
				<tr> <td class="timeStyle">  </td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr>
			</tbody>
		</table>

	</div>
	<div id="lecutreTable">
		<div class="simpleTitle">
			<span>강의 목록</span>
		</div>
		<div id="lecListTableStyle">
			<div id="lecListTableCard">
				<div class="card mb-lg-32pt">
		
		            <div class="table-responsive" data-toggle="lists">
		
		                <table class="table mb-0 thead-border-top-0 table-nowrap">
		                    <thead style="text-align: center;">
		                        <tr>
		                            <th style="width: 50px;">
		                                <a href="javascript:void(0)">NO</a>
		                            </th>
		                            <th style="width: 270px;">
		                                <a href="javascript:void(0)">강의명</a>
		                            </th>
		                            <th style="width: 100px;">
		                                <a href="javascript:void(0)">교수명</a>
		                            </th>
		                        </tr>
		                    </thead>
		                    <tbody class="list" id="listBody">
		                    	
		                   	</tbody>
		                </table>
		            </div>
		
		        </div>
			</div>
	        <div class="card-footer p-8pt" id="lecutreTableFoot">
	           <div id="pagingArea"></div>
	        </div>
		</div>
	</div>
</div>
<form id="searchForm" hidden="true" method="get" action='<c:url value="/student/cyber/cyberMain/lecList"/>'>
	<input type="hidden" name="page" />
</form>
<script src="<c:url value='/resources/js/paging.js' />"></script>
<script src='<c:url value="/resources/js/app/cyber/cyberMainS.js" />'></script>



