/**
	[사용시 주의사항] 
	
	** jpg 사진으로 할것
	
	
	[사용 방법]
	------------------------------------------------------------------------------------------------
	ex)
	<div id="imgshoww" data-img-width="300" data-img-height="300" data-file-no="F2403190003"></div>
	-------------------------------------------------------------------------------------------------
	** 위의 예시와 같이 출력하고자 하는 곳에 div를 만들고 해당 div에 id를 만들어주어야함.
	** data-img-width="" 
	** data-img-height="" 를 사용하여 가로,새로 길이를 전달해야함.
	
	** data-file-no="" 를 사용하여 이미지를 표출할 fileNo를 넣어줌
	
	-------------------------------------------------------------------------------------------------
	ex)
	<script>
		imgShow("imgshoww");
	</script>
	
	** 위의 예시와 같이 script 부분에서 위의 함수를 호출해야함.
	** imgShow("div id 이름"); << 해당 함수 안에는 해당 div의 id의 이름이 들어가야함.
	
 */
const cpath = $("body").data("bodyCpath");
function imgShow(showTarget){
	
	console.log("cpath : ",cpath);
	
	var imgTarget = $(`#${showTarget}`);
	var fileNo = imgTarget.data("fileNo");
	
	console.log("fileNo : ",fileNo);
	
    
    $.ajax({
        url: cpath + "/imgShow/getImage?fileNo="+fileNo,
        type: "GET",
        success: function(data) {
            // 이미지를 받아왔을 때의 처리
            displayImage(data,showTarget);
        },
        error: function(xhr, status, error) {
            // 오류 발생 시 처리
            console.error("Error fetching image: " + error);
        }
    });
}

function displayImage(imageData,showTarget) {
	
	var imgTarget = $(`#${showTarget}`);
	var width = imgTarget.data("imgWidth");
	var height = imgTarget.data("imgHeight");
	
	console.log("width : ",width);
	console.log("height : ",height);
	
    // 이미지를 표시할 div 요소 선택
    var imageDiv = document.getElementById(showTarget);

    // 이미지를 표시할 img 요소 생성
    var img = document.createElement("img");
    
    // 이미지 데이터를 src 속성에 설정
    img.src = "data:image/jpeg;base64," + imageData; // 이미지 데이터는 Base64로 인코딩되어 있어야 함
    img.width = width;
    img.height = height;
    
    // 이미지를 div에 추가
    imageDiv.appendChild(img);
}