<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>

<style>
 	body { 
	    font-family: 'Gungsuh', sans-serif;
 	} 
    .container {
    	font-family: 'Gungsuh', sans-serif;
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
    	font-size: 40px;
    	text-align: center;
    }
    
    .bodytext{
    	margin-top: 120px;
    	margin-bottom: 120px;
    	font-size: 22px;
    	text-align: left;
    }
    
    .footertext{
    	font-size: 30px;
    	font-weight: bold;
    	text-align: center;
    }
    
    .footerdate{
    	margin-top: 90px;
    	margin-bottom: 30px;
    	font-size: 26px;
    	text-align: center;
    }
    
    .textfooter{
		font-size: 38px;
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
	.trT {
		text-align: center;
	}
	.fmtCnt {
		text-align: right;
	}

</style>
</head>
<body>
<c:forEach items="${gno }" var="g">
	<div class="container">
		<div style="margin-top: 10px;">${g.crtfGno }</div>
	    <h1 class="hedtext">교육비납입증명서</h1>
	    
	    <!-- 이미지 표시 -->
	    <div class="image-container">
	        <img src="${pageContext.request.contextPath}/resources/images/logo/logo_op.png" alt="Watermark" class="watermark">
	    </div>
	    
	    <div class="bodytext">
	        <p>학&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;과 : ${stuRecord[0].deptName }</p>
	        <p>학&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;번 : ${stuRecord[0].smemNo }</p>
	        <p>생&nbsp;&nbsp;년&nbsp;&nbsp;월&nbsp;&nbsp;일 : ${stuRecord[0].bas }</p>
	        <p>성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명 : ${stuRecord[0].memName }</p>
	        <p>납&nbsp;&nbsp;부&nbsp;&nbsp;일&nbsp;&nbsp;자 : ${stuRecord[0].endate }</p>
	        <table>
	        	<tr>
	        		<td colspan="2" class="trT">구분</td>
	        		<td class="trT">금액</td>
	        	</tr>
	        	<tr>
	        		<td rowspan="4" class="trT">등록금</td>
	        		<td class="trT">기성회비</td>
	        		<td class="fmtCnt">
	        			<fmt:formatNumber value="${stuRecord[0].enrlMf }" pattern="#,###,###"/>
	        		</td>
	        	</tr>
	        	<tr>
	        		<td class="trT">기본수업료</td>
	        		<td class="fmtCnt">
	        			<fmt:formatNumber value="${stuRecord[0].enrlTf }" pattern="#,###,###"/>
	        		</td>
	        	</tr>
	        	<tr>
	        		<td class="trT">실습비</td>
	        		<td class="fmtCnt">
	        			<fmt:formatNumber value="${stuRecord[0].enrlIf }" pattern="#,###,###"/>
	        		</td>
	        	</tr>
	        	<tr>
	        		<td class="trT">재료비</td>
	        		<td class="fmtCnt">
	        			<fmt:formatNumber value="${stuRecord[0].enrlMc }" pattern="#,###,###"/>
	        		</td>
	        	</tr>
	        	<tr>
	        		<td class="trT">합계</td>
	        		<td colspan="2" class="fmtCnt">
	        			<fmt:formatNumber value="${stuRecord[0].enrlTotal }" pattern="#,###,###"/>
	        		</td>
	        	</tr>
	        </table>
	    </div>
	
	    <div class="bodytwo">
	        <p class="footertext">위 의&nbsp; 같 이&nbsp; 교 육 비 를 <br> 납 입 하 였 음 을 &nbsp; 증 명 합 니 다.</p>
	        <p class="footerdate">${stuRecord[0].today }</p>
			<h1 class="textfooter">한 국 인 재 대 학 교 총 장</h1>
			<img src="${pageContext.request.contextPath}/resources/images/logo/stamp.png" alt="stamp" class="stamp">
	    </div>
	</div>
</c:forEach>
<script>
	print();
</script>
</body>
</html>