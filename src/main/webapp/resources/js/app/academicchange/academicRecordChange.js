$('#rejectModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget); 
    var rejectReason = button.data('reject-reason');
    var modal = $(this);
    modal.find('#rejectReason').text(rejectReason); 
});

var cPath = $('body').data('bodyCpath')

	
	$(document).on("change", '#custom-select',function(event){
		var acCode = $("#custom-select").val();
//	    console.log("Selected acCode:", acCode);
			if (acCode === 'AC001') {
                $('#file').prop('required', true);
            } else {
                $('#file').prop('required', false);
            }
	});
	
    $('.recordView').click(function(event) {
        $(this).next('.form-here').toggle();
	    var arcNo = $(this).attr('data-arc-no');
        console.log("arcNoView",arcNo)
        recordDetail(arcNo);
    });


$('#newFormButton').click(function() {
        $.ajax({
            type: 'GET',
            url: 'acaForm',
            success: function(response) {
            	  let parser = new DOMParser();
                  let newDoc = parser.parseFromString(response, "text/html");
                  let preTag = newDoc.getElementById('layout-content')
                  $('.form-here').html(preTag).show();
            },
            error: function(xhr, status, error) {
                console.error('AJAX request failed: ', status, error);
            }
        });
    });
$('#updateFormButton').click(function() {
        $.ajax({
            type: 'GET',
            url: 'acaEditForm',
            success: function(response) {
            	  let parser = new DOMParser();
                  let newDoc = parser.parseFromString(response, "text/html");
                  let preTag = newDoc.getElementById('layout-content')

				  $('.form-here').html(preTag).show();
            },
            error: function(xhr, status, error) {
                console.error('AJAX request failed: ', status, error);
            }
        });
    });


$(document).on("click", "#submitForm", function(event) {
event.preventDefault();

	var formData = new FormData(document.getElementById('recordForm'));
	
	console.log("formData",formData);
	
	for (const entry of formData.entries()) {
    console.log(entry[0], entry[1]);
	}
	
	var currentYear = new Date().getFullYear();
	formData.append("arcYear",currentYear);

	
    var currentMonth = new Date().getMonth() + 1; // JavaScript에서 월은 0부터 시작하므로 1을 더합니다.

    var semester = (currentMonth >= 2 && currentMonth <= 6) ? "1학기" : "2학기";

	if(semester === '1학기'){
		semester="S1";
	}else{
		semester="S2";
	}
	
	formData.append("arcSemester",semester);
	
	var memNo = $(this).data('memNo'); 
	formData.append("memNo", memNo); 
	var memName = $(this).data('memName'); 
	formData.append("memName", memName); 
	
	console.log("formData:",formData);
	console.log("FormData entries:", [...formData.entries()]);
	
    let form = $('#recordForm')[0]; // 폼 요소 가져오기
    let url = form.action;
//    var data = $(formData).serialize();
//	console.log("data",data);

	


 $.ajax({
    url: url,
    method: 'POST',
    data: formData,
    processData: false, // FormData 객체를 변환하지 않도록 설정
    contentType: false, // 기본 contentType 설정을 사용하여 FormData 객체를 전송
    dataType: "json",
    success: function(jsonObj) {
        let parser = new DOMParser();
        let newDoc = parser.parseFromString(jsonObj, "text/html");
        let preTag = newDoc.getElementById('layout-content');
        $('.form-here').hide();
        location.reload();
    },
    error: function(xhr, status, error) {
        console.error('AJAX request failed: ', status, error);
    }
    });
});

$(document).on("click", ".delete-link", function(event) {
    event.preventDefault();
	
	var arcNo = $(this).attr('data-arc-no');

    $.ajax({
        url: 'delete', // 삭제를 처리하는 컨트롤러 엔드포인트
        method: 'post',
		data: { arcNo: arcNo },
        success: function(response) {
           	location.reload();
        },
        error: function(xhr, status, error) {
            console.error("AJAX 요청 실패:", status, error);
        }
    });
});


function recordDetail(arcNo) {
    $.ajax({
        type: 'POST',
        url: 'view' ,
        data: { arcNo: arcNo }, 
        success: function(response) {
          let parser = new DOMParser();
         let newDoc = parser.parseFromString(response, "text/html");
         let preTag = newDoc.getElementById('layout-content')
            $('.form-here').html(preTag).show();
         console.log("arcNo",arcNo)
        },
        error: function(xhr, status, error) {
            console.error('AJAX request failed: ', status, error);
        }
    });
    
}




