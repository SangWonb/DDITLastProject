<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<style>
	table,tr,td {
		border: 1px solid black;
		border-collapse: collapse;
		text-align: center;
	}
		
	/* 모달 스타일 */
	.modal {
	    display: none; /* 기본적으로 숨김 */
	    position: fixed; /* 고정 위치 */
	    z-index: 1; /* 최상위 */
	    left: 0;
	    top: 0;
	    width: 100%;
	    height: 100%;
	    overflow: auto; /* 스크롤 가능 */
	    background-color: rgb(0,0,0); /* 배경색 */
	    background-color: rgba(0,0,0,0.4); /* 배경 투명도 */
	}
	
	.modal-content {
	    background-color: #fefefe; /* 모달 내용 배경색 */
	    margin: 15% auto; /* 수직 가운데 정렬 */
	    padding: 20px;
	    border: 1px solid #888;
	    width: 80%; /* 모달 내용 너비 */
	}
	
	/* 닫기 버튼 스타일 */
	.close {
	    color: #aaaaaa;
	    float: right;
	    font-size: 28px;
	    font-weight: bold;
	}
	
	.close:hover,
	.close:focus {
	    color: #000;
	    text-decoration: none;
	    cursor: pointer;
	}
</style>
<body class="layout-app has-drawer-opened" data-body-cpath="/lcms">

<!-- more 버튼 -->
<button type="button" id="get" class="btn btn-black">
    more
</button>

<!-- 모달 창 -->
<div id="myModal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    	<div id="modalTable">
			<div id="bookList">
			    <table class="table table-bordered">
			        <thead>
			            <tr>
			                <td>번호</td>
			                <td>제목</td>
			                <td>저자</td>
			                <td>출판사</td>
			                <td>카테고리</td>
			                <td>대출여부</td>
			            </tr>
			        </thead>
			        <tbody class="list" id="listBody">
			            <!-- 도서 목록 데이터 들어오는 곳 -->
			        </tbody>
			        <tfoot>
					    <tr>
					        <td colspan="6">
					        	<!-- Ajax로 페이지 이동 시 사용할 폼 -->
								<form id="searchForm" method="get">
								    <input type="number" name="page" /> 
								    <input type="text" name="bookCode" />
								    <input type="text" name="bookName" />
								    <input type="text" name="bookWriter" />
							        <div data-pg-role="searchUI" data-pg-target="#searchForm">
						                <input type="text" placeholder="제목" name="bookName" />
						                <input type="text" placeholder="저자" name="bookWriter" />
						                <button class="btn" type="button" data-pg-role='searchBtn'>검색</button>
						            </div>
								</form>
					            
					            <!-- 페이징 영역 -->
								<div class="pagination-container">
								    <div id="pagingArea"></div>
								</div>
								<!-- 도서 상세 정보를 표시하는 영역 -->
								<div class="book-detail" style="display: none;"></div>
					        </td>
					    </tr>
					</tfoot>
			    </table>
			</div>
		</div>
	</div>
</div>

<!-- jQuery -->
<script src="${pageContext.request.contextPath }/resources/vendor/jquery.min.js"></script>

<!-- Bootstrap -->
<script src="${pageContext.request.contextPath }/resources/vendor/popper.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/vendor/bootstrap.min.js"></script>

<script src="<c:url value='/resources/js/paging.js' />"></script>

<script>
$(document).ready(function() {
    // 모달 창 표시
    $("#get").click(function() {
        $("#myModal").css("display", "block");
    });

    // 모달 닫기 버튼에 대한 클릭 이벤트 처리
    $(".close").click(function() {
        $("#myModal").css("display", "none");
    });

});

$(document).ready(function() {
	
    // 검색 폼 제출 이벤트
    $(searchForm).on("submit", function(event) {
        event.preventDefault();
        let $listBody = $("#listBody");
        let $pagingArea = $("#pagingArea");

        $.ajax({
            url: '/lcms/common/book/jsonbookList',
            method: 'get',
            dataType: "json",
            data: $(this).serialize(), // 폼 데이터 직렬화
            success: function(jsonObj) {
                $listBody.empty();
                $pagingArea.empty();

                let dataList = jsonObj.bookList;
                let pagingHTML = jsonObj.pagingHTML;
                let trTags = "";
                if (dataList.length > 0) {
                    $.each(dataList, function(index, book) {
                        trTags += `
                            <tr>
                                <td>\${book.rnum}</td>
                                <td>
                                    <a href="#" class="bookLink" data-book-code="\${book.bookCode}">\${book.bookName}</a>
                                </td>
                                <td>\${book.bookWriter}</td>
                                <td>\${book.bookCompany}</td>
                                <td>\${book.bookCategory}</td>
                                <td>\${book.bookState}</td>
                            </tr>
                        `;
                    });
                } else {
                    trTags = `
                        <tr>
                            <td colspan="6">등록된 책이 없습니다.</td>
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
    
	// 책 제목 클릭 시 bookView 로드
    $(document).on('click', '.bookLink', function(event) {
        event.preventDefault();
        let bookCode = $(this).data('book-code');
        loadBookDetail(bookCode);
    });
	
});

//책 상세정보
var cPath = $('body').data('bodyCpath');

function loadBookDetail(bookCode) {
    $.ajax({
        type: 'GET',
        url: `\${cPath}/common/book/bookView/\${bookCode}`,
        success: function(response) {
            $('.book-detail').html(response).toggle();
        },
        error: function(xhr, status, error) {
            console.error('AJAX request failed: ', status, error);
        }
    });
}

</script>
</body>