<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<hr>
<h3>신청 수정 양식</h3>
<form id="applEditForm" method="post">
  <table class="table bg-white" style="margin: 20px;">
    <tbody>
        <tr style="display: none;">
            <th scope="row">과목코드</th>
            <td>
     			<input type="text" class="form-control" id="subAppno" name="subAppno" value="${subject.subAppno}" readonly="readonly" style="display: none;"/>
            </td>
        </tr>
        <tr>
            <th scope="row">과목명</th>
            <td>
            <input type="text" class="form-control" id="subName" name="subName" value="${subject.subName}"/>
            </td>
        </tr>
        <tr>
            <th scope="row">학년</th>
            <td>
           	<select class="form-control" id="subSchyear" name="subSchyear" data-select-value="${subject.subSchyear }" >
           		<option value>선택해주십시오</option>
	            <option value="공통">공통</option>
	            <option value="1학년">1학년</option>
	            <option value="2학년">2학년</option>
	            <option value="3학년">3학년</option>
	            <option value="4학년">4학년</option>
	        </select>
            </td>
        </tr>
        <tr>
            <th scope="row">학기</th>
            <td>
            <select class="form-control" id="subSemester" name="subSemester" data-select-value="${subject.subSemester }">
            	<option value>선택해주십시오</option>
	            <option value="1학기">1학기</option>
	            <option value="2학기">2학기</option>
	            <option value="기타">기타</option>
	        </select>
            </td>
        </tr>
        <tr>
            <th scope="row">학과</th>
            <td>
            <select class="form-control" id="deptCode" name="deptCode" data-select-value="${subject.deptCode }">
	            <option value>전공선택</option>
                <c:forEach items="${deptList }" var="dept">
	                <option value="${dept.deptCode }" selected>${dept.deptName }</option>
                </c:forEach>
	        </select>
            </td>
        </tr>
        <tr>
            <th scope="row">전공/교양</th>
            <td>
            <select class="form-control" id="majorCultural" name="majorCultural" data-select-value="${subject.majorCultural }">
            	<option value>선택해주십시오</option>
	            <option value="전공">전공</option>
	            <option value="교양">교양</option>
	            <option value="기타">기타</option>
	        </select>
            </td>
        </tr>
        <tr>
            <th scope="row">필수/선택</th>
           <td>
            <select class="form-control" id="choiceRequire" name="choiceRequire" data-select-value="${subject.choiceRequire }">
            	<option value>선택해주십시오</option>
	            <option value="필수">필수</option>
	            <option value="선택">선택</option>
	        </select>
            </td>
        </tr>
        <tr>
            <th scope="row">이수학점</th>
            <td>
            <input type="number" class="form-control" id="subCredit" name="subCredit" value="${subject.subCredit}"/>
            </td>
        </tr>
        <tr>
            <th scope="row">교번</th>
            <td>
            <input type="text" class="form-control" id="pmemNo" name="pmemNo" value="${subject.pmemNo}" readonly="readonly"/>
            </td>
        </tr>
    </tbody>
</table>
	<div class="col-sm-10">
		<div class="btn-group">
			<button type="submit" id="editForm" class="btn btn-primary">수정하기</button>
			<button type="button" id="delBtn" class="btn btn-danger">삭제하기</button>
		</div>
	</div>
</form>