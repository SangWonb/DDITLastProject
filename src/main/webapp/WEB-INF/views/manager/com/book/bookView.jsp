<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<div class="container mt-5 bg-white">
    <table class="table" id="table">
        <tr>
            <th colspan="2" style="text-align: center;">${book.bookCode}</th>
        </tr>
        <tr>
            <td>번호: ${book.rnum}</td>
            <td>제목: ${book.bookName}</td>
        </tr>
        <tr>
            <td>저자: ${book.bookWriter}</td>
            <td>출판사: ${book.bookCompany}</td>
        </tr>
        <tr>
            <td>카테고리: ${book.bookCategory}</td>
            <td>대출여부: ${book.bookState}</td>
        </tr>
        <tr>
            <td colspan="2">${book.bookContent}</td>
        </tr>
        <tr>
            <td colspan="2">
           		<button class="btn btn-success" id="updateButton">도서수정</button>
            </td>
        </tr>

    </table>
</div>
<!-- 수정 폼 -->
<form id="updateForm" method="post" action="/lcms/manager/com/book/updateBook" style="display: none;">
    <div class="col-lg-8 d-flex align-items-center">
           <div class="flex" style="max-width: 100%">
       		<div class="form-group">
		        <label for="bookName">북코드</label>
		        <input type="text" class="form-control" id="bookCode" name="bookCode" placeholder="${book.bookCode }" value="${book.bookCode}" readonly>
		    </div>
		    <div class="form-group">
		        <label for="bookName">제목:</label>
		        <input type="text" class="form-control" id="bookName" name="bookName" placeholder="제목을 입력해주세요." value="${book.bookName}">
		    </div>
		    <div class="form-group">
		        <label for="bookWriter">저자:</label>
		        <input type="text" class="form-control" id="bookWriter" name="bookWriter" placeholder="저자를 입력해주세요." value="${book.bookWriter}">
		    </div>
		    <div class="form-group">
		        <label for="bookCompany">출판사:</label>
		        <input type="text" class="form-control" id="bookCompany" name="bookCompany" placeholder="출판사를 입력해주세요." value="${book.bookCompany}">
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
		        <label for="bookContent">내용:</label>
		        <textarea class="form-control" id="bookContent" name="bookContent" rows="3">${book.bookContent}</textarea>
		    </div>
		</div>
	</div>
    <button type="submit" class="btn btn-primary">수정하기</button>
</form>
