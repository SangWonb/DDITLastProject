<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<style>
#frame {
	display: flex;
	flex-direction: row; /* 가로 정렬 */
	width: 1000px;
	height: 600px;
}

#resList {
	width: 550px;
}

#resDetail {
	width: 450px;
}

table {
	table-layout: fixed;
	width: 100%;
	height: 100%;
}

#restRVData::-webkit-scrollbar {
	display: none; /* Chrome, Safari, Edge 및 Opera에서 스크롤바 숨기기 */
}

#restRVData {
	scrollbar-width: none; /* Firefox에서 스크롤바 숨기기 */
}

button {
	border: none; /* 버튼의 테두리 제거 */
	background: none; /* 배경 제거 (선택사항) */
	/* 추가적인 스타일 지정 */
}

button:focus {
	outline: none; /* 클릭 시 테두리 제거 */
}

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

#userChoice:focus {
	outline: 1px solid blue; /* 원하는 스타일로 변경 */
}

#userChoice {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}

.userC {
	font-size: 20px;
}

.applPaper {
	width: 300px;
	height: 40px;
	font-size: 15px;
	position: absolute;
	border: none;
	outline: none;
	border-bottom: 1px solid black;
}

.ani1.move {
	animation: ani 1s linear forwards;
}

@keyframes ani {
	from { transform:translateY(0);	}
	to {transform: translateY(120px);}
}
[data-err-msg] {
	color: red;
}
</style>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<div id="frame">
	<div id="resList">
		<!-- 식당목록+식당신청버튼 -->
		<div class="col-lg-8 d-flex align-items-center"
			style="max-width: 100%">
			<div class="flex" style="max-width: 100%">
				<div class="card m-0">
					<div class="table-responsive" data-toggle="lists"
						data-lists-sort-by="js-lists-values-employee-name"
						data-lists-values='["js-lists-values-employee-name", "js-lists-values-employer-name", "js-lists-values-projects", "js-lists-values-activity", "js-lists-values-earnings"]'>
						<div class="card-header">
							<div class="search-form">
								<input type="text" name="resName" value="${condition.resName }"
									class="form-control search" placeholder="식당이름">
								<button class="btn" type="button" id="searchBtn">
									<i class="material-icons">search</i>
								</button>
							</div>
						</div>

						<table class="table mb-0 thead-border-top-0 table-nowrap"
							style="text-align: center;">
							<thead>
								<tr>

									<th style="width: 10px;">NO</th>
									<th style="width: 150px;">식당이름</th>
									<th style="width: 80px;"><select style="max-width: 100%;"
										name="resCode" data-change-event="resCode"
										value="${condition.resCode }" id="custom-select"
										class="form-control custom-select">
											<option selected="" value>분류</option>
											<option value="한식">한식</option>
											<option value="중식">중식</option>
											<option value="일식">일식</option>
											<option value="양식">양식</option>
											<option value="베트남식">배트남식</option>
											<option value="기타">기타</option>
									</select></th>
									<th style="width: 80px;">평점</th>
								</tr>
							</thead>
							<tbody class="list" id="listBody">
							</tbody>
						</table>

						<div class="card-footer p-8pt">
							<div id="pagingArea"></div>
						</div>

					</div>

				</div>

			</div>
		</div>
	</div>
	<div id="resDetail">

		<!-- 식당 상세정보 -->
		<div class="col-lg-8 d-flex align-items-center"
			style="max-width: 100%;">
			<div class="flex" style="max-width: 100%;">
				<div class="card p-relative o-hidden mb-0">
					<div class="card p-relative o-hidden mb-0">
						<div class="card-header">
							<a class="tooltip-trigger"  data-bs-toggle="modal" data-bs-target="#resRecomModal" onclick="$('#resRecomModal').modal('show');"
								style="margin-right: 10px;"
								onmouseover="showTooltip('tooltip1')"
								onmouseout="hideTooltip('tooltip1')"> <svg
									style="width: 30px;" data-v-134867f8="" aria-hidden="true"
									focusable="false" data-prefix="fas" data-icon="utensils"
									role="img" xmlns="http://www.w3.org/2000/svg"
									viewBox="0 0 416 512"
									class="svg-inline--fa fa-utensils fa-w-13">
									<path data-v-134867f8="" fill="currentColor"
										d="M207.9 15.2c.8 4.7 16.1 94.5 16.1 128.8 0 52.3-27.8 89.6-68.9 104.6L168 486.7c.7 13.7-10.2 25.3-24 25.3H80c-13.7 0-24.7-11.5-24-25.3l12.9-238.1C27.7 233.6 0 196.2 0 144 0 109.6 15.3 19.9 16.1 15.2 19.3-5.1 61.4-5.4 64 16.3v141.2c1.3 3.4 15.1 3.2 16 0 1.4-25.3 7.9-139.2 8-141.8 3.3-20.8 44.7-20.8 47.9 0 .2 2.7 6.6 116.5 8 141.8.9 3.2 14.8 3.4 16 0V16.3c2.6-21.6 44.8-21.4 48-1.1zm119.2 285.7l-15 185.1c-1.2 14 9.9 26 23.9 26h56c13.3 0 24-10.7 24-24V24c0-13.2-10.7-24-24-24-82.5 0-221.4 178.5-64.9 300.9z"
										class=""></path></svg> <span id="tooltip1"
								style="display: none; font-size: 15px; font-weight: bold;">점심추천</span>
							</a> 
							<a class="tooltip-trigger" data-bs-toggle="modal" data-bs-target="#resApplModal" onclick="$('#resApplModal').modal('show');"
								style="margin-right: 10px;" s
								onmouseover="showTooltip('tooltip2')"
								onmouseout="hideTooltip('tooltip2')"> <svg
									data-bs-toggle="modal" data-bs-target="#exampleModal"
									style="width: 30px;" data-v-134867f8="" aria-hidden="true"
									focusable="false" data-prefix="fas" data-icon="plus" role="img"
									xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"
									class="svg-inline--fa fa-plus fa-w-14">
									<path data-v-134867f8="" fill="currentColor"
										d="M416 208H272V64c0-17.67-14.33-32-32-32h-32c-17.67 0-32 14.33-32 32v144H32c-17.67 0-32 14.33-32 32v32c0 17.67 14.33 32 32 32h144v144c0 17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32V304h144c17.67 0 32-14.33 32-32v-32c0-17.67-14.33-32-32-32z"
										class=""></path></svg> <span id="tooltip2"
								style="display: none; font-size: 15px; font-weight: bold;">식당등록</span>
							</a>
						</div>
						<div class="card-header card-header-tabs-basic nav px-0"
							role="tablist">
							<a onclick="fn_detail()" class="active" data-toggle="tab"
								role="tab" data-rest="restData" aria-selected="true">상세정보</a> <a
								onclick="fn_review()" data-toggle="tab" role="tab"
								aria-selected="true" data-rest="restRVData" class="">식당리뷰</a>
						</div>
						<div class="card-body text-70" id="detailData"
							style="height: 400px;">
							<div id="restData" style="height: 370px;"></div>
							<div id="restRVData" style="height: 370px; overflow: auto;"></div>
						</div>

						<!-- 리뷰 작성 공간 -->
						<div class="card-footer p-8pt" id="reviewCard"
							style="height: 100px;">
							<div id="reviewWrite">
								<div id="prefer" style="margin-bottom: 5px;">
									<button data-prefer="false" value="L">
										<svg data-prefer-like="L"
											style="position: absolute; top: 523px; left: 15px; width: 20px; color: gray;"
											data-v-134867f8="" aria-hidden="true" focusable="false"
											data-prefix="fas" data-icon="thumbs-up" role="img"
											xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"
											class="svg-inline--fa fa-thumbs-up fa-w-16">
											<path data-v-134867f8="" fill="currentColor"
												d="M104 224H24c-13.255 0-24 10.745-24 24v240c0 13.255 10.745 24 24 24h80c13.255 0 24-10.745 24-24V248c0-13.255-10.745-24-24-24zM64 472c-13.255 0-24-10.745-24-24s10.745-24 24-24 24 10.745 24 24-10.745 24-24 24zM384 81.452c0 42.416-25.97 66.208-33.277 94.548h101.723c33.397 0 59.397 27.746 59.553 58.098.084 17.938-7.546 37.249-19.439 49.197l-.11.11c9.836 23.337 8.237 56.037-9.308 79.469 8.681 25.895-.069 57.704-16.382 74.757 4.298 17.598 2.244 32.575-6.148 44.632C440.202 511.587 389.616 512 346.839 512l-2.845-.001c-48.287-.017-87.806-17.598-119.56-31.725-15.957-7.099-36.821-15.887-52.651-16.178-6.54-.12-11.783-5.457-11.783-11.998v-213.77c0-3.2 1.282-6.271 3.558-8.521 39.614-39.144 56.648-80.587 89.117-113.111 14.804-14.832 20.188-37.236 25.393-58.902C282.515 39.293 291.817 0 312 0c24 0 72 8 72 81.452z"
												class=""></path></svg>
									</button>
									<button data-prefer="false" value="H">
										<svg data-prefer-hate="H"
											style="position: absolute; top: 523px; left: 50px; width: 20px; color: gray;"
											data-v-134867f8="" aria-hidden="true" focusable="false"
											data-prefix="fas" data-icon="thumbs-down" role="img"
											xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"
											class="svg-inline--fa fa-thumbs-down fa-w-16">
											<path data-v-134867f8="" fill="currentColor"
												d="M0 56v240c0 13.255 10.745 24 24 24h80c13.255 0 24-10.745 24-24V56c0-13.255-10.745-24-24-24H24C10.745 32 0 42.745 0 56zm40 200c0-13.255 10.745-24 24-24s24 10.745 24 24-10.745 24-24 24-24-10.745-24-24zm272 256c-20.183 0-29.485-39.293-33.931-57.795-5.206-21.666-10.589-44.07-25.393-58.902-32.469-32.524-49.503-73.967-89.117-113.111a11.98 11.98 0 0 1-3.558-8.521V59.901c0-6.541 5.243-11.878 11.783-11.998 15.831-.29 36.694-9.079 52.651-16.178C256.189 17.598 295.709.017 343.995 0h2.844c42.777 0 93.363.413 113.774 29.737 8.392 12.057 10.446 27.034 6.148 44.632 16.312 17.053 25.063 48.863 16.382 74.757 17.544 23.432 19.143 56.132 9.308 79.469l.11.11c11.893 11.949 19.523 31.259 19.439 49.197-.156 30.352-26.157 58.098-59.553 58.098H350.723C358.03 364.34 384 388.132 384 430.548 384 504 336 512 312 512z"
												class=""></path></svg>
									</button>
									<span id="preferWarn"
										style="position: absolute; top: 523px; left: 80px; color: red; display: none">선택해주세요</span>
									<button id="reviewAddBtn"
										style="position: absolute; right: 10px;"
										class="btn btn-outline-primary btn-rounded">등록</button>
								</div>
								<div>
									<input id="reviewContent" style="margin-top: 25px;"
										class="form-control form-control-rounded"
										placeholder="리뷰를 남겨주세요.">
								</div>
							</div>
						</div>


					</div>
				</div>

			</div>
		</div>
	</div>
</div>

<!-- 검색 폼 -->
<form id="searchForm" hidden="true" method="get">
	<input type="hidden" name="page" /> <input type="hidden"
		name="resName" value="${condition.resName }" /> <input type="hidden"
		name="resCode" value="${condition.resCode }" />
</form>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function () {
	
	getModal();
	function getModal(){
		
		
		$.ajax({
			url: window.location.pathname + "/recomModal"
			, method:"get"
			, success:function(response){
	            // 모달을 DOM에 추가
	            $(document.body).append(response);

	            // 모달 초기화
	            $('#resRecomModal').modal('hide');
				
			}, error : function(jqXHR, txt, status){
				console.log(jqXHR, txt, status);
			}
		});
		
		
		$.ajax({
			url: window.location.pathname + "/applModal"
			, method:"get"
			, success:function(response){
				
	            // 모달을 DOM에 추가
	            $(document.body).append(response);

	            // 모달 초기화
	            $('#resApplModal').modal('hide');
				
			}, error : function(jqXHR, txt, status){
				console.log(jqXHR, txt, status);
			}
		});
		
	}
	

	$(document).on("hidden.bs.modal", closeModal);
	
	
	function closeModal(event) {
		$("#userChoice").val("");
		if(document.getElementById("applForm")){
			document.getElementById("applForm").reset();			
		}
	    $('.ani1').hide(); // jQuery를 이용해 애니메이션 요소를 숨깁니다.
	    isAnimating = false;
	    $('#recomDetailContent').html("");
	    $("[data-err-msg]").text("");
	}
	
	$(document).on("click","#restApplFindAddressBtn",function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
            }
        }).open();
    });
    
    
    
	var recomCnt = 0; //추천 우선순위
	var recomOrder = [
		"","","","",""
	];
	
	$(document).ready(function(){
	    $(document).on('mousedown', '#lightBtn path', function(){
	        $(this).css('fill', '#FFFF99');
	    });

		$(document).on('mouseup', '#lightBtn', function(){
	    	$('#lightBtn path').css('fill', 'gray');
	    });
	});
	$(document).on("click","#lightBtn",function(event){
		
		console.log("1차 인증");
		
		var selectCode = $("#userChoice option:selected").val();
		if(!selectCode){/* 선택안하면 경고 */
			$("#userChoice").css("border-color","red");
			$("#userChoiceWarn").css("display","block");
			return;
		}
		
			
		$.ajax({
			url: window.location.pathname + "/recome?resCode=" + selectCode
			, method:"post"
			, contentType: 'application/json'
			, success:function(response){
				console.log(response);
				recomOrder[0] = response["one"];
				recomOrder[1] = response["two"];
				recomOrder[2] = response["three"];
				recomOrder[3] = response["four"];
				recomOrder[4] = response["five"];
				
			}, error : function(jqXHR, txt, status){
				console.log(txt, status, jqXHR);
			}
		}).done(function(){
				
			resAppno = recomOrder[recomCnt%5];
			console.log("recomOrder : ",recomOrder);
			console.log("recomCnt : ",recomCnt);
			console.log("recomCnt%5 : ",recomCnt%5);
			console.log("resAppno : ",resAppno);
			recomCnt++;
			$.ajax({
				url:window.location.pathname + "/" + resAppno + "/data"
				, method:"get"
				, success:function(response){
					
					var resName = response.res.resName;
					var spanTag = `<span id="restaurantName">\${resName }</span>`;
					
		            $('#recomDetailContent').html(spanTag);	
		            $('#recomDetailContent').data("data-recom-resappno",resAppno);
		            
		            f_str();
					
				}, error : function(jqXHR, txt, status){
					console.log(txt, status, jqXHR);
				}
			});
			
		});
		
	});
	$(document).on("click","#userChoice",function(event){
		$("#userChoice").css("border-color","gray");
		$("#userChoiceWarn").css("display","none");
	});
	$(document).on("change","#userChoice",function(event){
		recomCnt = 0;
		console.log(recomCnt);
	});
	$(document).on("submit","#resApplModal",function(event){
		event.preventDefault();
		$("[data-err-msg]").text("");
		
		var $form = $("#applForm");
		var jsonData = $form.serialize(); //form데이터를 전송할떄는 serialize,, js객체를 전송할때는 JSON.stringify
		console.log(jsonData);
		
		$.ajax({
			url: window.location.pathname
			, method:"post"
			, contentType: 'application/x-www-form-urlencoded'
			, data : jsonData //serialize
			, success:function(response){
				if(response.success){
					
					document.querySelector("#applForm").reset();
					
					Swal.fire({
				      title: '신청완료되었습니다.',
				      text: '신청 완료',
				      icon: 'success'
				    });
					
				}else{
					for (let err of response.errMsg) {
						var key = Object.keys(err)[0];
						var value = err[key];
						$(`[data-err-msg="\${key}"]`).text(value);
					}					
				}
			}, error : function(jqXHR, txt, status){
				var errors = jqXHR.responseJSON;
				console.log(errMsg);
			}
		});
		
		
	});
	
	
	//애니메이션
	let isAnimating = false; // 애니메이션 진행 여부를 저장하는 변수

	function f_str() {
	    if (!isAnimating) { // 애니메이션이 진행 중이 아니라면
	        // div 요소에 move 클래스 추가하여 애니메이션 적용
	        document.querySelector('.ani1').classList.add('move');
	        // 애니메이션이 시작되면 .ani2 요소를 화면에 표시
	        document.querySelector('.ani1').style.display = 'block';
	        isAnimating = true; // 애니메이션 진행 상태로 변경
	    } else { // 애니메이션이 진행 중인 경우
	        // 애니메이션 초기화
	        document.querySelector('.ani1').style.display = 'none';
	        document.querySelector('.ani1').classList.remove('move');
	        setTimeout(() => {
	            // 애니메이션 완료 후 재시작
	            document.querySelector('.ani1').style.display = 'block';
	            document.querySelector('.ani1').classList.add('move');
	            isAnimating = true; // 애니메이션 진행 상태로 변경
	        }, 10);
	    }
	}
	
	$(document).on("click", "#recomDetailContent", function() {
		event.preventDefault(); // 기본 동작 막기
	    console.log("sdfsdfsdfsdfsdfsdfsdfsdfsdfs-=-=-0=-0=-sdfsdfsdf");

	    var recomResAppno = $(this).data("data-recom-resappno");
	    console.log("recomResAppno : ", recomResAppno);
	    $('#resRecomModal').modal('hide');
	    fn_detail();
	    var cardFooter = document.querySelector('#reviewCard');
	    var elements = cardFooter.querySelectorAll('*');
	    elements.forEach(function(element) {
	        element.removeAttribute('disabled');
	    });
	});
	
	//추천받은 내용을 클릭하면 상세정보를 볼 수 있음
	
	
	
});
</script>
<script src="<c:url value='/resources/js/paging.js' />"></script>
<script src='<c:url value="/resources/js/app/restaurant/resList.js" />'></script>
