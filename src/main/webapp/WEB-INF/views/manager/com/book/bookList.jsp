<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<style>
    table {
        text-align: center;
    }

    #restRVData::-webkit-scrollbar {
        display: none; /* Chrome, Safari, Edge 및 Opera에서 스크롤바 숨기기 */
    }

    /* 오른쪽 정렬을 위한 스타일 */
    .pagination-container {
        text-align: right;
    }
    btn {
    	margin-top: 10px;
    }
    form {
    	margin-top: 10px;
    }
</style>
<div id="bookList">
    <!-- 도서 목록 테이블 -->
	<table class="table table-bordered bg-white">
	    <thead>
	        <tr>
	            <th>번호</th>
	            <th>제목</th>
	            <th>저자</th>
	            <th>출판사</th>
	            <th>카테고리</th>
	            <th>대출여부</th>
	            <th>작업</th>
	        </tr>
	    </thead>
	
	    <tbody class="list" id="listBody">
	        <!-- 각 도서 행에 대한 데이터 -->
	        <tr>
	            <td>1</td>
	            <td>도서 제목</td>
	            <td>도서 저자</td>
	            <td>출판사</td>
	            <td>카테고리</td>
	            <td>대출여부</td>
	            <td><button class="btn btn-danger deleteButton">삭제</button></td> <!-- 삭제 버튼 -->
	        </tr>
	        <!-- 나머지 도서 행들도 동일하게 추가 -->
	    </tbody>
	</table>
</div>

<!-- 페이징 영역 -->
<div class="pagination-container">
	<div id="pagingArea"></div>
</div>

<!-- 책 등록 버튼 -->
<div class="btn">
	<button class="btn btn-primary" id="registerButton">도서등록</button>	
</div>
<!-- 등록 폼 -->
<div class="form">
<form id="registerForm" method="post" action="/lcms/manager/com/book/bookList" style="display: none;">
    <div class="col-lg-8 d-flex align-items-center">
           <div class="flex" style="max-width: 100%">

               <div class="form-group">
                   <label class="form-label" for="bookName">제목:</label>
                   <input type="text" class="form-control" id="bookName" name="bookName"
                          placeholder="제목을 입력해주세요.">
               </div>
               <div class="form-group">
                   <label class="form-label" for="bookWriter">저자:</label>
                   <input type="text" class="form-control" id="bookWriter" name="bookWriter"
                          placeholder="저자를 입력해주세요.">
               </div>
               <div class="form-group">
                   <label class="form-label" for="bookCompany">출판사:</label>
                   <input type="text" class="form-control" id="bookCompany" name="bookCompany"
                          placeholder="출판사를 입력해주세요.">
               </div>
               <div class="form-group">
                   <label class="form-label" for="bookCategory">카테고리:</label>
                   <select id="bookCategory" name="bookCategory" class="form-control custom-select">
                       <option selected disabled>출판사를 입력해주세요.</option>
                       <option value="철학">철학</option>
                       <option value="종교">종교</option>
                       <option value="사회과학">사회과학</option>
                       <option value="자연과학">자연과학</option>
                       <option value="기술과학">기술과학</option>
                       <option value="예술">예술</option>
                       <option value="언어">언어</option>
                       <option value="문학">문학</option>
                       <option value="역사">역사</option>
                   </select>
               </div>
               <div class="form-group">
                   <label class="form-label" for="bookState">대출여부:</label>
                   <select id="bookState" name="bookState" class="form-control custom-select">
                       <option selected disabled>출판사를 입력해주세요.</option>
                       <option value="Y">Y</option>
                       <option value="N">N</option>
                       <option value="R">R</option>
                   </select>
               </div>
               <div class="form-group">
                   <label class="form-label" for="bookContent">내용:</label>
                          <textarea class="form-control" id="bookContent" name="bookContent" rows="3" name="bookContent"
                          placeholder="내용을 입력해주세요."></textarea>
               </div>
           </div>
       </div> 
      <button type="submit" class="btn btn-primary">등록하기</button>
</form>
</div>

<!-- Ajax로 페이지 이동 시 사용할 폼 -->
<form id="searchForm" hidden="true" method="get">
    <input type="hidden" name="page" /> 
</form>

<!-- 도서 상세 정보를 표시하는 영역 -->
<div class="book-detail" style="display: none;"></div>

<script src="<c:url value='/resources/js/paging.js' />"></script>
<script src='<c:url value="/resources/js/app/book/bookList.js" />'></script>

<script>
$(document).ready(function() {
    // 도서 등록 버튼 클릭 시 폼 토글
    $("#registerButton").click(function() {
        if ($("#registerForm").is(":visible")) {
            // 폼이 보이는 경우 등록 처리
            var formData = {
                bookName: $("#bookName").val(),
                bookWriter: $("#bookWriter").val(),
                bookCompany: $("#bookCompany").val(),
                bookCategory: $("#bookCategory").val(),
                bookContent: $("#bookContent").val(),
                bookState: $("#bookState").val()
            };
            $.ajax({
                url: "/lcms/manager/com/book/bookList",
                method: "POST",
                data: formData,
                success: function(response) {
                    console.log("등록이 완료되었습니다.");
                    // 등록이 완료되면 폼을 숨김
                    $("#registerForm").hide();
                },
                error: function(xhr, status, error) {
                    console.error("등록 중 에러가 발생했습니다:", error);
                }
            });
        } else {
            // 폼이 숨겨진 경우에는 폼을 보이게 함
            $("#registerForm").show();
        }
    });
});
</script>