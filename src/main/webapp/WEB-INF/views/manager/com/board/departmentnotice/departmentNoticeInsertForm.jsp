<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<hr>
<div id="departmentInsert" class="bg-white" style="padding: 20px;">
<h3>공지사항 작성</h3>
<form id="noticeInsertData" action="" method="POST" enctype="multipart/form-data">
<hr/>
    <div class="form-group">
    	<select class="form-control" name="deptCode" id="deptCode" required="required">
                <option value>전공선택</option>
                <c:forEach items="${deptList }" var="dept">
	                <option value="${dept.deptCode }">${dept.deptName }</option>
                </c:forEach>
           </select>
    </div>
    <div class="form-group">
        <label for="cmntTitle">제목</label>
        <input type="text" class="form-control" id="cmntTitle" name="cmntTitle">
    </div>
    <div class="form-group">
        <label for="cmntContent">내용</label>
        <textarea class="form-control" id="cmntContent" name="cmntContent" rows="3"></textarea>
    </div>
    <div class="form-group">
        <label for="memName">작성자</label>
        <input type="text" class="form-control" id="memName" name="memName" value="${memName}" readonly="readonly">
    </div>
    <div class="form-group">
        <label for="fileUpload">파일 업로드</label>
        <input type="file" class="form-control-file" id="coFiles" name="coFiles" />
        <small id="fileHelp" class="form-text text-muted"></small>
    </div>
	<div class="form-group">
	    <input type="hidden" class="form-control" id="memNo" name="memNo" value="${memName}" readonly>
	</div>
    <button type="submit" class="btn btn-primary">신청</button>
</form>
</div>