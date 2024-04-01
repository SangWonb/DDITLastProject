<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<style>
table {
    font-size: 12px; 
}

.swal2-title {
    font-size: 18px; /* 원하는 크기로 설정하세요 */
}
.bodyText {
	text-align: center;
}
</style>

<h2>상담목록</h2>
<span>*학생을 클릭하면 학생의 정보를 알 수 있습니다. 상담제목을 클릭하면 상담제목과 상담이유를 자세히 보실 수 있습니다.</span>
<br>
<span>*비대면상담(화상상담)의 경우 예정날짜에 입장을 누르시면 상담방이 개설됩니다. 학생은 상담예정시간에 입장할 수 있습니다.</span>
<br>
*상담 완료 후 상담상태의 상담대기 버튼을 누르면 상담완료로 상태가 변합니다. 상담완료 상태에서는 상담일지를 작성할 수 있습니다.
<div style="width:100%; margin-top:10px;" class="bg-white row row-cols-auto ">
<div style="margin-top:10px; width: 100%;">
	 <div style="width: 100%; text-align: left; display: flex;">
		 <div style="width: 50%;  margin-left: 30px; font-size: 14px;">
	        <span style="width: 100%; text-align: left;">
	            총상담건수 :  ${count.total} 건<br>
	            상담대기건수: ${count.waiting} 건 
	        </span>
	    </div>
		<div style=" display: flex; padding-right: 20px; justify-content: right; align-items: right; width: 50%; max-width: 50%; margin-bottom:10px; text-align: right;">
			<div>
				<select class="custom-select" style="margin-right: 10px; width: 100px; max-width: 100px;">
					<option style="width: 100px; max-width: 100px;">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</option>
					<option style="width: 100px; max-width: 100px;">학&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;번</option>
				</select>
			</div>
			<div>
				<input class="form-control" type="text" style="margin-right: 10px; width: 200px;">
			</div>
			<div>
				<button type="button" class="btn btn-outline-secondary" style="margin-right: 10px; width: 100px;">검색</button>
			</div>
		</div>
	 </div>
</div>
	<table class="table">
		<thead>
			<tr style="text-align: center;">
				<td scope="col">
					번호
				</td>
				<td scope="col">
					이름
					<br>(학번)
				</td>
				<td scope="col">
					상담제목
				</td>
				<td scope="col">상담방법</td>
				<td scope="col">상담종류</td>
				<td scope="col">삼담예정일시</td>
				<td scope="col">상담상태</td>
				<td scope="col">상담입장</td>
				<td scope="col">삼담일지</td>
			</tr>
		</thead>
		<tbody>
		<c:if test="${empty counsel}">
			<tr style="text-align: center;">
				<td colspan="12">상담내역이 존재하지 않습니다.</td>
			</tr>
		</c:if>
	<c:if test="${not empty counsel}">
		<c:forEach items="${counsel}" var="c" varStatus="status">
			<tr>
				<td>
					<div style="text-align: center;">
						${status.index+1}
					</div>
				</td> 
				<td>
						<div style="text-align: center;">
							<a href="#" data-toggle="modal" data-target="#myModal" data-smem-no="${c.memNo}" data-smem-name="${c.studentName}">${c.studentName}</a>
							<a href="#" data-toggle="modal" data-target="#myModal" data-smem-no="${c.memNo}" data-smem-name="${c.studentName}">(${c.memNo})</a>
						</div>
				</td>
				<td style="text-align: center; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; max-width: 150px;">
					<a href="#" data-toggle="modal" data-target="#counselDetail" data-couns-title="${c.counsTitle}"
					data-couns-reason="${c.counsReason}" data-pmem-name="${c.professorName}" 
					data-smem-name="${c.studentName}" data-smem-no="${c.memNo}">${c.counsTitle}</a>
				</td>
				<td style="text-align: center;">${c.counsMethod}</td>
				<td style="text-align: center;">${c.counsType}</td>
				<td>
					<div style="text-align: center;">
					   	${c.counsDatetime.toString().substring(0, 10)}
				        <br>
				        ${c.counsDatetime.toString().substring(11, 16)}
					</div>
				</td>
					<c:if test="${c.counsStatus eq 'STA08'}">
						<td style="text-align: center;">
							<button class="btn btn-primary" id="counsNo" onclick="changeStatus()" data-couns-no="${c.counsNo}">
								상담대기
							</button>
						</td>
						<td style="text-align: center;">
							<button class="btn btn-accent" onclick="startCounsel()">
								방생성
							</button>
						</td>
						<td style="text-align: center;">
							<button class="btn btn-outline-primary" style="max-width: 150px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;" disabled="disabled">
								상담일지
							</button>
						</td>
					</c:if>
					<c:if test="${c.counsStatus eq 'STA06' or c.counsStatus eq 'STA09'}" >
						<td style="text-align: center;">
							<button class="btn btn-outline-primary" disabled="disabled" >
								상담완료
							</button>
						</td>
						<td style="text-align: center;">
							<button class="btn btn-outline-accent" disabled="disabled">
								방생성
							</button>
						</td>
						<td style="text-align: center;">
							<button class="btn btn-primary" data-toggle="modal" data-target="#counselJournal" 
									data-couns-no="${c.counsNo}" data-couns-title="${c.counsTitle}"
									data-smem-no="${c.memNo}" data-smem-name="${c.studentName}" 
									data-couns-reason="${c.counsReason}" data-couns-content="${c.counsContent}"
									data-couns-status="${c.counsStatus}">
							
								상담일지
							</button>
						</td>
					</c:if>
				
			</tr>
		</c:forEach>
		</c:if>
		</tbody>
	</table>
</div>

<!-- 모달 -->

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="myModalLabel">학생상세정보</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         <h3>학생정보</h3>
         	<div>
         		<table class="table" style="margin-bottom:0px;">
         				<tr>
         					<th scope="col" style="width:10%">학번</th>
         					<td style="width:20%">
					          <span id="smemNo"></span>
         					</td>
         					<th scope="col" style="width:10%">이름</th>
         					<td style="width:20%">
         						<span id="smemName"></span>
         					</td>
							<th scope="col"style="width:20%">생년월일(성별)</th>
							<td id="bas" style="width:20%"></td>
         				</tr>
         			</table>
         			<table class="table" style="width:100%;">
         				<tr>
         					<th scope="col" style="width:20%">입학정보</th>
         						<td id="joinYear" style="width:30%"></td>
         					<th scope="col"style="width:20%">학적상태</th>
         						<td id="stuProg" style="width:30%"></td>
         				</tr>
         				<tr>
         					<th scope="col" style="width:20%">소속</th>
         						<td id="cad" style="width:30%"></td>
         					<th scope="col" style="width:20%">이메일</th>
         						<td id="stuEmail" style="width:30%"></td>
         				</tr>
         		</table>
         	</div>
         <h3>상담이력</h3><span>*상담이력의 번호를 클릭하면 상담일지를 조회할 수 있습니다.</span>
        	<div id="history" style="margin-top:10px;">
        	
        	</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="counselDetail" tabindex="-1" role="dialog" aria-labelledby="counselDetailLabel" aria-hidden="true">
  <div class="modal-dialog " role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="counselDetailLabel">상담상세정보</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      *학생의 이름을 클릭하면 학생의 상세정보와 상담이력을 확인할 수 있습니다.
        <table class="table" style="margin-top:10px;">
        	<tr>
        		<th>신청학생</th>
        		<td id="counsStu"></td>
        	</tr>
        	<tr>
        		<th>상담교수</th>
        		<td><span id="counsPro"></span></td>
        	</tr>
        	<tr>
        		<th style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis; max-width: 200px;">상담제목</th>
        		<td><span id="counsTitle"></span></td>
        	</tr>
        	<tr>
        		<th style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis; max-width: 200px;">상담신청이유</th>
        		<td><span id="counsReason"></span></td>
        	</tr>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="counselJournal" tabindex="-1" aria-labelledby="counselJournalLabel" aria-hidden="true">
  <div class="modal-dialog ">
    <div class="modal-content">
      <div class="modal-header">
        <h2 class="modal-title" id="counselJournalLabel">상담일지</h2>
      </div>
      <div class="modal-body">
          <div class="table bodyTextTable">
            <table class="table" style="margin-bottom:0px;">
            		<tr>
            			<th scope="col">상담번호</th>
            			<th scope="col">이름</th>
            			<th scope="col">학번</th>
            		</tr>
            		<tr>
            			<td>
            				<span id="counsNo"></span>
            			</td>
            			<td>
            				<span id="smemName"></span>
            			</td>
            			<td>
            				<span id="smemNo"></span>
            			</td>
            		</tr>
           	</table>
           	<table class="table" style="margin-bottom:0px;">
            		<tr>
            			<th scope="col">상담제목</th>
            		</tr>
            		<tr>
            			<td>
            				<span id="counsTitle"></span>
            			</td>
            		</tr>
            		<tr>
            			<th scope="col">상담신청이유</th>
            		</tr>
            		<tr>
            			<td>
            				<span id="counsReason"></span>
            			</td>
            		</tr>
            </table>
          </div>
        <form>
          <div >
			 <table class="table">
			 	<thead>
			 		<tr>
			 			<th scope="col">상담내용</th>
			 		</tr>
			 	</thead>
			 	<tbody>
			 		<tr id="counsContent">
			 			<td></td>
			 		</tr>
			 	</tbody>
			 </table>
          </div>
        </form>
      </div>
      <div class="modal-footer" id="footBtn">
       
      </div>
    </div>
  </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src='<c:url value="/resources/js/app/counsel/counselP.js"/>'></script>
