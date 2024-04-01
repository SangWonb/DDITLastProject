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
	                        <th style="width: 10%;"><a href="javascript:void(0)">이름</a></th>
	                        <th style="width: 10%;"><a href="javascript:void(0)">학번</a></th>
	                        <th style="width: 10%"><a href="javascript:void(0)">학과</a></th>
	                        <th style="width: 10%"><a href="javascript:void(0)"></a></th>
	                    </tr>
	                </thead>
	                <tbody class="list" id="complaintList">
	                	
	            	</tbody>
	            </table>
	        </div>
	        <div class="card-footer p-8pt" id="pagingArea">
	
	        </div>
	    </div>
	</div>
</div>
<form id="searchForm" hidden="true" method="get" action='<c:url value="/professor/cyber/${cyberLecCode}/objectionAppl/comListData"/>'>
	<input type="hidden" name="page" />
</form>
<div class="modal fade" id="complaintModal" tabindex="-1"
	aria-labelledby="complaintModal" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" style="width: 800px; height: 530px;">
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
			<div class="modal-body" style="height: 330px; padding: 20px;">
				<div id="complainDeail" style="height: 250px; display: flex; justify-content: center; align-items:center; ">
				</div>
				<div id="dataInfo">
				</div>
				<div style="height: 50px; width: 100%; text-align: right;">
					<button type="button" id="comOk" class="btn btn-success" onclick="$('#comOkModal').modal('show');">승인</button>
					<button type="button" id="comNo" class="btn btn-danger"  onclick="$('#comNoModal').modal('show');">반려</button>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="comOkModal" tabindex="-1" aria-labelledby="comOkModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="position: absolute; top: 450px; right: 200px;"> <!-- 임의의 위치에 배치 -->
        <div class="modal-content" style="width: 300px; height: 150px;">
            <div class="modal-body" style="height: 100px; display: flex; flex-direction: column; justify-content: center; align-items: center;">
                <div id="comOkDetail">
                </div>
                <div style="width: 100%; height:50px; margin-top: 10px; text-align: right;">
                    <button type="button" id="comOkBtn" class="btn btn-success" onclick="$('#comOkModal').modal('hide');">확인</button>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="comNoModal" tabindex="-1" aria-labelledby="comNoModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="position: absolute; top: 450px; right: 200px;"> 
        <div class="modal-content" style="width: 300px; height: 150px;">
            <div class="modal-body" style="height: 100px; display: flex; flex-direction: column; justify-content: center; align-items: center;">
                <div id="comNoDetail">
                	<div>
                		<span>반려사유</span>
                	</div>
                	<div>
	                	<input type="text" id="comNoReason" style="width: 250px;"/>                	
                	</div>
                </div>
                <div style="width: 100%; height: 50px; margin-top: 10px; text-align: right;">
                    <button type="button" id="comNoBtn" class="btn btn-success" onclick="$('#comNoModal').modal('hide');">확인</button>
                </div>
            </div>
        </div>
    </div>
</div>
<form id="comOkForm" hidden="true" method="post" action='<c:url value="/professor/cyber/${cyberLecCode}/objectionAppl/comOk"/>'>
	<input name="cptNo" type="hidden"/>
	<input name="cptType" type="hidden"/>
	<input name="smemNo" type="hidden"/>
	
	<!-- 출석 -->
	<input name="atNo" type="hidden"/>
	<input name="atCode" type="hidden"/>
	
	<!-- 과제 -->
	<input name="taskCode" type="hidden"/>
	<input name="taskScore" type="hidden"/>
	
	<!-- 팀플 -->
	<input name="teamNo" type="text"/>
	<input name="teamproScore" type="hidden"/>
</form>
<form id="comNoForm" hidden="true" method="post" action='<c:url value="/professor/cyber/${cyberLecCode}/objectionAppl/comNo"/>'>
	<input name="cptNo" type="hidden"/>
	<input name="appReject" type="hidden"/>
</form>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src='<c:url value="/resources/js/app/cyber/objectApplP.js" />'></script>
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
