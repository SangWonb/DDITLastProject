<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<div class="card card-body">
<div class="card card-body" style="background-color: #f2f2f2; width:80%; margin-left:10%">
<h2 style="text-align:center;">워크넷 직업심리검사</h2>
   <ul>
      <li>본 검사는 워크넷을 통한 검사이므로 검사를 위해 <span>워크넷 회원가입 및 로그인</span>을 해야 합니다.</li>
      <li>워크넷을 통한 온라인 검사는 검사 실시 후 즉시 결과표를 받아보실 수 있스며, 검사결과에 대한 상담을 원하시는 분들은 가까운 고용노동부 고용센터(1350)의 전문 직업 상담원에게 문의하시기 바랍니다.</li>
      <li>온라인 검사는 아래 목록의 검사명을 클릭하시면 해당 검사의 설명을 확인하실 수 있습니다.</li>
      <li><span>검사실시</span> 버튼을 클릭하면 검사를 실시할 수 있으며, 검사 도중 중단 되어도 당일에 한해 이어서 실시가 가능합니다.</li>
      <li>본 검사는 시각만으로 판단해야 하는 검사방식이 포함되어 있습니다. 해당 검사방식으로 검사진행이 어려운 장애우 학생은 한국장애인고용공단에서 제공하는 온라인 직업심리검사를 받으시기 바랍니다. <a href="https://www.kead.or.kr/" target="_blank">한국장애인고용공단 온라인 직업심리 검사 바로가기</a> </li>
      <li>결과조회는 워크넷에서 로그인 후 확인이 가능합니다.</li>
   </ul>
</div>
<div style="display: flex; justify-content: flex-end; margin-bottom:15px; width:90%;">
	<button class="btn btn-secondary" onclick="goBack()" >뒤로가기</button>
</div>
<div class="card card-body" style="text-align:center; width: 80%; margin-left:10%">
<div class="table table-votest" style="display: inline-block;">
   <table style="width: 100%;">
      <colgroup>
         <col style="width:36.507%">
         <col style="width:11.640%">
         <col style="width:13.227%">
         <col style="width:12.698%">
         <col style="width:12.698%">
         <col style="width:13.227%">
      </colgroup>
      <tbody class="text_center">
         <tr style="background-color: #f2f2f2;">
            <th>심리검사명</th>
            <th>검사시간</th>
            <th>실시가능</th>
            <th>검사안내</th>
            <th>결과예시</th>
            <th>검사실시</th>
         </tr>
         <tr>
            <td class="">성인용 직업적성검사</td>
            <td class="">90분</td>
            <td class="">인터넷, 지필</td>
            <td class=""><a href="http://www.work.go.kr/consltJobCarpa/jobPsyExam/aduAptDetail.do" target="_blank">안내보기</a></td>
            <td class=""><a href="http://www.work.go.kr/contents.do?relAddr=/consltJobCarpa/jobPsyExamSample/sampleAduAptEx&amp;titleId=JIFA000010" target="_blank">예시보기</a></td>
            <td class=""><a href="http://work.go.kr/consltJobCarpa/jobPsyExam/guest/univJobPsyExamInfo.do?psyExamOrgcd=U0134&amp;psyExamStudentId=201603082" target="_blank" class="btn btn-secondary" style="width:100px;">검사실시</a></td>
         </tr>
         <tr>
            <td class="">직업선호도검사 S형</td>
            <td class="">25분</td>
            <td class="">인터넷, 지필</td>
            <td class=""><a href="http://www.work.go.kr/consltJobCarpa/jobPsyExam/aduPreSNewDetail.do" target="_blank">안내보기</a></td>
            <td class=""><a href="http://www.work.go.kr/contents.do?relAddr=/consltJobCarpa/jobPsyExamSample/sampleAduPreSNewEx&amp;titleId=JIFA000011" target="_blank">예시보기</a></td>
            <td class=""><a href="http://work.go.kr/consltJobCarpa/jobPsyExam/guest/univJobPsyExamInfo.do?psyExamOrgcd=U0134&amp;psyExamStudentId=201603082" target="_blank" class="btn btn-secondary" style="width:100px;">검사실시</a></td>
         </tr>
         <tr>
            <td class="">구직준비도검사</td>
            <td class="">20분</td>
            <td class="">인터넷, 지필</td>
            <td class=""><a href="http://www.work.go.kr/consltJobCarpa/jobPsyExam/aduEquipDetail.do" target="_blank">안내보기</a></td>
            <td class=""><a href="http://www.work.go.kr/contents.do?relAddr=/consltJobCarpa/jobPsyExamSample/sampleAduEquipEx&amp;titleId=JIFA000026" target="_blank">예시보기</a></td>
            <td class=""><a href="http://work.go.kr/consltJobCarpa/jobPsyExam/guest/univJobPsyExamInfo.do?psyExamOrgcd=U0134&amp;psyExamStudentId=201603082" target="_blank" class="btn btn-secondary" style="width:100px;">검사실시</a></td>
         </tr>
         <tr>
            <td class="">창업적성검사</td>
            <td class="">20분</td>
            <td class="">인터넷, 지필</td>
            <td class=""><a href="http://www.work.go.kr/consltJobCarpa/jobPsyExam/aduFoundAptdDetail.do" target="_blank">안내보기</a></td>
            <td class=""><a href="http://www.work.go.kr/contents.do?relAddr=/consltJobCarpa/jobPsyExamSample/sampleAduAptdFoundEx&amp;titleId=JIFA000027" target="_blank">예시보기</a></td>
            <td class=""><a href="http://work.go.kr/consltJobCarpa/jobPsyExam/guest/univJobPsyExamInfo.do?psyExamOrgcd=U0134&amp;psyExamStudentId=201603082" target="_blank" class="btn btn-secondary" style="width:100px;">검사실시</a></td>
         </tr>
         <tr>
            <td class="">직업전환검사</td>
            <td class="">20분</td>
            <td class="">인터넷, 지필</td>
            <td class=""><a href="http://www.work.go.kr/consltJobCarpa/jobPsyExam/aduConvDetail.do" target="_blank">안내보기</a></td>
            <td class=""><a href="http://www.work.go.kr/contents.do?relAddr=/consltJobCarpa/jobPsyExamSample/sampleAduConvEx&amp;titleId=JIFA000015" target="_blank">예시보기</a></td>
            <td class=""><a href="http://work.go.kr/consltJobCarpa/jobPsyExam/guest/univJobPsyExamInfo.do?psyExamOrgcd=U0134&amp;psyExamStudentId=201603082" target="_blank" class="btn btn-secondary" style="width:100px;">검사실시</a></td>
         </tr>
         <tr>
            <td class="">영업직무 기본역량검사</td>
            <td class="">50분</td>
            <td class="">인터넷, 지필</td>
            <td class=""><a href="http://www.work.go.kr/consltJobCarpa/jobPsyExam/aduCapaDetail.do" target="_blank">안내보기</a></td>
            <td class=""><a href="http://www.work.go.kr/contents.do?relAddr=/consltJobCarpa/jobPsyExamSample/sampleAduCapaEx&amp;titleId=JIFA000018" target="_blank">예시보기</a></td>
            <td class=""><a href="http://work.go.kr/consltJobCarpa/jobPsyExam/guest/univJobPsyExamInfo.do?psyExamOrgcd=U0134&amp;psyExamStudentId=201603082" target="_blank" class="btn btn-secondary" style="width:100px;">검사실시</a></td>
         </tr>
         <tr>
            <td class="">IT직무 기본 역량검사</td>
            <td class="">95분</td>
            <td class="">인터넷, 지필</td>
            <td class=""><a href="http://www.work.go.kr/consltJobCarpa/jobPsyExam/aduItCapaDetail.do" target="_blank">안내보기</a></td>
            <td class=""><a href="http://www.work.go.kr/contents.do?relAddr=/consltJobCarpa/jobPsyExamSample/sampleAduItCapaEx&amp;titleId=JIFA000019" target="_blank">예시보기</a></td>
            <td class=""><a href="http://work.go.kr/consltJobCarpa/jobPsyExam/guest/univJobPsyExamInfo.do?psyExamOrgcd=U0134&amp;psyExamStudentId=201603082" target="_blank" class="btn btn-secondary" style="width:100px;">검사실시</a></td>
         </tr>
         <tr>
            <td class="">대학생 진로준비도검사</td>
            <td class="">20분</td>
            <td class="">인터넷, 지필</td>
            <td class=""><a href="http://www.work.go.kr/consltJobCarpa/jobPsyExam/univJobPreDetail.do" target="_blank">안내보기</a></td>
            <td class=""><a href="http://www.work.go.kr/contents.do?relAddr=/consltJobCarpa/jobPsyExamSample/sampleUnivJobPreEx&amp;titleId=JIFA000021" target="_blank">예시보기</a></td>
            <td class=""><a href="http://work.go.kr/consltJobCarpa/jobPsyExam/guest/univJobPsyExamInfo.do?psyExamOrgcd=U0134&amp;psyExamStudentId=201603082" target="_blank" class="btn btn-secondary" style="width:100px;">검사실시</a></td>
         </tr>
      </tbody>
   </table>
</div>
      <div>
         <button id="resultHref" class="btn btn-secondary" style="margin-top:20px;">
            결과조회
         </button>
      
      </div>
</div>
</div>

<script>
$(document).ready(function() {
    $("#resultHref").click(function() {
        // link1 클릭 시 동작할 코드 작성
        window.location.href = "http://www.work.go.kr/consltJobCarpa/jobPsyExam/newJobPsyExamLogin.do?rtnUrl=%2FconsltJobCarpa%2FjobPsyExamNew%2FpsyExamRsltList.do";
    });
    
});

function goBack(){
	window.history.back();
}
</script>
