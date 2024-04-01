<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en"
      dir="ltr">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible"
              content="IE=edge">
        <meta name="viewport"
              content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Login</title>

        <!-- Prevent the demo from appearing in search engines -->
        <meta name="robots"
              content="noindex">

       <title><tiles:getAsString name="title"/> </title>
		<tiles:insertAttribute name="preScript"/>
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

        <div class="mdk-drawer-layout js-mdk-drawer-layout"
             data-push
             data-responsive-width="992px">
            <div class="mdk-drawer-layout__content page-content">

                <!-- Header -->
				
				<!-- Navbar -->
				                
				<!-- // END Navbar -->
				
				<!-- // END Header -->

			<!-- // END BEFORE Page Content -->
			<div class="page-section">
				<div class="container page__container">
					<tiles:insertAttribute name="contentPage" />
				</div>
			</div>
		</div>

            <!-- // END drawer-layout__content -->

            <!-- Drawer -->

            <!-- // END Drawer -->

        </div>

        <!-- // END Drawer Layout -->

        <tiles:insertAttribute name="postScript" />
    </body>

</html>