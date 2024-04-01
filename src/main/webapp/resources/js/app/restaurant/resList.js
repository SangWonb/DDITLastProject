/**
 * 
 */
fn_detail();
$("#restRVData").hide();
var resAppno = "none";
$(searchForm).on("submit", function(event){
	event.preventDefault();
	
	let form = this;
	let url = form.action;
	let method = form.method;
	let data = $(form).serialize(); //fetch에서는 사용 불가 //ajax는 formdata 사용가능
	let $listBody = $(listBody);
	let $pagingArea = $(pagingArea);
	
	$.ajax({
		url:url
		, method:method
		, data : data
		, dataType : "json"
		, success:function(jsonObj){
			$listBody.empty();
			$pagingArea.empty();
			
			let dataList = jsonObj.resList;
			let pagingHTML = jsonObj.pagingHTML;
			
			let trTags = null;
			
			if(dataList.length > 0){
				$.each(dataList, function(index, res){ //jquery 아닐떄 >> dataList.forEach(function(member)

					trTags += `
						<tr data-res-appno="${res.resAppno}">
							<td style="width: 10px;" class="js-lists-values-earnings small">${res.rnum }</td>
							<td style="width: 150px;" class="js-lists-values-earnings small">
								<div class="media flex-nowrap align-items-center" style="white-space: nowrap;">
                                    <div class="media-body">
                                        <div class="d-flex flex-column"  style="text-align: left;">
                                            <p class="mb-0" style="margin-left: 20px;"><strong class="js-lists-values-name">${res.resName }</strong></p>
                                            <small class="js-lists-values-email text-50" style="margin-left: 20px;">${res.resTel }</small>
                                        </div>
                                    </div>
                                </div>
                            </td>
							<td style="width: 80px;" class="js-lists-values-earnings small">${res.resCode }</td>
							<td style="width: 80px;">
								<div class="col-lg-8 d-flex align-items-center">
									<div class="flex" style="display:flex; width: 40px; margin:2px;">
										<svg style="width:15px; color:lightcoral;" data-v-134867f8="" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="thumbs-up" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="svg-inline--fa fa-thumbs-up fa-w-16"><path data-v-134867f8="" fill="currentColor" d="M104 224H24c-13.255 0-24 10.745-24 24v240c0 13.255 10.745 24 24 24h80c13.255 0 24-10.745 24-24V248c0-13.255-10.745-24-24-24zM64 472c-13.255 0-24-10.745-24-24s10.745-24 24-24 24 10.745 24 24-10.745 24-24 24zM384 81.452c0 42.416-25.97 66.208-33.277 94.548h101.723c33.397 0 59.397 27.746 59.553 58.098.084 17.938-7.546 37.249-19.439 49.197l-.11.11c9.836 23.337 8.237 56.037-9.308 79.469 8.681 25.895-.069 57.704-16.382 74.757 4.298 17.598 2.244 32.575-6.148 44.632C440.202 511.587 389.616 512 346.839 512l-2.845-.001c-48.287-.017-87.806-17.598-119.56-31.725-15.957-7.099-36.821-15.887-52.651-16.178-6.54-.12-11.783-5.457-11.783-11.998v-213.77c0-3.2 1.282-6.271 3.558-8.521 39.614-39.144 56.648-80.587 89.117-113.111 14.804-14.832 20.188-37.236 25.393-58.902C282.515 39.293 291.817 0 312 0c24 0 72 8 72 81.452z" class=""></path></svg>
										<div style="width: 25px;">${res.resLike}</div>
									</div>
									<div class="flex" style="display:flex; width: 40px; margin:2px;">
										<svg style="width:15px; color:skyblue;" data-v-134867f8="" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="thumbs-down" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="svg-inline--fa fa-thumbs-down fa-w-16"><path data-v-134867f8="" fill="currentColor" d="M0 56v240c0 13.255 10.745 24 24 24h80c13.255 0 24-10.745 24-24V56c0-13.255-10.745-24-24-24H24C10.745 32 0 42.745 0 56zm40 200c0-13.255 10.745-24 24-24s24 10.745 24 24-10.745 24-24 24-24-10.745-24-24zm272 256c-20.183 0-29.485-39.293-33.931-57.795-5.206-21.666-10.589-44.07-25.393-58.902-32.469-32.524-49.503-73.967-89.117-113.111a11.98 11.98 0 0 1-3.558-8.521V59.901c0-6.541 5.243-11.878 11.783-11.998 15.831-.29 36.694-9.079 52.651-16.178C256.189 17.598 295.709.017 343.995 0h2.844c42.777 0 93.363.413 113.774 29.737 8.392 12.057 10.446 27.034 6.148 44.632 16.312 17.053 25.063 48.863 16.382 74.757 17.544 23.432 19.143 56.132 9.308 79.469l.11.11c11.893 11.949 19.523 31.259 19.439 49.197-.156 30.352-26.157 58.098-59.553 58.098H350.723C358.03 364.34 384 388.132 384 430.548 384 504 336 512 312 512z" class=""></path></svg>
										<div style="width: 25px;">${res.resHate}</div>
									</div>
								</div>
							</td>
						</tr>
					`;
				});
			}else{
				trTags = `
					<tr>
						<td colspan="4">조건에 맞는 식당이 없습니다.</td>
					</tr>
				`;
			}
			
			$listBody.append(trTags);
			$pagingArea.append(pagingHTML);
			
		}, error : function(jqXHR, txt, status){
			console.log(txt, status, jqXHR);
		}
	}).done(()=>{ //fetch의 filnally와 같은놈. 
		$(this).find("input[name='page']").val("");
	});
	return false;
}).submit(); //초기값 !! 페이지 로딩하자마다 바로 실행됨

function showTooltip(id) {
	var tooltip = document.getElementById(id);
	tooltip.style.display = "inline";
}
function hideTooltip(id) {
	var tooltip = document.getElementById(id);
	tooltip.style.display = "none";
}

$('select[data-change-event="resCode"]').on("change", (event) => {
	let $resCode = $(event.target);
	let selectedCode = $resCode.val(); //let selectedLgu = event.target.value; //val(), value 하면 선택되어있는 옵션의 값이 나옴.
	$('#searchForm').find("input[name='resCode']").val(selectedCode);
	$('#searchForm').submit();
});
$("#searchBtn").on("click", function(event){
	event.preventDefault();
	let searchData = $(".search-form").find('input[name="resName"]').val();
	$('#searchForm').find("input[name='resName']").val(searchData);
	$('#searchForm').submit();
});
$(document).on("click", 'tr[data-res-appno]',function(event){
    // 클릭한 <tr> 요소의 data-res-appno 속성 값 가져오기
    resAppno = $(this).data('res-appno');
	$("[data-rest='restData']").click();
	var cardFooter = document.querySelector('#reviewCard');
	var elements = cardFooter.querySelectorAll('*');
	elements.forEach(function(element) {
        element.removeAttribute('disabled');
    });
});
function fn_detail(){
	if($("#restRVData").is(":visible")){
		$("#restRVData").toggle();
	}
	let url = window.location.pathname + "/" + resAppno;
	let method = "get"
	
	$.ajax({
		url:url
		, method:method
		, success:function(response){
            $('#restData').html(response);				
			
		}, error : function(jqXHR, txt, status){
			console.log(txt, status, jqXHR);
		}
	});
	if($("#restData").is(":hidden")){
		$("#restData").toggle();
	}
}
function fn_review(){
	if($("#restData").is(":visible")){
		$("#restData").toggle();
	}
	
	let url = window.location.pathname + "/" + resAppno + "/review";
	let method = "get"
	
	$.ajax({
		url:url
		, method:method
		, success:function(response){
			console.log(response);
            $('#restRVData').html(response);				
		}, error : function(jqXHR, txt, status){
			console.log(txt, status, jqXHR);
		}
	});
	if($("#restRVData").is(":hidden")){
		$("#restRVData").toggle();
	}
}
$(document).ready(function(){
    // 버튼을 클릭했을 때
    $('#prefer button[data-prefer]').click(function(){
        var prefer = $(this).attr('value');
        if (prefer == "L") {
			$("[data-prefer-like]").css('color', 'lightcoral');
            $("[data-prefer-hate]").css('color', 'gray');
            $(this).attr('data-prefer', 'true');
            $('#prefer button[value="H"]').attr('data-prefer', 'false');
        } else if (prefer == "H") {
            $("[data-prefer-hate]").css('color', 'skyblue');
			$("[data-prefer-like]").css('color', 'gray');
            $(this).attr('data-prefer', 'true');
            $('#prefer button[value="L"]').attr('data-prefer', 'false');
        }
    });
});
document.addEventListener("DOMContentLoaded", function() {
    // card-footer 요소 찾기
    var cardFooter = document.querySelector('#reviewCard');
    
    // card-footer 안에 있는 모든 요소 찾기
    var elements = cardFooter.querySelectorAll('*');
    
    // 모든 요소를 비활성화 처리
    elements.forEach(function(element) {
        element.setAttribute('disabled', 'disabled');
    });
});
$("#reviewAddBtn").on("click",function(event){
	
	var prefer = $("[data-prefer=true]").val();
	var content = $("#reviewContent").val();
	
	if(prefer){
		$('#preferWarn').css("display","none");
	}else{
		$('#preferWarn').css("display","block");
		return;
	}
	
	if(content){
		$("#reviewContent").css("border-color","lightgray");
	}else{
		$("#reviewContent").css("border-color","red");
		return;
	}
	
	let url = window.location.pathname + "/" + resAppno + "/review";
	let method = "post"
	
	var data = {
	    "reviewPrefer": prefer,
	    "reviewReply": content
	};
	
	var jsonData = JSON.stringify(data);
	console.log(jsonData);
	
	console.log(url);
	
	$.ajax({
		url:url
		, method:method
		, data:jsonData
		, contentType: 'application/json'
		, success:function(response){
			console.log(response);
			$('#restRVData').empty();
            $('#restRVData').html(response);				
			
			let page = $(".page-item.active").find("span").text();
			$("#searchForm").find('[name="page"]').val(page);
			$("#searchForm").submit();
			fn_detail();
			
		}, error : function(jqXHR, txt, status){
			console.log(txt, status, jqXHR);
		}
	}).always(function() {
		$("[data-prefer-like]").css('color', 'gray');
        $("[data-prefer-hate]").css('color', 'gray');
        $('#prefer button[value="L"]').attr('data-prefer', 'false');
        $('#prefer button[value="H"]').attr('data-prefer', 'false');
		$("#reviewContent").val("");
	});

	
	
	
	
	
});