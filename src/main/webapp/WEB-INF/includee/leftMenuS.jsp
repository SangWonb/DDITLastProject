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

<div class="mdk-drawer js-mdk-drawer" id="default-drawer">
    <div class="mdk-drawer__content">
        <div class="sidebar sidebar-dark-pickled-bluewood sidebar-left"
             data-perfect-scrollbar>

            <a href="/lcms/student/info/infoMain"
               class="sidebar-brand ">
                <span>통합정보시스템</span>
            </a>

            <div class="sidebar-heading text-white">Student</div>
            <ul class="sidebar-menu">

                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button js-sidebar-collapse collapsed" data-toggle="collapse" href="#student_menu" aria-expanded="false">                    
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left mainText text-white">account_box</span>
                        <span class="mainTitle">마이페이지</span>
                        <span class="ml-auto sidebar-menu-toggle-icon text-white"></span>
                    </a>
                    <ul class="sidebar-submenu sm-indent collapse" id="student_menu" style="">

                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href='<c:url value="/student/info/mypage"/>'>

                                <span class="sidebar-menu-text">개인정보</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="mypage-mypage-student.html">

                                <span class="sidebar-menu-text">학점이수현황</span>
                            </a>
                        </li>
                    
                    </ul>
                </li>
                  <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button js-sidebar-collapse collapsed" data-toggle="collapse" href="#instructor_menu" aria-expanded="false">
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left mainText text-white">access_time</span>
                        <span class="mainTitle">일정관리</span>
                        <span class="ml-auto sidebar-menu-toggle-icon text-white"></span>
                    </a>
                    <ul class="sidebar-submenu sm-indent collapse" id="instructor_menu" style="">
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href='<c:url value="/common/info/calendar/Calendar"/>'>

                                <span class="sidebar-menu-text">일정관리</span>
                            </a>
                        </li>
                 
                    </ul>
                </li>
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button collapsed" data-toggle="collapse" href="#components_menu" aria-expanded="false">
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left mainText text-white">tune</span>
                        <span class="mainTitle">수강신청</span>
                        <span class="ml-auto sidebar-menu-toggle-icon text-white"></span>
                    </a>
                    <ul class="sidebar-submenu sm-indent collapse" id="components_menu" style="">
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href='<c:url value="/student/info/signupclasses"/>'>
                                <span class="sidebar-menu-text">수강신청</span>
                            </a>
                        </li>
                    </ul>
                </li>
              <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button collapsed" data-toggle="collapse" href="#productivity_menu" aria-expanded="false">
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left mainText text-white">message</span>
                        <span class="mainTitle">학적관리</span>
                        <span class="ml-auto sidebar-menu-toggle-icon text-white"></span>
                    </a>
                    <ul class="sidebar-submenu sm-indent collapse" id="productivity_menu" style="">
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href='<c:url value="/student/info/academicChange/list"/>'>
                                <span class="sidebar-menu-text">학적변동신청</span>
                            </a>
                    </ul>
                </li>
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button" data-toggle="collapse" href="#ecommerce_menu">
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left mainText text-white">view_compact</span>
                        <span class="mainTitle">성적</span>
                        <span class="ml-auto sidebar-menu-toggle-icon text-white"></span>
                    </a>
                    <ul class="sidebar-submenu collapse sm-indent" id="ecommerce_menu">
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href='<c:url value="/student/info/grade/wholeGrade"/>'>
                                <span class="sidebar-menu-text">전체학기성적</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href='<c:url value="/student/info/grade/currentGrade"/>'>
                                <span class="sidebar-menu-text">현재학기성적</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button collapsed" data-toggle="collapse" href="#cms_menu" aria-expanded="false">
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left mainText text-white">content_copy</span>
                        <span class="mainTitle">상담</span>
                        <span class="ml-auto sidebar-menu-toggle-icon text-white"></span>
                    </a>
                    <ul class="sidebar-submenu sm-indent collapse" id="cms_menu" style="">
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href='<c:url value="/student/info/counsel/counselApplList"/>'>
                                <span class="sidebar-menu-text">상담신청</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href='<c:url value="/student/info/counsel/liveCounselList"/>'>
                                <span class="sidebar-menu-text">상담목록</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button collapsed" data-toggle="collapse" href="#account_menu" aria-expanded="false">
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left mainText text-white">local_library</span>
                        <span class="mainTitle">장학/등록</span>
                        <span class="ml-auto sidebar-menu-toggle-icon text-white"></span>
                    </a>
                    <ul class="sidebar-submenu sm-indent collapse" id="account_menu" style="">
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="<c:url value='/student/info/scholarship/scholarshipList'/>">
                                <span class="sidebar-menu-text">장학금수혜이력</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="<c:url value='/student/info/tuition/tuitionList'/>">

                                                            <span class="sidebar-menu-text">등록금납부내역</span>
                        </a>
                    </li>
                </ul>
            </li>
            <li class="sidebar-menu-item">
                <a class="sidebar-menu-button" data-toggle="collapse" href="#plugins_menu">
                    <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left mainText text-white">folder</span>
                    <span class="mainTitle">증명서발급</span>
                    <span class="ml-auto sidebar-menu-toggle-icon text-white"></span>
                </a>
                <ul class="sidebar-submenu collapse sm-indent" id="plugins_menu">
                    <li class="sidebar-menu-item">
                        <a class="sidebar-menu-button" href='<c:url value="/student/info/certificate/certificateList"/>'>
                            <span class="sidebar-menu-text">증명서발급</span>
                        </a>
                    </li>
                </ul>
            </li>
            <li class="sidebar-menu-item">
                <a class="sidebar-menu-button" data-toggle="collapse" href="#layouts_menu">
                    <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left mainText text-white">school</span>
                    <span class="mainTitle">졸업자가진단</span>
                    <span class="ml-auto sidebar-menu-toggle-icon text-white"></span>
                </a>
                <ul class="sidebar-submenu collapse sm-indent" id="layouts_menu">
                    <li class="sidebar-menu-item">
                        <a class="sidebar-menu-button" href="<c:url value='/student/info/graduationdiagnosis/graduationList'/>">
                            <span class="sidebar-menu-text">졸업자가진단</span>
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
        <!-- // END Sidebar Content -->
    </div>
</div>
</div>
