<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<style>
    table {
        text-align: center;
    }
	.headText {
	    margin-top: 30px;
	    margin-left: 30px;
	    position: relative;
	}
	.headText::after {
	    content: '';
	    position: absolute;
	    top: calc(100% + 10px); /* h2 텍스트 아래에 위치하도록 수정하고 여분의 여백을 추가합니다 */
	    left: 0;
	    width: 100%;
	    height: 1px;
	    background-color: #ccc; /* 선의 색상을 조정할 수 있습니다 */
	}
    #restRVData::-webkit-scrollbar {
        display: none; /* Chrome, Safari, Edge 및 Opera에서 스크롤바 숨기기 */
    }
    .pagination-container {
        text-align: right;
    }
    .user-profile__picture {
    	width: 152px;
    	height: 172px;
    	margin-left: 50px;
    	margin-right: 30px;
    }
    .imgInDe {
    	margin-left: 35px;
    	margin-top: 10px;
    }
    .userInfo {
    	margin-top: 30px;
    }
    .form-control {
    	width: 100%;
    }
    .col-form-label {
    	font-weight: bold;
    	text-align: right;
    }
    .headText {
    	margin-top: 30px;
    	margin-left: 30px;
    }
    .eduTitle {
    	margin-left: 50px !important;
    	margin-right: 20px;
    }
    .eduSelect {
    	width: 30%;
    }
    .eduTitleDetails {
    	margin-left: 30px;
    	margin-right: 100px;
    }
    .eduTitleDetailsTwo {
        margin-left: 30px;
    	margin-right: 70px;
    }
    .registForm {
    	margin-top: 20px;
    	margin-left: 35px;
    	width: 80%;
    }
    .registFormTwo {
   		margin-top: 20px;
   		margin-left: 25px;
   		width: 80%;
    }
    .schoolSelOne {
    	margin-right: 20px !important;
    }
    .schoolSelTwo {
    	margin-right: 20px !important;
    }
    .SelAdmYear {
    	margin-right: 20px !important;
    }
	.addBtn {
	    margin-left: 30px !important; /* 우선순위를 위해 !important를 추가합니다 */
	}
    .comSelOne, .comSelect {
    	width: 60%;
    	margin-right: 18px !important;
    }
    .eduTitle {
    	margin-left: 23px;
    }
    .SelCom {
    	margin-left: 75px !important;
    }
    .SelGraMM {
    	margin-right: 18px !important;
    }
    .certification {
    	margin-left: 50px;
    }
    .certiTitle {
    	margin-right: 20px;
    }
    .certiSelOne {
    	width: 60%;
    	margin-right: 18px !important;
	}
	.formBtnCla {
	    text-align: center;
	    margin-top: 20px; 
	}
	.formBtnOne, .formBtnTwo {
	    margin-right: 10px;
	}
</style>

<div class="page-separator">
	<div class="page-separator__text">이력서목록</div>
</div>

<div class="card dashboard-area-tabs p-relative o-hidden mb-32pt">
	<div class="card-header p-0 nav">
		<div class="row no-gutters"
			 role="tablist">
			<div class="col-auto">
				<a href="#resumeList"
				   data-toggle="tab"
				   role="tab"
				   aria-selected="true"
				   class="dashboard-area-tabs__tab card-body d-flex flex-row align-items-center justify-content-start active">
					<span class="h2 mb-0 mr-3">1</span>
					<span class="flex d-flex flex-column">
						<strong>목록</strong>
					</span>
				</a>
			</div>
			<div class="col-auto border-left border-right">
				<a href="#resumeUpload"
				   data-toggle="tab"
				   role="tab"
				   aria-selected="false"
				   class="dashboard-area-tabs__tab card-body d-flex flex-row align-items-center justify-content-start">
					<span class="h2 mb-0 mr-3">2</span>
					<span class="flex d-flex flex-column">
						<strong>등록하기</strong>
					</span>
				</a>
			</div>
		</div>
	</div>
	<!-- 탭 내용 -->
	<div class="tab-content">
	
	<!-- 등록하기 폼 -->
	<div class="tab-pane fade" id="resumeUpload" role="tabpanel">
	    <form id="resumeForm" class="mb-4">
	        <!-- 개인정보 -->
	        <div id="RegistBaseInfo" class="registArea">
	            <div class="mb-24pt mb-sm-0 mr-sm-24pt headText">
	                <h2 class="mb-0">개인정보</h2>
	            </div>
	            <div class="row align-items-center">
	                <!-- 왼쪽에는 프로필 사진과 버튼 -->
	                <div>
	                    <div class="user-profile__picture border rounded p-1">
	                    </div>
	                    <div id="picModify" class="user-profile__action imgInDe">
	                        <button type="button" class="btn btn-outline-secondary">수정</button>
	                        <button type="button" class="btn btn-outline-secondary">삭제</button>
	                    </div>
	                </div>
	                <!-- 오른쪽에는 개인정보 입력 필드 -->
	                <div class="col-md-8 userInfo border-left pl-3">
	                    <div class="user-profile__info">
	                        <div class="user-profile__base mb-4">
	                            <div class="form-group">
	                                <div class="row">
	                                    <div class="col-auto">
	                                        <input type="text" class="form-control" id="userName" value="이성휘" readonly>
	                                    </div>
	                                    <div class="col-auto">
	                                        <input type="text" class="form-control" id="userAge" value="30세 (1994년생)" readonly>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="form-group row">
	                                <label class="col-form-label col-md-2" for="userTel">연락처</label>
	                                <div class="col-md-9">
	                                    <input type="text" class="form-control" id="userTel" value="010-3912-3145" readonly>
	                                </div>
	                            </div>
	                            <div class="form-group row">
	                                <label class="col-form-label col-md-2" for="userEmail">이메일</label>
	                                <div class="col-md-9">
	                                    <input type="text" class="form-control" id="userEmail" value="communcatime@naver.com" readonly>
	                                </div>
	                            </div>
	                            <div class="form-group row">
	                                <label class="col-form-label col-md-2" for="userAddr">주&nbsp;&nbsp;&nbsp;&nbsp;소</label>
	                                <div class="col-md-9">
	                                    <input type="text" class="form-control" id="userAddr" value="대전 유성구 송강동" readonly>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <!-- 최종학력 -->
	        <div id="Education" class="registArea">
	            <div class="mb-24pt mb-sm-0 mr-sm-24pt headText">
	                <h2 class="mb-0">학력</h2>
	            </div>
	            <div class="row align-items-center">
	                <div class="col-md-8 userInfo border-left pl-3">
	                    <div class="user-profile__info education">
	                        <div class="user-profile__base mb-4">
	                            <div class="form-group col-auto">
	                                <label class="form-label eduTitle" for="custom-select">최종학력</label>
	                                <select id="custom-select" class="form-control custom-select eduSelect">
	                                    <option selected>선택</option>
	                                    <option value="대학원">대학원</option>
	                                    <option value="대학">대학</option>
	                                    <option value="고등학교">고등학교</option>
	                                    <option value="중학교">중학교</option>
	                                    <option value="초등학교">초등학교</option>
	                                </select>
	                                <select id="custom-select" class="form-control custom-select eduSelect">
	                                    <option selected>선택</option>
	                                    <option value="졸업">졸업</option>
	                                    <option value="재학중">재학중</option>
	                                    <option value="휴학중">휴학중</option>
	                                    <option value="중퇴">중퇴</option>
	                                    <option value="수료">수료</option>
	                                </select>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <!-- 학력상세 -->
			<div id="Education" class="registArea">
			    <div class="mb-24pt mb-sm-0 mr-sm-24pt headText">
			        <h2 class="mb-0">학력상세</h2>
			    </div>
			    <div class="row align-items-center">
			        <div class="col-md-10 userInfo border-left pl-3">
			            <div class="user-profile__info educationDetails">
			                <div class="user-profile__base mb-4">
			                    <div class="form-group col-auto">
			                        <label class="form-label eduTitleDetails" for="custom-select">대학</label>
			                        <div class="col-md-12 table-responsive">
			                            <table class="table">
			                                <tr>
			                                    <td><input type="text" class="form-control schoolTitleCla" id="schoolTitle" placeholder="학교"></td>
			                                    <td><input type="text" class="form-control schoolMajorCla" id="schoolMajor" placeholder="전공"></td>
			                                    <td><input type="text" class="form-control admYearCla" id="admYear" placeholder="입학년도"></td>
			                                    <td><input type="text" class="form-control graYearCla" id="graYear" placeholder="졸업년도"></td>
			                                </tr>
			                            </table>
			                        </div>
			                        <button type="button" class="btn btn-outline-secondary addBtn" onclick="toggleForm('universityForm')">+ 추가</button>
			                        <div id="universityForm" class="registForm" style="display: none;">
									    <div class="form-group row mb-2">
									        <input type="text" class="form-control col schoolSelOne" placeholder="학교를 입력해주세요.">
									        <input type="text" class="form-control col schoolSelTwo" placeholder="전공을 입력해주세요.">
									    </div>
									    <div class="form-group row mb-2">
									        <select class="form-control col custom-select SelAdmYear">
									            <option>입학년도를 선택해주세요.</option>
									            <% for (int i = 2025; i >= 1950; i--) { %>
									                <option value="<%= i %>"><%= i %>년</option>
									            <% } %>
									        </select>
									        <select class="form-control col custom-select SelGraYear">
									            <option>졸업년도를 선택해주세요.</option>
									            <% for (int i = 2028; i >= 1950; i--) { %>
									                <option value="<%= i %>"><%= i %>년</option>
									            <% } %>
									        </select>
									    </div>
									    <div id="schoolBtn" class="user-profile__action schoolBtnCla">
				                            <button type="button" class="btn btn-outline-secondary">저장</button>
				                            <button type="button" class="btn btn-outline-secondary">취소</button>
				                        </div>
									</div>
			                    </div>
			                    <div class="form-group col-auto">
			                        <label class="form-label eduTitleDetailsTwo" for="custom-select">고등학교</label>
			                        <div class="col-md-12 table-responsive">
			                            <table class="table">
			                                <tr>
			                                    <td><input type="text" class="form-control highSchoolTitleCla" id="highSchoolTitle" placeholder="학교"></td>
			                                    <td><input type="text" class="form-control highSchoolMajorCla" id="highSchoolMajor" placeholder="전공"></td>
			                                    <td><input type="text" class="form-control highadmYearCla" id="highadmYear" placeholder="입학년도"></td>
			                                    <td><input type="text" class="form-control highgraYearCla" id="highgraYear" placeholder="졸업년도"></td>
			                                </tr>
			                            </table>
			                        </div>
			                        <button type="button" class="btn btn-outline-secondary addBtn" onclick="toggleForm('highSchoolForm')">+ 추가</button>
			                        <div class="registFormTwo" id="highSchoolForm" style="display: none;">
			                            <input type="text" class="form-control mb-2" placeholder="학교를 입력해주세요.">
			                            <select class="form-control custom-select mb-2">
			                                <option>입학년도를 선택해주세요.</option>
			                                <% for (int i = 2025; i >= 1950; i--) { %>
			                                    <option value="<%= i %>"><%= i %>년</option>
			                                <% } %>
			                            </select>
			                            <select class="form-control custom-select mb-2">
			                                <option>졸업년도를 선택해주세요.</option>
			                                <% for (int i = 2028; i >= 1950; i--) { %>
			                                    <option value="<%= i %>"><%= i %>년</option>
			                                <% } %>
			                            </select>
				                        <div id="highSchoolBtn" class="user-profile__action highSchoolBtnCla">
				                            <button type="button" class="btn btn-outline-secondary">저장</button>
				                            <button type="button" class="btn btn-outline-secondary">취소</button>
				                        </div>	
			                        </div>	
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
			</div>
			<!-- 경력 -->
			<div id="Experience" class="registArea">
			    <div class="mb-24pt mb-sm-0 mr-sm-24pt headText">
			        <h2 class="mb-0">경력</h2>
			    </div>
			    <div class="row align-items-center">
			        <div class="userInfo border-left pl-3">
			            <div class="user-profile__info educationDetails">
			                <div class="user-profile__base mb-4">
			                    <div class="form-group col-auto d-flex justify-content-end">
			                        <label class="form-label eduTitleDetails mr-3" for="custom-select">경력구분</label>
			                        <div id="careeupBtn" class="user-profile__action careeupBtnCla">
			                            <button type="button" class="btn btn-outline-secondary">신입</button>
			                            <button type="button" class="btn btn-outline-secondary">경력</button>
			                        </div>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
			    <div class="row align-items-center">
	                <div class="col-md-8 userInfo border-left pl-3">
	                    <div class="user-profile__info education">
	                        <div class="user-profile__base mb-4">
	                            <div class="form-group row mb-3">
	                                <label class="form-label eduTitle" for="custom-select">회사명</label>
	                                <input type="text" class="form-control col comSelOne" placeholder="회사명을 입력해주세요.">
	                                <select id="custom-select" class="form-control col custom-select comSelect">
	                                    <option selected>근무형태</option>
	                                    <option value="아르바이트">아르바이트</option>
	                                    <option value="계약직">계약직</option>
	                                    <option value="정규직">정규직</option>
	                                    <option value="인턴쉽">인턴쉽</option>
	                                </select>
	                            </div>
	                            <div class="form-group row mb-3 SelCom">
							        <select class="form-control col custom-select SelAdmYear">
							            <option>근무년도</option>
							            <% for (int i = 2024; i >= 2009; i--) { %>
							                <option value="<%= i %>"><%= i %>년</option>
							            <% } %>
							        </select>
							        <select class="form-control col custom-select SelGraMM">
							            <option>입사월</option>
							            <% for (int i = 1; i >= 12; i--) { %>
							                <option value="<%= i %>"><%= i %>월</option>
							            <% } %>
							        </select>
							        <select class="form-control col custom-select SelGraDD">
							            <option>일자</option>
							            <% for (int i = 1; i >= 29; i--) { %>
							                <option value="<%= i %>"><%= i %>일</option>
							            <% } %>
							        </select>
							    </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
		        <!-- 자격증 -->
				<div id="Experience" class="registArea">
				    <div class="mb-24pt mb-sm-0 mr-sm-24pt headText">
				        <h2 class="mb-0">자격증</h2>
				    	<button type="button" class="btn btn-outline-secondary addBtn" onclick="addCertification()">+ 추가</button>
				    </div>
				    <!-- 추가될 폼 -->
				    <div id="certificationForms">
				        <!-- 추가 폼 내용 -->
				    </div>
				</div>
		        <!-- 어학능력 -->
				<div id="Experience" class="registArea">
				    <div class="mb-24pt mb-sm-0 mr-sm-24pt headText">
				        <h2 class="mb-0">어학능력</h2>
				    	<button type="button" class="btn btn-outline-secondary addBtn" onclick="addLanguageAbility()">+ 추가</button>
				    </div>
				    <!-- 추가될 폼 -->
				    <div id="languageAbilityForms">
				        <!-- 추가 폼 내용 -->
				    </div>
				</div>
			</div>
			<div id="formBtn" class="user-profile__action formBtnCla">
            	<button type="button" class="btn btn-outline-secondary formBtnOne">저장</button>
            	<button type="button" class="btn btn-outline-secondary formBtnTwo">취소</button>
            </div>	
	    </form>
	</div>	
					
		<!-- 이력서 목록 -->
		<div class="tab-pane fade show active" id="resumeList"> <!-- 수정 -->
			<div class="table-responsive"
				 data-toggle="lists"
				 data-lists-sort-by="js-lists-values-date"
				 data-lists-sort-desc="true"
				 data-lists-values='["js-lists-values-lead", "js-lists-values-project", "js-lists-values-status", "js-lists-values-budget", "js-lists-values-date"]'>
	
				<table class="table mb-0 thead-border-top-0 table-nowrap">
					<thead>
				        <tr>
				            <th>순번</th>
				            <th>학번</th>
				            <th>학과</th>
				            <th>성명</th>
				            <th>작성일</th>
				            <th colspan="2">관리</th>
				        </tr>
				    </thead>
					<tbody class="list" id="listBody">
		        	<!-- 각 새 이력서 행에 대한 데이터 -->
				        <tr>
				            <td>1</td>
				            <td>
				            	<a href="#">202410965</a>
				            </td>
				            <td>소프트웨어학과</td>
				            <td>이성휘</td>
				            <td>2024년 3월 15일</td>
				            <td><button class="btn btn-primary updateButton">수정</button></td> <!-- 삭제 버튼 -->
				            <td><button class="btn btn-danger deleteButton">삭제</button></td> <!-- 삭제 버튼 -->
				        </tr>
				        <!-- 나머지 새 이력서 행들도 동일하게 추가 -->
				    </tbody>
				</table>
			</div>
		</div>
	</div>	
</div>

<!-- 프로필 사진 모달 -->
<div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="profileModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="profileModalLabel">프로필 사진 수정</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- 프로필 사진 업로드 폼 -->
        <form id="profileForm">
          <div class="form-group">
            <label for="profileImage">새 프로필 사진 선택:</label>
            <input type="file" class="form-control-file" id="profileImage">
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">저장</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<script src="<c:url value='/resources/js/paging.js' />"></script>
<script src='<c:url value="/resources/js/app/resume/resumeList.js" />'></script>

<script>
// 스타일 추가
var style = document.createElement('style');
style.innerHTML = `
    .certiTitle,
    .certiSelOne,
    .user-profile__action .btn-outline-secondary {
        margin-left: 20px;
    }
`;
document.head.appendChild(style);

$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
    var target = $(e.target).attr("href"); // 활성화된 탭의 href 속성 값 가져오기
});

function toggleForm(formId) {
    var form = document.getElementById(formId);
    if (form.style.display === "none") {
        form.style.display = "block";
    } else {
        form.style.display = "none";
    }
}
var certificationCount = 1;
var languageAbilityCount = 1;

function addCertification() {
    var certificationForm = document.createElement('div');
    certificationForm.classList.add('registForm');
    certificationForm.innerHTML = `
        <div class="form-group row mb-3">
            <label class="form-label certiTitle" for="custom-select">자격증명</label>
            <input type="text" class="form-control col certiSelOne" placeholder="자격증을 입력해주세요.">
        </div>
        <div class="form-group row mb-3">
            <label class="form-label certiTitle" for="custom-select">발행처</label>
            <input type="text" class="form-control col certiSelOne" placeholder="발행처를 입력해주세요.">
            <input type="text" class="form-control col certiSelOne" placeholder="취득년도를 입력해주세요.">
        </div>
        <div class="user-profile__action">
            <button type="button" class="btn btn-outline-secondary" onclick="removeForm(this)">취소</button>
        </div>`;
    document.getElementById('certificationForms').appendChild(certificationForm);
    certificationCount++;
}

function addLanguageAbility() {
    var languageAbilityForm = document.createElement('div');
    languageAbilityForm.classList.add('registForm');
    languageAbilityForm.innerHTML = `
        <div class="form-group row mb-3">
            <label class="form-label certiTitle" for="custom-select">어학명</label>
            <input type="text" class="form-control col certiSelOne" placeholder="어학명을 입력해주세요.">
        </div>
        <div class="form-group row mb-3">
            <label class="form-label certiTitle" for="custom-select">어학정보</label>
            <input type="text" class="form-control col certiSelOne" placeholder="어학종류">
            <input type="text" class="form-control col certiSelOne" placeholder="어학성적">
            <input type="text" class="form-control col certiSelOne" placeholder="발급기관">
        </div>
        <div class="user-profile__action">
            <button type="button" class="btn btn-outline-secondary" onclick="removeForm(this)">취소</button>
        </div>`;
    document.getElementById('languageAbilityForms').appendChild(languageAbilityForm);
    languageAbilityCount++;
}

function removeForm(button) {
    var formToRemove = button.closest('.registForm');
    formToRemove.remove();
    if (formToRemove.parentElement.children.length === 0) {
        // 해당 폼이 부모 요소에 더 이상 존재하지 않으면 추가 버튼을 활성화합니다.
        if (formToRemove.parentElement.id === 'certificationForms') {
            certificationCount = 1;
        } else if (formToRemove.parentElement.id === 'languageAbilityForms') {
            languageAbilityCount = 1;
        }
    }
}

// 대학 폼 취소 버튼 이벤트
document.getElementById('universityForm').querySelector('.user-profile__action .btn-outline-secondary:last-of-type').addEventListener('click', function() {
    document.getElementById('universityForm').style.display = 'none';
});

// 고등학교 폼 취소 버튼 이벤트
document.getElementById('highSchoolForm').querySelector('.user-profile__action .btn-outline-secondary:last-of-type').addEventListener('click', function() {
    document.getElementById('highSchoolForm').style.display = 'none';
});

// 프로필 사진 모달 열기
document.getElementById('picModify').addEventListener('click', function() {
    $('#profileModal').modal('show');
});

//프로필 사진 미리보기 모달 열기
document.querySelector('.user-profile__picture img').addEventListener('click', function() {
    // 프로필 사진 이미지를 클릭하면 모달을 보여줍니다.
    $('#profilePreviewModal').modal('show');
});

//프로필 저장 버튼 클릭 이벤트 핸들러
document.querySelector('#profileModal .modal-footer .btn-primary').addEventListener('click', function() {
    // 파일 선택 input 요소 가져오기
    var profileImageInput = document.getElementById('profileImage');
    
    // 선택된 파일이 있는지 확인
    if (profileImageInput.files.length > 0) {
        var file = profileImageInput.files[0]; // 선택된 파일 가져오기
        var reader = new FileReader(); // 파일을 읽기 위한 FileReader 객체 생성
        
        reader.onload = function(event) {
            // 파일을 읽어들인 후 이미지 URL을 가져와서 프로필 이미지에 표시
            var profileImg = document.querySelector('.user-profile__picture .border.rounded.p-1');
            profileImg.style.backgroundImage = 'url(' + event.target.result + ')';
            
            // 프로필 이미지를 저장하는 로직을 수행
            saveProfileImage(file);
        };
        
        reader.readAsDataURL(file); // 파일을 읽어들임
    } else {
        // 선택된 파일이 없을 때에 대한 처리를 추가할 수 있습니다.
        console.log('프로필 이미지를 선택해주세요.');
    }
});

// 프로필 이미지를 저장하는 함수
function saveProfileImage(imageFile) {
    // FormData 객체 생성
    var formData = new FormData();
    formData.append('profileImage', imageFile); // 이미지 파일 추가

    // AJAX를 사용하여 서버에 이미지 업로드
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'upload_profile_image.php', true); // 서버로 데이터 전송
    xhr.onload = function () {
        if (xhr.status === 200) {
            console.log('프로필 이미지가 성공적으로 저장되었습니다.');
        } else {
            console.error('프로필 이미지 저장에 실패했습니다.');
        }
    };
    xhr.send(formData); // FormData 객체 전송
}


// 프로필 사진 삭제
document.getElementById('deleteProfileBtn').addEventListener('click', function() {
    // 프로필 사진 삭제 로직을 구현하세요
    var profileImage = document.getElementById('profileImage'); // 프로필 이미지 요소 가져오기
    profileImage.src = defaultImageUrl; // 프로필 이미지를 기본 이미지로 변경
});
</script>

