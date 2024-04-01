/**
 * https://github.com/mar10/fancytree/wiki/TutorialLoadData
 */
function logEvent(event, data, msg){
	$.ui.fancytree.info(`Event('${event.type}', node=${data.node})\n${msg}`);
}
let $treeElement = $("#treeArea").fancytree({
	source: function(event, data){
		logEvent(event, data, "'this' : FancyTree 인스턴스");
		let url = this.data.source; 
		return {
			url: url,
			cache: false
		};
	}, 
	lazyLoad: function(event, data) {
		logEvent(event, data, "'this' : #treeArea div tag(HTMLDivElement)");
		let node = data.node;
		let treeElement = this;
		data.result = {
			url: treeElement.dataset.source
			, data : {
				path : node.getKeyPath()		
			}
		};
	}, 
	checkbox : true,
	selectMode : 3 // single selection(1), multi selection(2), hierarchical selection(3) 
});

const parseDownloadName = (contentDispositionHeader)=>{
//		Content-Disposition 헤더 의 값
//		case1 : attachment; filename*=UTF-8''%ED%8C%8C%EC%9D%BC%20%20%EB%AA%85
//		case2 : attatchment; filename="filename"
//		case3 : attatchment; filename*=UTF-8'%ED%8C%8C%EC%9D%BC%20%20%EB%AA%85'
	const [, name1, charset2, name2, charset3, name3] = 
			contentDispositionHeader 
			&& contentDispositionHeader.match(/filename\*?=(?:(?:"(.+)")|(?:(.+)''(.+))|(?:(.+)'(.+)'))/) 
			|| [];
	return name1 
			|| (name2 && decodeURIComponent(name2, charset2))
			|| (name3 && decodeURIComponent(name3, charset3));	
}

$("#downBtn").on("click", function(){
	let mainTree = $.ui.fancytree.getTree($treeElement);
	let nodeArray = mainTree.getSelectedNodes();
	if(nodeArray.length==0) return false;
	
	let keyPaths = nodeArray.map(n=>n.getKeyPath());
	
	let url = $(this).data('action');
		
	$.post({
		url : url
		, xhrFields : {
			responseType : "blob"
			, onprogress : function(e){
				$treeElement.data("progress").val((e.loaded/e.total) * 100);
			}
		}
		, data : JSON.stringify(keyPaths)
		, headers : {
			"Content-Type"  : "application/json;charset=UTF-8"
		}
		, beforeSend : function(){
			let prsBar = $("<progress max='100'>").addClass("col-6");
			$treeElement.prev(".prsArea").html(prsBar);
			$treeElement.data("progress", prsBar);
		}
	}).done((resp, status, jqXHR)=>{
		// this : #downBtn input tag(HTMLInputElement)
		let disposition = jqXHR.getResponseHeader("content-disposition");
		let filename =  parseDownloadName(disposition);
		let url = window.URL.createObjectURL(resp);
		let hiddenA = document.createElement("a");
		hiddenA.download = filename??"download.zip";
		hiddenA.href = url;
		hiddenA.click();
		hiddenA.remove();
	}).always(()=>{
		$treeElement.data("progress").remove();
		$treeElement.removeData("progress");
	});
});