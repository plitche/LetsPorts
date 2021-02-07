/* 		$('#content').append('<input type="file" id="inpfile" accept="image/*" />'); */
// 텍스트 박스 추가 메소드
function fn_addContent() {
	let html = `
		<div class="flex">
			<div contenteditable="true"></div>
			<i class="far fa-trash-alt"></i>
		</div>`;
	$('#content').append(html);
}

//파일전송 테스트
function fn_filesend() {
	$('#btnUpload').on('click', function() {
	    let form = $('#send')[0]
	    let data = new FormData(form);
	    
	    $.ajax({
	        type: "POST",
	        enctype: 'multipart/form-data',
	        url: "upload.wooki",
	        data: data,
	        processData: false,
	        contentType: false,
	        success: function (data) {
	        	let filename = data.filename;
	        	let html = `
				<div class="flex">
					<img src="resources/storage/boardsPhoto/${filename}"/>
					<i class="far fa-trash-alt"></i>
				</div>`;
				$('#content').append(html);
	        },
	        error: function (e) {
	            alert('fail');
	        }
	    });
	})
}

function deleteContent() {
	$('body').on('click', '.fa-trash-alt', (e) => {
		let target = $(e.target).parent('div');
		target.remove();
	})
}

$('body').on('change', '#inpfile', function() {
	let targetDiv = document.getElementById("content");
	let file = $(this).prop('files')[0];
	let img = document.createElement("img");
	let reader  = new FileReader();
	targetDiv.append(img);
	reader.addEventListener("load", function () {
		img.src = reader.result;
	}); 
	let data = reader.result;
	if (file) {
		reader.readAsDataURL(file);
	}
});

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