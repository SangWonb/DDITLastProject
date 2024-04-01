<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
    prefix="security"%>

<style>
    /* 헤드메뉴1 */
    .headOneColor {
        background-color: #004094;
    }
    /* 헤드메뉴2 */
    .headTwoColor {
        background-color: #003063;
    }
    /* 한인대 로고타이틀 */
    .mainTitle {
        font-weight: bold;
        font-size: 26px;
        margin-bottom: -5px;
        display: block;
        text-decoration: none;
    }
    .mainTitleSub {
        color: white;
        font-size: 10px;
        margin-left: 5px;
        margin-top: -5px;
        font-weight: bold;
        display: block;
    }
    /* 화면배치저장, 포틀릿설정, 로그아웃 */
    .headLightText {
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 15px;
        color: white;
        text-decoration: none;
    }
    /* 연장 */
    .headLightText a:hover {
        color: yellow;
    }
    .mainMenuTitle {
    	margin-left: 15px;
    }
    .nav-item .timeExtension {
        color: white;
        border-radius: 10px;
        background-color: orange;
        padding: 5px 10px;
        display: inline-block;
        text-decoration: none;
        font-weight: bold;
    }
    /* 메인메뉴 타이틀 */
    .mainMenuTitle a.nav-link {
        font-weight: bold;
        font-size: 20px;
        display: flex;
        justify-content: center;
        align-items: center;
        margin-right: 20px;
        margin-left: 20px;
        text-decoration: none;
    }
    /* 메인메뉴 아이템 기본 스타일 */
    .mainMenuTitle a.nav-link {
        color: white;
        padding: 25px;
        margin: 15 15px;
        border-radius: 25px;
        transition: all 0.3s ease;
    }
    /* 메인메뉴 아이템에 마우스를 올렸을 때의 스타일 */
    .mainMenuTitle a.nav-link:hover {
        background-color: #007bff;
        margin-left: 30px;
        margin-right: 30px;
        text-decoration: none;
    }
    
</style>

<!-- Header -->
<div id="header" class="mdk-header js-mdk-header mb-0" data-fixed
    data-effects="waterfall">
    <div class="mdk-header__content">
        <div class="navbar navbar-expand navbar-light headOneColor"
            id="default-navbar">
            <div class="container page__container">
                <!-- Navbar Brand -->
                <a href="#" class="">
                    <span class="avatar avatar-sm navbar-brand-icon mr-0 mr-lg-8pt">
                        <span class=""><img src="/lcms/resources/images/logo/logoBlue.jpg"
                            alt="logo" class="img-fluid" />
                        </span>
                    </span>
                    <a href='<c:url value="/common/mainPage"/>'>
                        <span class="d-none d-lg-block text-white mainTitle">한국인재대학교</span>
                        <span class="mainTitleSub">Korea Human Resource UniverSity</span>
                    </a>
                </a>
                <!-- Navbar toggler -->
                <ul
                    class="nav navbar-nav d-none d-sm-flex flex justify-content-start ml-8pt d-flex justify-content-end headLightText">
                    <li class="nav-item"><span id="sessionTime"></span></li>
                    <li class="nav-item"><a class="timeExtension"
                        href="javascript:;" class="nav-link text-warning">연장</a></li>
                    <li class="nav-item"><a href="#" class="headLightText">화면배치저장</a>
                    </li>
                    <li class="nav-item"><a href="#" onclick="openPortlet()" class="headLightText">포틀릿설정</a></li>
    				<li class="nav-item"><a href='<c:url value="/logout"/>'
                        class="headLightText">로그아웃</a></li>
                    
                </ul>
            </div>
        </div>
        <div class="navbar navbar-expand navbar-light navbar-shadow headTwoColor"
            id="default-navbar" data-fixed>
            <div class="container page__container d-flex justify-content-center">
                <!-- Navbar toggler -->
                <ul
                    class="nav navbar-nav justify-content-start ml-8pt d-flex justify-content-center mainMenuTitle">
                    <li class="nav-item active">
                    	<security:authorize access="hasRole('ROLE_S')">
                            <!-- 학생 -->
                            <a href='<c:url value="/student/info/infoMain" />'
                                class="nav-link text-white">통합정보시스템</a>
                        </security:authorize> <security:authorize access="hasRole('ROLE_P')">
                            <!-- 교수 -->
                            <a href='<c:url value="/professor/info/infoMain" />'
                                class="nav-link text-white">통합정보시스템</a>
                        </security:authorize> <security:authorize access="hasRole('ROLE_M')">
                            <!-- 교직원 -->
                            <a href='<c:url value="/manager/info/infoMain" />'
                                class="nav-link text-white">통합정보시스템</a>
                        </security:authorize></li>
                    <li class="nav-item active"><security:authorize
                            access="hasRole('ROLE_S')">
                            <!-- 학생 -->
                            <a href='<c:url value="/student/cyber/cyberMain"/>'
                                class="nav-link text-white">사이버캠퍼스</a>
                        </security:authorize> <security:authorize access="hasRole('ROLE_P')">
                            <!-- 교수 -->
                            <a href='<c:url value="/professor/cyber/cyberMain"/>'
                                class="nav-link text-white">사이버캠퍼스</a>
                        </security:authorize> <security:authorize access="hasRole('ROLE_M')">
                            <!-- 교직원 -->
                            <a href="#" class="nav-link text-white">사이버캠퍼스</a>
                        </security:authorize></li>
                    <li class="nav-item active"><a
                        href='<c:url value="/student/careerup/careerupMain"/>'
                        class="nav-link text-white">경력개발시스템</a></li>
                    <li class="nav-item active"><a
                        href='<c:url value="/common/board/academicnotice/academicNotice"/>'
                        class="nav-link text-white">커뮤니티</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

<!-- Material Icons -->
<link rel='stylesheet' href='https://fonts.googleapis.com/icon?family=Material+Icons'>

<!-- Bootstrap 5 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<script>
    function openPortlet() {
        var url = '<c:url value="/common/portlet/setPortlet" />';
        window.open(url, '', 'width=900, height=1000, top=50, left=50, scrollbars=yes');
    }
    function openChatbot() {
        window.open('chatbot/openChat', '', 'width=450, height=500, top=50, left=50, scrollbars=yes');
    }
</script>
<!-- // END Header -->
                    
