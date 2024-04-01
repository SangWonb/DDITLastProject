<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<style>
    .sidebar-menu-text, .mainTitle {
        color: white;
        font-weight: bold;
    }

    .sidebar-menu-button:hover .sidebar-menu-text,
    .sidebar-menu-button:hover .sidebar-menu-icon,
    .sidebar-menu-button:hover .sidebar-submenu, 
    .sidebar-menu-button:hover .sidebar-menu-toggle-icon, 
    .sidebar-menu-button:hover .mainTitle{
        color: #0097E0 !important; /* 색상을 변경하고자 하는 요소에 !important를 사용하여 우선시합니다. */
        font-weight: bold;
    }
</style>

<div class="mdk-drawer js-mdk-drawer"
     id="default-drawer">
    <div class="mdk-drawer__content">
        <div class="sidebar sidebar-dark-pickled-bluewood sidebar-left"
             data-perfect-scrollbar>

            <!-- Sidebar Content -->

            <a href="menu-student.html"
               class="sidebar-brand ">
                <!-- <img class="sidebar-brand-icon" src="../../public/images/illustration/student/128/white.svg" alt="Luma"> -->
        
                <span>오늘의식단</span>
            </a>

            <ul class="sidebar-menu">

                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button"
                        href='<c:url value="/common/menu/restaurant"/>'>
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left text-white">local_library</span>
                        <span class="sidebar-menu-text">식당게시판</span>
                    </a>
                </li>
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button"
                        href='<c:url value="/common/menu/diet"/>'>
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left mainText text-white">content_copy</span>
                        <span class="sidebar-menu-text">식단표</span>
                    </a>
                </li>
            </ul>

            <!-- // END Sidebar Content -->

        </div>
    </div>
</div>