// 에디터 동작 중 삭제한 img 파일들의 filename
let deleteList = [];

// 텍스트 박스 추가 메소드
function fn_addContent() {
	let html = `
		<div class="flex">
			<div contenteditable="true"></div>
			<i class="far fa-trash-alt"></i>
		</div>`;
	$('#content').append(html);
}

// 텍스트 박스 엔터시 div구분을 br 구분으로 변경하는 메소드
function divToBr() {
	$('body').on('keypress', '[contenteditable="true"]', (e) => {
		if(e.keyCode == 13) {
			let selection = window.getSelection();
			let range = selection.getRangeAt(0);
			let br = document.createElement("br");
			range.deleteContents();
			range.insertNode(br);
			range.setStartAfter(br);
			range.setEndAfter(br);
			range.collapse(false);
			selection.removeAllRanges();
			selection.addRange(range);
			return false;
		}
	});
}

//파일전송 테스트
function fn_filesend() {
	$('body').on('change', '#upload', function() {
		let file = document.getElementById('upload').files[0];
	    let data = new FormData();
	    data.append("upload", file);
	    $.ajax({
	        type: "POST",
	        enctype: 'multipart/form-data',
	        url: "upload.wooki",
	        data: data,
	        processData: false,
	        contentType: false,
	        dataType: 'json',
	        success: function (data) {
	        	let filename = data.filename;
	        	let html = `
				<div class="flex">
					<img src="resources/storage/${filename}"/>
					<i class="far fa-trash-alt"></i>
				</div>`;
				$('#content').append(html);
	        },
	        error: function (e) {
	            alert('실패');
	        }
	    });
	})
}

// div, img 삭제
function deleteContent() {
	$('body').on('click', '.fa-trash-alt', (e) => {
		let target = $(e.target).parent('div');
		let img = $(e.target).parent('div').find('img');
		let src = img.attr('src');
		if(src != undefined) {
			let index = src.lastIndexOf('/');
			let filename = src.substr(index + 1);
			deleteList.push(filename);
		}
		target.remove();
	});
}

// 저장하기 눌렀을 때 실행할 파일삭제 ajax
//let filesname = deleteList.toString();
//$.ajax({
//	url: `testDelete/${filesname}.wooki`,
//	type: 'delete',
//	sueccess: function(obj) {
//		deleteList = [];
//	},
//	error: function() {
//		alert('실패');
//		deleteList = [];
//	}
//});