<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<style>
	.contentBg {
		background-color: #d4d4d4;
	}
</style>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>community</title>

    <!-- Prevent the demo from appearing in search engines -->
    <meta name="robots" content="noindex">

    <title><tiles:getAsString name="title" /></title>
    <tiles:insertAttribute name="preScript" />
    <c:if test="${not empty message }">
        <script>
            alert("${message}");
        </script>
    </c:if>

</head>

<body class="layout-app has-drawer-opened" data-body-cpath="<%=request.getContextPath()%>">
    <div class="preloader" style="display: none;">
        <div class="sk-chase">
            <div class="sk-chase-dot"></div>
            <div class="sk-chase-dot"></div>
            <div class="sk-chase-dot"></div>
            <div class="sk-chase-dot"></div>
            <div class="sk-chase-dot"></div>
            <div class="sk-chase-dot"></div>
        </div>
    </div>

    <!-- Drawer Layout -->
    <div class="mdk-header-layout js-mdk-header-layout">
        <tiles:insertAttribute name="headerMenuMainPage" />
        <div class="mdk-drawer-layout__content page-content contentBg">
            <div><img src="" alt="" width="1" height="120"></div>

            <!-- Header -->
            <!-- // END Header -->

            <!-- // END BEFORE Page Content -->
            <div class="page-section">
                <div class="d-flex flex-column flex-lg-row align-items-center">
                    <div class="text-center">
                        <tiles:insertAttribute name="bodyCommunity" />
                    </div>
                    <div id="layout-content" class="container page__container">
                        <div class="page-section bg-alt border-bottom-2 card">
                            <tiles:insertAttribute name="contentPage" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <tiles:insertAttribute name="footerMenu" />

    <tiles:insertAttribute name="postScript" />

</body>

</html>