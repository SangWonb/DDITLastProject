<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

    <div class="container mt-5">
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
        </table>
    </div>