<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    <form:form id="editData" modelAttribute="graduationCriteria" method="POST">
    <h5>${detail.deptName } 졸업요건</h5>
    <table class="table bg-white">
     	<tr style="display: none;">
            <td>
            <input type="text" class="form-control" id="grcrCode" name="grcrCode" value="${detail.grcrCode }"/>
            </td>
            <td>
            <input type="text" class="form-control" id="deptCode" name="deptCode" value="${detail.deptCode }"/>
            </td>
        </tr>
		<tr>
		    <th scope="row">졸업논문 여부</th>
		    <td>
			<form:select class="form-control" id="deptThesis" path="deptThesis" >
	            <form:option value="">졸업논문 여부</form:option>
	            <form:option value="Y">있음</form:option>
                <form:option value="N">없음</form:option>
	        </form:select>
		    </td>
		</tr>
		<tr>
		    <th scope="row">졸업시험 여부</th>
		    <td>
		    <form:select class="form-control" id="deptTest" path="deptTest" >
	            <form:option value="">졸업시험 여부</form:option>
	            <form:option value="Y">있음</form:option>
                <form:option value="N">없음</form:option>
	        </form:select>
		    </td>
		</tr>

        <tr>
            <th scope="row">영어시험 종류</th>
            <td>
			<form:select class="form-control" id="engCode" path="engCode" >
	            <form:option value="">영어시험종류 선택</form:option>
                <c:forEach items="${selectBoxEng }" var="eng">
	                <form:option value="${eng.engCode }">${eng.engName }</form:option>
                </c:forEach>
	        </form:select>
           </td>
        </tr>
        
        <tr>
            <th scope="row">전공필수 최소학점</th>
            <td>
			<form:input type="number" class="form-control" id="deptMrc" path="deptMrc" value="${detail.deptMrc }"/>
           </td>
        </tr>
        <tr>
            <th scope="row">전공선택 최소학점</th>
            <td>
			<form:input type="number" class="form-control" id="deptMoc" path="deptMoc" value="${detail.deptMoc }" />
           </td>
        </tr>
        <tr>
            <th scope="row">교양필수 최소학점</th>
            <td>
			<form:input type="number" class="form-control" id="deptCrc" path="deptCrc" value="${detail.deptCrc }" />
           </td>
        </tr>
        <tr>
            <th scope="row">교양필수 최소학점</th>
            <td>
			<form:input type="number" class="form-control" id="deptCoc" path="deptCoc" value="${detail.deptCoc }" />
           </td>
        </tr>
        </table>
        <button type="submit" id="editGraduation" class="btn btn-primary">수정하기</button>
    </form:form>
