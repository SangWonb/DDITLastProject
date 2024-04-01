<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

		<div class="container page__container">
				<div class="col d-flex" data-pg-role="searchUI" data-pg-target="#submitForm" >
                     <div class="col-1" style="margin-right: 50px;">
                        <form:select class="form-control" path="paging.simpleCondition.searchType" style="width: 100px;">
                           <form:option value="cmntAll" label="전체" selected="true"/>
                           <form:option value="cmntTitle" label="제목" />
                           <form:option value="cmntContent" label="내용" />
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

<div class="card dashboard-area-tabs p-relative o-hidden mb-lg-32pt"></div>
<div class="card-header p-0 nav">
    <div class="row no-gutters" role="tablist">
        <div class="col-auto dashboard-area-tabs__tab card-body d-flex flex-row align-items-center justify-content-start active">
            <span class="h2 mb-0 mr-3">1</span>
            <span class="flex d-flex flex-column">
                <strong class="card-title">학과 공지사항</strong>
                <small class="card-subtitle text-50"></small>
            </span>
        </div>
    </div>
</div>

<div class="table-responsive" data-toggle="lists"
    data-lists-sort-by="js-lists-values-date" data-lists-sort-desc="true"
    data-lists-values='["js-lists-values-lead", "js-lists-values-project", "js-lists-values-status", "js-lists-values-budget", "js-lists-values-date"]'>
    <table class="table mb-0 thead-border-top-0 table-nowrap">
        <thead>
            <tr>
                <th style="width: 18px;" class="pr-0">
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox"
                            class="custom-control-input js-toggle-check-all"
                            data-target="#projects" id="customCheckAll">
                    </div>
                </th>

                <th style="width: 150px;"><a href="javascript:void(0)"
                    class="sort" data-sort="js-lists-values-project">번호</a></th>

                <th><a href="javascript:void(0)" class="sort"
                    data-sort="js-lists-values-lead">제목</a></th>

                <th style="width: 48px;"><a href="javascript:void(0)"
                    class="sort" data-sort="js-lists-values-status">작성자</a></th>

                <th style="width: 48px;"><a href="javascript:void(0)"
                    class="sort" data-sort="js-lists-values-budget">등록일</a></th>

                <th style="width: 48px;"><a href="javascript:void(0)"
                    class="sort" data-sort="js-lists-values-date">조회수</a></th>
                <th style="width: 24px;"></th>
            </tr>
        </thead>
        <c:forEach items="${departmentNoticeList}" var="departmentNotice">
            <tbody class="list" id="projects">
                <tr>
                    <td class="pr-0">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox"
                                class="custom-control-input js-check-selected-row"
                                id="customCheck1_1">
                        </div>
                    </td>

                    <td>
                        <div class="media-body">
                            <div class="d-flex flex-column">
                                <small class="js-lists-values-project"><strong>${departmentNotice.rnum}</strong></small>
                            </div>
                        </div>
                    </td>

                    <td>
                        <div class="media-body">
                            <div class="d-flex align-items-center">
                                <div class="flex d-flex flex-column">
                                    <p class="mb-0">
                                        <a href="#" class="js-lists-values-lead btn-load-detail" data-notice-id="${departmentNotice.cmntCode}">${departmentNotice.cmntTitle}</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </td>

                    <td>
                        <div class="d-flex flex-column">
                            <small class="js-lists-values-status">${departmentNotice.memName}</small>
                        </div>
                    </td>

                    <td>
                        <div class="d-flex flex-column">
                            <small class="js-lists-values-budget"><strong>${fn:substring(departmentNotice.cmntDate, 0, 10)}</strong></small>
                        </div>
                    </td>

                    <td>
                        <div class="d-flex flex-column">
                            <small class="js-lists-values-date"><strong>${departmentNotice.cmntCount}</strong></small>
                        </div>
                    </td>
                </tr>
            </tbody>
        </c:forEach>
    </table>
    ${pagingHTML }
</div>

<div id="noticeDetail"></div> <!-- 세부 내용을 표시할 영역 -->

<div class="notice-detail" style="display: none;">
</div>

<script src="<c:url value='/resources/js/paging.js'/>"></script>
<script>
$(document).ready(function() {
    $('.btn-load-detail').click(function(event) {
        event.preventDefault();

        $(this).next('.notice-detail').toggle();

        var noticeId = $(this).attr('data-notice-id');
        loadNoticeDetail(noticeId);
    });
});

var cPath = $('body').data('bodyCpath')

function loadNoticeDetail(noticeId) {
    $.ajax({
        type: 'GET',
        url: `\${cPath}/common/board/departmentnotice/departmentNoticeDetail/\${noticeId}`,
        success: function(response) {
            $('.notice-detail').html(response).toggle(); 
        },
        error: function(xhr, status, error) {
            console.error('AJAX request failed: ', status, error);
        }
    });
}
</script>
