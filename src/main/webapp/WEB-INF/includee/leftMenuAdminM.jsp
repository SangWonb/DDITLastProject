<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<div class="mdk-drawer js-mdk-drawer"
     id="default-drawer">
    <div class="mdk-drawer__content">
        <div class="sidebar sidebar-dark-pickled-bluewood sidebar-left"
             data-perfect-scrollbar>

            <!-- Sidebar Content -->

            <a href="index-manager.html"
               class="sidebar-brand ">
                <!-- <img class="sidebar-brand-icon" src="../../public/images/illustration/student/128/white.svg" alt="Luma"> -->
                <span>관리페이지</span>
            </a>

            <div class="sidebar-heading">manager</div>
            <ul class="sidebar-menu">

                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button js-sidebar-collapse collapsed" data-toggle="collapse" href="#student_menu" aria-expanded="false">
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left">format_shapes</span>
                        공통관리
                        <span class="ml-auto sidebar-menu-toggle-icon"></span>
                    </a>
                    <ul class="sidebar-submenu sm-indent collapse" id="student_menu" style="">

                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="#">
                                <span class="sidebar-menu-text">회원정보등록</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" data-toggle="collapse" href="#ecommerce_menu">
                                인재게시판
                                <span class="ml-auto sidebar-menu-toggle-icon"></span>
                            </a>
                            <ul class="sidebar-submenu collapse sm-indent" id="ecommerce_menu">
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href="#">
                                        <span class="sidebar-menu-text">자유게시판</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href="#">
                                        <span class="sidebar-menu-text">동아리게시판</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href="#">
                                        <span class="sidebar-menu-text">학사공지사항</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href="#">
                                        <span class="sidebar-menu-text">학과공지사항</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href="#">
                                        <span class="sidebar-menu-text">Q&A</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href="#">
                                        <span class="sidebar-menu-text">민원/오류접수</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="#">
                                <span class="sidebar-menu-text">시설물</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="#">
                                <span class="sidebar-menu-text">식단</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="#">
                                <span class="sidebar-menu-text">식당</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="#">
                                <span class="sidebar-menu-text">팝업관리</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="#">
                                <span class="sidebar-menu-text">챗봇관리</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="#">
                                <span class="sidebar-menu-text">도서</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button collapsed" data-toggle="collapse" href="#community_menu" aria-expanded="false">
                                일정
                                <span class="ml-auto sidebar-menu-toggle-icon"></span>
                            </a>
                            <ul class="sidebar-submenu sm-indent collapse" id="community_menu" style="">
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
                            </ul>
                        </li>
                    </ul>
                </li>
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button js-sidebar-collapse collapsed" data-toggle="collapse" href="#instructor_menu" aria-expanded="false">
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left">school</span>
                        학생관리
                        <span class="ml-auto sidebar-menu-toggle-icon"></span>
                    </a>
                    <ul class="sidebar-submenu sm-indent collapse" id="instructor_menu" style="">

                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="#">
                                <span class="sidebar-menu-text">학생정보<br/>(수업이수/상담이력)</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="#">
                                <span class="sidebar-menu-text">학적변동관리</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button collapsed" data-toggle="collapse" href="#components_menu" aria-expanded="false">
                                봉사프로그램
                                <span class="ml-auto sidebar-menu-toggle-icon"></span>
                            </a>
                            <ul class="sidebar-submenu sm-indent collapse" id="components_menu" style="">
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href="#">
                                        <span class="sidebar-menu-text">봉사프로그램신청</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href="#">
                                        <span class="sidebar-menu-text">봉사내역신청</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" data-toggle="collapse" href="#plugins_menu">
                                인턴프로그램
                                <span class="ml-auto sidebar-menu-toggle-icon"></span>
                            </a>
                            <ul class="sidebar-submenu collapse sm-indent" id="plugins_menu">
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href="#">
                                        <span class="sidebar-menu-text">인턴프로그램</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href="#">
                                        <span class="sidebar-menu-text">인턴이력신청</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" data-toggle="collapse" href="#layouts_menu">
                                기간관리
                                <span class="ml-auto sidebar-menu-toggle-icon"></span>
                            </a>
                            <ul class="sidebar-submenu collapse sm-indent" id="layouts_menu">
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href="#">
                                        <span class="sidebar-menu-text">수강신청관리</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href="#">
                                        <span class="sidebar-menu-text">이의신청관리</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href="#">
                                        <span class="sidebar-menu-text">강의평가관리</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="#">
                                <span class="sidebar-menu-text">기준등록</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="#">
                                <span class="sidebar-menu-text">장학관리</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" data-toggle="collapse" href="#clubBoard_menu">
                                등록금관리
                                <span class="ml-auto sidebar-menu-toggle-icon"></span>
                            </a>
                            <ul class="sidebar-submenu collapse sm-indent" id="clubBoard_menu">
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href="#">
                                        <span class="sidebar-menu-text">등록금이력</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href="#">
                                        <span class="sidebar-menu-text">등록금기준</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="#">
                                <span class="sidebar-menu-text">취업자관리</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="#">
                                <span class="sidebar-menu-text">멘토관리</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button js-sidebar-collapse collapsed" data-toggle="collapse" href="#enterprise_menu" aria-expanded="false">
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left">donut_large</span>
                        교수관리
                        <span class="ml-auto sidebar-menu-toggle-icon"></span>
                    </a>
                    <ul class="sidebar-submenu sm-indent collapse" id="enterprise_menu" style="">
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="#">
                                <span class="sidebar-menu-text">교수정보</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="#">
                                <span class="sidebar-menu-text">개설강의</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="#">
                                <span class="sidebar-menu-text">교과목</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="#">
                                <span class="sidebar-menu-text">장학금관리</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="#">
                                <span class="sidebar-menu-text">재직상태</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="#">
                                <span class="sidebar-menu-text">연구실/교수방관리</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button collapsed" data-toggle="collapse" href="#productivity_menu" aria-expanded="false">
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left">access_time</span>
                        현황통계관리
                        <span class="ml-auto sidebar-menu-toggle-icon"></span>
                    </a>
                    <ul class="sidebar-submenu sm-indent collapse" id="productivity_menu" style="">
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="#">
                                <span class="sidebar-menu-text">입학자증감추이</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="#">
                                <span class="sidebar-menu-text">재학자학적상태</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="#">
                                <span class="sidebar-menu-text">강의평가통계</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="#">
                                <span class="sidebar-menu-text">평균성적조회</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="#">
                                <span class="sidebar-menu-text">장학금수혜비율</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="#">
                                <span class="sidebar-menu-text">졸업자통계</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href="#">
                                <span class="sidebar-menu-text">도서통계</span>
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
                
            

            <!-- // END Sidebar Content -->

        </div>
    </div>
</div>