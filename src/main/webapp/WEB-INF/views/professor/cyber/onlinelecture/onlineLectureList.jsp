<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<style>
	.headText {
		font-size: 14px;
		letter-spacing: 3px;
	}
</style>
<div style="width:100%; background-color: #FFFFFF;" >
<div style="margin-left:10%; width:80%;">
	<h2>${contentTitle}</h2>
</div>
<div style="margin-left:10%; width:80%;" class="page-separator" ></div>
<div style="margin-left:10%; width:80%; background-color: #f0f0f0;" class="headText">
<p style="overflow-x: auto; white-space: pre-wrap; margin-left: 20px; margin-right: 20px;">
<br>
※온라인 강의 이용시 주의 사항※
<br>1. 동영상을 끝까지 시청하지 않는 경우 출석이 인정되지 않습니다.
<br>2. 한국 인재대학교에서 제공하는 컨텐츠를 블로그, 카페 내 각종 게시글을 통해 활용하거나, 상업적인 목적으로 제 3자에게 판매를 시도하거나 했을경우 (컨텐츠를 구매한 사람도 같이 불법 사용으로, 동일 처벌 대상이 되는점 유의바랍니다.)
<br>3.컨텐츠 이용 의외에 다른 목적으로 복제, 출판, p2p 경로 등을 통해 제 3자에게 제공하거나, 이를 시도하는 경우 (컨텐츠의 불법 복제와 유통행위에 대해서는 고발 시, 저작권법 136조 제1항에 의거 5년 이하의 징역이나 5천만원 이하의 벌금형에 처해지게 됩니다.)
<br>
</p>
</div>
<div style="margin-left:10%; width:80%;" class="page-separator"></div>
<div style="margin-left:10%; width:80%; display: flex; justify-content: flex-end; margin-right:10px; margin-top:10px; margin-bottom:10px;">
<select id="custom-select" class="form-control custom-select" style=" border: 1px solid #ced4da; width:10%;">
	<option>제목</option>
	<option>내용</option>
	<option>작성자</option>
</select>
<input style="margin-left:5px; margin-right:5px; border: 1px solid #ced4da;">
<button class="btn btn-secondary">검색</button>
</div>
<div style="margin-left:10%; width:80%;">
<table class="table mb-0 thead-border-top-0 table-nowrap" style="margin-top:5px;">
	<thead>
		<tr style="text-align: center;">

			<th style="width: 50px;"><a href="javascript:void(0)"
				class="sort" data-sort="js-lists-values-department">번호</a></th>

			<th><a href="javascript:void(0)" class="sort"
				data-sort="js-lists-values-name">제목</a></th>

			<th style="width: 50px;"><a href="javascript:void(0)"
				class="sort" data-sort="js-lists-values-status">작성자</a></th>

			<th style="width: 50px;"><a href="javascript:void(0)"
				class="sort" data-sort="js-lists-values-type">등록일</a></th>

<!-- 			<th style="width: 50px;"><a href="javascript:void(0)" -->
<!-- 				class="sort" data-sort="js-lists-values-phone">조회수</a></th> -->
		</tr>
	</thead>
		<c:forEach items="${list}" var="l">
	<tbody class="list" id="employees">
		<tr>
			<td >
				${l.rnum}
			</td>
			<td>
				<div class="media flex-nowrap align-items-center"
					style="white-space: nowrap;">
					<div class="media-body">

						<div class="d-flex align-items-center">
							<div class="flex d-flex flex-column" style = "text-align: center;">
								<p class="mb-0">
									<strong class="js-lists-values-name"><a href="${pageContext.request.contextPath}/professor/cyber/onlinelecture/onLineLectureDetail?lecoCode=${l.lecoCode}" >${l.lecoTitle}</a></strong>
									
								</p>
							</div>

						</div>

					</div>
				</div>

			</td>

			

			<td>
				<div class="d-flex flex-column">
					<small class="js-lists-values-status text-50 mb-4pt">${l.memName}</small>
				</div>
			</td>

			<td><small class="js-lists-values-type text-50">${l.lecoDate}</small> <!-- 여기에 넣어야됌 -->
			</td>

<%-- 			<td><small class="js-lists-values-phone text-50">${l.cmntCount}</small> --%>
<!-- 			</td> -->
			<td style="text-align:center;">

<!-- 				<div class="media flex-nowrap align-items-center" -->
<!-- 					style="white-space: nowrap;"> -->
<!-- 					<div class="media-body"> -->
<!-- 						<div class="d-flex flex-column"> -->
<!-- 							<div class="d-flex align-items-center ml-24pt"> -->
<%-- 								<c:if test="${not empty l.gfNo}"> --%>
<!-- 									<i class="material-icons text-20 icon-16pt">link</i>  -->
<%-- 								</c:if> --%>
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->

			</td>
<!-- 			<td class="text-right"><a href="" class="text-50"><i -->
<!-- 					class="material-icons">more_vert</i></a></td> -->
		</tr>
	</tbody>
		</c:forEach>
</table>
</div>
<div id="goToForm" style="margin-left:10%; width:80%; display: flex; justify-content: flex-end; margin-right:10px; margin-top:10px; margin-bottom:10px;">
	<button class="btn btn-primary" >작성하기</button>
</div>
</div>
<script>
$('#goToForm').on('click',function(){
	window.location.href = 'http://localhost/lcms/professor/cyber/onlinelecture/${lecCode}/onlineLectureForm';

});



</script>
