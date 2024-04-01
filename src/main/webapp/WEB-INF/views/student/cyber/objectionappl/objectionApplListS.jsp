<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<style>
#comTable{
	text-align: center;
}
#comTable tbody tr{
	height: 30px;
}
#comTable td{
	height: 30px;
}
.fontStyle{
	font-size: 15px;
	font-weight: 800;
}
</style>
<div>
	<div>
		<div class="card mb-lg-32pt">
	        <div class="table-responsive">
	            <table class="table mb-0 thead-border-top-0 table-nowrap" id="comTable">
	                <thead>
	                    <tr>
	                        <th style="width: 5%;"><a href="javascript:void(0)">NO</a></th>
	                        <th style="width: 10%"><a href="javascript:void(0)">분류</a></th>
	                        <th style="width: 45%;"><a href="javascript:void(0)">제목</a></th>
	                        <th style="width: 10%;"><a href="javascript:void(0)">날짜</a></th>
	                        <th style="width: 10%;"><a href="javascript:void(0)">상태</a></th>
	                        <th style="width: 10%"><a href="javascript:void(0)"></a></th>
	                        <th style="width: 10%"><a href="javascript:void(0)"></a></th>
	                    </tr>
	                </thead>
	                <tbody class="list" id="complaintList">
	                	
	            	</tbody>
	            </table>
	        </div>
	    </div>
	</div>
</div>
<div class="modal fade" id="complaintModal" tabindex="-1"
	aria-labelledby="complaintModal" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" style="width: 800px; height: 500px;">
			<div class="modal-header" style="height: 200px; width: 100%;">
				<div style="width: 93%; padding: 15px;">
					<table style="width: 80%;" style="font-size: 15px;" id="complaintTable">
						
					</table>
				</div>
				<div style="width: 7%;">
					<button type="button" id="complaintModalCloseBtn"
						class="btn btn-accent" class="close"
						onclick="$('#complaintModal').modal('hide');">
						<i class="material-icons">close</i>
					</button>
				</div>
			</div>
			<div class="modal-body" style="height: 300px; padding: 20px;">
				<div id="complainDeail" style="height: 250px; display: flex; justify-content: center; align-items:center; ">
				</div>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="comNoReasonModal" tabindex="-1"
	aria-labelledby="comNoReasonModal" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" style="width: 500px; height: 200px;">
			<div class="modal-header" style="height: 80px; width: 100%;">
				<div>
					<span class="fontStyle" style="font-size: 18px;">반려사유</span>
				</div>
				<div style="width: 20%; text-align: right;">
					<button type="button" id="complaintModalCloseBtn"
						class="btn btn-accent" class="close"
						onclick="$('#comNoReasonModal').modal('hide');">
						<i class="material-icons">close</i>
					</button>
				</div>
			</div>
			<div class="modal-body" style="height: 120px; padding: 15px;">
				<div id="comNoReason" style="height: 120px; display: flex; justify-content: center; align-items:center; ">
				</div>
			</div>
		</div>
	</div>
</div>
<form id="comDeleteForm" hidden="true" method="get" action='<c:url value="/student/cyber/${cyberLecCode}/objectionAppl/comDelete"/>'>
	<input type="hidden" name="cptNo"/>
</form>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src='<c:url value="/resources/js/app/cyber/objectApplS.js" />'></script>
<c:if test="${not empty success }">
	<c:if test="${success }">
		<script>
			Swal.fire({
		      title: '성공',
		      text: '성공하였습니다.',
		      icon: 'success'
		    });
		</script>
	</c:if>
	<c:if test="${not success }">
		<script>
			Swal.fire({
		      title: '실패',
		      text: '서버에러',
		      icon: 'error'
		    });
		</script>
	</c:if>
</c:if>
