<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
    /* 텍스트 간격을 위한 스타일 */
    .navbar-text-100 {
        margin-right: 5px; 
    }
    .text-white div, .text-white a, .text-white strong {
        display: inline-block; 
        margin-right: 5px;
    }
    
    .dept-name {
        margin-right: 5px; 
    }
    .roleMa {
        margin-right: 5px;
    }
</style>

<!-- Header -->
<div class="d-flex justify-content-between">

    <!-- 첫 번째 div: 왼쪽 정렬 -->
    <div class="sidebar sidebar-dark-pickled-bluewood align-items-left" id="default-navbar">
        <span class="d-none d-md-flex mr-16pt">
            <small class="flex d-flex flex-column">
                <a href='<c:url value="/common/mainPage"/>'>
                    <strong class="navbar-text-100 text-white">HOME | 사이트맵</strong>
                </a>
            </small>
        </span>
    </div>

    <!-- 빈 공간을 채울 div -->
    <div class="flex-grow-1 sidebar-dark-pickled-bluewood"></div>
    
    <!-- 두 번째 div: 오른쪽 정렬 -->
    <div class="sidebar sidebar-dark-pickled-bluewood align-items-end" id="default-navbar">
        <span class="d-none d-md-flex mr-16pt">
            <small class="flex d-flex flex-row">
                <strong class="navbar-text-100 text-white">${memName}</strong>
                <strong class="navbar-text-100 text-white dept-name">${DeptName}</strong>
                <strong class="navbar-text-100 text-white">${memNo}</strong>
                <c:forEach var="roleDesc" items="${RolesDescriptions}">
                    <div class="text-white roleMa">${roleDesc}</div>
                </c:forEach>
                <strong class="navbar-text-100 text-white"><span id="sessionTime"></span></strong>
                <a class="timeExtension" href="javascript:;">
                    <strong class="navbar-text-100 text-white">
                         로그인연장 
                    </strong>
                </a>
                <a href='<c:url value="/logout"/>'>
                    <strong class="navbar-text-100 text-white">
                         로그아웃 
                    </strong>
                </a>
            </small>
        </span>
    </div>

</div>
<!-- // END Header -->
