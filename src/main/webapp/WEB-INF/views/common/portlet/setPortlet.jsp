<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description"
	content="gridstack.js Build interactive dashboards in minutes." />
<meta name="keywords"
	content="gridstack, typescript, jquery, grid, layout, drag-n-drop, widgets, js, javascript, gridstack.js, dashboard" />
<!-- ES5 support for IE -->
<script
	src="https://gridstackjs.com/node_modules/gridstack/dist/es5/gridstack-poly.js"></script>
<script
	src="https://gridstackjs.com/node_modules/gridstack/dist/es5/gridstack-all.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://getbootstrap.com/docs/4.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-xrRywqdh3PHs8keKZN+8zzc5TX0GRTLCcmivcbNJWm2rs5C8PRhcEn3czEjhAO9o"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.16.2/build/highlight.min.js"></script>

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
.grid-container {
	padding: 15px;
	border: 1px solid white;
	max-width: 1000px;
}

.center {
	margin-left: auto;
	margin-right: auto;
}

.grid-stack-item {
	border: 0;
}

.grid-stack-item-content {
	background-color: white;
	text-align: center;
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
.potMainT {
	font-size: 18px;
	font-weight: bold;
}
.bookImg {
	width: 150px;
    height: 150px; 
}
.btnCo {
	color: white;
}
</style>
</head>

<body>
	<main role="main" class="container-fluid" style="padding: 0">
	
		<section id="advancedDemo" class="bg-primary">

			<div class="row">
				<div class="col-lg-12 text-white">
					<ion-icon class="float-right" name="grid"
						style="font-size: 350%; margin-top: 10px"></ion-icon>
					<hr />
				</div>
			</div>

			<div class="row">

				<div class="col-md-2 d-none d-md-block"
					style="border-right: 1px dashed white;">


					<!-- 추가 :newWidget 라는 클래스를 가진 요소들은 드래그를 하여 대시보드에 추가할 수 있음. -->
					<div class="text-center card text-white grid-stack-item newWidget">
						<div class="card-body grid-stack-item-content">
							<div>
								<ion-icon name="add-circle" style="font-size: 400%"></ion-icon>
							</div>
							<div>
								<span>포틀릿 생성!</span>
							</div>
						</div>
					</div>
					<br />
					<!-- 삭제 : #trash 라는 아이디를 가진 요소에 드래그 하면 삭제됨 -->
					<div id="trash" style="padding: 15px; margin-bottom: 15px;"
						class="text-center text-white">
						<div>
							<ion-icon name="trash" style="font-size: 400%"></ion-icon>
						</div>
						<div>
							<span>포틀릿 삭제~</span>
						</div>
					</div>

				</div>

				<div class="col-sm-12 col-md-10" style="padding-bottom: 25px;">
					<div class="grid-container">
						<div class="grid-stack" id="advanced-grid"></div>
					</div>
				</div>
			</div>

		</section>
		<div class="text-center">
		<br>
			<button id="savePortlet" type="submit" class="btn btn-primary rounded-pill">저장하기</button>
		</div>
	</main>
	<!-- /.container -->
	<script type="text/javascript">
		/* 포틀릿 내용 */
		var cPath = $('body').data('bodyCpath')  
		
		   advanced = [
                {
                    x : 0,
                    y : 0,
                    w : 8,
                    h : 4,
                    portState : 1,
                    content : `<div class="potMainT" style="background-color: #3498db; color: white; padding: 10px; border-radius: 5px;">취업교육</div>
	                       <div class="table-responsive"><table class="table table-flush table-nowrap table-bordered table-secondary table-striped table-hover">
	                       <thead>                                                 
			                        <tr>                                                
			                            <th>제목</th>                                   
			                            <th>모집인원</th>                                 
			                            <th>시작일</th>                                 
			                        </tr>                                               
			                    </thead>                                                
			                    <tbody>     
			                    <c:forEach  items="${proList}" var="pro" varStatus="loop">
			                    <tr>
			                        <td><a href="\${cPath}/student/careerup/employment/employmenteducation/employmentEducationList">${pro.emppgNm}</a></td> 
			                        <td>${pro.emppgLimit}</td> 
			                        <td>${pro.emppgStart}</td> 
			                    </tr>
			                </c:forEach>   
			                    </tbody>                                                                                          
			                </table>     </div>`
                 },
                 {
                    x : 8,
                    y : 0,
                    w : 4,
                    h : 4,
                    minW : 2,
                    portState : 2,
                    content : `<div class="potMainT" style="background-color: #3498db; color: white; padding: 10px; border-radius: 5px;">장학내역</div>
	                       <div class="table-responsive"><table class="table table-flush table-nowrap table-bordered table-secondary table-striped table-hover">
		                    <thead>                                                 
		                        <tr>                                                
		                            <th>장학금명</th>                                   
		                            <th>지급일</th>                                 
		                        </tr>                                               
		                    </thead>                                                
		                    <tbody>     
		                    <c:forEach items="${schList}" var="sch" varStatus="loop">
		                    <tr>
		                        <td>${sch.scholaship.scholName}</td> 
		                        <td>${sch.scholDate}</td> 
		                    </tr>
		                </c:forEach>   
		                    </tbody>                                                                                          
		                </table>     </div>`
                 },
                 {
                    x : 0,
                    y : 4,
                    w : 4,
                    h : 4,
                    portState : 3,
                    content :  `<div class="potMainT" style="background-color: #3498db; color: white; padding: 10px; border-radius: 5px;">성적조회</div>
                 	   <div class="table-responsive">
                	    <table class="table table-flush table-nowrap table-bordered table-secondary table-striped table-hover">
                	        <thead>
                	            <tr>
                	                <th colspan="3">당학기성적</th>
                	            </tr>
                	        </thead>
                	        <tbody>
                	            <tr>
                	                <td class="diagonal-line"></td>
                	                <td>전공</td>
                	                <td>교양</td>
                	            </tr>
                	            <tr>
                	            	<td>필수</td>
                	                <td>${member.stuMnl}</td>
                	                <td>${member.stuCnl}</td>
                	            </tr>
                	            <tr>
                	            	<td>선택</td>
                	                <td>${member.stuMcl}</td>
                	                <td>${member.stuCcl}</td>
                	            </tr>
                	            <tr>
            	            		<td>소계</td>
            	                	<td>28</td>
            	                	<td>35</td>
            	            	</tr>
                	        </tbody>
                	    </table>
                	</div>`
                 },
                 {
                    x : 4,
                    y : 4,
                    w : 4,
                    h : 4,
                    portState : 4,
                    content : `<div class="potMainT" style="background-color: #3498db; color: white; padding: 10px; border-radius: 5px;">인기도서추천</div>
		                           <table class="table table-flush table-nowrap table-bordered table-secondary table-striped table-hover"> 
				                        <thead>                                                                                            
				                            <tr>                                                                                           
				                                <th>제목</th>                                                                              
				                                <th>저자</th>                                                                              
				                            </tr>                                                                 							
				                        </thead>                                                                                           
				                        <tbody>       
				                        	<c:forEach items="${popBook}" var="p">
				                                <tr>                                                                                       
	                                                <td>${p.bookInfo.bookName}</td>
	                                                <td>${p.bookInfo.bookWriter}</td>
				                                </tr>   
				                            </c:forEach>
				                        </tbody>                                                                                           
				                    </table>
				                 `
                 },
                 {
                    x : 8,
                    y : 4,
                    w : 4,
                    h : 4,
                    portState : 5,
                    content: `
                    		<div class="potMainT" style="background-color: #3498db; color: white; padding: 10px; border-radius: 5px;">AI도서추천</div>
                            <div class="card-body">
                                <!-- "추천받기" 버튼 -->
                                <a href="#" id="aiRecomBtn" class="btn btn-primary">
                                	<img src="/lcms/resources/images/popbooks.jpg" alt="추천받기" class="bookImg">
	                            </a>
                                <!-- Modal -->
                                <div class="modal fade" id="staticBackdrop" data-backdrop="false" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content" id="modalContainer">
                                        <div class="modal-header">
										<h5 class="modal-title" id="staticBackdropLabel">Ai도서추천</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-header2">
										<select id="userChoice">
											<option selected class="userC" value="">카테고리</option>
											<option value="철학" class="userC">철학</option>
											<option value="종교" class="userC">종교</option>
											<option value="사회과학" class="userC">사회과학</option>
											<option value="자연과학" class="userC">자연과학</option>
											<option value="기술과학" class="userC">기술과학</option>
											<option value="예술" class="userC">예술</option>
											<option value="언어" class="userC">언어</option>
											<option value="문학" class="userC">문학</option>
											<option value="역사" class="userC">역사</option>
										</select>
									</div>
									<!-- 모달 본문 내용 -->
									<div class="modal-body">
										<div class="card mb-lg-32pt bg-white">
											<div class="table-bookponsive"
												 data-toggle="lists"
												 data-lists-sort-by="js-lists-values-date"
												 data-lists-sort-desc="true"
												 data-lists-values='["js-lists-values-name", "js-lists-values-company", "js-lists-values-phone", "js-lists-values-date"]'>
												
												<table class="table mb-0 thead-border-top-0">
													<thead>
														<tr>
															<td></td>
															<td>1순위</td>
															<td>2순위</td>
															<td>3순위</td>
														</tr>
													</thead>
													<tbody id="RecomResult">
														<!-- 추천데이터 결과 들어오는곳 -->
													</tbody>
												</table>
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" id="btnRecom" class="btn btn-secondary bg-primary btnCo" onclick="bookAiList()">추천받기</button>
										<button type="button" id="btnClose" class="btn btn-secondary btnCo" data-dismiss="modal">Close</button>
									</div>
                               </div>
                           </div>
                       </div>
                   </div>	                           			
                 `
                 },
         	];
	        

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
	</script>
	<script type="module"
		src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule=""
		src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons/ionicons.js"></script>
	<!-- Google Analytics -->
	<script>
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

		
		$("#savePortlet").on("click", function(){
			console.log("여기",advanced);
		    var grid = document.querySelector('#advanced-grid');
		    let grids = $(grid).find(".grid-stack-item");
		    var dataToSend = [];
		    for(var g of grids){
		        var gg = $(g)['0'].gridstackNode;
		        dataToSend.push({
		            content: gg.content,
		            x: gg.x,
		            y: gg.y,
		            w: gg.w,
		            h: gg.h,
		            locked: gg.locked,
		            noMove: gg.noMove,
		            noResize: gg.noResize,
		            minW: gg.minW,
		            minH: gg.minH,
		            portState : gg.portState,
		        });
		    }
		    
		    var url = window.location.href;
		    // AJAX 요청 보내기
		    $.ajax({
		        type: "POST",
		        url: url,
		        contentType: "application/json",
		        data: JSON.stringify(dataToSend),
		        success: function(response) {
		            console.log("데이터 저장 성공:", response);
		            window.close();
		        },
		        error: function(xhr, status, error) {
		            console.error("데이터 저장 실패:", error);
		        }
		    });
		});

			
		
	</script>
	<!-- End Google Analytics -->
</body>

</html>