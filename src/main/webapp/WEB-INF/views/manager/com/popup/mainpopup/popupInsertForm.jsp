<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<form:form id="popupInsert" method="post" enctype="multipart/form-data" modelAttribute="popup">
 <table class="table" id="insertTable">
    <tbody>
        <tr>
            <th scope="row">제목</th>
            <td>
            <form:input type="text" class="form-control" id="popupTitle" path="popupTitle"/>
            </td>
        </tr>
        <tr>
            <th scope="row">종료일</th>
            <td>
            <form:input type="date" class="form-control" id="popupPeriod" path="popupPeriod"/>
            </td>
        </tr>
        <tr>
            <td>
		        <label for="fileUpload">파일 업로드</label>
		        <input type="file" class="form-control-file" id="popFiles" name="popFiles" />
		        <small id="fileHelp" class="form-text text-muted"></small>
            </td>
        </tr>
    </tbody>
</table>
	<div class="col-sm-10">
			<button type="submit" id="insertFormBtn" class="btn btn-primary">신청하기</button>
	</div>
</form:form>