<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<form id="editSyllabusForm">
           <table class="table">
            <thead class="thead-light">
            <tr>
                <th scope="col">항목</th>
                <th scope="col">내용</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row">강의 코드</th>
                <td><input type="text" class="form-control" name="lpCode" value="${syllabus.lpCode}" readonly></td>
            </tr>
            <tr>
                <th scope="row">강의 내용</th>
                <td><input type="text" class="form-control" name="lpContent" value="${syllabus.lpContent}"></td>
            </tr>
            <tr>
                <th scope="row">출결 참고</th>
                <td><input type="text" class="form-control" name="lpAttendRef" value="${syllabus.lpAttendRef}"></td>
            </tr>
            <tr>
                <th scope="row">시험 참고</th>
                <td><input type="text" class="form-control" name="lpTestRef" value="${syllabus.lpTestRef}"></td>
            </tr>
            <tr>
                <th scope="row">과제 참고</th>
                <td><input type="text" class="form-control" name="lpTaskRef" value="${syllabus.lpTaskRef}"></td>
            </tr>
            <tr>
                <th scope="row">비고</th>
                <td><input type="text" class="form-control" name="lpNote" value="${syllabus.lpNote}"></td>
            </tr>
            <tr>
                <th scope="row">교재</th>
                <td><input type="text" class="form-control" name="lpBook" value="${syllabus.lpBook}"></td>
            </tr>
            <tr>
                <th scope="row">개설 학과</th>
                <td><input type="text" class="form-control" name="lolCode" value="${syllabus.lolCode}"></td>
            </tr>
            <tr>
                <th scope="row">학기 제한</th>
                <td><input type="text" class="form-control" name="lolLimit" value="${syllabus.lolLimit}"></td>
            </tr>
            <tr>
                <th scope="row">강의 요일</th>
                <td><input type="text" class="form-control" name="ltDay" value="${syllabus.ltDay}"></td>
            </tr>
            <tr>
                <th scope="row">강의 시간</th>
                <td><input type="text" class="form-control" name="ltTime" value="${syllabus.ltTime}"></td>
            </tr>
            <tr>
                <th scope="row">과목명</th>
                <td><input type="text" class="form-control" name="subName" value="${syllabus.subName}"></td>
            </tr>
            <tr>
                <th scope="row">과목 학년</th>
                <td><input type="text" class="form-control" name="subSchYear" value="${syllabus.subSchYear}"></td>
            </tr>
            <tr>
                <th scope="row">전공/교양</th>
                <td><input type="text" class="form-control" name="majorCultural" value="${syllabus.majorCultural}"></td>
            </tr>
            <tr>
                <th scope="row">선택/필수</th>
                <td><input type="text" class="form-control" name="choiceRequire" value="${syllabus.choiceRequire}"></td>
            </tr>
            </tbody>
        </table>
        <button type="submit" class="btn btn-primary">수정 완료</button>
    </form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        $('#editForm').submit(function (e) {
            e.preventDefault();
            $.ajax({
                type: 'POST',
                url: '수정 완료 요청을 처리하는 URL', // 수정이 완료되는 URL로 변경해야 함
                data: $(this).serialize(),
                success: function (response) {
                    $('#editResult').html('<div class="alert alert-success">수정이 완료되었습니다.</div>');
                },
                error: function (xhr, status, error) {
                    $('#editResult').html('<div class="alert alert-danger">수정 중 오류가 발생했습니다.</div>');
                }
            });
        });
    });
</script>