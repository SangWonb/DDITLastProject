<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<hr>
<div id="departmentEdit" class="bg-white" style="padding: 20px;">
<h3>공지사항 수정</h3>
<form id="noticeEditData" action="" method="POST" enctype="multipart/form-data">
    <hr/>
    <div class="form-group">
    	<select class="form-control" name="deptCode" id="deptCode" required="required" data-select-value="${notice.deptCode }">
                <option value>전공선택</option>
                <c:forEach items="${deptList }" var="dept">
	                <option value="${dept.deptCode }">${dept.deptName }</option>
                </c:forEach>
           </select>
    </div>
    <div class="form-group" style="display: none;">
        <input type="text" class="form-control" id="gfNo" name="gfNo" value="${notice.gfNo}" readonly="readonly" />
    </div>
    <div class="form-group">
        <label for="cmntCode">게시물 코드</label>
        <input type="text" class="form-control" id="cmntCode" name="cmntCode" value="${notice.cmntCode}" readonly="readonly" />
    </div>
    <div class="form-group">
        <label for="cmntTitle">제목</label>
        <input type="text" class="form-control" id="cmntTitle" name="cmntTitle" value="${notice.cmntTitle}" />
    </div>
    <div class="form-group">
        <label for="cmntContent">내용</label>
        <textarea class="form-control" id="cmntContent" name="cmntContent" rows="3">${notice.cmntContent}</textarea>
    </div>
   <div class="form-group">
        <label for="fileUpload">파일 업로드</label>
        <input type="file" class="form-control-file" id="coFiles" name="coFiles" />
        <small id="fileHelp" class="form-text text-muted">파일을 선택하지 않으면 기존의 파일도 삭제됩니다.</small>
        <c:forEach items="${notice.fileList}" var="file">
         	기존에 선택된 파일 : 
          	<a href="#" data-gf-no="${file.gfNo}" data-file-no="${file.fileNo}" class="fileObj">
          	${file.fileNm }
          	</a>
         </c:forEach>
    </div>
    <button type="submit" class="btn btn-primary" value="${notice.cmntCode}">저장</button>
    <button type="reset" class="btn btn-danger">취소</button>
</form>

</div>