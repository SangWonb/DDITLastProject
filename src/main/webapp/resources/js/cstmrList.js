/**
 * 
 */

const baseURI = window.location.href

let form = document.querySelector("#submitForm")

$("#submitForm").on("submit", (event) => {
	event.preventDefault();
	let url = form.action+ "/result";
	let method = form.method 

	let formData = new FormData(form);
	let jsonData = {};
	formData.forEach((value, key) => {
		jsonData[key] = value;
	});
	let listBody = document.querySelector("#listBody");

	fetch(url, {
		method: method,
		headers: {
			"Content-Type": "application/json",
			"Accept": "application/json"
		},
		body: JSON.stringify(jsonData)

	}).then(resp => {
		if (resp.ok) {
			return resp.json();
		} else {
			throw new Error("오류발생", { cause: resp })
		}
	}).then(jsonObj => {
		for (let mber of jsonObj) {
				listBody.add({
					'lecCode':mber['lecCode'],
					'subCode':mber['subCode'],
					'subName':mber['subName'],
					'majorCultural':mber['majorCultural'],
					'ltTime':mber['ltTime'],
				});					
			}
		//listBody.innerHTML = trTags;
	}).catch(err => {
		console.error(err)
	}).finally(() => {
		var tdList = document.querySelectorAll('td');

        tdList.forEach(function(td) {
            if (td.innerHTML.trim() === '') {
                td.style.display = 'none';
            }
 		});
	})

	return false;

})

function fnCommFetch(url, options, fnResolve) {
	fetch(url, options)
		.then(resp => {
			if (resp.ok) {
				return resp.json()
			} else {
				throw new Error(`상태코드 ${resp.status} 수신`, { cause: resp })
			}
		}).then(fnResolve).catch(err => console.error(err));
}

var fnRetrieveMber = (event) => {
	let mberBtn = (event.relatedTarget);
	let mberCstNo = (mberBtn.dataset.cstNo);

	fnCommFetch(`${baseURI}/${mberCstNo}`, {
		headers: {
			"Accept": "application/json"
		}
	}, (jsonObj) => {
		let mber = jsonObj.mberVO;
		console.log(mber)
		for (let n in mber) {
			let myInput = document.getElementById(n)
			console.log(n)
			console.log(myInput)
			if (myInput == null) continue
			myInput.value = mber[n];
		}
	})
}



document.addEventListener("show.bs.modal", fnRetrieveMber);

//document.addEventListener("DOMContentLoaded", () => {
//	let options = { "valueNames": ["lecCode", "subCode", "subName", "majorCultural", "ltTime","mberMbrsh", "detail"], "filter":{"key":"mberMbrsh"}, "page": 10, "pagination": true } 
//	mberList = new List('cstmrList', options)
//	$("#submitForm").submit();
//	var listFilter = document.querySelector('[data-list-filter]');
//	var key = options.filter.key;
//	listFilter.addEventListener("change", function(e){
//		console.log("change test")
//		var filterValue = listFilter.value;
//		console.log(filterValue)
//		mberList.filter(function(item){
//              if (e.target.value === '') {
//                return true;
//              }
//              return item.values()[key].toLowerCase().includes(e.target.value.toLowerCase());
//            });			
//		})
//	
//	})
	



