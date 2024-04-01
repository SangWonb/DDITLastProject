<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<div class="d-flex justify-content-center" id="resultRecom"
	     style="margin-top: 30px; display: none; height: 200px;">
	     <c:if test="${not empty recom}"> 
		<table style="text-align: center;">
		   <thead>
		      <tr>
		         <th style="padding-right: 40px; padding-left: 40px;">1등</th>
		         <th style="padding-right: 40px; padding-left: 40px;">2등</th>
		         <th style="padding-right: 40px; padding-left: 40px;">3등</th>
		      </tr>
		   </thead>
		   <tbody>
		      <tr>
		            <td style="padding-right: 40px; padding-left: 40px;">${recom}</td>      
		            <td style="padding-right: 40px; padding-left: 40px;">이거 나중에 뭔가 나올겨${recom.second}</td>      
		            <td style="padding-right: 40px; padding-left: 40px;">이거 나중에 뭔가 나올겨${recom.second}</td>      
		      </tr>
		   </tbody>
		</table>
	</c:if>
</div>
 	
