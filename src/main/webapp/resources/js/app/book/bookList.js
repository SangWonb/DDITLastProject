//fn_detail();
$(document).ready(function() {
    // 검색 폼 제출 이벤트
    $(searchForm).on("submit", function(event) {
        event.preventDefault();
        let $listBody = $("#listBody");
        let $pagingArea = $("#pagingArea");

        $.ajax({
            url: '/lcms/manager/com/book/jsonbookList',
            method: 'get',
            dataType: "json",
            data: { "page": event.target.page.value },
            success: function(jsonObj) {
                $listBody.empty();
                $pagingArea.empty();

                let dataList = jsonObj.bookList;
                let pagingHTML = jsonObj.pagingHTML;
				console.log(dataList);
                let trTags = null;
                if (dataList.length > 0) {
                    $.each(dataList, function(index, book) {
                        trTags += `
                            <tr>
                                <td>${book.rnum}</td>
                                <td>
                                    <a href="#" class="bookLink" data-book-code="${book.bookCode}">${book.bookName}</a>
                                </td>
                                <td>${book.bookWriter}</td>
                                <td>${book.bookCompany}</td>
                                <td>${book.bookCategory}</td>
                                <td>${book.bookState}</td>
                                <td>
                                    <button value="${book.bookCode}" class="btn btn-danger deleteButton">삭제</button>
                                </td>
                            </tr>
                        `;
                    });
                } else {
                    trTags = `
                        <tr>
                            <td colspan="7">등록된 책이 없습니다.</td>
                        </tr>
                    `;
                }
				
                $listBody.append(trTags);
                console.log(listBody);
                console.log(trTags);
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

    // 책 제목 클릭 시 bookView 로드
    $(document).on('click', '.bookLink', function(event) {
        event.preventDefault();
        let bookCode = $(this).data('book-code');
        loadBookDetail(bookCode);
    });

	$(document).on('click', '.deleteButton', function(event) {
	    var deleteButton = $(this); // 현재 클릭된 삭제 버튼을 저장
	    var bookCode = deleteButton.val(); // 선택된 도서의 bookCode를 가져옴
	    console.log(bookCode);
	    if (confirm("도서를 삭제하시겠습니까?")) { // 삭제 여부 확인
	        $.ajax({
	            url: "/lcms/manager/com/book/deleteBook", // 삭제 처리를 수행하는 컨트롤러의 URL
	            method: "POST",
	            data: { bookCode: bookCode }, // 삭제할 도서의 bookCode를 전송
	            success: function(response) {
	                console.log("도서가 삭제되었습니다.");
	                // 삭제된 도서를 화면에서 제거
	                deleteButton.closest("tr").remove();         
	                $.ajax({
					    url: "/lcms/manager/com/book/jsonbookList",
					    method: "GET",
					    data: { "page": 1 }, // 페이지 번호를 지정하여 첫 페이지의 목록을 가져올 수 있도록 설정하셨다면 여기에 적절한 페이지 번호를 지정해주세요.
					    dataType: "json",
					    success: function(jsonObj) {
					        console.log("도서 목록을 다시 불러왔습니다.");
					        // 서버에서 새로운 도서 목록을 받아와서 화면을 업데이트
					        updateBookList(jsonObj.bookList);
					    },
					    error: function(xhr, status, error) {
					        console.error("도서 목록을 다시 불러오는 중 에러가 발생했습니다:", error);
					    }
					});      
	            },
	            error: function(xhr, status, error) {
	                console.error("도서 삭제 중 에러가 발생했습니다:", error);
	            }
	        });
	    }
	});
	// 도서 목록을 업데이트하는 함수
	function updateBookList(bookList) {
	    let $listBody = $("#listBody");
	    let $pagingArea = $("#pagingArea");
	
	    $listBody.empty();
	    $pagingArea.empty();
	
	    let trTags = "";
	    if (bookList.length > 0) {
	        $.each(bookList, function(index, book) {
	            trTags += `
	                <tr>
	                    <td>${book.rnum}</td>
	                    <td>
	                        <a href="#" class="bookLink" data-book-code="${book.bookCode}">${book.bookName}</a>
	                    </td>
	                    <td>${book.bookWriter}</td>
	                    <td>${book.bookCompany}</td>
	                    <td>${book.bookCategory}</td>
	                    <td>${book.bookState}</td>
	                    <td>
	                        <button value="${book.bookCode}" class="btn btn-danger deleteButton">삭제</button>
	                    </td>
	                </tr>
	            `;
	        });
	    } else {
	        trTags = `
	            <tr>
	                <td colspan="7">등록된 책이 없습니다.</td>
	            </tr>
	        `;
	    }
	
	    $listBody.append(trTags);
	}
});

var cPath = $('body').data('bodyCpath');

function loadBookDetail(bookCode) {
    $.ajax({
        type: 'GET',
        url: `${cPath}/manager/com/book/bookView/${bookCode}`,
        success: function(response) {
            $('.book-detail').html(response).toggle();
        },
        error: function(xhr, status, error) {
            console.error('AJAX request failed: ', status, error);
        }
    });
	$(document).on("click", "#updateButton", function(event) {
	    // 폼이 보이는 경우에만 업데이트 처리
	    if ($("#updateForm").is(":visible")) {
	        $("#updateForm").hide();
	        $("#table").show();
	    } else {
	        $("#updateForm").show();
	        $("#table").hide();
	    }
	});
	
	// 수정 폼 제출 시 이벤트 처리
	$("#updateForm").submit(function(event) {
	    event.preventDefault(); // 폼 제출 방지
	
	    // 폼 데이터 가져오기
	    var formData = $(this).serialize();
	    
	    // 이전에 선택한 도서의 코드 가져오기
	    var bookCode = $(this).find('[name="bookCode"]').val();
	    
	    // Ajax 요청 수행
	    $.ajax({
	        url: $(this).attr("action"),
	        method: $(this).attr("method"),
	        data: formData,
	        success: function(response) {
	            console.log("수정이 완료되었습니다.");
	            // 리스트 갱신 함수 호출
	            refreshList(response); // 서버에서 받은 응답 데이터를 전달합니다.
	            // 도서 상세 정보 다시 불러오기
	            loadBookDetail(bookCode); // 수정된 도서 코드(bookCode)를 전달하여 상세 정보를 다시 불러옵니다.
	        },
	        error: function(xhr, status, error) {
	            console.error("수정 중 에러가 발생했습니다:", error);
	        }
	    });
	});
	
	// 리스트 갱신 함수 정의
	function refreshList(bookList) {
	    let $listBody = $("#listBody");
	    let $pagingArea = $("#pagingArea");
	
	    $listBody.empty();
	    $pagingArea.empty();
	
	    let trTags = "";
	    if (bookList.length > 0) {
	        $.each(bookList, function(index, book) {
	            trTags += `
	                <tr>
	                    <td>${book.rnum}</td>
	                    <td>
	                        <a href="#" class="bookLink" data-book-code="${book.bookCode}">${book.bookName}</a>
	                    </td>
	                    <td>${book.bookWriter}</td>
	                    <td>${book.bookCompany}</td>
	                    <td>${book.bookCategory}</td>
	                    <td>${book.bookState}</td>
	                    <td>
	                        <button value="${book.bookCode}" class="btn btn-danger deleteButton">삭제</button>
	                    </td>
	                </tr>
	            `;
	        });
	    } else {
	        trTags = `
	            <tr>
	                <td colspan="7">등록된 책이 없습니다.</td>
	            </tr>
	        `;
	    }
	
	    $listBody.append(trTags);
	}

}


