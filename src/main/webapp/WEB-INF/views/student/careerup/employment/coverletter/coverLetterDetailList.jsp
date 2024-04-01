<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<style>
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
	.formBtnCla {
	    text-align: center;
	    margin-top: 20px; 
	}
	.formBtnOne {
	    margin-right: 10px;
	}
	.certiSeltwo {
		margin-right: 10px;
	}
</style>

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
			<!-- 항목 -->
			<div id="Experience" class="registArea">   		    
		        <!-- 내용 -->
				<div id="Experience" class="registArea">
				    <div class="mb-24pt mb-sm-0 mr-sm-24pt headText">
				        <h2 class="mb-0">자기소개서</h2>
				    	<button type="button" class="btn btn-outline-secondary addBtn" id="insertButton">+ 추가</button>
				    	<div id="bodyForm">
				    		<!-- 항목 추가 -->
				    	</div>
				    </div>
				    <!-- 추가될 폼 -->
				    <div id="languageAbilityForms">
				        <!-- 추가 폼 내용 -->
				    </div>
				</div>
			</div>
			<div id="formBtn" class="user-profile__action formBtnCla">
            	<button type="submit" class="btn btn-outline-secondary formBtnOne" data-eventid="insert">저장</button>
            	<button type="button" class="btn btn-outline-secondary formBtnTwo">취소</button>
            </div>	
	    </form>
	</div>	
					
		<!-- 자기소개서 목록 -->
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
				            <th>자기소개서 등록번호</th>
				            <th>학번</th>
				            <th colspan="2">관리</th>
				        </tr>
				    </thead>
					<tbody class="list" id="listBody">
				    </tbody>
				</table>
			</div>
		</div>
	</div>	
</div>

<!-- 페이징 영역 -->
<div class="pagination-container">
	<div id="pagingArea"></div>
</div>
	
<!-- Ajax로 페이지 이동 시 사용할 폼 -->
<form id="searchForm" hidden="true" method="get">
    <input type="hidden" name="page" /> 
</form>

<!-- 자소서 상세 정보를 표시하는 영역 -->
<div class="cover-detail" style="display: none;">
	<button class='btn btn-sm btn-outline-secondary mr-16pt btnRec'>인쇄하기</button>
</div>

<script src="<c:url value='/resources/js/paging.js' />"></script>
<script src='<c:url value="/resources/js/coverLetterDetailList.js" />'></script>

<script>
$(document).ready(function() {
    var languageAbilityCount = 0; // languageAbilityCount 변수를 정의하고 초기화합니다.

    var style = $('<style>.certiTitle, .certiSelOne, .user-profile__action .btn-outline-secondary { margin-left: 20px; }</style>');
    $('head').append(style);

    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        var target = $(e.target).attr("href"); // 활성화된 탭의 href 속성 값 가져오기
        $('.cover-detail').hide();
        //formBtnOne.value = "insert";
    });
    
    $(document).on('click', '#insertButton', function(){
        var formToAdd = $(this).closest('.registForm');
        // 값이 있는지 확인 후 변수 초기화
        var itemName = formToAdd.find('.certiSelOne').val() || '';
        var itemContent = formToAdd.find('.certiSeltwo').val() || '';
        // 새로운 폼 추가
        var newForm = $('<div class="registForm" id="registForm">' +
            '<div class="form-group row mb-3">' +
            '<label class="form-label certiTitle" for="cldTitle" id="cldTitle" name="cldTitle"><h4>항목</h4></label>' +
            '<div class="col-md-12 table-responsive">' +
            '<input type="text" class="form-control col certiSelOne" placeholder="30자 이내로 항목을 입력해주세요." value="' + itemName + '">' +
            '</div>' +
            '</div>' +
            '<div class="form-group row mb-3">' +
            '<label class="form-label certiTitle" for="cldContent" id="cldContent" name="cldContent"><h4>내용</h4></label>' +
            '<div class="col-md-12 table-responsive">' +
            '<textarea rows="4" cols="50" class="form-control col certiSeltwo" placeholder="500자 이내로 내용을 입력해주세요.">' + itemContent + '</textarea>' +
            '<button type="button" class="btn btn-outline-secondary cancelButton">취소</button>' +
            '</div>' +
            '</div>');
        
        $('#bodyForm').append(newForm);
    });
    
    // 취소 버튼 클릭 시 폼 제거
    $(document).on('click', '.cancelButton', function() {
        $(this).closest('.registForm').remove();
        if ($('#languageAbilityForms').children().length === 0) {
            languageAbilityCount = 1;
        }
    });

    $(document).on('click', '.formBtnTwo', function() {
        var confirmCancel = confirm("정말로 취소하시겠습니까?");
        if (confirmCancel) {
            $('a[href="#resumeList"]').tab('show');
        } else {
            return; // 취소
        }
    });

 	// 저장 버튼 클릭 시 AJAX 호출
    $("#resumeForm").submit(function(event) {
        event.preventDefault();
        console.log("등록 실행");
        console.log("formBtnOne", $("#formBtnOne"));
        // 새로운 배열을 생성하여 모든 항목의 제목과 내용을 저장
        var formDataArray = [];
        $('.registForm').each(function() {
            var form = $(this);
            var formData = {
                cldTitle: form.find('.certiSelOne').val(), 
                cldContent: form.find('.certiSeltwo').val() 
            };
            formDataArray.push(formData);
        });
        console.log("formDataArray", formDataArray);
        $.ajax({
            url: "/lcms/student/careerup/employment/coverletter/coverLetterDetailList",
            method: "POST",
            data: JSON.stringify(formDataArray),
            dataType: "json",
            contentType: "application/json",
            success: function(response) {
                console.log("등록이 완료되었습니다.");
                $("#registForm").hide();
                $('a[href="#resumeList"]').tab('show');
                console.log(" ====== : ",response);
                
                $(searchForm).submit();
                
            },
            error: function(xhr, status, error) {
                console.error("등록 중 에러가 발생했습니다:", error);
            }
        });
    });

});
</script>
