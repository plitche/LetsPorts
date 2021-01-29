// 어드민 로그인 메소드
function fn_login(f) {
    if($('#email').val() == '') {
        alert('아이디를 입력해주세요.');
        return;
    } else if($('#password').val() == '') {
        alert('비밀번호를 입력해주세요.');
        return;
    }
    f.submit();
}

// 로그인 성공여부 체크 메소드
function fn_loginCehck(result) {
	if(result == 0) {
		alert('로그인 되었습니다.');
		location.href = 'adminIndex.wooki';
	} else if(result == 1) {
		alert('아이디 또는 암호를 확인하세요.');
	} else if(result == 2) {
		alert('접근 권한이 없습니다.');
	}
}

// 로그아웃 메소드
function fn_logout() {
	if(confirm('로그아웃 하시겠습니까?')) {
		location.href = 'adminLogout.wooki';
	}
}

// 페이지접속시 어드민권한이 있는지 확인하는 메소드
function fn_adminCheck(user_sep) {
	if(user_sep != 0) {
		alert('접근 권한이 없습니다.')
		location.href = 'adminPage.wooki';
	}
}

// 선택한 nav-btn 강조 메소드
function fn_selectBtn() {
	$('.nav-container .nav-btn').click(function() {
		$('.nav-container .nav-btn').removeAttr('id', 'select-nav');
	    $('.nav-container .nav-btn').eq($(this).index()).attr('id', 'select-nav');
	});
}

// 메인페이지 선택 메소드
function fn_main() {
	$('.content-container').empty();
	$('.content-container')
	.append('<h1>어드민 전용 페이지 입니다</h1>')
	.append('<p>환영합니다</p>');
}

// 일반회원관리 선택 메소드
function fn_user(page) {
	$.ajax({
		url: 'userList.wooki',
		type: 'get',
		data: {"page": page},
		dataType: 'json',
		success: function(list) {
			if(list.result) {
				userList(list.list, list.paging, list.totalRecord, list.recordPerPage, list.page);
			}
		},
		error: function() {
			alert('실패');
		}
	});
}

// 유저리스트 테이블 만드는 함수
function userList(list, paging, totalRecord, recordPerPage, page) {
	$('.content-container').empty();
	$('.content-container').append('<h1>일반회원 관리</h1>');
	$('<table>')
	.append($('<thead id="title">'))
	.append($('<tbody id="list">'))
	.append($('<tfoot class="paging">'))
	.appendTo('.content-container');
	
	$('<tr>')
	.append($('<th>').html('인덱스'))
	.append($('<th>').html('유저번호'))
	.append($('<th>').html('이메일'))
	.append($('<th>').html('닉네임'))
	.append($('<th>').html('활동지역(시,도)'))
	.append($('<th>').html('활동지역(시,군,구)'))
	.append($('<th>').html('가입일'))
	.append($('<th>').html('최종로그인'))
	.append($('<th>').html('로그인횟수'))
	.append($('<th>').html('로그인 시도 횟수'))
	.append($('<th>').html('가입방식'))
	.append($('<th>').html('계정 활성화 여부'))
	.append($('<th colspan="3">').html('비고'))
	.appendTo('#title');
	
	$.each(list, function(idx, user) {
		let date = [user.created_at, user.last_login];
		let result = [];
		for(let i = 0; i < 2; i++) {
			let d = new Date(date[i]);
			result[i] = d.getFullYear() + '-';
			if(d.getMonth() < 10) {
				result[i] += 0;
			}
			result[i] += (d.getMonth() + 1) + '-' + d.getDate() + " ";
			result[i] += d.getHours() + ":"; 
			if(d.getMinutes() < 10) {
				result[i] += 0;
			}
			result[i] += d.getMinutes() + ":";
			if(d.getSeconds() < 10) {
				result[i] += 0;
			}
			result[i] += d.getSeconds();
		};
		
		$('<tr>')
		.append($('<td>').html(totalRecord - (recordPerPage * (page - 1)) - idx))
		.append($('<td>').html(user.user_no))
		.append($('<td>').html(user.email))
		.append($('<td>').html(user.user_nickname))
		.append($('<td>').html(user.location1_no))
		.append($('<td>').html(user.location2_no))
		.append($('<td>').html(result[0]))
		.append($('<td>').html(result[1]))
		.append($('<td>').html(user.login_count))
		.append($('<td>').html(user.login_attempt))
		.append($('<td>').html(user.user_reg_method))
		.append($('<td>').html(user.disable))
		.append($('<input type="hidden" name="no" />').val(user.user_no))
		.append($('<td>').html('<input type="button" value="아이디변경" id="changeEmail" />'))
		.append($('<td>').html('<input type="button" value="임시비밀번호부여" id="changePwd" />'))
		.append($('<td>').html('<input type="button" value="계정삭제" id="deleteId" />'))
		.appendTo('#list')
	});
	
	$('<tr>')
	.append($('<td colspan="15">').html(paging))
	.appendTo('.paging');
}