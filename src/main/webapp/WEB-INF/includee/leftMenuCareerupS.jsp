<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<style>
    .sidebar-menu-text {
        font-weight: bold;
        font-size: 18px; 
    }
    .sidebar-menu-item {
        transition: background-color 0.3s; /* 배경색 변경 시 부드러운 효과 */
    }
    .sidebar-menu-item:hover,
    .sidebar-menu-item.active {
        background-color: #333; /* 변경할 배경색 설정 */
    }
</style>

<div class="mdk-drawer js-mdk-drawer"
     id="default-drawer">
    <div class="mdk-drawer__content">
        <div class="sidebar sidebar-dark-pickled-bluewood sidebar-left"
             data-perfect-scrollbar>

            <!-- Sidebar Content -->
            <a href='<c:url value="/student/careerup/careerupMain"/>'
               class="sidebar-brand ">

                <span class="avatar avatar-xl sidebar-brand-icon h-auto">

                    <span class="avatar-title rounded bg-Dark">
                    	<img src="/lcms/resources/images/illustration/achievement/128/man.png"
                             class="img-fluid"
                             alt="logo" /></span>

                	</span>

                <span></span>
            </a>

            <div class="sidebar-heading text-white">Student</div>
            <ul class="sidebar-menu bg-info">
				  <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button"
                        href='<c:url value="/student/careerup/test"/>'>
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left text-white">panorama_fish_eye</span>
                        <span class="sidebar-menu-text text-white">진단테스트</span>
                    </a>
                </li>
                  <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button js-sidebar-collapse collapsed text-white" data-toggle="collapse" href="#student_menu" aria-expanded="false">
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left text-white">school</span>
                        <span class="sidebar-menu-text text-white">취업</span>
                        <span class="ml-auto sidebar-menu-toggle-icon text-white"></span>
                    </a>
                    <ul class="sidebar-submenu sm-indent collapse" id="student_menu" style="">

                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href='<c:url value="/student/careerup/employment/graduateemployment/graduateEmploymentList"/>'>

                                <span class="sidebar-menu-text text-white">선배취업처</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href='<c:url value="/student/careerup/employment/employmentreview/employmentReviewList"/>'>

                                <span class="sidebar-menu-text text-white">취업후기</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href='<c:url value="/student/careerup/employment/employmentagency/employmentAgencyList"/>'>

                                <span class="sidebar-menu-text text-white">취업처</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href='<c:url value="/student/careerup/employment/employmenteducation/employmentEducationList"/>'>

                                <span class="sidebar-menu-text text-white">취업교육</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href='<c:url value="/student/careerup/employment/resume/resumeList"/>'>

                                <span class="sidebar-menu-text text-white">이력서</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href='<c:url value="/student/careerup/employment/coverletter/coverLetterDetailList"/>'>

                                <span class="sidebar-menu-text text-white">자소서</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button" href='<c:url value="/student/careerup/employment/coverletterauto/coverLetterAutoView"/>'>

                                <span class="sidebar-menu-text text-white">AI자소서추천</span>
                            </a>
                        </li>
                    </ul>
                </li>
                                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button js-sidebar-collapse collapsed text-white" data-toggle="collapse" href="#instructor_menu" aria-expanded="false">
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left text-white">import_contacts</span>
                        <span class="sidebar-menu-text text-white">멘토링</span>
                        <span class="ml-auto sidebar-menu-toggle-icon text-white"></span>
                    </a>
                    <ul class="sidebar-submenu sm-indent collapse" id="instructor_menu" style="">

                        <li class="sidebar-menu-item">
                        <security:authorize access="hasRole('ROLE_S')"> <!-- 학생 -->
                        	<a href='<c:url value="/student/careerup/mentoring/mentoringmentee/mentoringMenteeAppl" />' class="sidebar-menu-button">
                        	<span class="sidebar-menu-text text-white">멘토링신청</span></a>
                    	</security:authorize>
                        </li>
                        <li class="sidebar-menu-item">
                        <security:authorize access="hasRole('ROLE_G')"> 
                        	<a href='<c:url value="/student/careerup/mentoring/mentoringmentor/mentoringMentorDecision" />' class="sidebar-menu-button">
                        	<span class="sidebar-menu-text text-white">멘토링 신청목록</span></a>
                    	</security:authorize>
                        </li>
                        <li class="sidebar-menu-item">
						<security:authorize access="hasRole('ROLE_G')"> <!-- 졸업생 -->
                        	<a href='<c:url value="/student/careerup/mentoring/mentorMentoring" />' class="sidebar-menu-button">
                        	<span class="sidebar-menu-text text-white">멘토링챗방</span></a>
                    	</security:authorize>
                    	<security:authorize access="hasRole('ROLE_S')"> <!-- 학생 -->
                        	<a href='<c:url value="/student/careerup/mentoring/menteeMentoring" />' class="sidebar-menu-button">
                        	<span class="sidebar-menu-text text-white">멘토링챗방</span></a>
                    	</security:authorize>
                        </li>
                    </ul>
                </li>
                
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button"
                        href='<c:url value="/student/careerup/licenseauto/licenseAuto"/>'>
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left text-white">style</span>
                        <span class="sidebar-menu-text text-white">AI자격증 자동등록</span>
                    </a>
                </li>
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button"
                        href='<c:url value="/student/careerup/licenserecom/licenseRecom"/>'>
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left text-white">account_box</span>
                        <span class="sidebar-menu-text text-white">AI자격증추천</span>
                    </a>
                </li>
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button"
                        href='<c:url value="/student/careerup/subjectrecom/subjectRecomList"/>'>
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left text-white">search</span>
                        <span class="sidebar-menu-text text-white">AI과목추천</span>
                    </a>
                </li>
              
            </ul>

            <!-- // END Sidebar Content -->
            
        </div>
    </div>
</div>

<script>
//페이지가 로드될 때 실행
window.onload = function() {
    // 현재 URL의 pathname 가져오기
    var pathName = window.location.pathname;
    // 사이드바 메뉴 항목에 해당하는 <a> 태그 선택
    var menuItems = document.querySelectorAll('.sidebar-menu-item a');
    // 각 메뉴 항목에 대해 처리
    menuItems.forEach(function(item) {
        // 항목의 href 속성값이 현재 URL의 pathname과 일치하는지 확인
        if (item.getAttribute('href') === pathName) {
            // 일치하면 해당 항목에 active 클래스 추가
            item.parentElement.classList.add('active');
        }
    });
    
    // 사이드바 메뉴 항목 클릭 시 효과 전환
    menuItems.forEach(function(item) {
        item.addEventListener('click', function() {
            // 클릭한 항목이 홈인지 확인
            if (item.getAttribute('href') === '/index-student.html') {
                // 홈을 클릭한 경우 모든 항목의 active 클래스 제거
                menuItems.forEach(function(menuItem) {
                    menuItem.parentElement.classList.remove('active');
                });
            } else {
                // 현재 active 클래스가 적용된 항목 찾기
                var activeItem = document.querySelector('.sidebar-menu-item.active');
                // 현재 active 클래스 제거
                if (activeItem) {
                    activeItem.classList.remove('active');
                }
            }
            // 클릭한 항목에 active 클래스 추가
            item.parentElement.classList.add('active');
        });
    });
    
    // 홈으로 이동할 때 배경색 제거
    var homeLink = document.querySelector('.sidebar-brand');
    homeLink.addEventListener('click', function() {
        // 모든 항목의 active 클래스 제거
        menuItems.forEach(function(menuItem) {
            menuItem.parentElement.classList.remove('active');
        });
    });
};

</script>