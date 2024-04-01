<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<div class="container card" id="employmentProgramDetail">
	<table class="table">
		<tr>
			<th colspan="3" style="text-align: center; font-size: 1.5em;">${employProgram.emppgNm}</th>
		</tr>
		<tr>
			<td>신청시작일: ${employProgram.emppgStart}</td>
			<td>신청마감일: ${employProgram.emppgEnd}</td>
		</tr>
		<tr>
			<td>정원: ${employProgram.emppgLimit}</td>
			<td>기타: ${employProgram.emppgEtc}</td>
		</tr>
		<tr>
		</tr>
		<tr>
			<td colspan="3">${employProgram.emppgContent}</td>
		</tr>
		<tr>
			<td colspan="3" style="text-align: right;">
				<button class="btn btn-primary"
					onclick="employmentProgramAppl('${employProgram.emppgCode}')">신청하기</button>
			</td>
		</tr>
	</table>
</div>