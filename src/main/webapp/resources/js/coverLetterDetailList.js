$(document).ready(function() {
    // 검색 폼 제출 이벤트
    $(searchForm).on("submit", function(event) {
        event.preventDefault();
        let $listBody = $("#listBody");
        let $pagingArea = $("#pagingArea");

        $.ajax({
            url: '/lcms/student/careerup/employment/coverletter/jsoncoverList',
            method: 'get',
            dataType: "json",
            data: { "page": event.target.page.value },
            success: function(jsonObj) {
                $listBody.empty();
                $pagingArea.empty();

                let dataList = jsonObj.coverList;
                let pagingHTML = jsonObj.pagingHTML;
                let trTags = null;
                if (dataList.length > 0) {
                    $.each(dataList, function(index, cover) {
                        trTags += `
                            <tr>
                                <td>${cover.rnum}</td>
                                <td>
                                    <a href="#" class="coverLink" data-cover-code="${cover.clNo}">${cover.clNo}</a>
                                </td>
                                <td>${cover.smemNo}</td>
                                <td>
                                    <button class="btn btn-success printButton" data-cover-code="${cover.clNo}">인쇄하기</button>
                                    <button value="${cover.clNo}" class="btn btn-danger deleteButton">삭제</button>
                                </td>
                            </tr>
                        `;
                    });
                } else {
                    trTags = `
                        <tr>
                            <td colspan="6">등록된 자기소개서가 없습니다.</td>
                        </tr>
                    `;
                }
                
                $listBody.append(trTags);
                $pagingArea.append(pagingHTML);
            },
            error: function(jqXHR, txt, status) {
                console.log(txt, status, jqXHR);
            }
        }).done(() => {
            $(this).find("input[name='page']").val("");
        });
        return false;
    }).submit();

    // 인쇄하기 버튼 클릭 시 coverViewPrint를 작은 창으로 열기
    $(document).on('click', '.printButton', function(event) {
        event.preventDefault();
        let coverCode = $(this).data('cover-code'); // 클릭된 버튼의 data-cover-code 값을 가져옴
        let coverViewURL = `${cPath}/student/careerup/employment/coverletter/coverViewPrint/${coverCode}`; // coverViewPrint URL 생성
        
        // 새 창의 크기 및 위치 설정
        let w = 900; // 새 창의 가로 크기
        let h = 700; // 새 창의 세로 크기
        let left = (screen.width - w) / 2; // 가운데 정렬을 위한 가로 위치
        let top = (screen.height - h) / 2; // 가운데 정렬을 위한 세로 위치

        // 작은 창으로 coverViewPrint 열기
        window.open(coverViewURL, '_blank', `width=${w}, height=${h}, left=${left}, top=${top}`);
    });

    // 자소서 등록번호 클릭 시 coverView 로드
    $(document).on('click', '.coverLink', function(event) {
        event.preventDefault();
        let coverCode = $(this).data('cover-code'); // 클릭된 요소의 cover-code 값을 가져옴
        loadcoverDetail(coverCode);
    });

    $(document).on('click', '.deleteButton', function(event) {
        var deleteButton = $(this); // 현재 클릭된 삭제 버튼을 저장
        var clNo = deleteButton.val(); // 선택된 자기소개서의 coverCode를 가져옴
        console.log(clNo);
        if (confirm("자기소개서를 삭제하시겠습니까?")) { // 삭제 여부 확인
            $.ajax({
                url: "/lcms/student/careerup/employment/coverletter/deleteCover", // 삭제 처리를 수행하는 컨트롤러의 URL
                method: "POST",
                data: { clNo: clNo }, // 삭제할 자기소개서의 coverCode를 전송
                success: function(response) {
                    console.log("자기소개서가 삭제되었습니다.");
                    // 삭제된 자기소개서를 화면에서 제거
                    deleteButton.closest("tr").remove();         
                    $.ajax({
                        url: "/lcms/student/careerup/employment/coverletter/jsoncoverList",
                        method: "GET",
                        data: { "page": 1 }, // 페이지 번호를 지정하여 첫 페이지의 목록을 가져올 수 있도록 설정하셨다면 여기에 적절한 페이지 번호를 지정해주세요.
                        dataType: "json",
                        success: function(jsonObj) {
                            console.log("자기소개서 목록을 다시 불러왔습니다.");
                            // 서버에서 새로운 자기소개서 목록을 받아와서 화면을 업데이트
                            updatecoverList(jsonObj.coverList);
                        },
                        error: function(xhr, status, error) {
                            console.error("자기소개서 목록을 다시 불러오는 중 에러가 발생했습니다:", error);
                        }
                    });      
                },
                error: function(xhr, status, error) {
                    console.error("자기소개서 삭제 중 에러가 발생했습니다:", error);
                }
            });
        }
    });

    // 자기소개서 목록을 업데이트하는 함수
    function updatecoverList(coverList) {
        let $listBody = $("#listBody");
        let $pagingArea = $("#pagingArea");

        $listBody.empty();
        $pagingArea.empty();

        let trTags = "";
        if (coverList.length > 0) {
            $.each(coverList, function(index, cover) {
                trTags += `
                    <tr>
                        <td>${cover.rnum}</td>
                        <td>
                            <a href="#" class="coverLink" data-cover-code="${cover.clNo}">${cover.clNo}</a>
                        </td>
                        <td>${cover.smemNo}</td>
                        <td>
							<button class="btn btn-success printButton" data-cover-code="${cover.clNo}">인쇄하기</button>
                            <button value="${cover.clNo}" class="btn btn-danger deleteButton">삭제</button>
                        </td>
                    </tr>
                `;
            });
        } else {
            trTags = `
                <tr>
                    <td colspan="5">등록된 자기소개서가 없습니다.</td>
                </tr>
            `;
        }

        $listBody.append(trTags);
    }
});

var cPath = $('body').data('bodyCpath');

function loadcoverDetail(clNo) { // 매개변수 이름을 clNo로 변경
    $.ajax({
        type: 'GET',
        url: `${cPath}/student/careerup/employment/coverletter/coverView/${clNo}`, 
        success: function(response) {
            $('.cover-detail').html(response).toggle();
        },
        error: function(xhr, status, error) {
            console.error('AJAX request failed: ', status, error);
        }
    });

	// 수정 버튼 클릭 시
	$(document).on('click', '.btnUp', function(event) {
	    event.preventDefault(); // 폼 제출 방지
	    alert("수정 버튼이 클릭되었습니다.");
	
		// 폼 데이터 수집
	    var formData = {
	        cldTitle: $('#cldTitle').val(), 
	        cldContent: $('#cldContent').val() 
	    };
	    console.log("formData", formData);
	
	    // 수정 버튼이 속한 <tr> 요소에서 데이터 가져오기
	    var clNo = $(this).data("cover-code");
	    console.log("clNo", clNo);
	
	    console.log("action Url ", $(this).attr("action"));
	
	    // Ajax 요청 수행
	    $.ajax({
	        url: '/lcms/student/careerup/employment/coverletter/updateCover',
	        method: "POST",
	        dataType: 'json',
	        data: JSON.stringify(formData), 
	        contentType: "application/json",
	        success: function(response) {
	            console.log("수정이 완료되었습니다.");
	        },
	        error: function(xhr, status, error) {
	            console.error("수정 중 에러가 발생했습니다:", error);
	        }
	    });
	});

	
	// 리스트 갱신 함수 정의
	function refreshList(coverList) {
		alert("리스트 갱신");
	    let $listBody = $("#listBody");
	    let $pagingArea = $("#pagingArea");
	
	    $listBody.empty();
	    $pagingArea.empty();
	
	    let trTags = "";
	    if (coverList.length > 0) {
	        $.each(coverList, function(index, book) {
	            trTags += `
	                <tr>
                        <td>${cover.rnum}</td>
                        <td>
                            <a href="#" class="coverLink" data-cover-code="${cover.clNo}">${cover.clNo}</a>
                        </td>
                        <td>${cover.smemNo}</td>
                        <td>
							<button class="btn btn-success printButton" data-cover-code="${cover.clNo}">인쇄하기</button>
                            <button value="${cover.clNo}" class="btn btn-danger deleteButton">삭제</button>
                        </td>
                    </tr>
	            `;
	        });
	    } else {
	        trTags = `
	            <tr>
	                <td colspan="6">등록된 자기소개서가 없습니다.</td>
	            </tr>
	        `;
	    }
	
	    $listBody.append(trTags);
	}

}
