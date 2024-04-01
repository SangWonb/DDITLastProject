<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
	.headText {
		font-size: 14px;
		letter-spacing: 3px;
	}
</style>
<div style="width:100%; background-color: #FFFFFF;" >
<div style="margin-left:10%; width:80%;">
</div>
<div style="margin-left:10%; width:80%;" class="page-separator" ></div>
<div style="margin-left:10%; width:80%; background-color: #f0f0f0;" class="headText">
<p style="overflow-x: auto; white-space: pre-wrap; margin-left: 20px; margin-right: 20px;">
<br>
※ 강의 자료실에 등록되어 있는 자료는 모두 지식재산권의 법적 효력을 가지고 있음을 고지합니다.
<br>
</p>
</div>

<div style="margin-left:10%; width:80%;" class="page-separator"></div>
<div style="margin-left:10%; width:80%; display: flex; justify-content: flex-end; margin-right:10px; margin-top:10px; margin-bottom:10px;">
</div>
 		<div class="container page__container">
				<div class="col d-flex" data-pg-role="searchUI" data-pg-target="#submitForm" >
                     <div class="col-1" style="margin-right: 50px;">
                        <form:select class="form-control" path="paging.simpleCondition.searchType" style="width: 100px;">
                           <form:option value="all" label="전체" selected="true"/>
                           <form:option value="lecDataname" label="제목" />
                           <form:option value="lecDatacontent" label="내용" />
                        </form:select>
                     </div>

					<div class="col-3 d-flex align-items-start">
                        <form:input type="search" class="form-control" path="paging.simpleCondition.searchWord" aria-label="Search"  style="margin-right: 10px;"/>
                        <input type="button"  class="btn btn-outline-primary" data-pg-role="searchBtn" value="검색"/>
                     </div>
				</div>
			<form:form id="submitForm" action="" modelAttribute="paging" method="get">
	           <input type='hidden' name="page" />
	           <form:input type='hidden' path="simpleCondition.searchType"/>
	           <form:input type='hidden' path="simpleCondition.searchWord"/>
        </form:form> 
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
				class="sort" data-sort="js-lists-values-type">등록일</a></th>
				
			<th style="width: 50px;"><a href="javascript:void(0)"
				class="sort" data-sort="js-lists-values-status">작성자</a></th>

		</tr>
	</thead>
		<c:forEach items="${lectureDataList}" var="data" varStatus="loop">
	<tbody class="list" id="employees">
		<tr>
			<td >
				${loop.count}
			</td>
			<td>
				<div class="media flex-nowrap align-items-center"
					style="white-space: nowrap;">
					<div class="media-body">

						<div class="d-flex align-items-center">
							<div class="flex d-flex flex-column" style = "text-align: center;">
								<p class="mb-0">
									<strong class="js-lists-values-name"><a href="${pageContext.request.contextPath}/professor/cyber/lectureDataDetail?lecDatano=${data.lecDatano}">${data.lecDataname}</a></strong>
								</p>
							</div>
						</div>
					</div>
				</div>
			</td>

			<td>
				<div class="d-flex flex-column">
					<small class="js-lists-values-status">${data.lecDate}</small>
				</div>
			</td>

			<td><small class="js-lists-values-type text-50">${data.memName}</small>
			</td>

			<td style="text-align:center;">
			</td>
		</tr>
	</tbody>
		</c:forEach>
</table>
${pagingHTML}
</div>
<div id="goToForm" style="margin-left:10%; width:80%; display: flex; justify-content: flex-end; margin-right:10px; margin-top:10px; margin-bottom:10px;">
	<button class="btn btn-primary" >작성하기</button>
</div>
</div>
<script src="<c:url value='/resources/js/paging.js'/>"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
var cPath = $('body').data('bodyCpath');
$('#goToForm').on('click',function(){
	window.location.href = 'http://localhost/lcms/professor/cyber/${lecCode}/lectureDataInsertForm';
});
</script>
