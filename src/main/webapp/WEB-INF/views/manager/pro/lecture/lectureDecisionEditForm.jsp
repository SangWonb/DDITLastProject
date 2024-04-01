<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<hr>
<h3>신청 상세 내역</h3>

<form id="decisionEditForm" method="post">
  <table class="table bg-white" style="margin: 20px;">
    <tbody>
        <tr style="display: none;">
            <td>
            <input type="text" class="form-control" id="lolAppno" name="lolAppno" value="${lecture.lolAppno }" readonly="readonly"/>
            </td>
        </tr>
        <tr>
            <th scope="row">강의명</th>
            <td>
            <input type="text" class="form-control" id="lolName" name="lolName" value="${lecture.lolName }" readonly="readonly"/>
            </td>
        </tr>
        <tr>
            <th scope="row">교과목</th>
            <td>
            <input class="form-control" id="subCode" name="subCode" value="${lecture.subCode }" readonly="readonly">
            </td>
        </tr>
        <tr>
            <th scope="row">정원</th>
            <td>
            <input type="number" class="form-control" id="lolLimit" name="lolLimit" value="${lecture.lolLimit }" readonly="readonly"/>
            </td>
        </tr>
        <tr>
            <th scope="row">수업일수</th>
            <td>
            <input type="number" class="form-control" id="lolDaycount" name="lolDaycount" value="${lecture.lolDaycount }" readonly="readonly"/>
            </td>
        </tr>
        <tr>
            <th scope="row">신청인</th>
            <td>
            <input type="text" class="form-control" id="pmemNo" name="pmemNo" value="${lecture.memName }" readonly="readonly"/>
            </td>
        </tr>
        
<!--    강의 계획서 -->
        <tr>
            <td scope="row" style="text-align: center;" colspan="2"><h3>강의계획서</h3></td>
        </tr>
        <tr>
        	<th scope="row">강의개요</th>
            <td>
            <input type="text" class="form-control" value="${lecture.lecturePlan.lpContent }" readonly="readonly"/>
            </td>
        </tr>
        <tr>
        	<th scope="row">출석반영비율</th>
            <td>
            <input type="number" class="form-control" id="lpAttendRef" value="${lecture.lecturePlan.lpAttendRef }" readonly="readonly"/>
            </td>
        </tr>
        <tr>
        	<th scope="row">시험반영비율</th>
            <td>
            <input type="number" class="form-control" id="lpTestRef" value="${lecture.lecturePlan.lpTestRef }" readonly="readonly"/>
            </td>
        </tr>
        <tr>
        	<th scope="row">과제반영비율</th>
            <td>
            <input type="number" class="form-control" id="lpTaskRef" value="${lecture.lecturePlan.lpTaskRef }" readonly="readonly"/>
            </td>
        </tr>
        <tr>
        	<th scope="row">교재</th>
            <td>
            <input type="text" class="form-control" value="${lecture.lecturePlan.lpBook }" readonly="readonly"/>
            </td>
        </tr>
<!--         강의 주차별 -->
        <tr>
            <td scope="row" style="text-align: center;" colspan="2"><h3>강의계획</h3></td>
        </tr>
		<c:forEach var="content" items="${lecture.lecturePlan.lectureContent}" varStatus="status">
			<c:set var="lpNo" value="${content.lpNo }"/>
		    <tr>
		        <th scope="row" >${fn:substring(lpNo, 4, 6)}주차 내용</th>
		        <td>
					<input type="text" class="form-control" value="${lecture.lecturePlan.lectureContent[fn:substring(lpNo, 4, 6) - 1].lpContent}" readonly="readonly"/>

		        </td>
		    </tr>
		</c:forEach>
    </tbody>
</table>
<div class="container">
    <div class="row">
        <div class="col-sm-4">
            <!-- 첫 번째 세트 -->
            <div class="form-group">
                <select id="buildingNo" name="buildingNo" class="form-control">
                    <option value="">건물 선택</option>
                    <c:forEach items="${buildingNoList}" var="building">
                        <option value="${building.buildingNo }">${building.buildingNo }</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <select id="roomNo" name="roomNo" class="form-control">
                    <option value="">강의실 선택</option>
                    <c:forEach items="${buildingNoList}" var="room">
                        <option value="${room.roomNo }" class="${room.buildingNo }">${room.roomNo }호</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        
        <div class="col-sm-4">
            <!-- 두 번째 세트 -->
            <div class="form-group">
                <select id="ltDay" name="ltDay" class="form-control">
                    <option value="">강의요일 선택</option>
                    <option value="1">월</option>
                    <option value="2">화</option>
                    <option value="3">수</option>
                    <option value="4">목</option>
                    <option value="5">금</option>
                </select>
            </div>
            <div class="form-group">
             <select id="lecTime" name="lecTime" class="form-control">
                    <option value="">강의시간 선택</option>
                    <option value="60">60분</option>
                    <option value="120">120분</option>
                    <option value="180">180분</option>
                </select>

            </div>
        </div>
        
        <div class="col-sm-4">
            <div class="form-group">
               <select id="startTime" name="ltTime" class="form-control">
	              <option value="">강의시작 시간선택</option>
	              <option value="0900">09시00분</option>
	              <option value="0930">09시30분</option>
	               <option value="1030">10시30분</option>
	               <option value="1100">11시00분</option>
	               <option value="1130">11시30분</option>
	               <option value="1200">12시00분</option>
	               <option value="1230">12시30분</option>
	               <option value="1300">13시00분</option>
	               <option value="1330">13시30분</option>
	               <option value="1400">14시00분</option>
	               <option value="1430">14시30분</option>
	               <option value="1500">15시00분</option>
	               <option value="1530">15시30분</option>
	               <option value="1600">16시00분</option>
	               <option value="1630">16시30분</option>
	               <option value="1700">17시00분</option>
	               <option value="1730">17시30분</option>
                </select>
            </div>
            <div class="form-group">
                <select id="endTime" name="ltTime" class="form-control">
                    <option value="">강의끝 시간선택</option>
                    <option value="0930">09시30분</option>
                    <option value="1000">10시00분</option>
	               <option value="1030">10시30분</option>
	               <option value="1100">11시00분</option>
	               <option value="1130">11시30분</option>
	               <option value="1200">12시00분</option>
	               <option value="1230">12시30분</option>
	               <option value="1300">13시00분</option>
	               <option value="1330">13시30분</option>
	               <option value="1400">14시00분</option>
	               <option value="1430">14시30분</option>
	               <option value="1500">15시00분</option>
	               <option value="1530">15시30분</option>
	               <option value="1600">16시00분</option>
	               <option value="1630">16시30분</option>
	               <option value="1700">17시00분</option>
	               <option value="1730">17시30분</option>
	               <option value="1800">18시00분</option>
                </select>
            </div>
        </div>
    </div>
</div>
       <div class="btn-group">
        <button type="submit" id="statusSelect" class="btn btn-primary">승인</button>
    </div>
        
 <div class="col-sm-2"> 
    <select id="rejectReason" name="rejectReason" class="form-control">
            <option value="">반려사유 선택</option>
    <c:forEach items="${rejectList}" var="reject">
            <option value="${reject.rejectCode }">${reject.rejectReason }</option>
       </c:forEach>
        </select>
    </div>
    <div class="btn-group">
           <button type="submit" id="rejectSelect" class="btn btn-danger">반려</button>
     </div>
</form>
<script type="text/javascript">
let $roomNo = $('select[name="roomNo"]').val("${room.roomNo}"); //name-prodBuyer 두개여서 select 붙여줌 //select하면서 값을 초기화하고 있음
$('select[name="buildingNo"]').on("change",(event)=>{ 
   let $buildingNo = $(event.target); 
   let selectedLgu = $buildingNo.val(); //let selectedLgu = event.target.value; //val(), value 하면 선택되어있는 옵션의 값이 나옴.
   $roomNo.find("option:gt(0)").each((idx, op)=>{ //:gt 보다 큰 //여러개의 option을 하나하나 처리
      let $op = $(op);
      let showFlag = (selectedLgu && $op.hasClass(selectedLgu)) || (!selectedLgu);
      // 없을떄      :  없으니까 false   뒤에는 계산 안하고                  없으니까 true
      // 있을떄      :  있으니까 true  (분류코드)를 클래스로 가지고 있으면 true  있으니까 false
      //                           (분류코드)를 클래스로 가지고 있지 않으면 false 
      $op.toggle(showFlag);
      //flase면 hidden
   });
}).trigger("change"); //이벤트가 끝난 후에 초기값을 정해줌 // 트리거 : 이벤트 발생시키겠다.
</script>