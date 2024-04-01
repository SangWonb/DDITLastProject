<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<div class="container mt-4">
    <div class="card p-4 mb-4" style="background-color: #f8f9fa;">
    <div>키워드를 입력한 후 추천받기 버튼을 누르면 GPT-API를 기반으로 한 추천 내용을 출력합니다.</div>
    <hr>
        <div class="form-row">
            <div class="col">
                <div class="form-group">
                    <label for="text1">첫번째 키워드</label>
                    <input type="text" class="form-control" id="text1">
                </div>
            </div>
            <div class="col">
                <div class="form-group">
                    <label for="text2">두번째 키워드</label>
                    <input type="text" class="form-control" id="text2">
                </div>
            </div>
            <div class="col">
                <div class="form-group">
                    <label for="text3">세번째 키워드</label>
                    <input type="text" class="form-control" id="text3">
                </div>
            </div>
        </div>
        
        <div class="text-right">
            <button type="button" class="btn btn-primary" id="recommendButton">추천받기</button>
            <button id="demoButton" type="button" class="btn btn-primary" onclick="fillFormData()">시연용 데이터</button>
        </div>
        
    </div>
    
		<div id="loading" style="display: none; text-align: center;">
		    <div class="spinner-border text-primary" role="status">
		        <span class="sr-only">Loading...</span>
		    </div>
		    <p>입력한 키워드로 추천 내용을 작성하는 중입니다.</p>
		</div>
     <div class="card p-4" id="recommendationArea" style="display: none; border-radius: 10px; box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);">
        <h5>추천된 내용</h5>
        <p id="recommendationText" style="font-size: 16px; line-height: 1.6;"></p>
        <small style="color: #6c757d; text-align: center; display: block;">※추천된 내용은 자기소개서 작성 중 참고사항을 위한 내용임을 공지합니다.※</small>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>

function fillFormData() {
    // 시연용 데이터 설정
    var text1 = "공감능력";
    var text2 = "적응력";
    var text3 = "개발능력";
    
    // 강의명(input)에 데이터 채우기
    document.getElementById("text1").value = text1;
    document.getElementById("text2").value = text2;
    document.getElementById("text3").value = text3;
}

var cPath = $('body').data('bodyCpath');
  $(document).ready(function() {
    $("#recommendButton").click(function() {
        var keyword1 = $("#text1").val().trim();
        var keyword2 = $("#text2").val().trim();
        var keyword3 = $("#text3").val().trim();
        if (keyword1 === "" || keyword2 === "" || keyword3 === "") {
        	Swal.fire({
			      title: '모든 키워드를 입력해주세요.',
			      icon: 'error'
			    });
        } else {
        var requestData = {
            recomCoverLetter: keyword1 + " " + keyword2 + " " + keyword3
        };
        
        $("#loading").show();

        $.ajax({
            url: cPath + "/student/careerup/employment/coverletterauto/coverLetterAutoView",
            method: "POST",
            headers: {
                "Accept": "application/json"
            },
            contentType: "application/json",
            data: JSON.stringify(requestData), 
            success: function(response) {
				let data = JSON.parse(response)
				console.log(data['choices'][0]["message"]["content"]);
                var recommendationText = data['choices'][0]["message"]["content"];
                $("#recommendationArea").show();
                $("#recommendationText").text(recommendationText);
                $("#loading").hide(); 
            },
            error: function(xhr, status, error) {
                console.error("서버 요청 실패: " + error);
                $("#loading").hide();
            }
        });
    }
   });
});
</script>