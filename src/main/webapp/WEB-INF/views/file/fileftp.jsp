<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<div style="border: solid 1px black; background-color: pink;">
<h2>다운로드/삭제</h2>
	<div class="row mt-3">
		<div class="col-6">
			<select id="singleSel" class="form-select">
			  	<option selected value>파일선택</option>
			 	<c:forEach items="${fileList }" var="file">
			 		<option value="${file.fileNo }">${file.fileNm }</option>
			 	</c:forEach>
			</select>
		</div>
		<div class="col-2">
			<a class="btn btn-primary downloadBtn" href="${pageContext.request.contextPath}/fileftp/single" 
				data-target="#singleSel" data-role="single" onclick="singleFileDownload(event);">single download</a>
		</div>
		<div class="col-2">
			<a class="btn btn-primary deleteBtn" href="${pageContext.request.contextPath}/fileftp/single/delete" 
				data-target="#singleSel" data-role="single" onclick="singleFileDelete(event);">single delete</a>
		</div>
	</div>
	<br/><br/>
	<div class="row mt-3">
		<div class="col-6">
			<select id="multiSel" class="form-select" size="10" multiple>
			 	<c:forEach items="${fileList }" var="file">
			 		<option value="${file.fileNo }">${file.fileNm }</option>
			 	</c:forEach>
			</select>
		</div>
		<div class="col-2">
			<a class="btn btn-primary downloadBtn" href="${pageContext.request.contextPath}/fileftp/multiple" 
				 data-target="#multiSel" data-role="multiple" onclick="multipleFileDownload(event);">multiple download</a>
		</div>
		<div class="col-2">
			<a class="btn btn-primary deleteBtn" href="${pageContext.request.contextPath}/fileftp/multiple/delete" 
				 data-target="#multiSel" data-role="multiple" onclick="multipleFileDelete(event);">multiple delete</a>
		</div>
	</div>
</div>
<div style="border: solid 1px black; background-color: skyblue;">
<h2>업로드</h2> 
<form method="post" enctype="multipart/form-data" action="fileftp/multiple/upload">
    <table>
        <tr>
            <td>
                <input type="file" name="files" multiple/>
            </td>
            <td>
                <input type="submit" value="업로드" />
            </td>
        </tr>
    </table>
</form>
</div>
<script src="${pageContext.request.contextPath }/resources/js/app/file/fileView.js"></script>