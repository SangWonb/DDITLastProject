<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="modal fade" id="clubRecomModal" tabindex="-1"
	aria-labelledby="clubRecomModal" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" style="width: 800px; height: 650px;">
			<form method="POST" id="recomForm">

				<div
					style="margin-top: 10px; display: flex; justify-content: flex-end; align-items: flex-start; position: relative;">
					<span style="font-weight: bold; font-size: 20px;"> ⊂よ신의
						㈄ㅏ음ㅇㅔ 쏙 들 동ㅇㅏzl를 찾ㅇト줄つㅔ요~ <img
						src='<c:url value="/resources/images/kce/요정.jpg" />' width="200"
						height="220" style="margin-top: 0;">
					</span>
					<button type="button" id="clubRecomCloseBtn"
						style="position: absolute; top: 0; right: 0; outline: none; box-shadow: none; background-color: rgba(255, 255, 255, 0); border: none; color: black; width: 50px; margin-top: 0;"
						class="btn btn-accent"
						onclick="$('#clubRecomModal').modal('hide');">
						<i class="material-icons">close</i>
					</button>
				</div>

				<div id="changeResult" class="d-flex justify-content-center">
					<table>
						<tr style="padding-bottom: 30px; display: block;">
							<th style="padding-right: 10px;"><img
								src='<c:url value="/resources/images/kce/별.jpg" />' width="30"
								height="30"></th>
							<td style="padding-right: 50px;"><label class="form-label"
								for="custom-select"> MBTI</label></td>
							<td><select id=mbtiSelect required name="mbti"
								class="form-control custom-select" style="width: 350px;">
									<option selected="selected" disabled>MBTI</option>
									<option value="ISFP">ISFP</option>
									<option value="ISFJ">ISFJ</option>
									<option value="ISTP">ISTP</option>
									<option value="ISTJ">ISTJ</option>
									<option value="INFP">INFP</option>
									<option value="INFJ">INFJ</option>
									<option value="INTP">INTP</option>
									<option value="INTJ">INTJ</option>
									<option value="ESFP">ESFP</option>
									<option value="ESFJ">ESFJ</option>
									<option value="ESTP">ESTP</option>
									<option value="ESTJ">ESTJ</option>
									<option value="ENFP">ENFP</option>
									<option value="ENFJ">ENFJ</option>
									<option value="ENTP">ENTP</option>
									<option value="ENTJ">ENTJ</option>
							</select></td>
						</tr>
						<tr style="padding-bottom: 30px; display: block;">
							<th style="padding-right: 10px;"><img
								src='<c:url value="/resources/images/kce/별.jpg" />' width="30"
								height="30"></th>
							<th style="padding-right: 65px;">성별</th>
							<td><select id=sexSelect name="sex" required
								class="form-control custom-select" style="width: 350px;">
									<option disabled selected="">성별</option>
									<option value="F">여자</option>
									<option value="M">남자</option>
							</select></td>
						</tr>
						<tr style="padding-bottom: 20px; display: block;">
							<th style="padding-right: 10px;"><img
								src='<c:url value="/resources/images/kce/별.jpg" />' width="30"
								height="30"></th>
							<th style="padding-right: 40px;">선호과목</th>
							<td><select id=subSelect name="sub" required
								class="form-control custom-select" style="width: 350px;">
									<option disabled selected>선호과목</option>
									<option value="국">국어</option>
									<option value="영">영어</option>
									<option value="수">수학</option>
									<option value="사">사회</option>
									<option value="과">과학</option>
									<option value="음">음악</option>
									<option value="미">미술</option>
									<option value="체">체육</option>
							</select></td>
						</tr>
					</table>
				</div>
				
				<div class="d-flex justify-content-center" class="bg-white">
					<a href="#" class="bg-white" id="submitForm">
						<img src='<c:url value="/resources/images/kce/찾아줘.jpg" />'
						width="160" height="160">
					</a> <a href="#" class="bg-white"
						id="resetFormBtn"> <img
						src='<c:url value="/resources/images/kce/다시.jpg" />' width="160"
						height="160">
					</a> <a href="<c:url value='/student/info/club/clubJoin' />"
						style="border: none; margin-left: 20px;" class="bg-white"> <img
						src='<c:url value="/resources/images/kce/바로가기.jpg" />' width="150"
						height="150">
					</a>
				</div>
			</form>
		</div>
	</div>
</div>
