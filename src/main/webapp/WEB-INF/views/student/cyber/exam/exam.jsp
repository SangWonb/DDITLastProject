<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
    table {
        text-align: center;
    }
    video {
        display: block; /* 비디오를 블록 요소로 설정합니다. */
        margin: 0 auto; /* 가운데 정렬합니다. */
    }
    .resultDiv {
       text-align: left;
       font-size: 16px;
       font-weight: 800;
       margin-right: 10px;
       color: blue;
    }
    .faceResult {
       text-align: left;
       font-size: 16px;
       font-weight: 800;
       margin-right: 10px; 
   }
</style>

<div id="testList">
    <!-- 도서 목록 테이블 -->
    <table class="table table-bordered bg-white">
        <thead>
            <tr>
                <th>주차</th>
                <th>과목명</th>
                <th>시험분류</th>
                <th>시험형태</th>
                <th>시험시간</th>
                <th>시험날짜</th>
                <th>입장가능시간</th>
                <th>제출여부</th>
                <th>점수</th>
                <th>응시버튼</th>
                
            </tr>
        </thead>
    
        <tbody class="list" id="listBody">
            <!-- 각 도서 행에 대한 데이터 -->
            <c:forEach items="${testList}" var="t" varStatus="status">
            <tr>
                <td>${status.index+1}</td>
                <td>${t.ltName}</td>
                  <c:if test="${t.ltCate eq 'TEST01'}">
                     <td>중간고사</td>
                  </c:if>
               <c:if test="${t.ltCate eq 'TEST02'}">
                     <td>기말고사</td>
                  </c:if>
                  <c:if test="${t.ltGu eq 'ON'}">
                   <td>온라인시험</td>
                </c:if>
                <td>${t.ltTotalTime}분</td>
                <td>${t.ltDate.substring(0, 10)}</td>
                <td>${t.ltTime.substring(0,2)}:${t.ltTime.substring(2,4)}~${t.ltTime.substring(4,6)}:${t.ltTime.substring(6,8)}</td>
                <c:choose>
                   <c:when test="${empty t.tgRecord}">
                      <td>미응시</td>
                      <td style="text-align:center">-</td>
                      <td><button class="btn btn-primary deleteButton" data-lt-code="${t.ltCode}" data-toggle="modal" data-target="#exampleModal">시험응시</button></td> 
                   </c:when>
                   <c:otherwise>
                      <td>응시완료</td>
                      <td style="text-align:center">${t.tgRecord}점</td>
                      <td><button class="btn btn-primary deleteButton" disabled="disabled">응시완료</button></td>
                   </c:otherwise>
                </c:choose>
            </tr>
            </c:forEach>
            
        </tbody>
    </table>
</div>

<!-- 모달 창 -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">시험 응시</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="stopCamera()">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- 비디오 요소 -->
        <video id="video" width="440" height="310" style="display: none;" autoplay></video>
      </div>
      <div class="modal-footer">
         <div class="faceResult">결과 : </div><div id="resultDiv" class="resultDiv"></div>
        <button type="button" class="btn btn-primary" onclick="startCamera()">카메라켜기</button>
        <button type="button" class="btn btn-success" onclick="captureAndSend()">인증하기</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="stopCamera()">닫기</button>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
var video = document.getElementById('video');
var stream;
var canvas = document.createElement('canvas'); // canvas 변수 정의
var faceResult;

$('.deleteButton').click(function() {
    var ltCode = $(this).data('lt-code');
//     console.log('시험 코드:', ltCode);

   $.ajax({
        url: 'saveLTcode', // 요청을 보낼 URL
        type: 'POST', // 요청 방식
        data : JSON.stringify(ltCode),
        dataType: "json",
       contentType: "application/json",
        success: function(response) { 
//            console.log("성공");
},
error: function(jqXHR, textStatus, errorThrown) { // 요청 실패 시 실행할 콜백 함수
    console.error("Request failed:", textStatus, errorThrown);
}
   });

});

function startCamera() {
    navigator.mediaDevices.getUserMedia({ video: true }).then(function(str) {
        stream = str;
        video.srcObject = stream;
        video.style.display = 'block'; // 비디오를 보이도록 변경
        video.play();
    }).catch(function(error) {
        console.error(error);
    });
}

function stopCamera() {
    if (stream) {
        stream.getTracks().forEach(track => {
            track.stop();
        });
    }
    // 모달이 닫힐 때 resultDiv를 비워줌
    var resultDiv = document.getElementById("resultDiv");
    resultDiv.innerText = "";
}

function captureAndSend() {
    var formData = new FormData(); // formData 변수 생성

    canvas.width = video.videoWidth;
    canvas.height = video.videoHeight;
    var context = canvas.getContext('2d'); // canvas 2D 컨텍스트 생성
    context.drawImage(video, 0, 0, canvas.width, canvas.height);

    canvas.toBlob(function(blob) {
        formData.append('file', blob, 'image.jpg');
        formData.append('mem_id', 'test');
        jQuery.ajax({
            url: "http://192.168.141.10:5000/cam_capture_upload.ajax",
            processData: false,
            contentType: false,
            data: formData,
            type: "POST",
            success: function(response) {
                console.log("파이썬 ", response);
                var resultDiv = document.getElementById("resultDiv");
                if (response.result === "success") {
                    faceResult = "성공"; 
                    Swal.fire({
                        icon: 'success',
                        title: '인증 성공',
                        showConfirmButton: false,
                        timer: 1500
                    }).then(function() {
                        // 첫 번째 알림이 사라진 후에 두 번째 알림을 표시
                       Swal.fire({
                           title: '시험을 응시하시겠습니까?',
                           showDenyButton: true,
                           showCancelButton: false,
                           confirmButtonText: `응시하기`,
                           denyButtonText: `취소`,
                           customClass: {
                               confirmButton: 'btn btn-success mr-2',
                               denyButton: 'btn btn-secondary'
                           }
                       }).then((result) => {
                           if (result.isConfirmed) {
                              window.location.href="http://localhost/lcms/student/cyber/exam/takeAnExam";
                           }
                       });
                    });
                } else {
                    faceResult = "실패"; 
                    Swal.fire({
                        icon: 'error',
                        title: '인증 실패',
                        text: '다시 시도해주세요'
                    });
                }
                // 결과를 div에 출력하고 색상 지정
                resultDiv.innerText = faceResult;
                if (faceResult === "성공") {
                    resultDiv.style.color = "blue"; 
                } else {
                    resultDiv.style.color = "red"; 
                }
            }

        });
    }, 'image/jpeg', 0.9);
}


// 페이지가 로드될 때 카메라를 활성화하지 않습니다.

</script>
