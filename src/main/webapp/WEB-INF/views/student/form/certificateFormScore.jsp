<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
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
    	font-size: 48px;
    	text-align: center;
    }
    
    .bodytext{
    	margin-top: 140px;
    	margin-bottom: 140px;
    	font-size: 26px;
    	text-align: left;
    }
    
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

</style>
</head>
<body>

<c:forEach items="${gno }" var="g">
	<div class="container">
		<div style="margin-top: 10px;">${g.crtfGno }</div>
	    <h1 class="hedtext">성적증명서</h1>
	    
	    <!-- 이미지 표시 -->
	    <div class="image-container">
	        <img src="${pageContext.request.contextPath}/resources/images/logo/logo_op.png" alt="Watermark" class="watermark">
	    </div>
	    
	    <div class="bodytext">
	        <table>
	        	<tr>
	        		<td>학&nbsp;과</td><td>${stuRecord[0].deptName }</td>
	        		<td>학&nbsp;번</td><td>${stuRecord[0].smemNo }</td>
	        	</tr>
	        	<tr>
	        		<td>생년월일</td><td>${stuRecord[0].bas }</td>
	        		<td>입&nbsp;학</td><td>${stuRecord[0].stdate }</td>
	        	</tr>
	        	<tr>
	        		<td>성&nbsp;명</td><td>${stuRecord[0].memName }</td>
	        		<td>졸&nbsp;업</td><td>${stuRecord[0].endate }</td>
	        	</tr>
	        	<tr>
	        		<td>구분</td><td>교과목명</td><td>학점</td><td>성적</td>
	        	</tr>
	        	<tr>
	        		<td>전공필수</td><td>소프트웨어공학기초</td><td>4</td><td>90</td>
	        	</tr>
	        	<tr>
	        		<td>전공선택</td><td>컴퓨터활용능력</td><td>3.5</td><td>85</td>
	        	</tr>
	        	<tr>
	        		<td>교양필수</td><td>영어회화중급</td><td>4.5</td><td>100</td>
	        	</tr>
	        	<tr>
	        		<td>교양선택</td><td>기계학습의 이해</td><td>4</td><td>90</td>
	        	</tr>
	        </table>
	    </div>
	
	    <div class="bodytwo">
	        <p class="footertext">위 의&nbsp; 사 실 을&nbsp; 증 명 합 니 다.</p>
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