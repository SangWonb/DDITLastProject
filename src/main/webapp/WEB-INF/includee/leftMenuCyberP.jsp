<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

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

<div class="mdk-drawer js-mdk-drawer sidebar-brand sidebar sidebar-dark-pickled-bluewood sidebar-left ps"
     id="default-drawer">
    <div class="mdk-drawer__content">
        <div class=""
             data-perfect-scrollbar>

            <!-- Sidebar Content -->
            <a href='<c:url value="/professor/cyber/cyberMain"/>'
               class="sidebar-brand sidebar sidebar-dark-pickled-bluewood sidebar-left ps">
               
                <span class="avatar avatar-xl sidebar-brand-icon h-auto">

                    <span class="avatar-title rounded bg-Dark">
					    <img src="/lcms/resources/images/illustration/achievement/128/girl.png" 
					         class="img-fluid" 
					         alt="이미지" />
					</span>

                </span>

                <span class="text-white"></span>
            </a>

            <div class="sidebar-heading text-white sidebar sidebar-dark-pickled-bluewood sidebar-left ps">Professor</div>
            <ul class="sidebar-menu bg-danger">

                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button"
                        href='<c:url value="/professor/cyber/syllabus/syllabusDetail/${cyberLecCode }"/>'>
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left text-white">home</span>
                        <span class="sidebar-menu-text text-white">강의계획서</span>
                    </a>
                </li>
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button"
                        href='<c:url value="/professor/cyber/onlinelecture/onlineLectureList/${lecCode }"/>'>
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left text-white">local_library</span>
                        <span class="sidebar-menu-text text-white">온라인강의</span>
                    </a>
                </li>
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button"
                        href='<c:url value="/professor/cyber/${cyberLecCode}/lectureNotice"/>'>
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left text-white">account_box</span>
                        <span class="sidebar-menu-text text-white">강의공지사항</span>
                    </a>
                </li>
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button"
                        href='<c:url value="/professor/cyber/${cyberLecCode}/lectureDataList"/>'>
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left text-white">search</span>
                        <span class="sidebar-menu-text text-white">강의자료</span>
                    </a>
                </li>
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button"
                        href='<c:url value="/professor/cyber/${cyberLecCode }/attendance"/>'>
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left text-white">timeline</span>
                        <span class="sidebar-menu-text text-white">출석</span>
                    </a>
                </li>
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button"
                        href='<c:url value="/professor/cyber/${cyberLecCode }/task"/>'>
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left text-white">change_history</span>
                        <span class="sidebar-menu-text text-white">과제</span>
                    </a>
                </li>
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button"
                        href='<c:url value="/professor/cyber/${cyberLecCode }/teamProject"/>'>
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left text-white">face</span>
                        <span class="sidebar-menu-text text-white">팀프로젝트</span>
                    </a>
                </li>
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button"
                        href="#">
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left text-white">panorama_fish_eye</span>
                        <span class="sidebar-menu-text text-white">시험</span>
                    </a>
                </li>
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button"
                        href='<c:url value="/professor/cyber/${cyberLecCode }/objectionAppl"/>'>
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left text-white">import_contacts</span>
                        <span class="sidebar-menu-text text-white">이의신청</span>
                    </a>
                </li>
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button"
                        href='<c:url value="/professor/cyber/${cyberLecCode }/grade"/>'>
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left text-white">dvr</span>
                        <span class="sidebar-menu-text text-white">성적</span>
                    </a>
                </li>
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button"
                        href='<c:url value="/professor/cyber/${cyberLecCode }/lectureevaluation"/>'>
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left text-white">view_compact</span>
                        <span class="sidebar-menu-text text-white">강의평가</span>
                    </a>
                </li>
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button"
                        href="#">
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left text-white">people_outline</span>
                        <span class="sidebar-menu-text text-white">수강생</span>
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