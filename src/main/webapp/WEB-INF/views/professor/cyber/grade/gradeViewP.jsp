<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<style>
#gradeTable{
	text-align: center;
}
#gradeTable tbody tr{
	height: 30px;
}
#gradeTable td{
	height: 30px;
}

</style>
<div>
	<div>
		<div style="margin-bottom: 15px;">
			<button id="updateGradeBtn" type="button" class="btn btn-success">성적 산출</button>
		</div>
		<div class="card mb-lg-32pt">
	        <div class="table-responsive">
	            <table class="table mb-0 thead-border-top-0 table-nowrap" id="gradeTable">
	                <thead>
	                    <tr>
	                        <th style="width: 20px;"><a href="javascript:void(0)">NO</a></th>
	                        <th style="width: 80px;"><a href="javascript:void(0)">이름</a></th>
	                        <th style="width: 100px;"><a href="javascript:void(0)">학번</a></th>
	                        <th style="width: 100px;"><a href="javascript:void(0)">학과</a></th>
	                        <th style="width: 50px;"><a href="javascript:void(0)">출결</a></th>
	                        <th style="width: 50px;"><a href="javascript:void(0)">과제(팀플)</a></th>
	                        <th style="width: 50px;"><a href="javascript:void(0)">중간</a></th>
	                        <th style="width: 50px;"><a href="javascript:void(0)">기말</a></th>
	                        <th style="width: 50px;"><a href="javascript:void(0)">총점</a></th>
	                        <th style="width: 50px;"><a href="javascript:void(0)">등급</a></th>
	                        <th style="width: 50px;"><a href="javascript:void(0)">석차</a></th>
	                        <th style="width: 50px;"><a href="javascript:void(0)">백분율</a></th>
	                    </tr>
	                </thead>
	                <tbody class="list" id="leaves">
	                	
	            	</tbody>
	            </table>
	        </div>
	        <div class="card-footer p-8pt" id="pagingArea">
	
	        </div>
	    </div>
	</div>
</div>
<form id="searchForm" hidden="true" method="get" action='<c:url value="/professor/cyber/${cyberLecCode}/grade/gradeList"/>'>
	<input type="hidden" name="page" />
</form>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
//강의 목록 비동기로 가져오는 내용(페이징처리)
$(searchForm).on("submit", function(event){
	event.preventDefault();
	
	let form = this;
	let url = form.action;
	let method = form.method;
	let data = $(form).serialize(); //fetch에서는 사용 불가 //ajax는 formdata 사용가능
	let $leaves = $(leaves);
	let $pagingArea = $(pagingArea);
	
	$.ajax({
		url:url
		, method:method
		, data : data
		, dataType : "json"
		, success:function(jsonObj){
			$leaves.empty();
			$pagingArea.empty();
			
			let dataList = jsonObj.gradeList;
			let lecturePlan = jsonObj.lecturePlan;
			let attendF = jsonObj.attendF;
			let pagingHTML = jsonObj.pagingHTML;
			
			let trTags = null;
			
			if(dataList.length > 0){
				$.each(dataList, function(index, g){ //jquery 아닐떄 >> dataList.forEach(function(member)
					if(g.lgcAttend){
						
						var attendS = g.lgcAttend;
						if (parseInt(g.lgcAttend) <= parseInt(attendF)) {
						    attendS = "F";
						}
						
						trTags += `
	                        <tr class="stuTr" data-lec-code="\${g.lecCode }" data-smem-no="\${g.smemNo }">
		                        <td style="width: 20px;"><small>\${g.rnum }</small></td>
		                        <td style="width: 80px;"><small>\${g.memName }</small></td>
		                        <td style="width: 100px;"><small>\${g.smemNo }</small></td>
		                        <td style="width: 100px;"><small>\${g.deptName }</small></td>
		                        <td style="width: 50px;"><small>\${attendS }/\${lecturePlan.lpAttendRef}</small></td>
		                        <td style="width: 50px;"><small>\${g.lgcTask }/\${lecturePlan.lpTaskRef}</small></td>
		                        <td style="width: 50px;"><small>\${g.lgcMidterm }/\${lecturePlan.lpTestRef / 2}</small></td>
		                        <td style="width: 50px;"><small>\${g.lgcFinal }/\${lecturePlan.lpTestRef / 2}</small></td>
		                        <td style="width: 50px;"><small>\${g.lgcTotalscore }</small></td>
		                        <td style="width: 50px;"><small>\${g.lgcGrade }</small></td>
		                        <td style="width: 50px;"><small>\${g.lgcRanking }</small></td>
		                        <td style="width: 50px;"><small>\${g.lgcPercent }%</small></td>
		                    </tr>
						`;
					}else{
						trTags += `
	                        <tr data-lec-code="\${g.lecCode }" data-smem-no="\${g.smemNo }">
		                        <td style="width: 20px;"><small>\${g.rnum }</small></td>
		                        <td style="width: 80px;"><small>\${g.memName }</small></td>
		                        <td style="width: 100px;"><small>\${g.smemNo }</small></td>
		                        <td style="width: 100px;"><small>\${g.deptName }</small></td>
		                        <td style="width: 50px;"><small>-</small></td>
		                        <td style="width: 50px;"><small>-</small></td>
		                        <td style="width: 50px;"><small>-</small></td>
		                        <td style="width: 50px;"><small>-</small></td>
		                        <td style="width: 50px;"><small>-</small></td>
		                        <td style="width: 50px;"><small>-</small></td>
		                        <td style="width: 50px;"><small>-</small></td>
		                        <td style="width: 50px;"><small>-</small></td>
		                    </tr>
						`;
						
					}
						
				});
			}else{
				trTags = `
					<tr>
						<td colspan="12">정보가 없습니다.</td>
					</tr>
				`;
			}
			
			$leaves.append(trTags);
			$pagingArea.append(pagingHTML);
			
		}, error : function(jqXHR, txt, status){
			console.log(txt, status, jqXHR);
		}
	}).done(()=>{ //fetch의 filnally와 같은놈. 
		$(this).find("input[name='page']").val("");
	});
	return false;
}).submit(); //초기값 !! 페이지 로딩하자마다 바로 실행됨

//성적 산출
$("#updateGradeBtn").on("click",function(event){
	$.ajax({
		url: window.location.pathname + "/updateGrade"
		, method:"get"
		, dataType : "json"
		, success:function(jsonObj){
			if(jsonObj.success){
				Swal.fire({
			      title: '성공',
			      text: '성적 산출이 완료되었습니다.',
			      icon: 'success'
			    });				
			}else{
				Swal.fire({
			      title: '실패',
			      text: '서버에러',
			      icon: 'error'
			    });				
			}
			$(searchForm).submit();			
		}, error : function(jqXHR, txt, status){
			console.log(txt, status, jqXHR);
		}
	});
});


//성적 상세 조회
$(document).on("click",".stuTr", function(event){
	
	var target = $(event.target).closest(".stuTr");
	var lecCode = target.data("lecCode");
	var smemNo = target.data("smemNo");
	window.location.href = window.location.pathname + "/detail?smemNo="+smemNo;
});








</script>