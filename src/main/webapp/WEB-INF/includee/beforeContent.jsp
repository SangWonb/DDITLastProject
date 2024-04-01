<%@page import="org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
 <h2 class="mb-0">${contentTitle }</h2>

<c:set var="requestURL" value="${requestScope[RequestMappingHandlerMapping.BEST_MATCHING_PATTERN_ATTRIBUTE] }" />
<c:set var="array" value="${fn:split(requestURL, '/') }"/>
<ol class="breadcrumb p-0 m-0">
	<c:forEach items="${array }" var="step">
	<li class="breadcrumb-item">${step }</li>
	</c:forEach>
<!-- 	<li class="breadcrumb-item"><a href="index.html">Home</a></li> -->

<!-- 	<li class="breadcrumb-item active">통합정보시스템(학생)</li> -->
</ol>
