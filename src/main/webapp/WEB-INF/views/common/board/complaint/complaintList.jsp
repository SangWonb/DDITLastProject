<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div style="width: 100%; background-color: #FFFFFF;">
	<div style="margin-left: 10%; width: 80%;">
		<h2>${contentTitle}</h2>
	</div>
	<div style="margin-left: 10%; width: 80%;" class="page-separator"></div>
	<div style="margin-left: 10%; width: 80%; background-color: #f0f0f0;">
		<p style="overflow-x: auto; white-space: pre-wrap; margin-left: 20px; margin-right: 20px;">
			<br> 게시판에 작성되는 본문 내용 및 첨부파일 내에 성명, 주민등록번호, 핸드폰 번호, 이메일 등 2개 이상의 개인정보 작성 시 개인정보보호법 제2조제1호에 의거 개인정보에 해당되어 작성 및 등록을 제한하고 관리자에 의해 삭제 처리될 수 있습니다. 게시판 사용에 유의하시기 바랍니다. ※ 개인정보를 위조 또는 도용, 외부에 유출한 자는 관련법에 의거 법적 처벌을 받을 수 있으며, 게시 글에 포함된 개인정보 또한 책임은 게시자에게 있으며 정보 노출을 원하지 않으실 경우에는 수정 및 삭제하시기 바랍니다. (개인정보보호법 제71조에 의거 개인정보를 유출한 자는 5년 이하의 징역 또는 5천만원 이하의 벌금이 부과될 수 있습니다.) <br>
		</p>
	</div>
	<div style="margin-left: 10%; width: 80%;" class="page-separator"></div>
	<div
		style="margin-left: 10%; width: 80%; display: flex; justify-content: space-between; align-items: center; margin-right: 10px; margin-top: 10px; margin-bottom: 10px;"
		data-pg-role="searchUI" data-pg-target="#submitForm">
		<p>총 ${total}건 / 금일 ${today} 건</p>
		<div style="display: flex; align-items: center; width: 40%;">
			<form:select class="form-control"
				path="paging.simpleCondition.searchType" style="width: 100px;">
				<form:option value="cmntAll" label="전체" selected="true" />
				<form:option value="cmntTitle" label="제목" />
				<form:option value="cmntContent" label="내용" />
			</form:select>
			<form:input type="search" class="form-control"
				path="paging.simpleCondition.searchWord" aria-label="Search"
				style="margin-right: 10px;" />
			<input type="button" class="btn btn-outline-primary"
				data-pg-role="searchBtn" value="검색" />
		</div>
	</div>
	<form:form id="submitForm" action="" modelAttribute="paging"
		method="get">
		<input type='hidden' name="page" />
		<form:input type='hidden' path="simpleCondition.searchType" />
		<form:input type='hidden' path="simpleCondition.searchWord" />
	</form:form>
	<div style="margin-left: 10%; width: 80%;">
		<table class="table mb-0 thead-border-top-0 table-nowrap"
			style="margin-top: 5px;">
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

					<th style="width: 50px;"><a href="javascript:void(0)"
						class="sort" data-sort="js-lists-values-phone">조회수</a></th>

					<!-- 			<th style="width: 10px;"><a href="javascript:void(0)" -->
					<!-- 				class="sort" data-sort="js-lists-values-department">첨부</a></th> -->
				</tr>
			</thead>
			<c:forEach items="${list}" var="l">
				<tbody class="list" id="employees">
					<tr>
						<td>${l.rnum}</td>
						<td>
							<div class="media flex-nowrap align-items-center"
								style="white-space: nowrap;">
								<div class="media-body">

									<div class="d-flex align-items-center"
										style="text-align: center;">
										<div class="flex d-flex flex-column">
											<p class="mb-0">
												<c:if test="${l.level gt 1}">
													<c:forEach begin="2" end="${l.level}">
														&emsp;&emsp;
													</c:forEach>
                									re:
            									</c:if>
												<c:choose>
													<c:when test="${not empty l.password}">
														<i class="material-icons">lock</i>
														<strong class="js-lists-values-name js-secret-post"
															data-cmnt-code="${l.cmntCode}"
															data-pass-word="${l.password }">비밀글입니다.</strong>
													</c:when>
													<c:otherwise>
														<a
															href='<c:url value="/common/board/complaint/complaintDetail?cmntCode=${l.cmntCode}"/>'>
															<strong class="js-lists-values-name">${l.cmntTitle}</strong>
														</a>
													</c:otherwise>
												</c:choose>
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

						<td><small class="js-lists-values-type text-50">${l.cmntDate}</small>
						</td>

						<td style="text-align: center;"><small
							class="js-lists-values-phone text-50">${l.cmntCount}</small></td>
						<td style="text-align: center;">

							<div class="media flex-nowrap align-items-center"
								style="white-space: nowrap;">
								<div class="media-body">
									<div class="d-flex flex-column">
										<div class="d-flex align-items-center ml-24pt">
											<c:if test="${not empty l.gfNo}">
												<i class="material-icons text-20 icon-16pt">link</i>
											</c:if>
										</div>
									</div>
								</div>
							</div>

						</td>
						<!-- 			<td class="text-right"><a href="" class="text-50"><i -->
						<!-- 					class="material-icons">more_vert</i></a></td> -->
					</tr>

				</tbody>
			</c:forEach>
		</table>
		${pagingHTML }
	</div>
	<div id="goToForm"
		style="margin-left: 10%; width: 80%; display: flex; justify-content: flex-end; margin-right: 10px; margin-top: 10px; margin-bottom: 10px;">
		<button class="btn btn-primary">작성하기</button>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="<c:url value='/resources/js/paging.js'/>"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).on("click", ".js-secret-post", function() {
	   // 클릭된 요소에 대한 정보 가져오기
    var clickedElement = $(event.target);
    
    // 클릭된 요소의 데이터 속성에서 게시글 코드 가져오기
    var cmntCode = clickedElement.data("cmnt-code");
    
    // 클릭된 요소의 데이터 속성에서 비밀번호 가져오기
    var correctPassword = clickedElement.data("pass-word");  
    
    Swal.fire({
        title: '비밀번호 입력',
        input: 'password',
        inputAttributes: {
            autocapitalize: 'off'
        },
        showCancelButton: true,
        confirmButtonText: '확인',
        cancelButtonText: '취소',
        allowOutsideClick: false
    }).then((result) => {
        if (result.isConfirmed) {
            var inputPassword = result.value;
            if (inputPassword == correctPassword) {
                window.location.href = "${pageContext.request.contextPath}/common/board/complaint/complaintDetail?cmntCode=" + cmntCode;
            } else {
                Swal.fire(
                    '오류',
                    '비밀번호가 일치하지 않습니다.',
                    'error'
                )
            }
        }
    });
});






	$('#goToForm')
			.on(
					'click',
					function() {
						window.location.href = 'http://localhost/lcms/common/board/complaint/cpForm';
					});
</script>