<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<form:form id="popupEdit" method="post" enctype="multipart/form-data" modelAttribute="popup">
 <table class="table" id="editTable">
    <tbody>
        <tr style="display: none;">
            <td>
            <form:input type="text" class="form-control" id="popupCode" path="popupCode"/>
            <form:input type="text" class="form-control" id="gfNo" path="gfNo"/>
            </td>
        </tr>
        <tr>
            <th scope="row">제목</th>
            <td>
            <form:input type="text" class="form-control" id="popupTitle" path="popupTitle"/>
            </td>
        </tr>
        <tr>
            <th scope="row">기간</th>
   
            <td>
            <form:input type="date" class="form-control" id="popupPeriod" path="popupPeriod"/>
            </td>
        </tr>
        <tr>
        <td>
        <input type="file" class="form-control-file" id="popFiles" name="popFiles" />
        <small id="fileHelp" class="form-text text-muted">파일을 선택하지 않으면 기존의 파일도 삭제됩니다.</small>
         <c:forEach items="${popup.fileList}" var="file">
         	기존에 선택된 파일 : 
          	<a href="#" data-gf-no="${file.gfNo}" data-file-no="${file.fileNo}" class="fileObj">
          	${file.fileNm }
          	</a>
          </c:forEach>
        <small id="fileHelp" class="form-text text-muted"></small>
        </td>
        </tr>
    </tbody>
</table>
	<div class="col-sm-10">
		<div class="btn-group">
			<button type="submit" id="EditFormBtn" class="btn btn-primary">수정하기</button>
			<button type="button" id="delBtn" class="btn btn-danger">삭제하기</button>
		</div>
	</div>
</form:form>