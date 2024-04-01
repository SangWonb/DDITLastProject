<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <!-- 탭 -->
    <ul class="nav nav-tabs mb-4">
        <li class="nav-item">
            <a class="nav-link active" id="receivedTab" data-toggle="tab" href="#received">받은 메일함</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="sentTab" data-toggle="tab" href="#sent">보낸 메일함</a>
        </li>
        <li class="nav-item">
       	 <a class="nav-link" id="composeTab" data-toggle="tab" href="#compose">메일 쓰기</a>
    	</li>
    </ul>

    <!-- 탭 내용 -->
    <div class="tab-content">
        <!-- 메일 쓰기 폼 -->
    <div class="tab-pane fade" id="compose">
    <form id="composeForm" class="mb-4">
        <div class="form-group">
            <label for="recipient">수신자:</label>
            <input type="email" class="form-control" id="recipient" required>
        </div>
        <div class="form-group">
            <label for="subject">제목:</label>
            <input type="text" class="form-control" id="subject" required>
        </div>
        <div class="form-group">
            <label for="content">내용:</label>
            <textarea class="form-control" id="content" rows="5" required></textarea>
        </div>
        <button type="submit" class="btn btn-primary">보내기</button>
    </form>
    </div>
    
        <!-- 보낸 메일함 -->
        <div class="tab-pane fade show active" id="sent">
            <table id="sentMailTable" class="table">
                <thead>
                    <tr>
					<th class="custom-control custom-checkbox">
						<div class="form-check">
							<input type="checkbox" class="form-check-input"
								id="selectAllSentMails"> <label class="form-check-label"
								for="selectAllSentMails"></label>
						</div>
					</th>
					<th>번호</th>
						<th>제목</th>
						<th>발신일</th>
						<th>수신자</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- 더미 데이터로 3개의 메일을 생성합니다. -->
                    <tr>
                        <td><input type="checkbox" class="mail-checkbox"></td>
                        <td>1</td>
                        <td class="mail-subject"><a href="#" class="mail-link" data-mail-id="1">첫 번째 메일</a></td>
                        <td>2024-02-15</td>
                        <td>user1@example.com</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" class="mail-checkbox"></td>
                        <td>2</td>
                        <td class="mail-subject"><a href="#" class="mail-link" data-mail-id="2">두 번째 메일</a></td>
                        <td>2024-02-14</td>
                        <td>user2@example.com</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" class="mail-checkbox"></td>
                        <td>3</td>
                        <td class="mail-subject"><a href="#" class="mail-link" data-mail-id="3">세 번째 메일</a></td>
                        <td>2024-02-13</td>
                        <td>user3@example.com</td>
                    </tr>
                </tbody>
            </table>
            <button id="deleteSentMailsBtn" class="btn btn-danger mb-3">메일삭제</button>
        </div>

        <!-- 받은 메일함 -->
        <div class="tab-pane fade" id="received">
            <table id="receivedMailTable" class="table">
                <thead>
                    <tr>
                    <th class="custom-control custom-checkbox">
						<div class="form-check">
							<input type="checkbox" class="form-check-input"
								id="selectAllReceivedMails"> <label class="form-check-label"
								for="selectAllReceivedMails"></label>
						</div>
					</th>
                        <th>번호</th>
                        <th>제목</th>
                        <th>발신일</th>
                        <th>발신자</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- 더미 데이터로 3개의 메일을 생성합니다. -->
                    <tr>
                        <td><input type="checkbox" class="mail-checkbox"></td>
                        <td>1</td>
                        <td class="mail-subject"><a href="#" class="mail-link" data-mail-id="1">첫 번째 메일</a></td>
                        <td>2024-02-15</td>
                        <td>sender1@example.com</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" class="mail-checkbox"></td>
                        <td>2</td>
                        <td class="mail-subject"><a href="#" class="mail-link" data-mail-id="2">두 번째 메일</a></td>
                        <td>2024-02-14</td>
                        <td>sender2@example.com</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" class="mail-checkbox"></td>
                        <td>3</td>
                        <td class="mail-subject"><a href="#" class="mail-link" data-mail-id="3">세 번째 메일</a></td>
                        <td>2024-02-13</td>
                        <td>sender3@example.com</td>
                    </tr>
                </tbody>
            </table>
            <button id="deleteReceivedMailsBtn" class="btn btn-danger mb-3">메일삭제</button>
        </div>
    </div>

<!--     비동기 메일 내용을 표시할 영역 -->
    <div id="mailContent" class="mt-4">
<!--     메일 내용이 여기에 동적으로 추가됩니다. -->
    </div>
    
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
//     // 서버로부터 메일 목록을 가져오는 함수
//     function fetchMails() {
//         $.ajax({
//             url: '서버에서 메일 목록을 가져오는 URL', // 실제 서버의 URL로 변경해야 합니다.
//             type: 'GET',
//             dataType: 'json', // 받아올 데이터 형식(JSON 등)을 지정합니다.
//             success: function(response) {
//                 displayMails(response); // 받아온 메일 목록을 화면에 표시하는 함수를 호출합니다.
//             },
//             error: function(xhr, status, error) {
//                 console.error('Error fetching mails:', error); // 오류가 발생했을 때 콘솔에 오류 메시지를 출력합니다.
//             }
//         });
//     }

//     // 받아온 메일 목록을 화면에 표시하는 함수
//     function displayMails(mails) {
//         var mailList = $('#mailList'); // 메일 목록을 표시할 요소를 가져옵니다.

//         // 메일 목록을 초기화합니다.
//         mailList.empty();

//         // 각 메일에 대해 반복하면서 화면에 표시합니다.
//         mails.forEach(function(mail) {
//             var listItem = $('<a href="#" class="list-group-item list-group-item-action"></a>'); // 메일을 표시할 리스트 아이템을 생성합니다.
//             listItem.text(mail.subject); // 메일 제목을 표시합니다.
//             listItem.click(function() {
//                 // 메일을 클릭했을 때의 동작을 지정합니다. 예를 들어 해당 메일을 상세히 보여주는 팝업을 띄울 수 있습니다.
//                 alert('메일 내용: ' + mail.content);
//             });
//             mailList.append(listItem); // 리스트 아이템을 메일 목록에 추가합니다.
//         });
//     }

//     // 페이지 로드가 완료되면 메일 목록을 가져와서 표시합니다.
//     $(document).ready(function() {
//         fetchMails(); // 메일 목록을 가져오는 함수 호출
//     });

    // 메일 제목 클릭 이벤트 핸들러
    $('.mail-link').click(function(event) {
        event.preventDefault(); // 기본 동작 방지

        var mailId = $(this).data('mail-id'); // 클릭된 메일의 ID 가져오기
        fetchMailContent(mailId); // 해당 메일의 내용을 가져와서 표시하는 함수 호출
    });

 // 메일 내용을 표시하는 함수
    function displayMailContent(mailContent) {
        var mailContentArea = $('#mailContent'); // 메일 내용을 표시할 영역을 가져옵니다.
        mailContentArea.empty(); // 이전에 표시된 메일 내용을 지웁니다.

        // 더미 메일 내용을 생성합니다.
        var dummyMailContent = $('<div class="card"><div class="card-body"><h5 class="card-title">메일 내용</h5><p class="card-text">' + mailContent + '</p></div></div>');

        mailContentArea.append(dummyMailContent); // 메일 내용을 표시할 영역에 추가합니다.
    }

    // 서버로부터 메일 내용을 가져오는 함수
    function fetchMailContent(mailId) {
        // 더미 데이터로 메일 내용을 생성합니다.
        var dummyMailContent = '메일 ' + mailId + '의 내용입니다.';
        
        // 생성된 더미 메일 내용을 표시하는 함수를 호출합니다.
        displayMailContent(dummyMailContent);
    }
 // 탭 이동 이벤트 핸들러
    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        var target = $(e.target).attr("href"); // 활성화된 탭의 href 속성 값 가져오기
        $('#mailContent').empty(); // 메일 내용 초기화
    });
  /*  // 서버로부터 메일 내용을 가져와서 표시하는 함수
    function fetchMailContent(mailId) {
        $.ajax({
            url: '서버에서 메일 내용을 가져오는 URL', // 실제 서버의 URL로 변경해야 합니다.
            type: 'GET',
            data: { id: mailId }, // 서버에 전달할 데이터 (예: 메일 ID)
            dataType: 'html', // 받아올 데이터 형식을 지정합니다.
            success: function(response) {
                $('#mailContent').html(response); // 받아온 메일 내용을 표시할 영역에 추가합니다.
            },
            error: function(xhr, status, error) {
                console.error('Error fetching mail content:', error); // 오류가 발생했을 때 콘솔에 오류 메시지를 출력합니다.
            }
        });
    }*/
// 보낸 메일함에서 선택된 메일 삭제 버튼 클릭 이벤트 핸들러
$('#deleteSentMailsBtn').click(function() {
    var selectedMails = $('#sentMailTable').find('.mail-checkbox:checked');
    var selectedMailCount = selectedMails.length;
    if (selectedMailCount === 0) {
        alert('삭제할 메일을 선택하세요.');
        return;
    }
    if (confirm(selectedMailCount + '개의 메일을 삭제하시겠습니까?')) {
        selectedMails.each(function() {
            $(this).closest('tr').remove(); // 선택된 메일 행 삭제
        });
        alert(selectedMailCount + '개의 메일이 삭제되었습니다.');
    }
});

// 받은 메일함에서 선택된 메일 삭제 버튼 클릭 이벤트 핸들러
$('#deleteReceivedMailsBtn').click(function() {
    var selectedMails = $('#receivedMailTable').find('.mail-checkbox:checked');
    var selectedMailCount = selectedMails.length;
    if (selectedMailCount === 0) {
        alert('삭제할 메일을 선택하세요.');
        return;
    }
    if (confirm(selectedMailCount + '개의 메일을 삭제하시겠습니까?')) {
        selectedMails.each(function() {
            $(this).closest('tr').remove(); // 선택된 메일 행 삭제
        });
        alert(selectedMailCount + '개의 메일이 삭제되었습니다.');
    }
});
//전체 선택 체크박스 클릭 이벤트 핸들러
$('#selectAllSentMails').click(function() {
    var isChecked = $(this).prop('checked'); // 전체 선택 체크박스의 상태
    $('#sentMailTable').find('.mail-checkbox').prop('checked', isChecked); // 모든 메일 체크박스의 상태 변경
});

// 하위 체크박스 클릭 이벤트 핸들러
$('.mail-checkbox').click(function() {
    var totalCheckboxes = $('#sentMailTable').find('.mail-checkbox').length; // 전체 하위 체크박스 개수
    var checkedCheckboxes = $('#sentMailTable').find('.mail-checkbox:checked').length; // 선택된 하위 체크박스 개수
    var isChecked = $(this).prop('checked'); // 현재 클릭된 체크박스의 상태

    if (checkedCheckboxes === totalCheckboxes) {
        $('#selectAllSentMails').prop('checked', true); // 모든 하위 체크박스가 선택되면 전체 선택 체크박스도 선택
    } else {
        $('#selectAllSentMails').prop('checked', false); // 하위 체크박스 중 하나라도 선택 해제되면 전체 선택 체크박스도 해제
    }
});

//전체 선택 체크박스 클릭 이벤트 핸들러
$('#selectAllReceivedMails').click(function() {
    var isChecked = $(this).prop('checked'); // 전체 선택 체크박스의 상태
    $('#receivedMailTable').find('.mail-checkbox').prop('checked', isChecked); // 모든 메일 체크박스의 상태 변경
});

// 하위 체크박스 클릭 이벤트 핸들러
$('.mail-checkbox').click(function() {
    var totalCheckboxes = $('#receivedMailTable').find('.mail-checkbox').length; // 전체 하위 체크박스 개수
    var checkedCheckboxes = $('#receivedMailTable').find('.mail-checkbox:checked').length; // 선택된 하위 체크박스 개수
    var isChecked = $(this).prop('checked'); // 현재 클릭된 체크박스의 상태

    if (checkedCheckboxes === totalCheckboxes) {
        $('#selectAllReceivedMails').prop('checked', true); // 모든 하위 체크박스가 선택되면 전체 선택 체크박스도 선택
    } else {
        $('#selectAllReceivedMails').prop('checked', false); // 하위 체크박스 중 하나라도 선택 해제되면 전체 선택 체크박스도 해제
    }
});
</script>
