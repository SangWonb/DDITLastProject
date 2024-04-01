<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<style>
	.text {
		text-align: center;
	}
	.bodyText {
		text-align: left;
	}
	.btnAl {
		display: block;
	    margin: 0 auto;
	    text-align: center; /* 가운데 정렬 */
	}
</style>
<div class="form">
	<form id="resUpForm" method="post" action="lcms/student/careerup/employment/coverletter/coverLetterDetailList" style="display none;">
		<div class="coverView">
			<div class="container mt-5 bg-white">
			    <table class="table" id="table">
				    <thead>
				        <tr>
				            <td colspan="2" class="text">자기소개서</td>
				        </tr>
				    </thead>
				    <tbody>
						<c:forEach var="cover" items="${coverList}">
						        <tr>
						            <td class="bodyText">
									    <input type="text" class="form-control" id="cldTitle" name="cldTitle" value="${cover.cldTitle}">
									</td>
						        </tr>
						        <tr>
						            <td class="bodyText">
						            	<textarea class="form-control" rows="4" cols="50" id="cldContent" name="cldContent">${cover.cldContent}</textarea>
						            </td>
						        </tr>
						</c:forEach>
				    </tbody>
				</table>
			</div>
			<div class="btnAl">
				<button type="submit" class="btn btn-primary btnUp" id="btnUp" data-cover-code="${cover.clNo}" action="/lcms/student/careerup/employment/coverletter/updateCover">수정하기</button>
			</div>
		</div>
	</form>
</div>

<script src='<c:url value="/resources/js/coverLetterDetailList.js" />'></script>