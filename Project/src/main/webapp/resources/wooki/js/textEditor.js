// 에디터 동작 중 삭제한 img 파일들의 filename
let deleteList = [];

// temp_board 데이터 삽입 및 반환
function fn_insertTempBoard(user_no) {
	$.ajax({
		url: 'isnertTempBoard.wooki',
		type: 'get',
		data: {
			user_no: user_no
		},
		success: function(obj) {
			$('#temp_no').val(obj.temp_no);
		},
		error: function() {
			alert('임시번호 생성이 되지 않았습니다. 다시 시도해주세요.');
			history.back();
		}
	});
}

// 텍스트 박스 추가 메소드
function fn_addContent() {
	let html = `
		<div class="flex">
			<div contenteditable="true"></div>
			<i class="far fa-trash-alt btn"></i>
		</div>`;
	$('#content').append(html);
}

// 텍스트 박스 엔터시 div구분을 br 구분으로 변경하는 기능
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

// 사진 선택시 사진업로드 및 photo 테이블 저장 및 이미지 태그 컨텐츠에 추가
function fn_filesend() {
	$('body').on('change', '#uploadFile', function() {
		let file = $('#uploadFile')[0].files[0];
		let user_no = $('#user_no').val();
		let temp_no = $('#temp_no').val();
	    let data = new FormData();
	    data.append("uploadFile", file);
	    data.append("user_no", user_no);
	    data.append("temp_no", temp_no);
	    $.ajax({
	        type: "POST",
	        enctype: 'multipart/form-data',
	        url: "photoUpload.wooki",
	        data: data,
	        processData: false,
	        contentType: false,
	        dataType: 'json',
	        success: function (data) {
	        	$('#uploadFile').val('');
	        	let filename = data.filename;
	        	let html = `
				<div class="flex">
					<img src="resources/storage/${filename}"/>
					<i class="far fa-trash-alt btn"></i>
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
		let target = $(e.target).parent('div');	// 삭제해야 하는 태그 선택
		let img = $(e.target).parent('div').find('img');	// 이미지인 경우를 분기하기 위한 선택자
		let src = img.attr('src');	// 이미지 파일명 추출을 위한 src 추출
		if(src != undefined) {	// 이미지인경우
			let index = src.lastIndexOf('/');
			let filename = src.substr(index + 1);
			deleteList.push(filename);	// 이미지 파일명
		}
		target.remove();
	});
}

// 데이터 저장메소드
function fn_submit() {
	// deleteList에 저장해두었던 삭제사진들 db + 서버에서 삭제
	fn_photoDelete();
	
	// form 내부에 컨텐츠 추가
	let content = $('#content').html().trim();
	let form = $('#insertForm');
	form.append(`<textarea style="display: none" name="content" id="content" cols="1" rows="1">${content}</textarea>`);
	
	// 폼 전송
	form.submit();
}

// 저장하기 눌렀을 때 실행할 파일삭제 및 photo 테이블 제거 ajax
function fn_photoDelete() {
	let filesname = deleteList.toString();
	$.ajax({
		url: `photoDelete/${filesname}.wooki`,
		type: 'delete',
		success: function(obj) {
			deleteList = [];
		},
		error: function() {
			alert('실패');
			deleteList = [];
		}
	});
}

// 뷰페이지 진입시 img태그 파일네임 배열화 및 숨김사진 분기
function fn_photoList() {
	let photoList = [];
	$('#content img').each(function() {
		let index = $(this).attr('src').lastIndexOf('/');
		let filename = $(this).attr('src').substr(index + 1);
		photoList.push(filename);
	});
	let filesname = photoList.toString();
	$.ajax({
		url: `photoHideCheck/${filesname}.wooki`,
		type: 'get',
		dataType: 'json',
		success: function(obj) {
			if(obj.list == null) {
				return;
			}
			let hideList = obj.list.split(',');
			$('#content img').each(function() {
				let index = $(this).attr('src').lastIndexOf('/');
				let filename = $(this).attr('src').substr(index + 1);
				for(let i = 0; i < hideList.length; i++) {
					if(filename == hideList[i]) {
						$(this).hide();
					}
				}
			});
		},
		error: function() {
			alert('실패');
		}
	});
}