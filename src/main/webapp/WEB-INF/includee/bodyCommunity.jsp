<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container page__container">
	<div class="d-flex flex-column flex-lg-row align-items-center">
		<div
			class="flex d-flex flex-column align-items-center align-items-lg-start mb-16pt mb-lg-0 text-center text-lg-left">
			<h1 class="h2 mb-8pt">커뮤니티</h1>
			<!-- 아코디언 메뉴 -->
			<div id="accordion" class="mt-4">

				<!-- 첫 번째 아코디언 메뉴 -->
				<div class="accordion-group">
					<div class="card">
						<div class="card-header" id="headingOne">
							<h5 class="mb-0">
								<button class="btn btn-link" data-toggle="collapse"
									data-target="#collapseOne" aria-expanded="false"
									aria-controls="collapseOne">공지사항</button>
							</h5>
						</div>

						<div id="collapseOne" class="collapse"
							aria-labelledby="headingOne" data-parent="#accordion">
							<div class="card-body">
								<a
									href="<c:url value='/common/board/academicnotice/academicNotice'/>">학교공지사항</a>
							</div>
							<div class="card-body">
								<a
									href="<c:url value='/common/board/departmentnotice/departmentNoticeList'/>">학과공지사항</a>
							</div>
						</div>
						<div class="card-header" id="headingFour">
							<h5 class="mb-0">
								<div class="btn btn-link collapsed" data-toggle="collapse"
									data-target="#collapseFour" aria-expanded="false"
									aria-controls="collapseFour">
									<a href='<c:url value="/common/board/qna/qnaList"/>'
										style="text-decoration: none; color: inherit;">Q&A</a>
								</div>
							</h5>
						</div>

						<div class="card-header" id="headingFour">
							<h5 class="mb-0">
								<div class="btn btn-link collapsed" data-toggle="collapse"
									data-target="#collapseFour" aria-expanded="false"
									aria-controls="collapseFour">
									<a href='<c:url value="/common/board/complaint/complaintList"/>'
										style="text-decoration: none; color: inherit;">민원/오류접수</a>
								</div>
							</h5>
						</div>
						<div class="card-header" id="headingFour">
							<h5 class="mb-0">
								<div class="btn btn-link collapsed" data-toggle="collapse"
									data-target="#collapseFour" aria-expanded="false"
									aria-controls="collapseFour">
									<a href='<c:url value="/common/board/freeboard/freeBoardList"/>'>
										자유게시판</a>
									</div>
							</h5>
						</div>
						<div class="card-header" id="headingFive">
							<h5 class="mb-0">
								<div class="btn btn-link collapsed" data-toggle="collapse"
									data-target="#collapseFive" aria-expanded="false"
									aria-controls="collapseFive">
									<a href='<c:url value="/common/board/clubboard/clubBoardList"/>'>
										동아리 </a>
								</div>

							</h5>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>
