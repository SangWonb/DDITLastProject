<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<style>
    table {
        text-align: center;
        table-layout: fixed;
        width: 100%; 
    }

    #restRVData::-webkit-scrollbar {
        display: none;
    }

    .pagination-container {
        text-align: right;
    }
    btn {
        margin-top: 10px;
    }
    form {
        margin-top: 10px;
    }

    .table th,
    .table td {
        width: 20%; 
        font-size: 14px; 
    }

    .bodyTitle {
        width: 40%; 
        font-size: 14px;
    }

    .footerText {
        font-weight: bold;
        color: blue;
        font-size: 25px; 
    }
    .pass {
        color: blue;
        font-weight: bold;
    }

    .fail {
        color: red;
        font-weight: bold;
    }
</style>
<div class="page-separator">
    <div class="page-separator__text">졸업요건항목</div>
</div>

<div id="bookList">
    <!-- 도서 목록 테이블 -->
    <table class="table table-bordered bg-white">
        <thead>
            <tr>
                <th colspan="2">구분</th>
                <th>기준학점</th>
                <th>이수학점</th>
                <th>판정</th>
            </tr>
        </thead>
    
        <tbody class="list" id="listBody">
            <tr>
                <td rowspan="3">전공</td>
                <td>전공필수</td>
                <td>${depcord.deptMrc }</td>
                <td>${stuRecord.stuMnl }</td>
                <td>${stuRecord.stuMnl >= depcord.deptMrc ? '합격' : '불합격'}</td>
            </tr>
            <tr>
                <td>전공선택</td>
                <td>${depcord.deptMoc }</td>
                <td>${stuRecord.stuMcl }</td>
                <td>${stuRecord.stuMcl >= depcord.deptMoc ? '합격' : '불합격'}</td>
            </tr>
            <tr>
                <td>소계</td>
                <td>${depcord.totalMrScore }</td>
                <td>${stuRecord.totalMScore }</td>
                <td>${stuRecord.totalMScore >= depcord.totalMrScore ? '합격' : '불합격'}</td>
            </tr>
            <tr>
                <td rowspan="3">교양</td>
                <td>교양필수</td>
                <td>${depcord.deptCrc }</td>
                <td>${stuRecord.stuCnl }</td>
                <td>${stuRecord.stuCnl >= depcord.deptCrc ? '합격' : '불합격'}</td>
            </tr>
            <tr>
                <td>교양선택</td>
                <td>${depcord.deptCoc }</td>
                <td>${stuRecord.stuCcl }</td>
                <td>${stuRecord.stuCcl >= depcord.deptCoc ? '합격' : '불합격'}</td>
            </tr>
            <tr>
                <td>소계</td>
                <td>${depcord.totalCrScore }</td>
                <td>${stuRecord.totalFScore }</td>
                <td>${stuRecord.totalFScore >= depcord.totalCrScore ? '합격' : '불합격'}</td>
            </tr>
            <tr>
                <td colspan="2">총 취득학점</td>
                <td>${depcord.totalDScore }</td>
                <td>${stuRecord.totalScore }</td>
                <td>${stuRecord.totalScore >= depcord.totalDScore ? '합격' : '불합격'}</td>
            </tr>
        </tbody>
    </table>
    <table class="table table-bordered bg-white">
        <thead>
            <tr>
                <th colspan="2">구분</th>
                <th>해당</th>
                <th>성적</th>
                <th>판정</th>
            </tr>
        </thead>
        <tbody>
		    <tr>
		        <td colspan="2" class="bodyTitle">졸업논문</td>
		        <td>${depcord.deptThesis }</td>
		        <td>${stuRecord.stuGtstatus }</td>
		        <td>
		            <c:choose>
		                <c:when test="${stuRecord.stuGtstatus == 'Y'}">
		                    <span>합격</span>
		                </c:when>
		                <c:when test="${stuRecord.stuGtstatus == 'N' && depcord.deptThesis == 'N'}">
		                    <span>해당없음</span>
		                </c:when>
		                <c:otherwise>
		                    <span>불합격</span>
		                </c:otherwise>
		            </c:choose>
		        </td>
		    </tr>
		    <tr>
		        <td colspan="2" class="bodyTitle">졸업시험</td>
		        <td>${depcord.deptTest }</td>
		        <td>${stuRecord.stuGestatus }</td>
		        <td>
		            <c:choose>
		                <c:when test="${stuRecord.stuGestatus == 'Y'}">
		                    <span class="pass">합격</span>
		                </c:when>
		                <c:when test="${stuRecord.stuGestatus == 'N' && depcord.deptTest == 'N'}">
		                    <span>해당없음</span>
		                </c:when>
		                <c:otherwise>
		                    <span class="fail">불합격</span>
		                </c:otherwise>
		            </c:choose>
		        </td>
		    </tr>
		    <tr>
		        <td colspan="2" class="bodyTitle">판정결과</td>
		        <td colspan="3">
		            <c:choose>
		                <c:when test="${stuRecord.totalScore >= depcord.totalDScore && (stuRecord.stuGtstatus == 'Y' || depcord.deptThesis == 'N') && (stuRecord.stuGestatus == 'Y' || depcord.deptTest == 'N')}">
		                    <span class="pass">합격</span>
		                </c:when>
		                <c:otherwise>
		                    <span class="fail">불합격</span>
		                </c:otherwise>
		            </c:choose>
		        </td>
		    </tr>
		</tbody>
    </table>
</div>
