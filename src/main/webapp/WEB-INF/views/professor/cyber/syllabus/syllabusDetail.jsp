<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="container">
    <div class="row">
        <div class="col-md-8 offset-md-2" >
            <table class="table table-bordered bg-white" >
                <tbody style="margin: 20px;">
                	<tr>
					    <td scope="row" colspan="6" style="text-align: center;">
					        <h3 style="margin: 20px;">강의계획서 기본 내용</h3>
					    </td>
					</tr>
                    <tr>
                        <th scope="row">강의명</th>
                        <td colspan="2">${lecture.lecOpenList.lolName }</td>
                        <th scope="row">교과목</th>
                        <td colspan="2">${lecture.lecOpenList.subName }</td>
                    </tr>
                    <tr>
                        <th scope="row">정원</th>
                        <td colspan="2">${lecture.lecOpenList.lolLimit }</td>
                        <th scope="row">수업일수</th>
                        <td colspan="2">${lecture.lecOpenList.lolDaycount }</td>
                    </tr>
                    <tr>
                        <th scope="row">신청인</th>
                        <td colspan="2">${lecture.lecOpenList.memName }</td>
                        <th scope="row">강의요일</th>
                        <td colspan="2">
                            <c:choose>
                                <c:when test="${lecture.lectureTime.ltDay == 1}">월요일</c:when>
                                <c:when test="${lecture.lectureTime.ltDay == 2}">화요일</c:when>
                                <c:when test="${lecture.lectureTime.ltDay == 3}">수요일</c:when>
                                <c:when test="${lecture.lectureTime.ltDay == 4}">목요일</c:when>
                                <c:when test="${lecture.lectureTime.ltDay == 5}">금요일</c:when>
                            </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">강의시간</th>
                        <td colspan="2">
                            <c:set var="ltTime" value="${lecture.lectureTime.ltTime}" />
                            <c:set var="startTimeHour" value="${fn:substring(ltTime, 0, 2)}" />
                            <c:set var="startTimeMinute" value="${fn:substring(ltTime, 2, 4)}" />
                            <c:set var="endTimeHour" value="${fn:substring(ltTime, 4, 6)}" />
                            <c:set var="endTimeMinute" value="${fn:substring(ltTime, 6, 8)}" />
                            ${startTimeHour}:${startTimeMinute} ~ ${endTimeHour}:${endTimeMinute}
                        </td>
                        <th scope="row">교재</th>
                        <td colspan="2">${lecture.lpBook }</td>
                    </tr>
                    <tr>
                        <th scope="row" colspan="6" style="text-align: center;">반영비율</th>
                    </tr>
                    <tr>
                        <th scope="row" colspan="1">출석</th>
                        <td colspan="1">${lecture.lpAttendRef } %</td>
                        <th scope="row" colspan="1">시험</th>
                        <td colspan="1">${lecture.lpTestRef } %</td>
                        <th scope="row" colspan="1">과제</th>
                        <td colspan="1">${lecture.lpTaskRef } %</td>
                    </tr>
                    <tr>
                    	<th scope="row" colspan="6" style="text-align: center;">강의개요</th>
                    </tr>
                    <tr>
                        <td colspan="6">${lecture.lpContent }</td>
                    </tr>
                    <tr>
					    <td scope="row" colspan="6" style="text-align: center;">
					        <h3 style="margin: 20px;">주차별 강의 계획</h3>
					    </td>
					</tr>
                    <c:forEach var="content" items="${lecture.lectureContent}" varStatus="status">
                        <c:set var="lpNo" value="${content.lpNo }"/>
                        <tr>
                            <th scope="row" colspan="1">${fn:substring(lpNo, 4, 6)}주차 내용</th>
                            <td colspan="5">${lecture.lectureContent[fn:substring(lpNo, 4, 6) - 1].lpContent}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
