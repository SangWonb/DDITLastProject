<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
.advancedDemo {
	margin-top: 20px;
}

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

/* 모달 크기 조정 */
.modal-dialog {
	max-width: 1000px; /* 모달의 최대 너비를 1000px로 설정 */
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

<main role="main" class="container-fluid movePort"
	style="padding-left: 0; padding-right: 0;">
	<section class="container-fluid advancedDemo">
		<div class="col-sm-12 col-md-10" style="padding-bottom: 25px;">
			<div class="container">
				<div id="advanced-grid1" class="grid-stack"></div>
			</div>
		</div>
	</section>
</main>

<script type="text/javascript">
   
   var userSirel = '${userSirel}'

      $(document).ready(function() {
           createDashboard();
           
           // "추천받기" 버튼 클릭 이벤트
           $(document).on("click", "#aiRecomBtn", function (event) {
              console.log("누름");
               $('#staticBackdrop').modal("show");
           });

           // "추천받기" 모달 내의 버튼 클릭 이벤트
           $(document).on("click", "#btnRecom", function (event) {
               var selectedValueC = $("#userChoice").val();
               console.log("선택한 값:", selectedValueC);
               if (!selectedValueC) {
                   alert("카테고리를 선택하세요.");
                   return;
               }
               
               $.ajax({
                  url: "<c:url value="/common/bookAiList" />",
                   method: "post",
                   data: {
                       bookCategory: selectedValueC
                   },
                   success: function (response) {
                       console.log(response.bookRecomVO);
                       var tableBody = $("#RecomResult");
                       var book = response.bookRecomVO;
                       tableBody.empty(); // 기존 결과 삭제
                       var row = "<tr>" +
                           "<td>" + book.bookCategory + "</td>" +
                           "<td>" + book.one + "</td>" +
                           "<td>" + book.two + "</td>" +
                           "<td>" + book.three + "</td>" +
                           "</tr>";
                       tableBody.append(row);
                   },
                   error: function (jqXHR, textStatus, errorThrown) {
                       console.log(textStatus, errorThrown);
                       alert("추천 도서를 불러오는 중 오류가 발생했습니다.");
                   }
               });
           });
       });
    
    function createDashboard() {
		var majorN = parseInt("${member.stuMnl}");
		var majorC = parseInt("${member.stuMcl}");
		var cnl = parseInt("${member.stuCnl}");
		var ccl = parseInt("${member.stuCcl}");
		var cnlString = String(cnl);
		var cclString = String(ccl);
		
       $.ajax({
           url: '${pageContext.request.contextPath }/common/mainPortletAjax',
           method: 'post',
           data : {"userSirel" : userSirel},
           dataType : "json",
           success: function (data) {
              var dataList = data.portletList;

              // 받아온 포틀릿 데이터를 사용하여 대시보드 생성
               var advanced = [];
              
               if (dataList.length > 0) {
                  
                  for (var i = 0; i < dataList.length; i++) {
                     
                     var portlet = dataList[i];

                     console.log(portlet)
                     
                      advanced.push({
                            x: portlet.x,
                            y: portlet.y,
                            w: portlet.w,
                            h: portlet.h,
                            content: portlet.content
                        });
                  }
               } 
               
               else {
                  
                  advanced = [
                	  {
                	        x: 0,
                	        y: 0,
                	        w: 8,
                	        h: 4,
                	        portState: 1,
                	        content:`<div class="potMainT" style="background-color: #3498db; color: white; padding: 10px; border-radius: 5px;">취업교육</div>
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
                              <button type="button" class="btn btn-white">
                                   more
                               </button>                                
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
                            </table>     
                            </div>
                         `
                        },
                        {
                           x : 0,
                           y : 4,
                           w : 4,
                           h : 4,
                           portState : 3,
                           content : `<div class="potMainT" style="background-color: #3498db; color: white; padding: 10px; border-radius: 5px;">성적조회</div>
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
//                         	    <div style="text-align: center; margin-top: 10px; color: red;">총 이수 학점: 63</div>
                        	</div>`

                        },
                        {
                            x : 4,
                            y : 4,
                            w : 4,
                            h : 4,
                            portState : 4,
                            content : `<div class="potMainT" style="background-color: #3498db; color: white; padding: 10px; border-radius: 5px;">인기도서추천</div>
                                <div class="table-responsive">
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
                                </div>
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
               }
               
               // 대시보드 생성
               var advGrid = GridStack.init({
                   margin: 5,
                   disableOneColumnMode: true,
                   acceptWidgets: true,
                   removable: '#trash',
                   removeTimeout: 100
               }, '#advanced-grid1').load(advanced);

               GridStack.setupDragIn('.newWidget', {
                   appendTo: 'body',
                   helper: 'clone'
               });

               hljs.initHighlightingOnLoad();
              
           },
           error: function (data, status, err) {
              alert("에러")
           }
       });
       
    }
    function openNewPage(event) {
        event.preventDefault(); 
        var url = event.target.href;
        window.open(url, '_blank');
    }
   </script>
