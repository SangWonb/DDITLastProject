<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
	.bodyContent{
		background-color: Aliceblue;
		margin-top: 10px;
		box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.1);
	}
	.clubContent{
		font-family: 'Malgun Gothic', sans-serif;
		font-size: 14px;
	}
	.headtitle{
		margin-top: 10px;
	}
	.cardContent {
	    display: flex;
	    justify-content: center;
	    width: 96%;
	    text-align: center;
	    margin: 0 auto;
	    margin-top: 20px;
	}
	.imglist{
		width: 200px; 
		height: 200px;
		margin-top: 20px;
	}

</style>

<div class="page-separator" style="margin-top: 10px;">
	<div class="page-separator__text">
		<h2 class="headtitle">&nbsp;&nbsp;동아리목록</h2>
	</div>
</div>
<div class="clubLogo">
	<a onclick="$('#clubRecomModal').modal('show');" class="tooltip-trigger" data-bs-toggle="modal" data-bs-target="#clubRecomModal"
		style="margin-bottom: 10px; margin-right: 20px; display: flex; align-items: center; justify-content: flex-end; text-decoration: none;">
		<img src='<c:url value="/resources/images/kce/하트기본.jpg" />' width="20"
		height="20"> <span style="font-size: 10pt; font-weight: bold;">동㉧ㅏ己I추천</span>
		<img src='<c:url value="/resources/images/kce/하트기본.jpg" />' width="20"
		height="20">
	</a>
</div>	
<div
	style="display: flex; align-items: center; justify-content: flex-end; height: 100%; margin-bottom:10px;">
	<div>
		<select style="padding: 4px;">
			<option selected="">동아리분과</option>
			<option value="AC">학술분과</option>
			<option value="VO">봉사분과</option>
			<option value="HO">취미분과</option>
			<option value="EX">전시분과</option>
			<option value="SH">공연분과</option>
			<option value="RE">종교분과</option>
			<option value="PE">체육분과</option>
			<option value="FL">어학분과</option>
		</select>
	</div>
	<div style="margin-left: 10px;">
		<select style="padding: 4px;">
			<option selected="">전&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;체</option>
			<option>동아리이름</option>
			<option>동아리소개</option>
		</select>
	</div>
	<div style="margin-left: 10px;">
		<input>
	</div>
	<div style="margin-left: 10px; margin-right: 10px;">
		<button type="button" class="btn btn-outline-dark btn-sm"
			style="height: 100%;">검색</button>
	</div>
</div>

<div class="bodyContent">
	<c:forEach items="${list}" var="cl">
	<div class="card cardContent">
		<table style=" width: 100%; margin: 0 auto;">
			<tr class="contentTr">
				<td style="width: 10%;" >
					<div class="d-flex justify-content-center"><h3>${cl.rnum}</h3></div>
				</td>
				<td style="text-align: left;">
					<div class="posts-card__content d-flex flex-column flex-sm-row">
						<figure class="figure">
							<img src="${cl.clubGf}" class="figure-img img-fluid rounded imglist"
								alt="${cl.clubName}">
						</figure>
	
						<div
							class="posts-card__info ml-sm-3 mt-sm-0 mt-3 d-flex flex-column">
							<div style="margin-top:30px">
								<h3>${cl.clubName}</h3>
	
							</div>
							<div style="margin-bottom: 20px" class="clubContent">
								<small><pre class="clubContent">${cl.clubContent}</pre></small>
							</div>
							<div class="d-flex flex-column mt-3 align-items-start justify-content-left">
								<div class="d-flex flex-column">
									<div class="d-flex justify-content-between">
										<div class="text-50 posts-card__date">
											<small>개설날짜: ${cl.clubDate}</small>
										</div>
										<div class="text-50 posts-card__date">
											<small>동아리 인원:${cl.clubMem }</small>
										</div>
										<div class="text-50 posts-card__date">
											<small>조회수:${cl.clubViews} </small>
										</div>
									</div>
								</div>
							</div>
						</div>
	
					</div>
				</td>
				<td style="text-align: center;">
					<button id="baroBtn${cl.rnum}" type="button" class="btn btn-light"
						value="${cl.clubNo}">신청바로가기</button>
				</td>
			</tr>
		
		</table>
	</div>
</c:forEach>
<script>
document.addEventListener('DOMContentLoaded', function () {
	
	getModal();
	function getModal(){
		
		
		$.ajax({
			url: window.location.pathname + "/recomModal"
			, method:"get"
			, success:function(response){
				
				let parser = new DOMParser();
				let newDoc = parser.parseFromString(response, "text/html");
				let preTag = newDoc.getElementById('clubRecomModal');
	            // 모달을 DOM에 추가
	            $(document.body).append(preTag);

	            // 모달 초기화
	            $('#clubRecomModal').modal('hide');
				
			}, error : function(jqXHR, txt, status){
				console.log(jqXHR, txt, status);
			}
		});
		
	}
$(document).on("hidden.bs.modal", closeModal);
	
	
	function closeModal(event) {
		$("#userChoice").val("");
		if(document.getElementById("recomForm")){
			document.getElementById("recomForm").reset();			
		}
	    $('.ani1').hide(); // jQuery를 이용해 애니메이션 요소를 숨깁니다.
	    isAnimating = false;
	    $('#recomDetailContent').html("");
	    $("[data-err-msg]").text("");
	}
	

$("[id^='baroBtn']").on("click",function(){
	var buttonValue = $("[id^='baroBtn']").val();
	console.log(buttonValue);
	window.location.href="http://localhost/lcms/student/info/club/clubJoin?clubNo="+buttonValue;
	});
});
</script>

<script src="<c:url value='/resources/js/paging.js' />"></script>
<script src='<c:url value="/resources/js/app/club/club.js" />'></script>

</div>
