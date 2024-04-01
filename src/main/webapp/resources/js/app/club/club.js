var cPath = $('body').data('bodyCpath')


$(document).on("change", '#mbtiSelect', function(event) {
	var mbti = $("#mbtiSelect").val();
	//	console.log("Selected mbti:", mbti);

});

$(document).on("change", '#sexSelect', function(event) {
	var sex = $("#sexSelect").val();
	//	console.log("Selected sex:", sex);

});

$(document).on("change", '#subSelect', function(event) {
	var sub = $("#subSelect").val();
	//	console.log("Selected sub:", sub);

});

$('#resetFormBtn').click(function(event){
	console.log("여기니?")
	event.preventDefault();
	console.log("여")
 	$('#recomForm')[0].reset(); // 폼 리셋
	console.log("기")
    $('#changeResult').empty(); // 결과 영역 비우기
	console.log("까지")
    $('#resultRecom').hide(); // 결과 영역 숨기기
	console.log("왔니?")
    $('#recomForm').show(); // 폼 영역 보이기
	console.log("어디니?")
});


$(document).on("click", "#submitForm", function(event) {

	event.preventDefault();
	let form = $('#recomForm')[0]; // 폼 요소 가져오기
	let url = form.action;
	let method = form.method;

	let data = $('#recomForm').serialize();

	$.ajax({
		url: url,
		method: method,
		data: data, // 데이터를 JSON 문자열로 변환하여 전송
		contentType: 'application/x-www-form-urlencoded',
		success: function(resp) {
			let resultHtml = `
			<div class="d-flex justify-content-center" id="resultRecom" style="display: none; height: 200px;">
				<table style = "text-align: center;" >
				        <thead>
				            <tr>
								<th style="width:150px;">
									<img src="../../../resources/images/kce/별.jpg" width="30"height="30">
								</th>
								<th style="width:150px;">
									<img src="../../../resources/images/kce/별.jpg" width="30"height="30">
								</th>
								<th style="width:150px;">
									<img src="../../../resources/images/kce/별.jpg" width="30"height="30">
								</th>
				            </tr>
				        </thead>
				        <tbody>
							<tr>
								<th>1등</th>
								<th>2등</th>
								<th>3등</th>
							</tr>
				            <tr>
				                <td>` + resp[0].clubName + `</td>
				                <td>` + resp[1].clubName + `</td>
								<td>` + resp[2].clubName + `</td>
				            </tr>
				            <tr>
				                <td><img src="` + resp[0].clubGf + `" width="100"height="100"></td>
				                <td><img src="` + resp[1].clubGf + `" width="100"height="100"></td>
				                <td><img src="` + resp[2].clubGf + `" width="100"height="100"></td>
				            </tr>
				        </tbody>
				    </table >
				</div > `;

			$('#changeResult').html(resultHtml);

		},
		error: function(xhr, status, error) {
			console.error('AJAX request failed: ', status, error);
		}
	});
});





