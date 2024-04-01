<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<hr>
<div id="applInsertForm" style="margin: 20px;">
<h3>신청 양식</h3>
<div class="tab-content bg-white" style="margin: 20px;">
    <div id="ongoing" class="tab-pane fade show active">
        <div class="table-responsive">
         <form id="applInsertData" method="post">
              <table class="table">
    <tbody>
        <tr>
            <th scope="row">과목명</th>
            <td>
            <input type="text" class="form-control" id="subName" name="subName" value="${subject.subName}"/>
            </td>
        </tr>
        <tr>
            <th scope="row">학년</th>
            <td>
           	<select class="form-control" id="subSchyear" name="subSchyear">
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
            <select class="form-control" id="subSemester" name="subSemester">
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
            <select class="form-control" id="deptCode" name="deptCode">
	            <option value>전공선택</option>
                <c:forEach items="${deptList }" var="dept">
	                <option value="${dept.deptCode }">${dept.deptName }</option>
                </c:forEach>
	        </select>
            </td>
        </tr>
        <tr>
            <th scope="row">전공/교양</th>
            <td>
            <select class="form-control" id="majorCultural" name="majorCultural">
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
             <select class="form-control" id="choiceRequire" name="choiceRequire">
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
            <input type="text" class="form-control" id="pmemNo" name="pmemNo" value="${memNo}" readonly="readonly"/>
            </td>
        </tr>
        <tr>
            <th scope="row">성명</th>
            <td>
            <input type="text" class="form-control" id="memName" name="memName" value="${memName}" readonly="readonly"/>
            </td>
        </tr>
    </tbody>
</table>
	<div class="col-sm-10">
		<div class="btn-group">
			<button type="submit" id="applFormBtn" class="btn btn-primary">신청하기</button>
		</div>
	</div>

</form>
        </div>
    </div>
</div>
</div>