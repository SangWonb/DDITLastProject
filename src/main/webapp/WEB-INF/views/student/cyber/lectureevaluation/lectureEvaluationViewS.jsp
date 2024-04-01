<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<style>
#evalPage{
	width: 100%;
}
#evalTableSpace{
	width: 80%;
	background: white;
	height: 540px;
	margin: 0 auto;
	padding: 40px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); 
}
#evalTable{
	width: 90%; 
	margin: 0 auto;
}
#evalTable thead{
	text-align: center;
	background-color: PowderBlue;
}
#evalTable tbody{
	font-size: 13px;
	background-color: Azure;
}
#evalTable tbody td{
	text-align: center;
	padding: 5px 0;
}
.radioType{
	width: 15px;
	height: 15px;
}
</style>

<div id="evalPage" data-lec-code="${cyberLecCode }">
	<div id="evalTableSpace">
		<div style="width: 95%; text-align: right;">
			<span>시연데이터</span><input type="checkbox" id="lecEvalCom"/>
		</div>
		<table id="evalTable" border="1">
			<thead>
				<tr>
					<th style="width: 60%;" rowspan="2">강의평가 내용</th>
					<th style="width: 8%;">전혀<br>그렇지않다</th>
					<th style="width: 8%;">그렇지않다</th>
					<th style="width: 8%;">보통이다</th>
					<th style="width: 8%;">그런편이다</th>
					<th style="width: 8%;">매우<br>그렇다</th>
				</tr>
				<tr>
					<th style="width: 8%; font-size: 15px;">①</th>
					<th style="width: 8%; font-size: 15px;">②</th>
					<th style="width: 8%; font-size: 15px;">③</th>
					<th style="width: 8%; font-size: 15px;">④</th>
					<th style="width: 8%; font-size: 15px;">⑤</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty lscList }">
					<c:forEach items="${lscList }" var="lsc">
						<tr>
							<th>${lsc.lsContent }</th>
							<td><input type="radio" class="radioType" name="${lsc.lsNo }" value="1" data-ls-type="${lsc.lsType }"/></td>
							<td><input type="radio" class="radioType" name="${lsc.lsNo }" value="2" data-ls-type="${lsc.lsType }"/></td>
							<td><input type="radio" class="radioType" name="${lsc.lsNo }" value="3" data-ls-type="${lsc.lsType }"/></td>
							<td><input type="radio" class="radioType" name="${lsc.lsNo }" value="4" data-ls-type="${lsc.lsType }"/></td>
							<td><input type="radio" class="radioType" name="${lsc.lsNo }" value="5" data-ls-type="${lsc.lsType }"/></td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty lscList }">
					<td colspan="6">평가 내용이 없습니다.</td>
				</c:if>
			</tbody>
		</table>
		<div style="width: 100%; text-align: center; margin-top: 20px;">
			<button type="button" id="evaluationSubmit" style="width: 200px; height: 40px; background-color: LightSeaGreen; border-color: CadetBlue;" class="btn btn-accent btn-lg">평가제출</button>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
const cpath = $("body").data("bodyCpath");
const cyberLecCode = $("#evalPage").data("lecCode");
$("#evaluationSubmit").on("click",function(event){
	
	$.ajax({
		url:window.location.pathname + "/LSCData"
		, method:"get"
		, dataType : "json"
		, success:function(jsonObj){
			var submit = true;
			var lscList = jsonObj.lscList;	
			var evalDataList = [];
			$.each(lscList, function(index, lsc){
				
				var lsNo = lsc.lsNo;
				var satis = $(`[name="\${lsNo}"]:checked`).val();
				var lsType = $(`[name="\${lsNo}"]:checked`).data("lsType");
				
				if(!satis){
					submit = false;
				}
				
				evalData = {
					"lsNo" : lsNo,
					"lsType" : lsType,
					"satis" : satis
				};
				
				evalDataList.push(evalData);

			});
			
			if(!submit){
				alert("평가를 모두 끝마쳐주세요.");
				return;
			}else{
				
				$.ajax({
					url:window.location.pathname + "/LSCSubmit"
					, method:"post"
					, data:JSON.stringify(evalDataList)
					, dataType : "json"
					, contentType: "application/json"
					, success:function(jsonObj){
						if(jsonObj.success){
							Swal.fire({
								  title: '성공',
								  text: '제출완료',
								  icon: 'success',
							}).then((result) => {
							  if (result.isConfirmed) {
							    window.location.href = cpath + "/student/cyber/"+ cyberLecCode +"/lectureevaluation";
							  }
							});
						}else{
							Swal.fire({
						      title: '실패',
						      text: '서버에러',
						      icon: 'error'
						    });
						}
						
					}, error : function(jqXHR, txt, status){
						console.log(txt, status, jqXHR);
					}
				});
				
			}
			
		}, error : function(jqXHR, txt, status){
			console.log(txt, status, jqXHR);
		}
	});
	
});
$("#lecEvalCom").on("change", function(){
	$("#evalTable").find('.radioType[value="5"]').prop('checked',true);
});
</script>