<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>    
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

            <a href="/lcms/professor/info/infoMain"
               class="sidebar-brand ">
                <span>통합정보시스템</span>
            </a>

            <div class="sidebar-heading text-white">Professor</div>
            <ul class="sidebar-menu">

                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button js-sidebar-collapse collapsed" data-toggle="collapse" href="#student_menu" aria-expanded="false">
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left text-white">account_box</span>
                        <span class="mainTitle">마이페이지</span>
                        <span class="ml-auto sidebar-menu-toggle-icon text-white"></span>
                    </a>
                    <ul class="sidebar-submenu sm-indent collapse" id="student_menu" style="">

                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href='<c:url value="/professor/info/mypage/myPage"/>'>

                                <span class="sidebar-menu-text">개인정보</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button js-sidebar-collapse collapsed" data-toggle="collapse" href="#instructor_menu" aria-expanded="false">
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left text-white">access_time</span>
                        <span class="mainTitle">일정관리</span>
                        <span class="ml-auto sidebar-menu-toggle-icon text-white"></span>
                    </a>
                    <ul class="sidebar-submenu sm-indent collapse" id="instructor_menu" style="">

                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="#">

                                <span class="sidebar-menu-text">학사일정</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="#">

                                <span class="sidebar-menu-text">학과일정</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="#">

                                <span class="sidebar-menu-text">개인일정</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button collapsed" data-toggle="collapse" href="#cms_menu" aria-expanded="false">
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left text-white">content_copy</span>
                        <span class="mainTitle">상담</span>
                        <span class="ml-auto sidebar-menu-toggle-icon text-white"></span>
                    </a>
                    <ul class="sidebar-submenu sm-indent collapse" id="cms_menu" style="">
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href='<c:url value="/professor/info/counsel/counselappl/counselApplList"/>'>
                                <span class="sidebar-menu-text">상담신청</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href='<c:url value="/professor/info/counsel/startcounsel/startCounselList"/>'>
                                <span class="sidebar-menu-text">상담목록</span>
                            </a>
                        </li>
                    </ul>
                </li>
    
               <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button" data-toggle="collapse" href="#ecommerce_menu">
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left text-white">style</span>
                        <span class="mainTitle">강의개설</span>
                        <span class="ml-auto sidebar-menu-toggle-icon text-white"></span>
                    </a>
                    <ul class="sidebar-submenu collapse sm-indent" id="ecommerce_menu">
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href='<c:url value="/professor/info/lecture/lectureappl/lectureApplList"/>'>
                                <span class="sidebar-menu-text">강의개설신청</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                        <security:authorize access="hasRole('ROLE_D')"> <!-- 학생 -->
                           <a href='<c:url value="/professor/info/lecture/lecturedecision/lectureDecision" />' class="sidebar-menu-button">강의개설승인</a>
                       </security:authorize>
                        </li>
                    </ul>
                </li>
               <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button collapsed" data-toggle="collapse" href="#components_menu" aria-expanded="false">
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left text-white">view_compact</span> 
                        <span class="mainTitle">교과목</span>
                        <span class="ml-auto sidebar-menu-toggle-icon text-white"></span>
                    </a>
                    <ul class="sidebar-submenu sm-indent collapse" id="components_menu" style="">
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href='<c:url value="/professor/info/subject/subjectappl/subjectApplList"/>'>
                                <span class="sidebar-menu-text">교과목신청</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                         <security:authorize access="hasRole('ROLE_D')"> <!-- 학생 -->
                           <a href='<c:url value="/professor/info/subject/subjectdecision/subjectDecision" />' class="sidebar-menu-button">교과목승인</a>
                       </security:authorize>
                        </li>
                    </ul>
                </li>
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button" data-toggle="collapse" href="#plugins_menu">
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left text-white">folder</span>
                        <span class="mainTitle">증명서발급</span>
                        <span class="ml-auto sidebar-menu-toggle-icon text-white"></span>
                    </a>
                    <ul class="sidebar-submenu collapse sm-indent" id="plugins_menu">
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href='<c:url value="/professor/info/certificate/certificateList"/>'>
                                <span class="sidebar-menu-text">증명서발급</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button" data-toggle="collapse" href="#layouts_menu">
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left text-white">donut_large</span>
                        <span class="mainTitle">재직변경</span>
                        <span class="ml-auto sidebar-menu-toggle-icon text-white"></span>
                    </a>
                    <ul class="sidebar-submenu collapse sm-indent" id="layouts_menu">
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="#">
                                <span class="sidebar-menu-text">재직변경</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button collapsed" data-toggle="collapse" href="#productivity_menu" aria-expanded="false">
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left text-white">face</span>
                        <span class="mainTitle">학생학적변동</span>
                        <span class="ml-auto sidebar-menu-toggle-icon text-white"></span>
                    </a>
                    <ul class="sidebar-submenu sm-indent collapse" id="productivity_menu" style="">
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="#">
                                <span class="sidebar-menu-text">학생학적변동</span>
                            </a>
                    </ul>
                </li>
            </ul>
                
            

            <!-- // END Sidebar Content -->

        </div>
    </div>
</div>