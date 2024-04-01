function changeStatus() {
    var button = document.getElementById("counsNo");
    var counsNo = button.dataset.counsNo;
    var data = { counsNo: counsNo };
    
    Swal.fire({
        title: '상담완료 상태로 변경하시겠습니까?',
        showDenyButton: true,
        showCancelButton: false,
        confirmButtonText: `네`,
        denyButtonText: `아니요`,
        customClass: {
            confirmButton: 'btn btn-success mr-2',
            denyButton: 'btn btn-secondary'
        }
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: 'modCounsel',
                type: 'GET',
                data: data,
                success: function(response) {
                    if (response.result === 'OK') {
                        Swal.fire({
                            icon: 'success',
                            title: '상담 상태 변경 완료',
                            showConfirmButton: false,
                            timer: 1500,
                            cancelButtonText: '닫기',
                            showCancelButton: true   
                        }).then(function() {
                            location.reload();
                        });
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: '상태 변경 오류',
                            text: '잠시 후에 다시 시도해주세요.'
                        });
                    }
                },
                error: function(xhr, status, error) {
                    console.error("AJAX request failed: " + error);
                }
            });
        }
    });
}

$('#counselDetail').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget); 
    var counsTitle = button.data('couns-title');
    var counsReason = button.data('couns-reason');
    var counsPro = button.data('pmem-name');
    var counsStu = button.data('smem-name');
    var counsSmemNo = button.data('smem-no');

    var modal = $(this);
    modal.find('#counsTitle').text(counsTitle); 
    modal.find('#counsReason').text(counsReason); 
    modal.find('#counsPro').text(counsPro); 
	
	var stuHtml ="";
	stuHtml += "<a href='#' data-toggle='modal' data-target='#myModal' data-smem-no="+counsSmemNo+" data-smem-name="+counsStu+"> "+counsStu+"</a>"
	
	$('#counsStu').html(stuHtml);

});

$('#myModal').on('show.bs.modal', function (event) {
	var joinYear = document.getElementById('joinYear');
	var stuProg = document.getElementById('stuProg');
	var bas = document.getElementById('bas');
	var cad = document.getElementById('cad');
	var stuEmail = document.getElementById('stuEmail');
	
    var button = $(event.relatedTarget); 
    var smemNo = button.data('smem-no');
    var smemName = button.data('smem-name');
    var modal = $(this);
	modal.find('#smemNo').text(smemNo); 
	modal.find('#smemName').text(smemName); 
	
	data={ smemNo: smemNo };
	
    $.ajax({
    	url: 'selectStudent',
    	type: 'GET',
    	data: data,
    	success: function(response){
    		var sInfo=response.sInfo;

    		//학생정보
    		joinYear.innerText = sInfo.stuJoinyear;
    		cad.innerText=sInfo.cad;
    		bas.innerText=sInfo.bas;
    		stuEmail.innerText=sInfo.memEmail;
    		stuProg.innerText=sInfo.stuProg;
    		
		    
		    //상담이력
		    var counselList=response.counselList;
		    var filteredCounselList = counselList.filter(function(counsel) {
		        return counsel.memNo === sInfo.smemNo && counsel.counsStatus === 'STA09' ;
		    });
		    
			var historyHtml= "<table class='table'>";
	    	historyHtml+="<thead><tr>"
	    	historyHtml+="<th>No.</th>"
	    	historyHtml+="<th>이름(학번)</th>"
	    	historyHtml+="<th>상담교수</th>"
	    	historyHtml+="<th>상담날짜</th>"
	    	historyHtml+="<th>상담제목</th>"
	    	historyHtml+="</tr></thead><tbody>"
	    	
		 filteredCounselList.forEach(function(counsel, index) {
		    var rnum = index + 1;
		    var date = new Date(counsel.counsDatetime);
		    var formattedDate = date.toLocaleDateString();
		    
		    historyHtml += "<tr><td><a href='#' data-toggle='modal' data-target='#counselJournal' data-couns-content='" + counsel.counsContent + "' data-couns-no='" + counsel.counsNo +"' data-couns-status='" + counsel.counsStatus +"' data-couns-content='" + counsel.counsContent + "' data-couns-title='" + counsel.counsTitle + "' data-smem-no='" + counsel.memNo + "' data-smem-name='" + counsel.studentName + "' data-couns-reason='" + counsel.counsReason + "'>" + rnum + "</a></td><td>";
		    historyHtml +="<a href='#' data-toggle='modal' data-target='#counselJournal' data-couns-content='" + counsel.counsContent + "' data-couns-no='" + counsel.counsNo +"' data-couns-status='" + counsel.counsStatus +"' data-couns-content='" + counsel.counsContent + "' data-couns-title='" + counsel.counsTitle + "' data-smem-no='" + counsel.memNo + "' data-smem-name='" + counsel.studentName + "' data-couns-reason='" + counsel.counsReason + "'>"
			historyHtml += counsel.studentName + "(" + counsel.memNo + ")</a></td><td>";
		    historyHtml += counsel.professorName + "</td><td>";
		    historyHtml += formattedDate + "</td><td>";
		    historyHtml += counsel.counsTitle + "</td></tr>";
		});
				   
			historyHtml +="</tbody></table>";
			$('#history').html(historyHtml);
    	},
    	error: function(xhr, status, error) {
            console.error("AJAX request failed: " + error);
        }
    }) ;   
    
});

function startCounsel() {
    $.ajax({
        url: '/lcms/professor/info/counsel/startcounsel/startCounselDetails',
        type: 'GET',
        success: function(data) {
            var windowWidth = 900;
            var windowHeight = 700;
            var windowFeatures = 'width=' + windowWidth + ',height=' + windowHeight + ',resizable=yes,scrollbars=yes';
            var url = 'https://192.168.141.9:3000/';
            console.log(url);
            window.open(url, 'CounselWindow', windowFeatures);
        },
        error: function(xhr, status, error) {
            console.error("AJAX request failed: " + error);
        }
    });
}


$('#counselJournal').on('show.bs.modal', function (event){
	
	
	 var button = $(event.relatedTarget);
	 var modal = $(this);
	 
	 var counsNo = button.data('couns-no');
	 modal.find('#counsNo').text(counsNo); 
	 
	 var counsTitle = button.data('couns-title');
	 modal.find('#counsTitle').text(counsTitle); 
	 
	 var counsReason = button.data('couns-reason');
	 modal.find('#counsReason').text(counsReason); 
	 
	 var smemNo = button.data('smem-no');
	 modal.find('#smemNo').text(smemNo); 
	 
	 var smemName = button.data('smem-name');
	 modal.find('#smemName').text(smemName); 
	 
	 
	 var counsContent = button.data('couns-content');

	 var counsStatus = button.data('couns-status');

	 var counsHtml="";
	 var footBtnHtml="";
	 
	 if(counsStatus==='STA06'){
		 
		 counsHtml+=`<form id='contentForm'>
	    				<div data-couns-no="${counsNo}">
							<div id="countMessage" style=" float: right; margin-right:10px;"></div>
	        				<textarea name='contentText' style='width:450px;height:200px;margin-top: 10px; margin-left:5px;'>${counsContent ? counsContent : ''}</textarea>
							<div id="charCountMessage" style="color: red; margin-top:5px; ">
	    				</div>
					</form>`;
		 
		 footBtnHtml+=
		    `<button type="submit" id="saveContent" class="btn btn-primary">저장</button>
	        <button type="submit" id="modContent" class="btn btn-success">수정</button>
	        <button type="submit" id="finalContent" class="btn btn-accent">확정</button>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>`;
		 
	
	 }if(counsStatus==='STA09'){
		 
		 counsHtml+="<p>"+counsContent+"</p>";
		 
		 footBtnHtml+=`<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>`;
	 }
	 
	 $('#counsContent').html(counsHtml);
	 $('#footBtn').html(footBtnHtml);
	 
});

$(document).on("click", "#finalContent", function(){
	 event.preventDefault();
	
	 var contentText = $("#counselJournal").find("[name='contentText']").val();
	 var counsNo = $("#counselJournal").find("[data-couns-no]").data("counsNo");
	 var counsStatus = 'STA09';
	
	 var data={
	        "counsContent": contentText,
	        "counsNo": counsNo,
	        "counsStatus":counsStatus 
		    };
	 
	 $.ajax({
	     url: 'finalJournal',
	     type: 'POST',
	     data: JSON.stringify(data),
	     dataType : "json",
	     contentType: "application/json",
	     success: function(resp) {
	         if(resp.result==='OK'){
	        	 Swal.fire({
                     icon: 'success',
                     title: '상담일지 등록 완료',
                     showConfirmButton: false,
                     cancelButtonText: '닫기',
                     showCancelButton: true   
                 }).then(function(){
                	 $('#counselJournal').modal('hide');
                	 location.reload();
                 });
	         }
	     },
	     error: function(xhr, status, error) {
	         console.error("AJAX request failed: " + error);
	     }
	 });
});

$(document).on("click", "#saveContent,#modContent", function(){
	event.preventDefault();
	 
	var contentText = $("#counselJournal").find("[name='contentText']").val();
	var counsNo = $("#counselJournal").find("[data-couns-no]").data("counsNo");
	
	data={
        "counsContent": contentText,
        "counsNo": counsNo
    };
	
	 $.ajax({
	     url: 'saveJournal',
	     type: 'POST',
	     data: JSON.stringify(data),
	     dataType : "json",
	     contentType: "application/json",
	     success: function(resp) {
	         if(resp.result==='OK'){
	        	 Swal.fire({
                     icon: 'success',
                     title: '상담일지 저장/수정 완료',
                     showConfirmButton: false,
                     cancelButtonText: '닫기',
                     showCancelButton: true   
                 }).then(function(){
                	 $('#counselJournal').modal('hide');
                	 location.reload();
                 });
	         }
	     },
	     error: function(xhr, status, error) {
	         console.error("AJAX request failed: " + error);
	     }
	 });
	

});

$(document).on('input', 'textarea', function() {
    var maxCharacters = 500; 
    var currentTextLength = $(this).val().length; 
    
    $('#countMessage').text(currentTextLength + ' / ' + maxCharacters);

    if (currentTextLength > maxCharacters) {
        $(this).val($(this).val().substring(0, maxCharacters));

        $('#charCountMessage').text('최대 글자 수를 초과하였습니다.');
    } else {
        $('#charCountMessage').text('');
    }
});


