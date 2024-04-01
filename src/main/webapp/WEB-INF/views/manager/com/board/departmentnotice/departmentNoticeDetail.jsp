<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<hr>
<div id="departmentDetail">
    <div class="container mt-5 bg-white" style="padding: 20px;">
        <table class="table">
            <tr>
                <th colspan="3" style="text-align: center;">${notice.cmntTitle}</th>
            </tr>
            <tr>
                <td>작성일: ${fn:substring(notice.cmntDate, 0, 10)}</td>
                <td>작성자: ${notice.memName}</td>
            </tr>
            <tr>
                <td>조회수: ${notice.cmntCount}</td>
               <td>첨부파일:
	                <c:forEach items="${notice.fileList}" var="file">
	                	<a href="#" data-gf-no="${file.gfNo}" data-file-no="${file.fileNo}" class="fileObj">
	                	${file.fileNm }
	                	</a>
	                </c:forEach>
                </td>
            </tr>
            <tr>
                <td colspan="3">${notice.cmntContent}</td>
            </tr>
            <tr>
                <td>
                	<button type="button" class="btn btn-primary" id="editFormBtn" value="${notice.cmntCode}">
					    수정하기
					</button>
                	<button type="button" class="btn btn-danger" id="delBtn" value="${notice.cmntCode}">
					    삭제하기
					</button>
                </td>
            </tr>
        </table>
    </div>
</div>