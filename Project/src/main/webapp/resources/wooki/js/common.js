// ajax 진행중 확인 스테이터스
let is_progress = false;

// 이메일 사용가능여부 확인 스테이터스
let is_possible = false;

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
	if(result == '0') {
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
	location.href = 'adminLogout.wooki';
}

// 페이지접속시 어드민권한이 있는지 확인하는 메소드
function fn_adminCheck(user_sep) {
	if(user_sep != 0) {
		alert('접근 권한이 없습니다.');
		fn_logout();
		return;
	}
	return true;
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

// 일반회원 메뉴 실행 메소드
function fn_user(p) {
	$.ajax({
		url: 'userList.wooki',
		type: 'get',
		data: {page: p},
		dataType: 'json',
		success: function(list) {
			if(list.result) {
				userFilter(list.text_filter, list.search, list.user_separator);
				userList(list.list, list.paging, list.totalRecord, list.recordPerPage, list.page);
			}
		},
		error: function() {
			alert('실패');
		}
	});
}

// 유저 검색 만드는 함수
function userFilter(text_filter, search, user_separator) {
	$('.content-container').empty();
	$('.content-container').append('<h1>회원 관리</h1>');
	$('<form>')
	.append($('<tbody id="filterBox">'))
	.appendTo('.content-container');
	
	$('<tr>')
	.append($('<td>').html('<select name="text_filter" id="text_filter"><option value="email">이메일</option><option value="user_nickname">닉네임</option><option value="user_no">유저번호</option></select>'))
	.append($('<td>').html('<input type="text" name="search" id="search" />'))
	.append($('<td>').html('회원구분'))
	.append($('<td>').html('<select name="user_separator" id="user_separator"><option value="">전체선택</option><option value="0">관리자</option><option value="1">트레이너</option><option value="2">일반회원</option></select>'))
	.append($('<td>').html('<input type="button" value="검색" onclick="fn_filterUserList(1)" />'))
	.appendTo('#filterBox');
	if(text_filter == undefined) {
		$('#text_filter').val('email');
	} else {
		$('#text_filter').val(text_filter);
	}
	$('#search').val(search);
	$('#user_separator').val(user_separator);
}

// 유저탭 - 필터된 유저 리스트
function fn_filterUserList(p) {
	let text_filter = $('#text_filter').val();
	let search = $('#search').val();
	let user_separator = $('#user_separator').val();
	if(text_filter == 'user_no' && search == '') {
		alert('유저번호를 입력하세요.');
		return;
	}
	$.ajax({
		url: 'filterUserList.wooki',
		type: 'get',
		data: {
			page: p,
			text_filter: text_filter,
			search: search,
			user_separator: user_separator
		},
		dataType: 'json',
		success: function(list) {
			if(list.result) {
				userFilter(list.text_filter, list.search, list.user_separator);
				userList(list.list, list.paging, list.totalRecord, list.recordPerPage, list.page);
			}
		},
		error: function() {
			alert('유저번호는 숫자로 입력 해 주세요.');
		}
	});
}

// 유저리스트 테이블 만드는 함수
function userList(list, paging, totalRecord, recordPerPage, page) {
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
	.append($('<th>').html('회원구분'))
	.append($('<th>').html('활동지역(시,도)'))
	.append($('<th>').html('활동지역(시,군,구)'))
	.append($('<th>').html('가입일'))
	.append($('<th>').html('최종로그인'))
	.append($('<th>').html('로그인횟수'))
	.append($('<th>').html('로그인 시도 횟수'))
	.append($('<th>').html('가입방식'))
	.append($('<th colspan="3">').html('비고'))
	.appendTo('#title');
	
	$.each(list, function(idx, user) {
		let date = [user.created_at, user.last_login];
		let result = [];
		for(let i = 0; i < 2; i++) {
			let d = new Date(date[i]);
			result[i] = `${d.getFullYear()}-`;
			if(d.getMonth() < 10) {result[i] += 0;}
			result[i] += `${(d.getMonth() + 1)}-`;
			if(d.getDate() < 10) {result[i] += 0;}
			result[i] += `${d.getDate()} ${d.getHours()}:`;
			if(d.getMinutes() < 10) {result[i] += 0;}
			result[i] += `${d.getMinutes()}:`;
			if(d.getSeconds() < 10) {result[i] += 0;}
			result[i] += d.getSeconds();
		};
		let separator = ['관리자', '트레이너', '일반회원'];
		let sep = separator[user.user_separator];
		$('<tr>')
		.append($('<td>').html(totalRecord - (recordPerPage * (page - 1)) - idx))
		.append($('<td>').html(user.user_no))
		.append($('<td>').html(user.email))
		.append($('<td>').html(user.user_nickname))
		.append($('<td>').html(sep))
		.append($('<td>').html(user.location1_no))
		.append($('<td>').html(user.location2_no))
		.append($('<td>').html(result[0]))
		.append($('<td>').html(result[1]))
		.append($('<td>').html(user.login_count))
		.append($('<td>').html(user.login_attempt))
		.append($('<td>').html(user.user_reg_method))
		.append($('<input type="hidden" name="user_no" id="user_no" />').val(user.user_no))
		.append($('<input type="hidden" name="email" id="email" />').val(user.email))
		.append($('<td>').html('<input type="button" value="아이디변경" id="changeEmail" />'))
		.append($('<td>').html('<input type="button" value="임시비밀번호부여" id="changePwd" />'))
		.append($('<td>').html('<input type="button" value="계정삭제" id="deleteId" />'))
		.appendTo('#list')
	});
	
	$('<tr>')
	.append($('<td colspan="15">').html(paging))
	.append($('<input type="hidden" id="now_page" />').val(page))
	.appendTo('.paging');
}

// 이메일변경 모달 열기
function fn_openChangeEmailModal() {
	$('body').on('click', '#changeEmail', function() {
		let user_no = $(this).parents('tr').find('#user_no').val();
		let email = $(this).parents('tr').find('#email').val();
		$('#change-email-modal').addClass('show');
		$('#change_user_no').val(user_no);
		$('#current_email').val(email);
	});
}

// 이메일 변경 가능 아이디 체크
function fn_changeEmailIsPossible() {
	$('#change_email').blur(function() {
		if($('#change_email').val() == '') {
			return;
		}
		$.ajax({
			url: 'changeEmailIsPossible.wooki',
			type: 'get',
			data: {
				email: $('#change_email').val()
			},
			dataType: 'json',
			success: function(obj) {
				if(obj.result) {
					$('#change_mail_is_possible').html('사용 가능한 이메일 입니다.');
					$('#change_mail_is_possible').attr('class', 'success');
					is_possible = obj.result;
				} else {
					$('#change_mail_is_possible').html('이미 사용중인 이메일 입니다.');
					$('#change_mail_is_possible').attr('class', 'fail');
				}
			},
			error: function() {
				alert('실패');
			}
		});
	});
}

//이메일변경 이벤트
function fn_changeEmail() {
	$('#change_email_submit').click(function() {
		if(is_progress == true) {
			return;
		}
		is_progress = true;
		let email = $('#change_email').val();
		let user_no = $('#change_user_no').val();
		if(email == '') {
			alert('변경할 이메일을 입력하세요.');
			$('#change_email').focus();
			return;
		} else if(!is_possible) {
			alert('사용가능한 이메일을 입력하세요.');
			$('#change_email').focus();
			return;
		}
		let sendObj = {"user_no": user_no, "email": email};
		$.ajax({
			url: 'changeEmail.wooki',
			type: 'put',
			dataType: 'json',
			data: JSON.stringify(sendObj),
			contentType: 'application/json',
			success: function(obj) {
				$('#change-email-modal').removeClass('show');
				$('#change_email').val('');
				$('#change_user_no').val('');
				$('#current_email').val('');
				$('#change_mail_is_possible').html('');
				$('#change_mail_is_possible').attr('class', '');
				is_possible = false;
				fn_filterUserList($('#now_page').val());
				setTimeout(function() {is_progress = false;}, 1000);
			},
			error: function() {
				alert('실패');
				setTimeout(function() {is_progress = false;}, 1000);
			}
		});
	});
}

// 이메일변경 모달 닫기
function fn_closeChangeEmailModal() {
	$('#change-email-modal').click(function(e) {
		if(e.target == e.currentTarget) {
			$(this).removeClass('show');
			$('#change_email').val('');
			$('#change_user_no').val('');
			$('#current_email').val('');
			$('#change_mail_is_possible').html('');
			$('#change_mail_is_possible').attr('class', '');
			is_possible = false;
		}
	});
}

// 임시비밀번호 발송
function fn_sendTempPass() {
	$('body').on('click', '#changePwd', function() {
		if(is_progress == true) {
			return;
		}
		is_progress = true;
		let user_no = $(this).parents('tr').find('#user_no').val();
		let email = $(this).parents('tr').find('#email').val();
		let sendObj = {"user_no": user_no, "email": email};
		$.ajax({
			url: 'sendTempPass.wooki',
			type: 'put',
			dataType: 'json',
			data: JSON.stringify(sendObj),
			contentType: 'application/json',
			success: function(obj) {
				if(obj.result) {
					alert('임시 비밀번호를 발송하였습니다.');
				} else {
					alert('임시 비밀번호를 발송에 실패하였습니다.');
				}
				setTimeout(function() {is_progress = false;}, 1000);
			},
			error: function() {
				alert('실패');
				setTimeout(function() {is_progress = false;}, 1000);
			}
		});
	});
}

// 관리자 등록 페이지
function fn_addAdminPage() {
	$('.content-container').empty
	let string = `
	<h1>관리자추가</h1>
    <div class="flex">
    <div class="scroll">
    <table style="width: 400px;">
    <thead>
    <tr>
    <th>유저번호</th>
    <th>닉네임</th>
    <th>비고</th>
    </tr>
    </thead>
    <tbody id="adminList"></tbody>
    </table>
    </div>
    <div>
    <span>유저번호</span><input type="text" name="admin_target_no" id="admin_target_no" /><br/>
    <span>유저닉네임</span><span id="admin_target_nickname"></span><br/>
    <input type="button" value="어드민추가" id="btn_updateAdminUser" />
    </div>
    </div>`
	$('.content-container').html(string);
	fn_adminList();
}

// 관리자 회원 리스트 불러와서 추가하는 메소드
function fn_adminList() {
	$.ajax({
		url: 'adminList.wooki',
		type: 'get',
		dataType: 'json',
		success: function(list) {
			$('#adminList').empty();
			$.each(list.list, function(idx, user) {
				$('<tr>')
				.append($('<td>').html(user.user_no))
				.append($('<td>').html(user.user_nickname))
				.append($('<input type="hidden" name="user_no" id="user_no" />').val(user.user_no))
				.append($('<td>').html('<input type="button" value="일반유저전환" id="btn_updateNormalUser" />'))
				.appendTo('#adminList')
			});
		},
		error: function() {
			alert('실패');
		}
	});
}

// 관리자 회원 일반회원으로 변경하는 메소드
function fn_updateNormalUser() {
	$('body').on('click', '#btn_updateNormalUser', function() {
		if(!confirm('변경하시겠습니까?')) {
			return;
		}
		if(is_progress == true) {
			return;
		}
		is_progress = true;
		let user_no = $(this).parents('tr').find('#user_no').val();
		$.ajax({
			url: `updateNormalUser/${user_no}.wooki`,
			type: 'put',
			dataType: 'json',
			success: function(obj) {
				if(obj.result) {
					alert('변경되었습니다.');
				} else {
					alert('변경되지 않았습니다.');
				}
				fn_adminList();
				setTimeout(function() {is_progress = false;}, 1000);
			},
			error: function() {
				alert('실패');
				setTimeout(function() {is_progress = false;}, 1000);
			}
		});
	});
}

// 입력된 유저번호 기준 일치하는 회원 가져오는 가져오는 메소드
function fn_checkUser() {
	$('body').on('blur', '#admin_target_no', function() {
		let target_no = $('#admin_target_no').val();
		if(target_no == '') {
			alert('유저번호를 입력해주세요.');
			$('#admin_target_no').focus();
			return;
		} else if(isNaN(target_no)) {
			alert('유저번호는 숫자로 구성되어 있습니다.');
			$('#admin_target_no').val('');
			$('#admin_target_no').focus();
			return;
		}
		$.ajax({
			url: 'checkUser.wooki',
			type: 'get',
			data: {user_no: target_no},
			dataType: 'json',
			success: function(obj) {
				if(obj.result) {
					$('#admin_target_nickname').html(obj.user_nickname);
					is_possible = true;
				} else {
					$('#admin_target_nickname').html('일치하는 회원이 없습니다.');
					is_possible = false;
				}
			},
			error: function() {
				alert('실패');
			}
		});
	});
}

// 일반회원 관리자 회원으로 변경하는 메소드
function fn_updateAdminUser() {
	$('body').on('click', '#btn_updateAdminUser', function() {
		if(!is_possible) {
			alert('유저검색을 먼저 진행해주세요.');
			return;
		}
		if(is_progress == true) {
			return;
		}
		is_progress = true;
		let user_no = $('#admin_target_no').val();
		$.ajax({
			url: `updateAdminUser/${user_no}.wooki`,
			type: 'put',
			dataType: 'json',
			success: function(obj) {
				if(obj.result) {
					is_possible = false;
					alert('추가되었습니다.');
				} else {
					alert('추가되지 않았습니다.');
				}
				fn_addAdminPage();
				setTimeout(function() {is_progress = false;}, 1000);
			},
			error: function() {
				alert('실패');
				setTimeout(function() {is_progress = false;}, 1000);
			}
		});
	});
}

// 회원관리 - 회원탈퇴 메소드
function fn_deleteUser() {
	$('body').on('click', '#deleteId', function() {
		if(!confirm('변경하시겠습니까?')) {
			return;
		}
		if(is_progress == true) {
			return;
		}
		is_progress = true;
		let user_no = $(this).parents('tr').find('#user_no').val();
		$.ajax({
			url: `deleteUser/${user_no}.wooki`,
			type: 'delete',
			dataType: 'json',
			success: function(obj) {
				if(obj.result) {
					alert('삭제되었습니다.');
				} else {
					alert('삭제되지 않았습니다.');
				}
				fn_filterUserList($('#now_page').val());
				setTimeout(function() {is_progress = false;}, 1000);
			},
			error: function() {
				alert('실패');
				setTimeout(function() {is_progress = false;}, 1000);
			}
		});
	});
}

//트레이너 메뉴 실행 메소드
function fn_trainerUser(p) {
	$.ajax({
		url: 'trainerUserList.wooki',
		type: 'get',
		data: {page: p},
		dataType: 'json',
		success: function(list) {
			trainerUserFilter(list.text_filter, list.search, list.user_separator);
			trainerUserList(list.list, list.paging, list.totalRecord, list.recordPerPage, list.page);
		},
		error: function() {
			alert('실패');
		}
	});
}

// 트레이너 검색 공간 만드는 함수
function trainerUserFilter(text_filter, search, user_separator) {
	$('.content-container').empty();
	$('.content-container').append('<h1>트레이너 관리</h1>');
	$('.content-container').append('<div class="space-between" id="trainer-container">');
	
	$('<form>')
	.append($('<tbody id="filterBox">'))
	.appendTo('#trainer-container');
	
	$('<div>').html('<input type="button" value="트레이너추가하기" onclick="fn_openAddTrainerModal()" />')
	.appendTo('#trainer-container');
	
	$('<tr>')
	.append($('<td>').html('<span>유저번호</span>'))
	.append($('<td>').html('<input type="text" name="search" id="search" />'))
	.append($('<td>').html('<input type="button" value="검색" onclick="fn_filterTrainerUserList(1)" />'))
	.appendTo('#filterBox');
	$('#search').val(search);
}

// 트레이너탭 - 필터된 유저 리스트
function fn_filterTrainerUserList(p) {
	let search = $('#search').val();
	if(search == '') {
		alert('유저번호를 입력하세요.');
		$('#search').focus();
		return;
	}
	else if(isNaN(search)) {
		$('#search').val('');
		alert('유저번호는 숫자로 입력하세요.');
		$('#search').focus();
		return;
	}
	$.ajax({
		url: 'filterTrainerUserList.wooki',
		type: 'get',
		data: {
			page: p,
			search: search
		},
		dataType: 'json',
		success: function(list) {
			trainerUserFilter(list.text_filter, list.search, list.user_separator);
			trainerUserList(list.list, list.paging, list.totalRecord, list.recordPerPage, list.page);
		},
		error: function() {
			alert('실패');
		}
	});
}

//유저리스트 테이블 만드는 함수
function trainerUserList(list, paging, totalRecord, recordPerPage, page) {
	$('<table style="width: 1000px;">')
	.append($('<thead id="title">'))
	.append($('<tbody id="list">'))
	.append($('<tfoot class="paging">'))
	.appendTo('.content-container');
	
	$('<tr>')
	.append($('<th>').html('인덱스'))
	.append($('<th>').html('고유번호'))
	.append($('<th>').html('유저번호'))
	.append($('<th>').html('경력'))
	.append($('<th>').html('본명'))
	.append($('<th>').html('자격증 파일명'))
	.append($('<th>').html('근무센터명'))
	.append($('<th>').html('트레이너 등록일'))
	.append($('<th>').html('비고'))
	.appendTo('#title');
	
	$.each(list, function(idx, user) {
		let d = new Date(user.created_at);
		let result = `${d.getFullYear()}-`;
		if(d.getMonth() < 10) {result += 0;}
		result += `${(d.getMonth() + 1)}-`;
		if(d.getDate() < 10) {result += 0;}
		result += `${d.getDate()} ${d.getHours()}:`;
		if(d.getMinutes() < 10) {result += 0;}
		result += `${d.getMinutes()}:`;
		if(d.getSeconds() < 10) {result += 0;}
		result += d.getSeconds();
		$('<tr>')
		.append($('<td>').html(totalRecord - (recordPerPage * (page - 1)) - idx))
		.append($('<td>').html(user.trainer_no))
		.append($('<td>').html(user.user_no))
		.append($('<td>').html(user.career + '년'))
		.append($('<td>').html(user.trainer_name))
		.append($('<td>').html(user.certificate_filename))
		.append($('<td>').html(user.employment))
		.append($('<td>').html(result))
		.append($('<input type="hidden" name="user_no" id="user_no" />').val(user.user_no))
		.append($('<td>').html('<input type="button" value="트레이너탈퇴" id="deleteTrainerInfo" />'))
		.appendTo('#list')
	});
	
	$('<tr>')
	.append($('<td colspan="9">').html(paging))
	.append($('<input type="hidden" id="now_page" />').val(page))
	.appendTo('.paging');
}

// 트레이너 추가 모달 오픈
function fn_openAddTrainerModal() {
	$('#add-trainer-modal').addClass('show');
}

//입력된 유저번호 기준 일치하는 회원 가져오는 가져오는 메소드2
function fn_checkUser() {
	$('#trainer_target_user_no').blur(function() {
		let target_no = $(this).val();
		if(target_no == '') {
			alert('유저번호를 입력해주세요.');
			return;
		} else if(isNaN(target_no)) {
			alert('유저번호는 숫자로 구성되어 있습니다.');
			$(this).val('');
			return;
		}
		$.ajax({
			url: 'checkUser.wooki',
			type: 'get',
			data: {user_no: target_no},
			dataType: 'json',
			success: function(obj) {
				if(obj.result) {
					$('#trainer_target_user_nickname').html(obj.user_nickname);
					is_possible = true;
				} else {
					$('#trainer_target_user_nickname').html('일치하는 회원이 없습니다.');
					is_possible = false;
				}
			},
			error: function() {
				alert('실패');
			}
		});
	});
}

// 트레이너 회원가입 메일발송 메소드
function fn_addTrainerSendEamil() {
	$('#send-add-trainer-email').click(function() {
		if(is_progress == true) {
			return;
		}
		is_progress = true;
		let user_no = $('#trainer_target_user_no').val();
		if(!is_possible) {
			alert('정확한 회원번호를 입력해주세요.');
			return;
		}
		$.ajax({
			url: 'addTrainerSendEmail.wooki',
			type: 'get',
			data: {user_no: user_no},
			dataType: 'json',
			success: function(obj) {
				if(obj.result) {
					alert('메일 발송에 성공하였습니다.');
					$('#add-trainer-modal').removeClass('show');
					$('#trainer_target_user_no').val('');
					$('#trainer_target_user_nickname').html('');
					is_possible = false;
				} else {
					alert('메일 발송에 실패하였습니다.');
				}
				setTimeout(function() {is_progress = false;}, 1000);
			},
			error: function() {
				alert('실패');
				setTimeout(function() {is_progress = false;}, 1000);
			}
		});
	});
}

// 이메일변경 모달 닫기
function fn_closeAddTrainerModal() {
	$('#add-trainer-modal').click(function(e) {
		if(e.target == e.currentTarget) {
			$('#add-trainer-modal').removeClass('show');
			$('#trainer_target_user_no').val('');
			$('#trainer_target_user_nickname').html('');
			is_possible = false;
		}
	});
}