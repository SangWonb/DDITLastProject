<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<style>
#ceriteriaInfo{
	width: 800px;
	height: 80px;
	border-radius: 20px;
	background-color: LightSteelBlue;
	margin-bottom: 15px;
	padding: 15px;
	padding-left: 30px;
}
#ceriteriaEditSpace{
	width: 800px;
	height: 300px;
	border-radius: 20px;
	background-color: white;
	margin-bottom: 15px;
	padding: 30px;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
}
.fontStyle{
	font-size: 18px;
	font-weight: 800;
}
.divStyle{
	margin: 5px;
}
.tagStyle{
	width: 70px;
}
#editBtn{
	margin-left: 730px;
}
#updateBtn{
	margin-left: 730px;
}
</style>
<div>
	<div id="ceriteriaInfo">
		<span style="font-size: 18px; font-weight: 800;">출석률 계산</span><br>
		<span id="infoSpan">출석률 = [{ (출석*<span class="출석"></span>) + (공결*<span class="공결"></span>) + (결석*<span class="결석"></span>) + (조퇴*<span class="조퇴"></span>) + (지각*<span class="지각"></span>) } / 수업일수 ] * 100</span><br>
	</div>
	
	<div id="ceriteriaEditSpace">
	</div>
	
	<div id="btnArea">
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>

var attendCriteria = "";
function getData(){
	
	$.ajax({
		url:window.location.pathname + "/attendCriteriaData"
		, method:"get"
		, dataType : "json"
		, success:function(jsonObj){
			
			var tag =`
				<div class="divStyle">
					<span class="fontStyle">출석(공결) <span id="출석" class="tagStyle"></span> 인정</span>
				</div>
				<div class="divStyle">
					<span class="fontStyle">결석 <span id="결석" class="tagStyle"></span> 인정</span>
				</div>
				<div class="divStyle">
					<span class="fontStyle">조퇴 <span id="조퇴" class="tagStyle"></span> 인정</span>
				</div>
				<div class="divStyle">
					<span class="fontStyle">지각 <span id="지각" class="tagStyle"></span> 인정</span>
				</div>
				<span class="fontStyle">출석률 <span id="F"></span> 이하는 F로 처리합니다.</span>
			`;
			
			$("#ceriteriaEditSpace").empty();
			$("#ceriteriaEditSpace").append(tag);
			
			
			attendCriteria = jsonObj.attendCriteria;
			$.each(attendCriteria, function(index, atc){
				
				$(`#\${atc.atcCode}`).empty();
				$(`#\${atc.atcCode}`).append(atc.atcPercent + "%");
				
				$(`.\${atc.atcCode}`).empty();
				$(`.\${atc.atcCode}`).append(atc.atcPercent/100);
				
			});
			
			var btnTag = `
				<button type="button" id="editBtn" class="btn btn-primary">수정</button>	
			`;
			
			$("#btnArea").empty();
			$("#btnArea").append(btnTag);
			
		}, error : function(jqXHR, txt, status){
			console.log(txt, status, jqXHR);
		}
	});
}
getData();
$(document).on("click","#editBtn",function(event){
	
	var optionTag = `
		<option value="0">0%</option>
		<option value="10">10%</option>
		<option value="20">20%</option>
		<option value="30">30%</option>
		<option value="40">40%</option>
		<option value="50">50%</option>
		<option value="60">60%</option>
		<option value="70">70%</option>
		<option value="80">80%</option>
		<option value="90">90%</option>
		<option value="100">100%</option>
	`;
	
	var editTag = `
		<div class="divStyle">
			<span class="fontStyle">출석(공결) 
			<select id="출석" class="tagStyle">
			\${optionTag}
			</select>
			 인정</span>
		</div>
		<div class="divStyle">
			<span class="fontStyle">결석 
			<select id="결석" class="tagStyle">
			\${optionTag}
			</select>
			 인정</span>
		</div>
		<div class="divStyle">
			<span class="fontStyle">조퇴 
			<select id="조퇴" class="tagStyle">
			\${optionTag}
			</select>
			 인정</span>
		</div>
		<div class="divStyle">
			<span class="fontStyle">지각 
			<select id="지각" class="tagStyle">
			\${optionTag}
			</select>
			 인정</span>
		</div>
		<span class="fontStyle">출석률 
		<select id="F" class="tagStyle">
		\${optionTag}
		</select>
		이하는 F로 처리합니다.</span>
	`;
	
	$("#ceriteriaEditSpace").empty();
	$("#ceriteriaEditSpace").append(editTag);
	
	$.each(attendCriteria, function(index, atc){
		
		$(`#\${atc.atcCode}`).val(atc.atcPercent);
		
	});
	
	var btnTag = `
		<button type="button" id="updateBtn" class="btn btn-success">적용</button>	
	`;
	
	$("#btnArea").empty();
	$("#btnArea").append(btnTag);
	
});

$(document).on("click","#updateBtn",function(event){
	
	var dataList = [];
	
	$.each(attendCriteria, function(index, atc){
		
		var atcPercent = $(`#\${atc.atcCode}`).val();
		var data = {
			"atcCode" : atc.atcCode,
			"atcPercent" : atcPercent
		};
		dataList.push(data);
	});
	
	$.ajax({
	    url: window.location.pathname + "/attendCriteriaDataEdit",
	    method: "POST",
	    data: JSON.stringify(dataList),
	    dataType: "json",
	    contentType: "application/json",
	    success: function(jsonObj) {
			
			if(jsonObj.success){
				Swal.fire({
			      title: '수정 성공',
			      text: "수정되었습니다.",
			      icon: 'success'
			    });
				getData();
			}else{
				Swal.fire({
			      title: '수정 실패',
			      text: "서버에러",
			      icon: 'error'
			    });
			}
	    },
	    error: function(jqXHR, textStatus, errorThrown) {
	        console.error("AJAX 오류:", textStatus, errorThrown);
	    }
	});
	
	
});
</script>









