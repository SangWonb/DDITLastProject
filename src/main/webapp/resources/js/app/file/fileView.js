//단건 다운로드
const singleFileDownload = (event)=>{
	event.preventDefault();
	let file = document.querySelector(event.target.dataset.target).value;
	console.log(file);
	if(! file.length ) return;
	let href = event.target.href;
	let hiddenA = document.createElement("a");
	hiddenA.href = `${href}?what=${file}`;
	hiddenA.click();
	hiddenA.remove();
}

//단건 삭제
const singleFileDelete = (event)=>{
	event.preventDefault();
	let file = document.querySelector(event.target.dataset.target).value;
	console.log(file);
	if(! file.length ) return;
	let href = event.target.href;
	let hiddenA = document.createElement("a");
	hiddenA.href = `${href}?what=${file}`;
	hiddenA.click();
	hiddenA.remove();
}

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

//여러건 다운로드
const multipleFileDownload = (event)=>{
	event.preventDefault();
	let multipleSelect = event.target.dataset.target;
	let options = Array.from(document.querySelectorAll(`${multipleSelect} option:checked`).values());
	let files = options.map(o=>o.value);
	console.log(files);
	if(! files.length ) return;
	let href = event.target.href;
	let filename = null;
	fetch(href, {
		method:"post",
		headers:{
			"Content-Type"  : "application/json;charset=UTF-8"
		}, 
		body : JSON.stringify(files)
	}).then(resp=>{
			if(resp.ok){
				const headerValue = resp.headers.get('Content-Disposition');
				filename = parseDownloadName(headerValue);
				return resp.blob();
			}else{
				throw new Error(`파일 다운로드 ${resp.status} 에러`, {cause : resp});
			}
		}
	).then(blob=>{
		let url = window.URL.createObjectURL(blob);
		let hiddenA = document.createElement("a");
		hiddenA.href = url;
		hiddenA.download = filename;
		hiddenA.click();
		hiddenA.remove();
		URL.revokeObjectURL(url);
	});
}
//여러건 삭제
const multipleFileDelete = (event)=>{
	event.preventDefault();
	let multipleSelect = event.target.dataset.target;
	let options = Array.from(document.querySelectorAll(`${multipleSelect} option:checked`).values());
	let files = options.map(o=>o.value);
	console.log(files);
	if(! files.length ) return;
	let href = event.target.href;
	let filename = null;
	fetch(href, {
		method:"post",
		headers:{
			"Content-Type"  : "application/json;charset=UTF-8"
		}, 
		body : JSON.stringify(files)
	}).then(resp=>{
			if(resp.ok){
				console.log("성공"); //삭제 후 다시 새로고침해야지 보임 >> 비동기로 하는건 알아서!
			}else{
				throw new Error(`파일 다운로드 ${resp.status} 에러`, {cause : resp});
			}
		}
	);
}
