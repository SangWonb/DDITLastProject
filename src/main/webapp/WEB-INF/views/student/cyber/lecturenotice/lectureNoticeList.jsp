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
강의 공지사항 게시판은 교수만 작성할 수 있습니다.

※ 개인정보를 위조 또는 도용, 외부에 유출한 자는 관련법에 의거 법적 처벌을 받을 수 있으며, 게시 글에 포함된 개인정보 또한 책임은 게시자에게 있으며 정보 노출을 원하지 않으실 경우에는 수정 및 삭제하시기 바랍니다. (개인정보보호법 제71조에 의거 개인정보를 유출한 자는 5년 이하의 징역 또는 5천만원 이하의 벌금이 부과될 수 있습니다.)
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
				class="sort" data-sort="js-lists-values-department" ">번호</a></th>

			<th><a href="javascript:void(0)" class="sort"
				data-sort="js-lists-values-name" ">제목</a></th>

			<th style="width: 50px;"><a href="javascript:void(0)"
				class="sort" data-sort="js-lists-values-status" ">작성자</a></th>

			<th style="width: 50px;"><a href="javascript:void(0)"
				class="sort" data-sort="js-lists-values-type" ">등록일</a></th>

			<th style="width: 50px;"><a href="javascript:void(0)"
				class="sort" data-sort="js-lists-values-phone" ">조회수</a></th>

<!-- 			<th style="width: 10px;"><a href="javascript:void(0)" -->
<!-- 				class="sort" data-sort="js-lists-values-department">첨부</a></th> -->
		</tr>
	</thead>
		<c:forEach items="${list}" var="l">
	<tbody class="list" id="employees">
		<tr>
			<td style="text-align: center;">
				${l.rnum}
			</td>
			<td>
				<div class="media flex-nowrap align-items-center"
					style="white-space: nowrap;">
					<div class="media-body">

						<div class="d-flex align-items-center">
							<div class="flex d-flex flex-column" style = "text-align: center;">
								<p class="mb-0">
									<strong class="js-lists-values-name"><a href="${pageContext.request.contextPath}/student/cyber/lecturenotice/lectureNoticeDetail?lecannNo=${l.lecannNo}" >${l.lecannTitle}</a></strong>
									
								</p>
							</div>

						</div>

					</div>
				</div>

			</td>

			

			<td>
				<div class="d-flex flex-column">
					<small class="js-lists-values-status text-50 mb-4pt" ">${l.memName}</small>
				</div>
			</td>

			<td><small class="js-lists-values-type text-50" ">${l.lecannDate}</small>
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

<!-- 			</td> -->
<!-- 			<td class="text-right"><a href="" class="text-50"><i -->
<!-- 					class="material-icons">more_vert</i></a></td> -->
		</tr>
	</tbody>
		</c:forEach>
</table>
</div>
</div>
