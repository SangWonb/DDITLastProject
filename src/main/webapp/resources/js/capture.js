
var video = document.getElementById('video');
var canvas = document.createElement('canvas');
var context = canvas.getContext('2d');
var formData = new FormData();

var imgIndex = 1;

function captureImgs() {
    canvas.width = video.videoWidth;
    canvas.height = video.videoHeight;
    context.drawImage(video, 0, 0, canvas.width, canvas.height);
    canvas.toBlob(function(blob) {
		formData.append(`file${imgIndex}`, blob, `image${imgIndex++}.jpg`);
	}, 'image/jpeg', 0.9);
}

function captureImgSend(empNo) {
	formData.append('empNo', empNo)
/*	for(key of formData.keys()){
		console.log(key);
	}*/
	$.ajax({
		url: "http://192.168.141.18:5000/cam_capture_upload.ajax",
		processData: false,
		contentType: false,
		data: formData,
		type: "POST",
		success: function(response) {
	    	console.log(response);
		}
	});
}

$(document).on('mousedown','.longClickSample',function(){
    var interval = setInterval(function () {
        captureImgs();
    }, 100);

    $(document).on('mouseup', function () {
        clearInterval(interval);
    });
})

navigator.mediaDevices.getUserMedia({ video: true }).then(function(stream) {
	video.srcObject = stream;
	video.play();
}).catch(function(error) {
	console.error(error);
});
