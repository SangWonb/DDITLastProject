<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	.headText {
		font-size: 14px;
		letter-spacing: 3px;
	}
</style>
<form method="post" id="deleteForm" method="post"
   action="${pageContext.request.contextPath}/professor/cyber/onlinelecture/delete/${lec.lecoCode}">
   <input type="hidden" name="lecoCode" id="lecoCode"  value="${lec.lecoCode }"> 
      <input type="hidden" name="lecCode" id="lecoCode" value="${lec.lecCode }">
   <div style="width: 100%; background-color: #FFFFFF;">
      <div style="margin-left: 10%; width: 80%;">
         <h2>${contentTitle}</h2>
      </div>
      <div style="margin-left: 10%; width: 80%;" class="page-separator"></div>
		<div style="margin-left:10%; width:80%; background-color: #f0f0f0;" class="headText">
			<p style="overflow-x: auto; white-space: pre-wrap; margin-left: 20px; margin-right: 20px;">
				<br> ※온라인 강의 이용시 주의 사항※ 1. 동영상을 끝까지 시청하지 않는 경우 출석이 인정되지 않습니다.
				<br>2. 한국 인재대학교에서 제공하는 컨텐츠를 블로그, 카페 내 각종 게시글을 통해 활용하거나, 상업적인 목적으로 제 3자에게 판매를 시도하거나 했을경우 (컨텐츠를 구매한 사람도 같이 불법 사용으로, 동일 처벌 대상이 되는점 유의바랍니다.)
				<br>3.컨텐츠 이용 의외에 다른 목적으로 복제, 출판, p2p 경로 등을 통해 제 3자에게 제공하거나, 이를 시도하는 경우 (컨텐츠의 불법 복제와 유통행위에 대해서는 고발 시, 저작권법 136조 제1항에 의거 5년 이하의 징역이나 5천만원 이하의 벌금형에 처해지게 됩니다.) <br>
			</p>
		</div>
      </div>
      <div style="margin-left: 10%; width: 80%;" class="page-separator"></div>
      <div style="margin-left: 10%; width: 80%; background-color: #FFFFFF;">
         <table style="width: 100%; border-collapse: collapse;">
            <tr>
               <td
                  style="border-top: 1px solid #ddd; border-right: 1px solid #ddd; border-bottom: 1px solid #ddd; margin-top: 10px;"><label
                  for="validationSample03">제목</label></td>
               <td
                  style="border-top: 1px solid #ddd; border-bottom: 1px solid #ddd; margin-top: 10px;">${lec.lecoTitle}</td>
            </tr>
            <tr>
               <td
                  style="border-right: 1px solid #ddd; border-bottom: 1px solid #ddd; margin-top: 10px;"><label
                  for="validationSample03">작성자</label></td>
               <td style="border-bottom: 1px solid #ddd; margin-top: 10px;">${lec.memName}</td>
            </tr>
            <tr>
               <td
                  style="border-right: 1px solid #ddd; border-bottom: 1px solid #ddd; margin-top: 10px;"><label
                  for="validationSample03">작성일</label></td>
               <td style="border-bottom: 1px solid #ddd; margin-top: 10px;">${lec.lecoDate}</td>
            </tr>
            <tr>
               <td
                  style="margin-top: 10px; border-right: 1px solid #ddd; border-bottom: 1px solid #ddd;"><label
                  for="validationSample03">첨부파일</label></td>
               <td colspan="2" style="border-bottom: 1px solid #ddd;"><c:forEach
                     items="${lec.fileList}" var="file">
                     <a href="#" data-gf-no="${file.gfNo}"
                        data-file-no="${file.fileNo}" class="fileObj"> ${file.fileNm }
                     </a>
                  </c:forEach></td>
            </tr>
            <tr>
               <td
                  style="margin-top: 10px; border-right: 1px solid #ddd; border-bottom: 1px solid #ddd;"><label
                  class="form-label">내용</label></td>
               <td style="margin-top: 5px; border-bottom: 1px solid #ddd;"><video
                     src="${pageContext.request.contextPath}/download/video/${lec.fileList[0].fileNo}"
                     width="600" height="400" controls 
                     preload="none" id="movie">
                     <%--               <source src="${pageContext.request.contextPath}/download/video/${lec.fileList[0].fileNo}" > --%>
                  </video></td>
            </tr>

         </table>
      </div>

      <div
         style="display: flex; justify-content: flex-end; margin-top: 10px; margin-right: 10%;">
         <button id="listBtn" class="btn btn-secondary"
            style="margin-right: 5px;" type="button">목록</button>
         <a
            href="${pageContext.request.contextPath}/professor/cyber/onlinelecture/onlineLectureEdit?lecoCode=${lec.lecoCode}"><button
               id="modiBtn" class="btn btn-primary" style="margin-right: 5px;"
               type="button">수정</button></a>
         <button id="deleteBtn" type="button" class="btn btn-accent">삭제</button>

      </div>
   </div>
</form>


<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
   document
         .getElementById("listBtn")
         .addEventListener(
               "click",
               function() {
                  window.location.href = `<c:url value="/professor/cyber/onlinelecture/onlineLectureList/${lec.lecCode}"/>`;
               });

   document
         .getElementById("modiBtn")
         .addEventListener(
               "click",
               function(event) {
                  var lecoTitle = "${lec.lecoTitle}";
                  var lecannContent = "${lec.lecoContent}";
                  var urlParams = new URLSearchParams(
                        window.location.search);
                  var lecoCode = urlParams.get('lecoCode');
                  window.location.href = `<c:url value="/professor/cyber/onlinelecture/onlineLectureEdit/${lec.lecoCode}"/>`;
               });

   document.getElementById("deleteBtn").addEventListener("click", function() {
      if (confirm("정말로 삭제하시겠습니까?")) {
         var urlParams = new URLSearchParams(window.location.search);
         var lecoCode = urlParams.get('lecoCode');
         var lecCode = '${la.lecCode}'; // 여기에 lecCode 값을 설정합니다.
         document.getElementById('lecoCode').value = lecoCode;
         document.getElementById('deleteForm').submit();
         window.location.href = `<c:url value="/professor/cyber/onlinelecture/delete/${lec.lecoCode}"/>`;
      } else {
         alert("삭제가 취소되었습니다.");
      }
   });

   var cPath = "${pageContext.request.contextPath}";
   console.log("주소", cPath);

   function fn_downloadFile(fileNo) {
      let hiddenA = document.createElement("a");
      hiddenA.href = cPath + "/download/single?fileNo=" + fileNo;
      ;
      hiddenA.click();
      hiddenA.remove();
   }

   $(document).on("click", ".fileObj", function(event) {
      var clickedElement = $(event.currentTarget);
      var gfNo = clickedElement.data("gfNo");
      var fileNo = clickedElement.data("fileNo");
      fn_downloadFile(fileNo);
   });
   
   
   document.getElementById('movie').addEventListener('play', function() {
       var timer;

       function displayAlert() {
           var currentTime = document.getElementById('movie').currentTime;
           var duration = document.getElementById('movie').duration;
           alert(currentTime + " / " + duration);
           document.getElementById('movie').pause();
           if (confirm("화면 영상을 잘 시청중이신가요?\n\n계속 시청을 원하시면 '확인' 버튼을 눌러주세요.")) {
               console.log("진행시간", currentTime);
               console.log("토탈", duration);
               document.getElementById('movie').play();
           } else {
               document.getElementById('movie').pause();
           }
       }

       timer = setInterval(displayAlert, 60000); // 1분인듯

       document.getElementById('movie').addEventListener('pause', function() {
           clearInterval(timer);
       });

       document.getElementById('movie').addEventListener('ended', function() {
           clearInterval(timer);
       });
   });



</script>