<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
*학번 또는 이름을 누르면 학생의 상세 정보를 조회할 수 있습니다.
<hr/>

<%-- ${result} --%>
<div class="card mb-0">

                        <div class="table-responsive" data-toggle="lists" data-lists-sort-by="js-lists-values-employee-name" data-lists-values="[&quot;js-lists-values-employee-name&quot;, &quot;js-lists-values-employer-name&quot;, &quot;js-lists-values-projects&quot;, &quot;js-lists-values-activity&quot;, &quot;js-lists-values-earnings&quot;]">

                            <div class="card-header">
                                <form class="form-inline">
                                    <label class="mr-sm-2 form-label" for="inlineFormFilterBy">검색</label>
                                    <select id="inlineFormRole" class="custom-select mb-2 mr-sm-2 mb-sm-0">
                                        <option value="All Roles">단과대학</option>
                                        <option value="All Roles">학과</option>
                                        <option value="All Roles">이름</option>
                                        <option value="All Roles">입학년도</option>
                                        <option value="All Roles">졸업년도</option>
                                    </select>
									<label class="sr-only" for="inlineFormRole">검색</label>
										 <select id="inlineFormRole" class="custom-select mb-2 mr-sm-2 mb-sm-0">
	                                        <option value="All Roles">단과대학</option>
	                                        <option value="All Roles">학과</option>
	                                        <option value="All Roles">이름</option>
	                                        <option value="All Roles">입학년도</option>
	                                        <option value="All Roles">졸업년도</option>
	                                    </select>
                                    <label class="sr-only" for="inlineFormRole">검색</label>
                                    <input type="text" class="form-control search mb-2 mr-sm-2 mb-sm-0" id="inlineFormFilterBy" placeholder="Search ...">

                                    <div class="ml-auto mb-2 mb-sm-0 custom-control-inline mr-0">
                                        <label class="form-label mb-0" for="active">Active</label>
                                        <div class="custom-control custom-checkbox-toggle ml-8pt">
                                            <input checked="" type="checkbox" id="active" class="custom-control-input">
                                            <label class="custom-control-label" for="active">Active</label>
                                        </div>
                                    </div>
                                </form>
                            </div>

                            <table class="table mb-0 thead-border-top-0 table-nowrap">
                                <thead>
                                    <tr>

                                        <th style="width: 18px;" class="pr-0">
                                             <a href="javascript:void(0)" class="sort asc" data-sort="js-lists-values-employee-name">학번</a>
                                        </th>

                                        <th>
                                            <a href="javascript:void(0)" class="sort asc" data-sort="js-lists-values-employee-name">이름</a>
                                        </th>

                                        <th style="width: 150px;">
                                            <a href="javascript:void(0)" class="sort" data-sort="js-lists-values-employer-name">단과대학</a>
                                        </th>

                                        <th class="text-center" style="width: 48px;">
                                            <a href="javascript:void(0)" class="sort" data-sort="js-lists-values-projects">학과</a>
                                        </th>

                                        <th style="width: 37px;">생년월일(성별)</th>

                                        <th style="width: 120px;">
                                            <a href="javascript:void(0)"  class="sort" data-sort="js-lists-values-earnings">학적상태</a>
                                        </th>
                                        <th style="width: 51px;">
                                            <a href="javascript:void(0)" >전화번호</a>
                                        </th>
                                        <th style="width: 51px;">
                                        	<a href="javascript:void(0)" >주소</a>
                                        </th>
                                         <th style="width: 51px;">
                                            <a href="javascript:void(0)" >Email</a>
                                        </th>
                                         <th style="width: 51px;">
                                            <a href="javascript:void(0)" >은행</a>
                                        </th>
                                         <th style="width: 51px;">
                                            <a href="javascript:void(0)" >계좌번호</a>
                                        </th>
                                         <th style="width: 51px;">
                                            <a href="javascript:void(0)" >예금주</a>
                                        </th>
                                        <th style="width: 24px;" class="pl-0"></th>
                                    </tr>
                                </thead>
                                	<c:forEach items="${result}" var="r">
                                <tbody class="list" id="staff"><tr>

                                        <td class="pr-0">
                                        	 <div class="media-body">

                                                    <div class="d-flex flex-column">
                                                        <p class="mb-0">
                                                        	<a href='<c:url value="/manager/stu/studentinfo/${r.memNo}"/>'>
                                                        		<strong class="js-lists-values-employee-name">${r.memNo}</strong>
                                                        	</a>
                                                        </p>
                                                    </div>

                                                </div>
                                        </td>

                                        <td>

                                            <div class="media flex-nowrap align-items-center" style="white-space: nowrap;">
                                                <div class="media-body">

                                                    <div class="d-flex flex-column">
                                                        <p class="mb-0">
                                                        	<a href='<c:url value="/manager/stu/studentinfo/${r.memNo}"/>'>
                                                        		<strong class="js-lists-values-employee-name">${r.memName}</strong>
                                                        	</a>
                                                        </p>
                                                    </div>

                                                </div>
                                            </div>

                                        </td>

                                        <td class="text-center js-lists-values-projects small">
                                        	<a href="" class="">${r.colName}</a>
                                        </td>

                                        <td>

                                            <a href="" class="">${r.deptName}</a>

                                        </td>

                                        <td>
                                            <div class="d-flex align-items-center">
                                               ${r.bas}
                                            </div>
                                        </td>

                                        <td class="text-50 js-lists-values-activity small">${r.acName}</td>
                                        <td class="js-lists-values-earnings small">${r.memTel}</td>
                                        <td class="js-lists-values-earnings small">${r.memAddr}</td>
                                        <td class="js-lists-values-earnings small">${r.memEmail}</td>
                                        <td class="js-lists-values-earnings small">${r.memBank}</td>
                                        <td class="js-lists-values-earnings small">${r.memBanknum}</td>
                                        <td class="js-lists-values-earnings small">${r.memDepo}</td>
                                        <td class="text-right pl-0">
                                            <a href="" class="text-50"><i class="material-icons">more_vert</i></a>
                                        </td>
                                    </tr>
                                 </tbody>
</c:forEach>
                            </table>
                        </div>

                        <div class="card-footer p-8pt">

                            <ul class="pagination justify-content-start pagination-xsm m-0">
                                <li class="page-item disabled">
                                    <a class="page-link" href="#" aria-label="Previous">
                                        <span aria-hidden="true" class="material-icons">chevron_left</span>
                                        <span>Prev</span>
                                    </a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Page 1">
                                        <span>1</span>
                                    </a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Page 2">
                                        <span>2</span>
                                    </a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Next">
                                        <span>Next</span>
                                        <span aria-hidden="true" class="material-icons">chevron_right</span>
                                    </a>
                                </li>
                            </ul>

                        </div>
                        <!-- <div class="card-body bordet-top text-right">
  15 <span class="text-50">of 1,430</span> <a href="#" class="text-50"><i class="material-icons ml-1">arrow_forward</i></a>
</div> -->

                    </div>

