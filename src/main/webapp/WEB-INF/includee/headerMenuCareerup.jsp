<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
    /* 텍스트 간격을 위한 스타일 */
    .navbar-text-100 {
        margin-right: 10px; 
    }
    .text-white div, .text-white a, .text-white strong {
        display: inline-block; 
        margin-right: 10px; 
    }
    .roleMa {
        margin-right: 10px; 
    }
    .time-extension-container {
        margin-right: 10px;
    }
    .time {
    	margin-right: 10px;
    }
    .roleMa {
        margin-right: 5px;
    }
    .mar {
        margin-right: 5px;
    }
</style>

<div class="navbar navbar-expand pr-0 navbar-light border-bottom-2"
     id="default-navbar"
     data-primary>

    <span class="d-none d-md-flex align-items-center mr-16pt">

        <span class="avatar avatar-sm mr-12pt">
			<a href='<c:url value="/common/mainPage"/>'>
            	<span class="avatar-title rounded navbar-avatar"><i class="material-icons">opacity</i></span>
            </a>
        </span>

        <img src="/lcms/resources/images/illustration/achievement/128/lcmslogo.png"
                                         alt="logo">
    </span>

    <div class="flex"></div>

    <!-- Navbar Menu -->
    <div>
		<small class="flex d-flex flex-column mar">
   			<span>${memName}</span>
		</small>    
    </div>
    <div>
		<small class="flex d-flex flex-column mar">
   			<span>${DeptName}</span>
		</small>    
    </div>
    <div>
		<small class="flex d-flex flex-column mar">
   			<span>${memNo}</span>
		</small>    
    </div>
    <div>
		<small class="flex d-flex flex-column mar">
   			<span>${RolesDescriptions}</span>
		</small>    
    </div>
    <div class="text-white roleMa">
		<small class="flex d-flex flex-column">
   			<span>${roleDesc}</span>
		</small>    
    </div>
    
    <div>
		<small class="flex d-flex flex-column">
   			<span></span>
		</small>    
    </div>
    <div>
		<small class="flex d-flex flex-column">
   			<a class="timeExtension" href="javascript:;">
   				<strong class="navbar-text-100">시간연장</strong>
   			</a>
		</small>    
    </div>
	<div>
   		<small class="flex d-flex flex-column">
   			<a href='<c:url value="/logout"/>'>
   				<strong class="navbar-text-100">로그아웃</strong>
   			</a>
		</small>
	</div>

    <!-- // END Navbar Menu -->

</div>
