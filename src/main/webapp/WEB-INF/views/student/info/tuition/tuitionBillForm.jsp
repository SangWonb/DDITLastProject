<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>

<style>
 	body { 
	    font-family: 'Gungsuh', sans-serif;
 	} 
    .container {
    	font-family: 'Gungsuh', sans-serif;
/*         text-align: center; */
        width: 21cm; /* A4 사이즈 너비 */
        min-height: 29.7cm; /* A4 사이즈 높이 */
        padding: 2cm; /* 여백 */
        margin: 1cm auto; /* 가운데 정렬 */
        border: 1px solid #D3D3D3; /* 테두리 */
        border-radius: 5px; /* 둥근 테두리 */
    }
    .hedtext {
    	
    }
    .image-container {
    	text-align: center;
    	justify-content: center;
        display: inline-block;
        position: relative;
    	top: 50%;
    	left: 50%;
    	transform: translate(-50%, -50%);
    	z-index: -1; /* 이미지를 맨 뒤로 배치 */
    }
    .watermark {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, 50%);
        opacity: 0.1; /* 워터마크 투명도 조절 */
    }
    
    table {
        width: 100%;
        border-collapse: collapse;
    }
    th, td {
        border: 1px solid #dddddd;
        padding: 8px;
        text-align: left;
    }
    
    .hedtext{
    	font-size: 48px;
    	text-align: center;
    }
    
/*     .bodytext{ */
/*     	margin-top: 140px; */
/*     	margin-bottom: 140px; */
/*     	font-size: 26px; */
/*     	text-align: left; */
/*     } */
    
    .footertext{
    	font-size: 34px;
    	font-weight: bold;
    	text-align: center;
    }
    
    .footerdate{
    	margin-top: 90px;
    	margin-bottom: 140px;
    	font-size: 26px;
    	text-align: center;
    }
    
    .textfooter{
		font-size: 48px;
		display: inline-block;
		text-align: center;
    }
    .bodytwo{
    	text-align: center;
    }
    
    .stamp {
	    vertical-align: middle; /* 이미지를 텍스트의 가운데로 정렬 */
	    margin-left: -60px; /* 이미지와 텍스트 사이 여백 조절 */
	    position: relative; /* 절대 위치 지정을 위해 필요 */
    	z-index: -1; /* 다른 요소들보다 뒤에 위치하도록 설정 */
	}
    .bodytext {
        display: inline-block; /* 표를 가로로 나열합니다. */
    }
</style>
</head>
<body>

<div class="container">
   <p></p>
    <h1 class="hedtext">등록금 납부확인서</h1>
    
    <!-- 이미지 표시 -->
    <div class="image-container">
<%--         <img src="${pageContext.request.contextPath}/resources/images/logo/logo_op.png" alt="Image" class="image"> --%>
        <img src="${pageContext.request.contextPath}/resources/images/logo/logo_op.png" alt="Watermark" class="watermark">
    </div>
    <table class="bodytext">
    <thead>
    	<tr>
    		<th>성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명</th>
    		<td colspan="4" style="text-align: center;">${memName }</td>
    	</tr>
    	<tr>
    		<th>학&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;번</th>
    		<td colspan="4" style="text-align: center;">${memNo }</td>
    	</tr>
    	<tr>
    		<th>학&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;과</th>
    		<td colspan="4" style="text-align: center;">${deptName }</td>
    	</tr>
    	<tr>
    		<th>년&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;도</th>
    		<td colspan="2" style="text-align: center;">${enrollInvoice.year} 년도</td>
    		<th>학&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;기</th>
    		<td colspan="2" style="text-align: center;">${enrollInvoice.semester } 학기</td>
    	</tr>
    </thead>
    <tbody >
    	<tr>
    		<th>구&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;분</th>
    		<th>고&nbsp;&nbsp;지&nbsp;&nbsp;금&nbsp;&nbsp;액</th>
    		<th>장&nbsp;&nbsp;학&nbsp;&nbsp;금&nbsp;&nbsp;액</th>
    		<th>납&nbsp;&nbsp;입&nbsp;&nbsp;금&nbsp;&nbsp;액</th>
    		<th>비&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;고</th>
    	</tr>
    	<tr>
    		<th>기&nbsp;본&nbsp;수&nbsp;업&nbsp;료</th>
    		<th style="text-align: right;">${enrollInvoice.enrlTf } 원</th>
    		<th style="text-align: right;">${enrollInvoice.scholAmt} 원</th>
    		<th style="text-align: right;">${enrollInvoice.real2} 원</th>
    		<th></th>
    	</tr>
    	<tr>
    		<th style="text-align: right;">기&nbsp;&nbsp;성&nbsp;&nbsp;회&nbsp;&nbsp;비</th>
    		<th style="text-align: right;">${enrollInvoice.enrlMf} 원</th>
    		<th style="text-align: right;">0 원</th>
    		<th style="text-align: right;">${enrollInvoice.enrlMf} 원</th>
    		<th></th>
    	</tr>
    	<tr>
    		<th style="text-align: right;">실&nbsp;&nbsp;&nbsp;&nbsp;습&nbsp;&nbsp;&nbsp;&nbsp;비</th>
    		<th style="text-align: right;">${enrollInvoice.enrlIf} 원</th>
    		<th style="text-align: right;">0 원</th>
    		<th style="text-align: right;">${enrollInvoice.enrlIf} 원</th>
    		<th></th>
    	</tr>
    	<tr>
    		<th style="text-align: right;">재&nbsp;&nbsp;&nbsp;&nbsp;료&nbsp;&nbsp;&nbsp;&nbsp;비</th>
    		<th style="text-align: right;">${enrollInvoice.enrlMc} 원</th>
    		<th style="text-align: right;">0 원</th>
    		<th style="text-align: right;">${enrollInvoice.enrlMc} 원</th>
    		<th></th>
    	</tr>
    	<tr>
    		<th style="text-align: right;">총&nbsp;&nbsp;&nbsp;&nbsp;합&nbsp;&nbsp;&nbsp;&nbsp;계</th>
    		<th style="text-align: right;" colspan="3">${enrollInvoice.real} 원</th>
    		<th></th>
    	</tr>
    	<tr>
    		<th style="text-align: right;">납&nbsp;&nbsp;&nbsp;&nbsp;부&nbsp;&nbsp;&nbsp;&nbsp;일</th>
    		<th style="text-align: right;" colspan="3">${fn:substring(enrollInvoice.enrlDate, 0, 10)}</th>
    		<th></th>
    	</tr>
    	<tr>
    	</tr>
	</tbody>
</table>
    <div class="bodytwo">
        <p class="footertext">위 와 같 이&nbsp; 납 부 내 역 을&nbsp; 고 지 합 니 다.</p>
      <h1 class="textfooter">한 국 인 재 대 학 교 총 장</h1>
      <img src="${pageContext.request.contextPath}/resources/images/logo/stamp.png" alt="stamp" class="stamp">
    </div>
</div>
<script>
	print();
	document.addEventListener("DOMContentLoaded", ()=>{
		fetch("", {
			method:"post",
			headers:{
				"accept":"text/plain",
				"Content-type":"text/plain"
			},body:document.documentElement.outerHTML
		}).then(resp=>resp.text())
		.then(attrName=>console.log(attrName))
	});
</script>
</body>
</html>