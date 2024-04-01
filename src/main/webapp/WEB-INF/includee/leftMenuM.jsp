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

            <a href="info-professor.html"
               class="sidebar-brand ">
                <span>관리페이지</span>
            </a>
           
         
            <ul class="sidebar-menu">

                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button js-sidebar-collapse collapsed" data-toggle="collapse" href="#common_menu" aria-expanded="false">
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left text-white">format_shapes</span>
                        <span class="mainTitle">공통관리</span>
                        <span class="ml-auto sidebar-menu-toggle-icon text-white"></span>
                    </a>
                    <ul class="sidebar-submenu sm-indent collapse" id="common_menu" style="">

                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href='<c:url value="/manager/com/memberRegistrateInsert"/>'>
                                <span class="sidebar-menu-text">회원정보등록</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" data-toggle="collapse" href="#ecommerce_menu">
                                <span class="sidebar-menu-text">인재게시판</span>
                                <span class="ml-auto sidebar-menu-toggle-icon text-white"></span>
                            </a>
                            <ul class="sidebar-submenu collapse sm-indent" id="ecommerce_menu">
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href='<c:url value="#"/>'>
                                        <span class="sidebar-menu-text">- 자유게시판</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href='<c:url value="/professor/info/lecture/lecturedecision/lectureDecision"/>'>
                                        <span class="sidebar-menu-text">- 동아리게시판</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href='<c:url value="/manager/com/board/academicnotice/academicNotice"/>'>
                                        <span class="sidebar-menu-text">- 학사공지사항</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href='<c:url value="/manager/com/board/departmentnotice/departmentNoticeList"/>'>
                                        <span class="sidebar-menu-text">- 학과공지사항</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href='<c:url value="#"/>'>
                                        <span class="sidebar-menu-text">- Q&A</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href='<c:url value="#"/>'>
                                        <span class="sidebar-menu-text">- 민원/오류접수</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href='<c:url value="/manager/com/popup/mainpopup/mainPopup"/>'>
                                <span class="sidebar-menu-text">팝업관리</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="<c:url value='/manager/com/book/bookList'/>">
                                <span class="sidebar-menu-text">도서</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" data-toggle="collapse" href="#community_menu" aria-expanded="false">
                                <span class="sidebar-menu-text">일정관리</span>
                                <span class="ml-auto sidebar-menu-toggle-icon text-white"></span>
                            </a>
                            <ul class="sidebar-submenu collapse sm-indent" id="community_menu" style="">
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href="<c:url value='/manager/info/acaCalendar'/>">
                                        <span class="sidebar-menu-text">- 학사일정</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href='<c:url value="#"/>'>
                                        <span class="sidebar-menu-text">- 학과일정</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button js-sidebar-collapse collapsed" data-toggle="collapse" href="#stu_menu" aria-expanded="false">
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left text-white">school</span>
                        <span class="mainTitle">학생관리</span>
                        <span class="ml-auto sidebar-menu-toggle-icon text-white"></span>
                    </a>
                    <ul class="sidebar-submenu sm-indent collapse" id="stu_menu" style="">

                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href='<c:url value="/manager/stu/studentinfo/studentInfoList"/>'>
                                <span class="sidebar-menu-text">학생정보<br/>(수업이수/상담이력)</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href='<c:url value="/manager/stu/academicchange/academicChangeList"/>'>
                                <span class="sidebar-menu-text">학적변동관리</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" data-toggle="collapse" href="#layouts_menu">
                                <span class="sidebar-menu-text">강의평가관리</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" data-toggle="collapse" href="#criteria_menu">
                                <span class="sidebar-menu-text">기준등록</span>
                                <span class="ml-auto sidebar-menu-toggle-icon text-white"></span>
                            </a>
                            <ul class="sidebar-submenu collapse sm-indent" id="criteria_menu">
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href='<c:url value="/manager/stu/criteria/graduationcriteria/graduationCriteriaList"/>'>
                                        <span class="sidebar-menu-text">- 졸업요건기준등록</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href='<c:url value="/manager/stu/criteria/attendancecriteria"/>'>
                                        <span class="sidebar-menu-text">- 출결기준등록</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href='<c:url value="/manager/stu/scholarship/scholarshipList"/>'>
                                <span class="sidebar-menu-text">장학관리</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href='<c:url value="#"/>'>
                                <span class="sidebar-menu-text">취업자관리</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href='<c:url value="/manager/stu/mentor/mentorList"/>'>
                                <span class="sidebar-menu-text">멘토관리</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button js-sidebar-collapse collapsed" data-toggle="collapse" href="#profe_menu" aria-expanded="false">
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left text-white">donut_large</span>
                        <span class="mainTitle">교수관리</span>
                        <span class="ml-auto sidebar-menu-toggle-icon text-white"></span>
                    </a>
                    <ul class="sidebar-submenu sm-indent collapse" id="profe_menu" style="">
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href='<c:url value="manager/pro/professorList"/>'>
                                <span class="sidebar-menu-text">교수정보</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href='<c:url value="/manager/pro/lecture/lectureList"/>'>
                                <span class="sidebar-menu-text">개설강의</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href='<c:url value="/manager/pro/subject/subjectList"/>'>
                                <span class="sidebar-menu-text">교과목</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button collapsed" data-toggle="collapse" href="#productivity_menu" aria-expanded="false">
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left text-white">access_time</span>
                        <span class="mainTitle">현황통계관리</span>
                        <span class="ml-auto sidebar-menu-toggle-icon text-white"></span>
                    </a>
                    <ul class="sidebar-submenu sm-indent collapse" id="productivity_menu" style="">
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href='<c:url value="#"/>'>
                                <span class="sidebar-menu-text">성적통계</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href='<c:url value="/manager/state/scholarship"/>'>
                                <span class="sidebar-menu-text">장학통계</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href='<c:url value="/manager/state/book/bookStats"/>'>
                                <span class="sidebar-menu-text">도서통계</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href='<c:url value="/manager/state/cotest"/>'>
                                <span class="sidebar-menu-text">역량통계</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href='<c:url value="#"/>'>
                                <span class="sidebar-menu-text">졸업자통계</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href='<c:url value="/manager/state/lectureevaluation"/>'>
                                <span class="sidebar-menu-text">강의평가통계</span>
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>