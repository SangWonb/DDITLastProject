<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<form:form id="forMentorForm" method="post" modelAttribute="student"  enctype="multipart/form-data">
    <div class="form-group row">
        <label for="senior" class="col-sm-2 col-form-label">성명</label>
        <div class="">
            <form:input type="text" class="form-control" id="memName" path="memName" value="${memName }" readonly=""/>
        </div>
    </div>

    <div class="form-group row">
        <label for="userNumber" class="col-sm-2 col-form-label">학번</label>
        <div class="">
            <form:input type="text" class="form-control" id="smemNo" path="smemNo" value="${memNo }" readonly=""/>
        </div>
    </div>

    <div class="form-group row">
        <label for="desiredCompany" class="col-sm-2 col-form-label">멘토 등록</label>
        <div class="">
            <form:select class="form-control" path="stuYn" id="stuYn">
                <option value="">멘토 등록 여부</option>
                    <option value="M">등록</option>
                    <option value="N">미등록</option>
            </form:select>
        </div>
    </div>
    <div class="form-group">
        <label for="fileUpload">재직증명서 업로드</label>
        <input type="file" class="form-control-file" id="stuFiles" name="stuFiles" />
        <small id="fileHelp" class="form-text text-muted"></small>
    </div>

<!--     <div class="form-group row"> -->
<!--         <label for="desiredCompany" class="col-sm-2 col-form-label">학과</label> -->
<!--         <div class="col-sm-10"> -->
<%--             <form:select class="form-control" path="deptCode" id="deptCode"> --%>
<!--                 <option value="">전공선택</option> -->
<%--                 <c:forEach items="${deptList }" var="dept"> --%>
<%--                     <option value="${dept.deptCode }">${dept.deptName }</option> --%>
<%--                 </c:forEach> --%>
<%--             </form:select> --%>
<!--         </div> -->
<!--     </div> -->

<!--     <div class="form-group row"> -->
<!--         <label for="desiredJob" class="col-sm-2 col-form-label">지역</label> -->
<!--         <div class="col-sm-10"> -->
<%--             <form:input type="text" class="form-control" id="companyLoc" path="companyLoc"/> --%>
<!--         </div> -->
<!--     </div> -->

<!--     <div class="form-group row"> -->
<!--         <label for="desiredJob" class="col-sm-2 col-form-label">회사명</label> -->
<!--         <div class="col-sm-10"> -->
<%--             <form:input type="text" class="form-control" id="companyNm" path="companyNm"/> --%>
<!--         </div> -->
<!--     </div> -->

<!--     <div class="form-group row"> -->
<!--         <label for="desiredJob" class="col-sm-2 col-form-label">부서</label> -->
<!--         <div class="col-sm-10"> -->
<%--             <form:input type="text" class="form-control" id="companyDept" path="companyDept"/> --%>
<!--         </div> -->
<!--     </div> -->

<!--     <div class="form-group row"> -->
<!--         <label for="desiredJob" class="col-sm-2 col-form-label">직무</label> -->
<!--         <div class="col-sm-10"> -->
<%--             <form:input type="text" class="form-control" id="companyJob" path="companyJob"/> --%>
<!--         </div> -->
<!--     </div> -->

    <div class="form-group row">
        <div class="col-sm-10 offset-sm-2">
            <button type="submit" id="submitForm" class="btn btn-primary">신청</button>
        </div>
    </div>
</form:form>

