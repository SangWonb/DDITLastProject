<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<form id="decisionEditForm" method="post">
  <table class="table">
    <tbody>
        <tr style="display: none;">
            <td>
            <input type="text" class="form-control" id="arcNo" name="arcNo" value="${record.arcNo }" readonly="readonly"/>
            <input type="text" class="form-control" id="acCode" name="acCode" value="${record.acCode }" readonly="readonly"/>
            </td>
        </tr>
        <tr>
            <th scope="row">학번</th>
            <td>
            <input type="text" class="form-control" id="memNo" name="memNo" value="${record.memNo }" readonly="readonly"/>
            </td>
        </tr>
        <tr>
            <th scope="row">학생명</th>
            <td>
            <input class="form-control" id="memName" name="memName" value="${record.memName }" readonly="readonly">
            </td>
        </tr>
        <tr>
            <th scope="row">신청분류명</th>
            <td>
            <input type="text" class="form-control" id="acName" name="acName" value="${record.acaCla.acName }" readonly="readonly"/>
            </td>
        </tr>
        <tr>
            <th scope="row">신청사유</th>
            <td>
            <input type="text" class="form-control" id="arcReason" name="arcReason" value="${record.arcReason }" readonly="readonly"/>
            </td>
        </tr>
        <tr>
            <th scope="row">기간</th>
            <td>
            <input type="text" class="form-control" id="memName" name="memName" value="${record.arcStart} ~ ${record.arcEnd}" readonly="readonly"/>
            </td>
        </tr>
        <tr>
            <th scope="row">신청날짜</th>
            <td>
            <input type="text" class="form-control" id="arcDate" name="arcDate" value="${record.arcDate }" readonly="readonly"/>
            </td>
        </tr>
        <tr>
            <th scope="row">첨부파일</th>
            <c:forEach items="${record.fileList}" var="file">
            	<a href="#" data-gf-no="${file.gfNo}" data-file-no="${file.fileNo}" class="fileObj">
            	${file.fileNm }
            	</a>
            </c:forEach>
        </tr>
        
    </tbody>
</table>
	<div class="row">
    <div class="col-sm-2"> <!-- 반려 사유 셀렉트 박스 -->
        <select id="rejectReason" name="rejectReason" class="form-control">
            <option value="">반려사유 선택</option>
    <c:forEach items="${rejectList}" var="reject">
            <option value="${reject.rejectCode }">${reject.rejectReason }</option>
       </c:forEach>
        </select>
    </div>
    <div class="col-sm-6"> <!-- 승인, 반려 버튼 그룹 -->
        <div class="btn-group">
            <button type="submit" id="statusSelect" class="btn btn-primary">승인</button>
            <button type="submit" id="rejectSelect" class="btn btn-danger">반려</button>
        </div>
    </div>
</div>
</form>