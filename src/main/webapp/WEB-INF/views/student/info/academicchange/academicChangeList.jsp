<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<div>
<div class="card card-body">
	 <h5>현재학적</h5>
	 <br>
	 <table>
 		<tr>
 			<th>학번</th>
 			<td>${stuInfo.smemNo}</td>
 			<th>이름</th>
 			<td>${stuInfo.memName}</td>
 			<th>소속</th>
 			<td>${stuInfo.cad}</td>
 			<th>입학정보</th>
 			<td>${stuInfo.stuJoinyear}</td>
 			<th>현재학적</th>
 			<td>${stuInfo.stuProg}</td>
 		</tr>
	 </table>
</div> 
<div class="card card-body">
	 <h5>신청목록</h5>
<div class="table-responsive"
       data-toggle="lists"
       data-lists-sort-by="js-lists-values-date"
       data-lists-sort-desc="true"
       data-lists-values='["js-lists-values-lead", "js-lists-values-project", "js-lists-values-status", "js-lists-values-budget", "js-lists-values-date"]'
      style="width:100%; max-height:260px;" 
       >

      <table class="table table-flush table-nowrap" style="max-height:100px;">
          <thead style="text-align:center;">
              <tr>
                  <th style="width:3%">번호</th>
                  <th style="width:3%">신청분류명</th>
                  <th style="width:10%">신청사유</th>
                  <th style="width:5%">년도/학기</th>
                  <th style="width:5%">신청날짜</th>
                  <th style="width:5%">승인날짜</th>
                  <th style="width:5%">승인/반려</th>
                  <th style="width:10%" class="text-center">삭제</th>
              </tr>
          </thead>
          <tbody class="list"
                 id="projects" style="text-align:center;">
                  <c:if test="${not empty record}">
                  	<c:forEach items="${record}" var="r" varStatus="status">
		              <tr>
		                <td><a href="#" class="recordView js-lists-values-lead btn-load-detail" data-arc-no="${r.arcNo}">
            				<strong>${status.index+1}</strong>
        				</a></td>
		                <td>${r.acName}</td>
		                <td style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
		                	${r.arcReason}
		                </td>
		                <td>${r.arcYear}/${r.value}</td>
		                <td>${r.arcDate}</td>
		                <c:choose>
						    <c:when test="${r.arcConfirmdate != null}">
						        <td>${r.arcConfirmdate}</td>
						    </c:when>
						    <c:otherwise>
						        <td style="text-align:center;"><p>-</p></td>
						    </c:otherwise>
						</c:choose>
		                <c:choose>
		                 	<c:when test="${r.arcState eq 'STA04'}">
        						<td style="text-align:center;">
        							 <button class="btn btn-outline-secondary d-block mx-auto"
                                            data-toggle="modal"
                                            data-target="#rejectModal"
            								data-reject-reason="${r.rejectReason}"
            								>
                                        반려 
                                    </button>
        						</td>
    						</c:when>
    						<c:otherwise>
				                <td style="text-align:center;">${r.statusNm}</td>
    						</c:otherwise>
						</c:choose>
						<c:choose>
		            			<c:when test="${r.arcState eq 'STA01' }">
				                     <td style="text-align:center;"><a href="#" class="delete-link btn btn-secondary" data-arc-no="${r.arcNo}" >삭제</a></td>
		                		</c:when>
		                		<c:otherwise>
		                			<td style="text-align:center;"><button type="button" class="btn btn-secondary" disabled="">삭제</button></td>
		                		</c:otherwise>
						</c:choose>
		              </tr>
 				   </c:forEach>
   			 </c:if>
          </tbody>
      </table>
      <p>&nbsp;&nbsp;*&nbsp;&nbsp;승인대기 상태인 신청만 수정/삭제가 가능합니다.</p>
      </div>
      <div class="row" style="width:100%">
      	<div class="col text-right">
		  <button class="btn btn-primary" type="button" id="newFormButton">신청서</button>
      	 </div>
      </div>
</div>
	<div class="form-here card card-body " style="display: none; margin-top: 50px;"></div>
</div>
<div class="modal fade" id="rejectModal"  tabindex="-1" role="dialog" aria-labelledby="rejectModalLabel" aria-hidden="true">
	 <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="rejectModal" >반려사유</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <p id="rejectReason" style="text-align:center;"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<script src="<c:url value='/resources/js/paging.js' />"></script>
<script src='<c:url value="/resources/js/app/academicchange/academicRecordChange.js" />'></script>




