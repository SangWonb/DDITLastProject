<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="pt-32pt">
    <div class="container page__container d-flex flex-column flex-md-row align-items-center text-center text-sm-left">
        <div class="flex d-flex flex-column flex-sm-row align-items-center">

            <div class="mb-24pt mb-sm-0 mr-sm-24pt">
                <h2 class="mb-0">인턴프로그램</h2>

                <ol class="breadcrumb p-0 m-0">
                    <li class="breadcrumb-item">MANAGER</li>
					<li class="breadcrumb-item">STU</li>
					<li class="breadcrumb-item">INTERN</li>
					<li class="breadcrumb-item">INTERNPROGRAM</li>
					<li class="breadcrumb-item">INTERNPROGRAMLIST</li>
                </ol>

            </div>
        </div>

    </div>
</div>

<!-- BEFORE Page Content -->

<!-- // END BEFORE Page Content -->

<!-- Page Content -->

<div class="page-section container page__container">
	<div class="page-separator">
        <div class="page-separator__text">인턴프로그램 신청목록조회</div>
    </div>
	
    <div class="bd-example bg-white">
		<table class="table table-bordered">
			<tbody>
			  <tr>
			    <th scope="row" class="text-center">순번</th>
			    <th scope="row" class="text-center">인턴명</th>
			    <th scope="row" class="text-center">학번</th>
			    <th scope="row" class="text-center">이름</th>
			    <th scope="row" class="text-center">학년</th>
			    <th scope="row" class="text-center">학과</th>
			    <th scope="row" class="text-center">전공</th>
			    <th scope="row" class="text-center">신청자격</th>
			    <th scope="row" class="text-center">모집기간</th>
			    <th scope="row" class="text-center">활동기간</th>
			    <th scope="row" class="text-center">승인여부</th>
			  </tr>
			  <tr>
			    <td class="text-center">1</td>
			    <td class="text-center"><a href="#" class="intern-link" data-intern-id="1">인턴프로그램</a></td>
			    <td class="text-center">202110985</td>
			    <td class="text-center">이미소</td>
			    <td class="text-center">3</td>
			    <td class="text-center">컴퓨터공학학과</td>
			    <td class="text-center">소프트웨어전공</td>
			    <td class="text-center">전체</td>
			    <td class="text-center">24.02.01~24.02.09</td>
			    <td class="text-center">24.03.01~24.03.09</td>
			    <td class="text-center">승인</td>
			  </tr>
			</tbody>
		</table>
	</div>
	
	<div id="mailContent" class="mt-4">
	</div>
	    
    <div class="page-separator">
        <div class="page-separator__text">상세조회</div>
    </div>
	
    <div class="bd-example bg-white">
		<table class="table table-bordered">
		    <tbody>
		        <tr>
		            <th scope="row" class="text-center">년도/학기</th>
		            <td>2024/1학기</td>
		            <th scope="row" class="text-center">학년</th>
		            <td>3</td>
		        </tr>
		        <tr>
		            <th scope="row" class="text-center">이름</th>
		            <td>이미소</td>
		            <th scope="row" class="text-center">학과</th>
		            <td>컴퓨터공학과</td>
		        </tr>
		        <tr>
		            <th scope="row" class="text-center">전공</th>
		            <td>소프트웨어전공</td>
		            <th scope="row" class="text-center">신청자격</th>
		            <td>전체</td>
		        </tr>
		        <tr>
		            <th scope="row" class="text-center">인턴명</th>
		            <td colspan="3">인턴프로그램</td>
		        </tr>
		        <tr>
		            <th scope="row" class="text-center">모집기간</th>
		            <td>24.02.01~24.02.09</td>
		            <th scope="row" class="text-center">활동기간</th>
		            <td>24.03.01~24.03.09</td>
		        </tr>
		        <tr>
		            <th scope="row" class="text-center">신청동기</th>
		            <td colspan="3">신청합니다.</td>
		        </tr>
		        <tr>
		            <th scope="row" class="text-center">반려사유</th>
		            <td colspan="3">
			            <select class="custom-select">
					        <option selected>분류 선택</option>
					        <option value="option1">옵션 1</option>
					        <option value="option2">옵션 2</option>
					        <option value="option3">옵션 3</option>
    					</select>
		            </td>
		        </tr>
		    </tbody>
		</table>
	</div>
</div>
<button id="signInternBtn" class="btn btn-danger mb-3">승인</button>
<button id="returnInternBtn" class="btn btn-primary mb-3">반려</button>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	
</script>


