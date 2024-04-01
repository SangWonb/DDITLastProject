<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<style>
#attendSpace{
	width: 100%;
}
#attendTable{
	width: 100%;
	text-align: center;
}
table thead{
	background-color: LightCoral;	
}
table tbody{
	background-color: LavenderBlush;	
}

</style>
<div id="attendSpace">
<div>
	<span style="font-size: 15px; font-weight: 800;">출석:● |결석:X |조퇴:△ |지각:□ |공결:◎ </span>
</div>
	<table id="attendTable" border="1">
		<thead id="attendThead">
			
		</thead>
		<tbody id="attendTbody">
		</tbody>
		
	</table>
</div>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src='<c:url value="/resources/js/app/cyber/AttendP.js" />'></script>



















