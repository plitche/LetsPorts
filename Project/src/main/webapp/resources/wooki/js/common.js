// ajax 진행중 확인 스테이터스
let is_progress = false;

// 이메일 사용가능여부 확인 스테이터스
let is_possible = false;

// 공통 - 어드민 로그인 메소드
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

// 공통 - 로그인 성공여부 체크 메소드
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

// 공통 - 로그아웃 메소드
function fn_logout() {
	location.href = 'adminLogout.wooki';
}

// 공통 - 페이지접속시 어드민권한이 있는지 확인하는 메소드
function fn_adminCheck(user_sep) {
	if(user_sep != 0) {
		alert('접근 권한이 없습니다.');
		fn_logout();
		return;
	}
	return true;
}

// 공통 - 선택한 nav-btn 강조 메소드
function fn_selectBtn() {
	$('.nav-container .nav-btn').click(function() {
		$('.nav-container .nav-btn').removeAttr('id', 'select-nav');
	    $('.nav-container .nav-btn').eq($(this).index()).attr('id', 'select-nav');
	});
}

//공통 - timestamp 날짜 + 시간 형식으로 변경 이벤트
function fn_stampToDate(timestamp) {
	let d = new Date(timestamp);
	let result = `${d.getFullYear()}-`;
	if(d.getMonth() < 10) {result += 0;}
	result += `${(d.getMonth() + 1)}-`;
	if(d.getDate() < 10) {result += 0;}
	result += `${d.getDate()} ${d.getHours()}:`;
	if(d.getMinutes() < 10) {result += 0;}
	result += `${d.getMinutes()}:`;
	if(d.getSeconds() < 10) {result += 0;}
	result += d.getSeconds();
	return result;
}

//공통 - timestamp 날짜 형식으로 변경 이벤트
function fn_stampToDate2(timestamp) {
	let d = new Date(timestamp);
	let result = `${d.getFullYear()}-`;
	if(d.getMonth() < 10) {result += 0;}
	result += `${(d.getMonth() + 1)}-`;
	if(d.getDate() < 10) {result += 0;}
	result += `${d.getDate()}`;
	return result;
}

// 메인 - 메인페이지 선택 메소드
function fn_main() {
	let chart = `
	<div style="width:100%">
		<div>
			<canvas id="canvas" height="600" width="960"></canvas>
		</div>
	</div>`;
	$('.content-container').empty();
	$('.content-container')
	.append('<h2></h2>')
	.append(chart);
	fn_selectChartData();
}

// 메인 - 회원 차트, 누적회원 차트
function fn_selectChartData() {
	let chartLabels = [];
	let chartData = [];
	let chartAccumulateData = [];
	let chart;
	$.ajax({
		url: 'selectChartData.wooki',
		type: 'get',
		dataType: 'json',
		success: function(obj) {
			$.each(obj.list, function(idx, users) {
				chartLabels.push(fn_stampToDate2(users.created_at));
				chartData.push(users.count);
			});
			for(let i = 0; i < chartData.length; i++) {
				if(i == 0) {
					chartAccumulateData[i] = obj.beforeTotalUser + chartData[i];
				} else {
					chartAccumulateData[i] = chartAccumulateData[i-1] + chartData[i];
				}
			}
			chart = {
				labels: chartLabels,
				datasets: [{
					label: '가입자 수',
			        borderWidth : '1', // 테두리 및 선굵기
			        backgroundColor: 'rgba(99, 201, 126, 0.2)', // 상단 라벨 및 채우기
			        borderColor: 'rgba(99, 201, 126, 1)', // 테두리
			        lineTension: 0.1,	// 그래프 연결선 장력
					data : chartData
				},
				{
					label: '누적 가입자 수',
					borderWidth : '1', // 테두리 및 선굵기
			        backgroundColor: 'rgba(132, 184, 232, 0.2)', // 상단 라벨 및 채우기
			        borderColor: 'rgba(132, 184, 232, 1)', // 테두리
			        lineTension: 0.1,	// 그래프 연결선 장력
					data : chartAccumulateData
				}]
			}
		},
		error: function() {
			alert('실패');
		}
	});
	setTimeout(() => {
		fn_createChart(chart);
	}, 500);
}

function fn_createChart(data) {
	let ctx = document.getElementById('canvas').getContext('2d');
	Chart.Line(ctx, {
		data : data,
		options :{
			scales : {
				yAxes : [{
					ticks :{
						beginAtZero : true
					}
				}]
			}
		}
	});
}

// 회원관리 - 일반회원 메뉴 실행 메소드
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

// 회원관리 - 유저 검색 만드는 함수
function userFilter(text_filter, search, user_separator) {
	$('.content-container').empty();
	$('.content-container').append('<h2>회원 관리</h2>');
	$('<form id="userFilter">').appendTo('.content-container');
	$('<table style="width: auto;">')
	.append($('<tbody id="filterBox">'))
	.appendTo('#userFilter');
	
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

// 회원관리 - 필터된 유저 리스트
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

// 회원관리 - 유저리스트 테이블 만드는 함수
function userList(list, paging, totalRecord, recordPerPage, page) {
	$('<table style="width: 1800px;">')
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

// 회원관리 - 이메일변경 모달 열기
function fn_openChangeEmailModal() {
	$('body').on('click', '#changeEmail', function() {
		let user_no = $(this).parents('tr').find('#user_no').val();
		let email = $(this).parents('tr').find('#email').val();
		$('#change-email-modal').addClass('show');
		$('#change_user_no').val(user_no);
		$('#current_email').val(email);
	});
}

// 회원관리 - 이메일 변경 가능 아이디 체크
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

// 회원관리 - 이메일변경 이벤트
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

// 회원관리 - 이메일변경 모달 닫기
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

// 회원관리 - 임시비밀번호 발송
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

// 회원관리 - 회원탈퇴 메소드
function fn_deleteUser() {
	$('body').on('click', '#deleteId', function() {
		if(is_progress == true) {
			return;
		}
		if(!confirm('탈퇴하시겠습니까?')) {
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

// 어드민 - 관리자 등록 페이지
function fn_addAdminPage() {
	$('.content-container').empty();
	let string = `
	<h2>어드민계정 추가/제거</h2>
    <div class="flex scroll">
	    <div style="height: 600px;">
		    <table style="width: 500px;">
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
	    <div class="searchUser">
	    	<table style="width: auto;">
	    		<tbody>
	    			<tr>
						<td>
							<span>유저번호</span>
						</td>
	    				<td>
							<input type="text" name="admin_target_no" id="admin_target_no" />
	    				</td>
					<tr/>
					<tr>
						<td>
							<span>유저닉네임</span>
						</td>
	    				<td>
							<span id="admin_target_nickname"></span>
	    				</td>
	    			</tr>
	    			<tr>
						<td colspan="2">
							<input type="button" value="어드민추가" id="btn_updateAdminUser" />
						</td>
					</tr>
	    		</tbody>
	    	</table>
	    </div>
    </div>`
	$('.content-container').html(string);
	fn_adminList();
}

// 어드민 - 관리자 회원 리스트 불러와서 추가하는 메소드
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

// 어드민 - 관리자 회원 일반회원으로 변경하는 메소드
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

// 어드민 - 입력된 유저번호 기준 일치하는 회원 가져오는 가져오는 메소드
function fn_checkAdminUser() {
	$('body').on('blur', '#admin_target_no', function() {
		let target_no = $('#admin_target_no').val();
		if(target_no == '') {
			alert('유저번호를 입력해주세요.');
			return;
		} else if(isNaN(target_no)) {
			alert('유저번호는 숫자로 구성되어 있습니다.');
			$('#admin_target_no').val('');
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

// 어드민 - 일반회원 관리자 회원으로 변경하는 메소드
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


// 트레이너 - 트레이너 메뉴 실행 메소드
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

// 트레이너 - 트레이너 검색탭 만드는 함수
function trainerUserFilter(text_filter, search, user_separator) {
	$('.content-container').empty();
	$('.content-container').append('<h2>트레이너 관리</h1>');
	$('.content-container').append('<div class="space-between" id="trainer-container">');
	
	$('<form id="trainerFilter">').appendTo('#trainer-container');
	$('<table style="width: auto;">')
	.append($('<tbody id="filterBox">'))
	.appendTo('#trainerFilter');
	
	$('<div>').html('<input type="button" value="트레이너추가하기" onclick="fn_openAddTrainerModal()" />')
	.appendTo('#trainer-container');
	
	$('<tr>')
	.append($('<td>').html('<span>유저번호</span>'))
	.append($('<td>').html('<input type="text" name="search" id="search" />'))
	.append($('<td>').html('<input type="button" value="검색" onclick="fn_filterTrainerUserList(1)" />'))
	.appendTo('#filterBox');
	$('#search').val(search);
}

// 트레이너 - 필터된 유저 리스트
function fn_filterTrainerUserList(p) {
	let search = $('#search').val();
	if(search == '') {
		fn_trainerUser(1);
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

// 트레이너 - 유저리스트 테이블 만드는 함수
function trainerUserList(list, paging, totalRecord, recordPerPage, page) {
	$('<table>')
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
		.append($('<td>').html('<input type="button" value="일반회원전환" id="deleteTrainerInfo" />'))
		.appendTo('#list')
	});
	
	$('<tr>')
	.append($('<td colspan="9">').html(paging))
	.append($('<input type="hidden" id="now_page" />').val(page))
	.appendTo('.paging');
}

// 트레이너 - 트레이너 추가 모달 오픈
function fn_openAddTrainerModal() {
	$('#add-trainer-modal').addClass('show');
}

// 트레이너 - 입력된 유저번호 기준 일치하는 회원 가져오는 가져오는 메소드2
function fn_checkTrainerUser() {
	$('body').on('blur', '#trainer_target_user_no', function() {
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

// 트레이너 - 트레이너 회원가입 메일발송 메소드
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

// 트레이너 - 트레이너추가 모달 닫기
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

// 트레이너 - 일반회원 전환 메소드
function fn_deleteTrainerUser() {
	$('body').on('click', '#deleteTrainerInfo', function() {
		if(!confirm('전환하시겠습니까?')) {
			return;
		}
		if(is_progress == true) {
			return;
		}
		is_progress = true;
		let user_no = $(this).parents('tr').find('#user_no').val();
		$.ajax({
			url: `deleteTrainerInfo/${user_no}.wooki`,
			type: 'delete',
			dataType: 'json',
			success: function(obj) {
				if(obj.result) {
					alert('전환되었습니다.');
				} else {
					alert('전환되지 않았습니다.');
				}
				fn_filterTrainerUserList($('#now_page').val());
				setTimeout(function() {is_progress = false;}, 1000);
			},
			error: function() {
				alert('실패');
				setTimeout(function() {is_progress = false;}, 1000);
			}
		});
	});
}

// 게시글관리 - 페이지로딩 이벤트
function fn_boardsPage() {
	$('.content-container').empty();
	let string = `
	<h2>게시글관리</h2>
	<div>
		<form id="filterBox">
			<table style="width: auto;">
				<tbody id="filterQuery">
					<tr>
						<td>게시글종류</td>
						<td>
							<select name="boardSep">
								<option value="100">선택안함</option>
								<option value="0">노하우</option>
								<option value="1">질문과답변</option>
								<option value="2">모임</option>
							</select>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<table>
		<thead id="title">
			<tr>
				<th>번호</th>
				<th>게시글번호</th>
				<th>게시글종류</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th colspan="2">비고</th>
			</tr>
		</thead>
		<tbody id="list"></tbody>
		<tfoot class="paging"></tfoot>
	</table>`
	$('.content-container').html(string);
	fn_boardsList(1);
}

// 게시글관리 - 검색필터 선택시 추가 메소드
function fn_boardFilterAdd() {
	$('body').on('change', 'select[name="boardSep"]', function() {
		let target = $('select[name="boardSep"]').val();
		let addTd = [$('<td id="td3">'), $('<td id="td4">'), $('<td id="td5">')];
		let selectTag = [$('#td3'), $('#td4'), $('#td5')];
		for(let i = 0; i < selectTag.length; i++) {
			selectTag[i].remove();
		}
		if(target == 100) {
			fn_boardsList(1);
			return;
		}
		addTd[0].appendTo('#filterQuery > tr');
		addTd[2].appendTo('#filterQuery > tr');
		$('<select name="columnName">')
		.append($('<option value="all">').html('전체회원검색'))
		.append($('<option value="board_no">').html('게시글번호'))
		.append($('<option value="user_no">').html('작성자번호'))
		.appendTo('#td3');
		$('#td5').html('<input type="button" value="검색" id="searchBtn" onclick="fn_boardsList(1)" />');
	});
	$('body').on('change', 'select[name="columnName"]', function() {
		$('#td4').remove();
		if($('select[name="columnName"]').val() == 'all') {
			return;
		};
		$('#td5').before($('<td id="td4">'));
		$('#td4').html('<input type="text" name="query" id="query" />');
	});
}

// 게시글관리 - 게시글 리스트 불러오기 메소드
function fn_boardsList(p) {
	let boardSep = $('select[name="boardSep"]').val();
	let columnName = $('select[name="columnName"]').val();
	if(columnName == undefined ) {
		columnName = '';
	}
	let query = $('#query').val();
	if(query == undefined ) {
		query = '';
	}
	$.ajax({
		url: 'boardsList.wooki',
		type: 'get',
		data: {
			page: p,
			boardSep: boardSep,
			columnName: columnName,
			query: query
		},
		dataType: 'json',
		success: function(list) {
			fn_insertBoardsList(list.list, list.paging, list.totalRecord, list.recordPerPage, list.page);
		},
		error: function() {
			alert('실패');
		}
	});
}

// 게시글관리 - 게시글 리스트 tbody, tfoot 삽입이벤트
function fn_insertBoardsList(list, paging, totalRecord, recordPerPage, page) {
	$('tbody#list').empty();
	$('tfoot.paging').empty();
	$.each(list, function(idx, board) {
		let is_on_hide = '';
		let created_at = fn_stampToDate(board.created_at);
		let boards_name = ['노하우', '질문과답변', '모임'];
		if(board.on_hide == 0) {
			is_on_hide = '<input type="button" value="숨기기" id="hideBtn" />';
		} else {
			is_on_hide = '<input type="button" value="보이기" id="showBtn" />';
		}
		let tbody = `
		<tr>
			<td>${totalRecord - (recordPerPage * (page - 1)) - idx}</td>
			<td>${board.board_no}</td>
			<td>${boards_name[board.board_sep]}</td>
			<td>${board.board_title}</td>
			<td>${board.user_no}</td>
			<td>${created_at}</td>
			<td>
				<input type="hidden" name="board_no" id="board_no" value="${board.board_no}" />
				<input type="hidden" name="board_sep" id="board_sep" value="${board.board_sep}" />
				${is_on_hide}
			</td>
			<td><input type="button" value="게시글삭제" id="deleteBoard" /></td>
		</tr>`;
		$('tbody#list').append(tbody);
	});
	let tfoot = `
		<tr>
		<td colspan="8">${paging}</td>
		<input type="hidden" id="now_page" value="${page}"/>
		</tr>`;
	$('tfoot.paging').append(tfoot);
}

// 게시글관리 - 게시글 숨기기, 보이기 기능개발
function fn_boardsOnHideToggle() {
	let btn = ['#showBtn', '#hideBtn'];
	for(let i = 0; i < btn.length; i++) {
		$('body').on('click', btn[i], function() {
			if(is_progress == true) {
				return;
			}
			is_progress = true;
			let board_no = $(this).parents('tr').find('#board_no').val();
			let board_sep = $(this).parents('tr').find('#board_sep').val();
			$.ajax({
				url: `boardsOnHideToggle/${board_no}/${board_sep}/${i}.wooki`,
				type: 'put',
				dataType: 'json',
				success: function(obj) {
					if(i == 0) {
						if(obj.result) {
							alert('게시글 공개 성공하였습니다.')
						} else {
							alert('게시글 공개 실패하였습니다.')
						}
					} else {
						if(obj.result) {
							alert('게시글 숨기기 성공하였습니다.')
						} else {
							alert('게시글 숨기기 실패하였습니다.')
						}
					}
					fn_boardsList($('#now_page').val());
					setTimeout(function() {is_progress = false;}, 1000);
				},
				error: function() {
					setTimeout(function() {is_progress = false;}, 1000);
					alert('실패');
				}
			});
		});
	}
}

// 게시글관리 - 게시글 삭제 기능개발
function fn_boardDelete() {
	$('body').on('click', '#deleteBoard', function() {
		if(is_progress == true) {
			return;
		}
		if(!confirm('삭제하시겠습니까?')) {
			return;
		}
		is_progress = true;
		let board_no = $(this).parents('tr').find('#board_no').val();
		let board_sep = $(this).parents('tr').find('#board_sep').val();
		$.ajax({
			url: `boardDelete/${board_no}/${board_sep}.wooki`,
			type: 'delete',
			dataType: 'json',
			success: function(obj) {
				if(obj.result) {
					alert('게시글이 삭제 되었습니다.')
				} else {
					alert('게시글 삭제에 실패하였습니다.')
				}
				fn_boardsList($('#now_page').val());
				setTimeout(function() {is_progress = false;}, 1000);
			},
			error: function() {
				setTimeout(function() {is_progress = false;}, 1000);
				alert('실패');
			}
		});
	});
}

// 댓글관리 - 페이지로딩 이벤트
function fn_commentsPage() {
	$('.content-container').empty();
	let string = `
	<h2>댓글관리</h2>
	<div>
		<form id="filterBox">
			<table style="width: auto;">
				<tbody id="filterQuery">
					<tr>
						<td>게시글종류</td>
						<td>
							<select name="commentSep">
								<option value="100">선택안함</option>
								<option value="0">노하우</option>
								<option value="1">질문과답변</option>
								<option value="2">모임</option>
							</select>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<table>
		<thead id="title">
			<tr>
				<th>번호</th>
				<th>댓글번호</th>
				<th>게시글종류</th>
				<th>게시글번호</th>
				<th style="width: 250px;">댓글내용</th>
				<th>작성자</th>
				<th>작성일</th>
				<th colspan="2">비고</th>
			</tr>
		</thead>
		<tbody id="list"></tbody>
		<tfoot class="paging"></tfoot>
	</table>`
	$('.content-container').html(string);
	fn_commentsList(1);
}

// 댓글관리 - 검색필터 선택시 추가 메소드
function fn_commentFilterAdd() {
	$('body').on('change', 'select[name="commentSep"]', function() {
		let target = $('select[name="commentSep"]').val();
		let addTd = [$('<td id="td3">'), $('<td id="td4">'), $('<td id="td5">')];
		let selectTag = [$('#td3'), $('#td4'), $('#td5')];
		for(let i = 0; i < selectTag.length; i++) {
			selectTag[i].remove();
		}
		if(target == 100) {
			fn_commentsList(1);
			return;
		}
		addTd[0].appendTo('#filterQuery > tr');
		addTd[2].appendTo('#filterQuery > tr');
		$('<select name="columnName">')
		.append($('<option value="all">').html('전체회원검색'))
		.append($('<option value="comment_referer_no">').html('게시글번호'))
		.append($('<option value="user_no">').html('작성자번호'))
		.appendTo('#td3');
		$('#td5').html('<input type="button" value="검색" id="searchBtn" onclick="fn_commentsList(1)" />');
	});
	$('body').on('change', 'select[name="columnName"]', function() {
		$('#td4').remove();
		if($('select[name="columnName"]').val() == 'all') {
			return;
		};
		$('#td5').before($('<td id="td4">'));
		$('#td4').html('<input type="text" name="query" id="query" />');
	});
}

// 댓글관리 - 댓글 리스트 불러오기 메소드
function fn_commentsList(p) {
	let commentSep = $('select[name="commentSep"]').val();
	let columnName = $('select[name="columnName"]').val();
	if(columnName == undefined ) {
		columnName = '';
	}
	let query = $('#query').val();
	if(query == undefined ) {
		query = '';
	}
	$.ajax({
		url: 'commentsList.wooki',
		type: 'get',
		data: {
			page: p,
			commentSep: commentSep,
			columnName: columnName,
			query: query
		},
		dataType: 'json',
		success: function(list) {
			fn_insertCommentsList(list.list, list.paging, list.totalRecord, list.recordPerPage, list.page);
		},
		error: function() {
			alert('실패');
		}
	});
}

// 댓글관리 - 댓글 리스트 tbody, tfoot 삽입이벤트
function fn_insertCommentsList(list, paging, totalRecord, recordPerPage, page) {
	$('tbody#list').empty();
	$('tfoot.paging').empty();
	$.each(list, function(idx, comment) {
		let is_on_hide = '';
		let created_at = fn_stampToDate(comment.created_at);
		let comments_name = ['노하우', '질문과답변', '모임'];
		if(comment.on_hide == 0) {
			is_on_hide = '<input type="button" value="숨기기" id="hideCommentBtn" />';
		} else {
			is_on_hide = '<input type="button" value="보이기" id="showCommentBtn" />';
		}
		let tbody = `
		<tr>
			<td>${totalRecord - (recordPerPage * (page - 1)) - idx}</td>
			<td>${comment.comment_no}</td>
			<td>${comments_name[comment.comment_referer_sep]}</td>
			<td>${comment.comment_referer_no}</td>
			<td>${comment.comment_content}</td>
			<td>${comment.user_no}</td>
			<td>${created_at}</td>
			<td>
				<input type="hidden" name="comment_no" id="comment_no" value="${comment.comment_no}" />
				${is_on_hide}
			</td>
			<td><input type="button" value="댓글삭제" id="deleteComment" /></td>
		</tr>`;
		$('tbody#list').append(tbody);
	});
	let tfoot = `
	<tr>
		<td colspan="9">${paging}</td>
		<input type="hidden" id="now_page" value="${page}"/>
	</tr>`;
	$('tfoot.paging').append(tfoot);
}

// 댓글관리 - 댓글 숨기기, 보이기 기능개발
function fn_commentsOnHideToggle() {
	let btn = ['#showCommentBtn', '#hideCommentBtn'];
	for(let i = 0; i < btn.length; i++) {
		$('body').on('click', btn[i], function() {
			if(is_progress == true) {
				return;
			}
			is_progress = true;
			let comment_no = $(this).parents('tr').find('#comment_no').val();
			$.ajax({
				url: `commentsOnHideToggle/${comment_no}/${i}.wooki`,
				type: 'put',
				dataType: 'json',
				success: function(obj) {
					if(i == 0) {
						if(obj.result) {
							alert('댓글 공개 성공하였습니다.')
						} else {
							alert('댓글 공개 실패하였습니다.')
						}
					} else {
						if(obj.result) {
							alert('댓글 숨기기 성공하였습니다.')
						} else {
							alert('댓글 숨기기 실패하였습니다.')
						}
					}
					fn_commentsList($('#now_page').val());
					setTimeout(function() {is_progress = false;}, 1000);
				},
				error: function() {
					setTimeout(function() {is_progress = false;}, 1000);
					alert('실패');
				}
			});
		});
	}
}

// 댓글관리 - 댓글 삭제 기능개발
function fn_commentDelete() {
	$('body').on('click', '#deleteComment', function() {
		if(is_progress == true) {
			return;
		}
		if(!confirm('삭제하시겠습니까?')) {
			return;
		}
		is_progress = true;
		let comment_no = $(this).parents('tr').find('#comment_no').val();
		$.ajax({
			url: `commentDelete/${comment_no}.wooki`,
			type: 'delete',
			dataType: 'json',
			success: function(obj) {
				if(obj.result) {
					alert('댓글이 삭제 되었습니다.')
				} else {
					alert('댓글 삭제에 실패하였습니다.')
				}
				fn_commentsList($('#now_page').val());
				setTimeout(function() {is_progress = false;}, 1000);
			},
			error: function() {
				setTimeout(function() {is_progress = false;}, 1000);
				alert('실패');
			}
		});
	});
}

// 리뷰관리 - 리뷰관리 페이지로딩 이벤트
function fn_reviewPage() {
	$('.content-container').empty();
	let string = `
	<h2>리뷰관리</h2>
	<div>
		<form id="filterBox">
			<table style="width: auto;">
				<tbody id="filterQuery">
					<tr>
						<td>테이블명칭</td>
						<td>
							<select name="reviewSep">
								<option value="100">선택안함</option>
								<option value="review_no">리뷰번호</option>
								<option value="target_user_no">리뷰대상</option>
								<option value="writer_user_no">작성자</option>
								<option value="meeting_no">모임번호</option>
								<option value="score">별점</option>
							</select>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<table>
		<thead id="title">
			<tr>
				<th>번호</th>
				<th>리뷰번호</th>
				<th>리뷰대상</th>
				<th>작성자</th>
				<th>별점</th>
				<th>모임번호</th>
				<th style="width: 250px;">리뷰내용</th>
				<th>작성일</th>
				<th>비고</th>
			</tr>
		</thead>
		<tbody id="list"></tbody>
		<tfoot class="paging"></tfoot>
	</table>`
	$('.content-container').html(string);
	fn_reviewList(1);
}

// 리뷰관리 - 검색필터 선택시 추가 메소드
function fn_reviewFilterAdd() {
	$('body').on('change', 'select[name="reviewSep"]', function() {
		let target = $('select[name="reviewSep"]').val();
		let addTd = [$('<td id="td4">'), $('<td id="td5">')];
		let selectTag = [$('#td4'), $('#td5')];
		for(let i = 0; i < selectTag.length; i++) {
			selectTag[i].remove();
		}
		if(target == 100) {
			fn_reviewList(1);
			return;
		}
		for(let i = 0; i < addTd.length; i++) {
			addTd[i].appendTo('#filterQuery > tr');
		}
		$('#td4').html('<input type="text" name="query" id="query" />');
		$('#td5').html('<input type="button" value="검색" id="searchBtn" onclick="fn_reviewList(1)" />');
	});
}

// 리뷰관리 - 리뷰 리스트 불러오기 메소드
function fn_reviewList(p) {
	let reviewSep = $('select[name="reviewSep"]').val();
	let query = $('#query').val();
	if(query == undefined ) {
		query = '';
	}
	$.ajax({
		url: 'reivewList.wooki',
		type: 'get',
		data: {
			page: p,
			reviewSep: reviewSep,
			query: query
		},
		dataType: 'json',
		success: function(list) {
			fn_insertReviewList(list.list, list.paging, list.totalRecord, list.recordPerPage, list.page);
		},
		error: function() {
			alert('실패');
		}
	});
}

// 리뷰관리 - 리뷰 리스트 tbody, tfoot 삽입이벤트
function fn_insertReviewList(list, paging, totalRecord, recordPerPage, page) {
	$('tbody#list').empty();
	$('tfoot.paging').empty();
	$.each(list, function(idx, review) {
		let is_on_hide = '';
		let created_at = fn_stampToDate(review.created_at);
		if(review.on_hide == 0) {
			is_on_hide = '<input type="button" value="숨기기" id="hideReviewBtn" />';
		} else {
			is_on_hide = '<input type="button" value="보이기" id="showReviewBtn" />';
		}
		let tbody = `
		<tr>
			<td>${totalRecord - (recordPerPage * (page - 1)) - idx}</td>
			<td>${review.review_no}</td>
			<td>${review.target_user_no}</td>
			<td>${review.writer_user_no}</td>
			<td>${review.score}</td>
			<td>${review.meeting_no}</td>
			<td>${review.content}</td>
			<td>${created_at}</td>
			<td>
				<input type="hidden" name="review_no" id="review_no" value="${review.review_no}" />
				${is_on_hide}
			</td>
		</tr>`;
		$('tbody#list').append(tbody);
	});
	let tfoot = `
	<tr>
		<td colspan="9">${paging}</td>
		<input type="hidden" id="now_page" value="${page}"/>
	</tr>`;
	$('tfoot.paging').append(tfoot);
}

// 리뷰관리 - 리뷰 숨기기, 보이기 기능개발
function fn_reviewOnHideToggle() {
	let btn = ['#showReviewBtn', '#hideReviewBtn'];
	for(let i = 0; i < btn.length; i++) {
		$('body').on('click', btn[i], function() {
			if(is_progress == true) {
				return;
			}
			is_progress = true;
			let review_no = $(this).parents('tr').find('#review_no').val();
			$.ajax({
				url: `reviewOnHideToggle/${review_no}/${i}.wooki`,
				type: 'put',
				dataType: 'json',
				success: function(obj) {
					if(i == 0) {
						if(obj.result) {
							alert('리뷰 공개 성공하였습니다.')
						} else {
							alert('리뷰 공개 실패하였습니다.')
						}
					} else {
						if(obj.result) {
							alert('리뷰 숨기기 성공하였습니다.')
						} else {
							alert('리뷰 숨기기 실패하였습니다.')
						}
					}
					fn_reviewList($('#now_page').val());
					setTimeout(function() {is_progress = false;}, 1000);
				},
				error: function() {
					setTimeout(function() {is_progress = false;}, 1000);
					alert('실패');
				}
			});
		});
	}
}

// 트레이너QnA - 트레이너QnA 페이지로딩 이벤트
function fn_tQnAPage() {
	$('.content-container').empty();
	let string = `
	<h2>트레이너 QNA 관리</h2>
	<div>
		<form id="filterBox">
			<table style="width: auto;">
				<tbody id="filterQuery">
					<tr>
						<td>검색조건</td>
						<td>
							<select name="tQnASep">
								<option value="100">선택안함</option>
								<option value="is_answered">미답변질문</option>
								<option value="question_user_no">질문유저번호</option>
								<option value="trainer_user_no">트레이너번호</option>
							</select>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<table>
		<thead id="title">
			<tr>
				<th>번호</th>
				<th>질문자</th>
				<th>트레이너번호</th>
				<th style="width: 250px;">질문내용</th>
				<th style="width: 250px;">답변내용</th>
				<th>작성일</th>
				<th colspan="2">비고</th>
			</tr>
		</thead>
		<tbody id="list"></tbody>
		<tfoot class="paging"></tfoot>
	</table>`
	$('.content-container').html(string);
	fn_tQnAList(1);
}

// 트레이너QnA - 검색필터 선택시 추가 메소드
function fn_tQnAFilterAdd() {
	$('body').on('change', 'select[name="tQnASep"]', function() {
		let target = $('select[name="tQnASep"]').val();
		let addTd = [$('<td id="td4">'), $('<td id="td5">')];
		let selectTag = [$('#td4'), $('#td5')];
		for(let i = 0; i < selectTag.length; i++) {
			selectTag[i].remove();
		}
		if(target == 100) {
			fn_tQnAList(1);
			return;
		}
		for(let i = 0; i < addTd.length; i++) {
			addTd[i].appendTo('#filterQuery > tr');
		}
		if(target == 'is_answered') {
			$('#td4').html('<input type="hidden" name="query" id="query" value="0" />');
		} else {
			$('#td4').html('<input type="text" name="query" id="query" />');
		}
		$('#td5').html('<input type="button" value="검색" id="searchBtn" onclick="fn_tQnAList(1)" />');
	});
}

// 트레이너QnA - 트레이너QnA 리스트 불러오기 메소드
function fn_tQnAList(p) {
	let tQnASep = $('select[name="tQnASep"]').val();
	let query = $('#query').val();
	if(query == undefined ) {
		query = '';
	}
	$.ajax({
		url: 'tQnAList.wooki',
		type: 'get',
		data: {
			page: p,
			tQnASep: tQnASep,
			query: query
		},
		dataType: 'json',
		success: function(list) {
			fn_inserttQnAList(list.list, list.paging, list.totalRecord, list.recordPerPage, list.page);
		},
		error: function() {
			alert('실패');
		}
	});
}

// 트레이너QnA - 트레이너QnA 리스트 tbody, tfoot 삽입이벤트
function fn_inserttQnAList(list, paging, totalRecord, recordPerPage, page) {
	$('tbody#list').empty();
	$('tfoot.paging').empty();
	$.each(list, function(idx, tQnA) {
		let is_on_hide = '';
		let created_at = fn_stampToDate(tQnA.created_at);
		if(tQnA.on_hide == 0) {
			is_on_hide = '<input type="button" value="숨기기" id="hideTQnABtn" />';
		} else {
			is_on_hide = '<input type="button" value="보이기" id="showTQnABtn" />';
		}
		let answered = '';
		if(tQnA.trainer_qna_answered != null) {
			answered = tQnA.trainer_qna_answered
		}
		let tbody = `
		<tr>
			<td>${totalRecord - (recordPerPage * (page - 1)) - idx}</td>
			<td>${tQnA.question_user_no}</td>
			<td>${tQnA.trainer_user_no}</td>
			<td>${tQnA.trainer_qna_content}</td>
			<td id="answerd">${answered}</td>
			<td>${created_at}</td>
			<td>
				<input type="hidden" name="trainer_qna_no" id="trainer_qna_no" value="${tQnA.trainer_qna_no}" />
				${is_on_hide}
			</td>
			<td id="updateBtnArea">
				<input type="button" value="수정하기" id="tAnswerdUpdateBtn" />
			</td>
		</tr>`;
		$('tbody#list').append(tbody);
	});
	let tfoot = `
	<tr>
		<td colspan="8">${paging}</td>
		<input type="hidden" id="now_page" value="${page}"/>
	</tr>`;
	$('tfoot.paging').append(tfoot);
}

// 트레이너QnA - 트레이너 답변 업데이트 메소드
function fn_tAnswerdUpdate() {
	$('body').on('click', '#tAnswerdUpdateBtn', function() {
		let answerd = $(this).parents('tr').find('#answerd')
		let beforeText = answerd.html();
		$(this).parents('tr').find('#answerd').html(`<textarea id="afterText" cols="25" rows="10">${beforeText}</textarea>`);
		let updateBtnArea = $(this).parents('tr').find('#updateBtnArea');
		updateBtnArea.empty();
		let btns = `
		<input type="button" value="수정완료" id="sendTAnwswerdUpdate" />
		<input type="button" value="취소하기" onclick="fn_tQnAList($('#now_page').val());" />`;
		updateBtnArea.html(btns);
	});
}

// 트레이너QnA - 트레이너 답변업데이트 ajax 통신 메소드
function fn_sendTAnwswerdUpdate() {
	$('body').on('click', '#sendTAnwswerdUpdate', function() {
		if(is_progress == true) {
			return;
		}
		is_progress = true;
		let answerd = $(this).parents('tr').find('#answerd > textarea').val();
		let trainer_qna_no = $(this).parents('tr').find('#trainer_qna_no').val();;
		let sendObj = {trainer_qna_no: trainer_qna_no, trainer_qna_answered: answerd};
		$.ajax({
			url: 'tAnswerdUpdate.wooki',
			type: 'put',
			data: JSON.stringify(sendObj),
			contentType: 'application/json',
			dataType: 'json',
			success: function(obj) {
				if(obj.result) {
					alert('답변수정 성공하였습니다.');
				} else {
					alert('답변수정 실패하였습니다.');
				}
				fn_tQnAList($('#now_page').val());
				setTimeout(function() {is_progress = false;}, 1000);
			},
			error: function() {
				setTimeout(function() {is_progress = false;}, 1000);
				alert('실패');
			}
		});
	});
}


// 트레이너QnA - 문의 숨기기, 보이기 기능개발
function fn_tQnAOnHideToggle() {
	let btn = ['#showTQnABtn', '#hideTQnABtn'];
	for(let i = 0; i < btn.length; i++) {
		$('body').on('click', btn[i], function() {
			if(is_progress == true) {
				return;
			}
			is_progress = true;
			let trainer_qna_no = $(this).parents('tr').find('#trainer_qna_no').val();;
			$.ajax({
				url: `tQnAOnHideToggle/${trainer_qna_no}/${i}.wooki`,
				type: 'put',
				dataType: 'json',
				success: function(obj) {
					if(i == 0) {
						if(obj.result) {
							alert('문의 공개 성공하였습니다.')
						} else {
							alert('문의 공개 실패하였습니다.')
						}
					} else {
						if(obj.result) {
							alert('문의 숨기기 성공하였습니다.')
						} else {
							alert('문의 숨기기 실패하였습니다.')
						}
					}
					fn_tQnAList($('#now_page').val());
					setTimeout(function() {is_progress = false;}, 1000);
				},
				error: function() {
					setTimeout(function() {is_progress = false;}, 1000);
					alert('실패');
				}
			});
		});
	}
}

// 사진 - 사진관리 페이지 로딩 이벤트
function fn_photoPage() {
	$('.content-container').empty();
	let string = `
	<h2>사진 관리</h2>
	<div>
		<form id="filterBox">
			<table style="width: auto;">
				<tbody id="filterQuery">
					<tr>
						<td>검색조건</td>
						<td>
							<select name="photoSep">
								<option value="100">선택안함</option>
								<option value="0">노하우</option>
								<option value="1">질문과답변</option>
								<option value="2">모임</option>
								<option value="3">임시게시글</option>
							</select>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<table>
		<thead id="title">
			<tr>
				<th>번호</th>
				<th>사진번호</th>
				<th>유저번호</th>
				<th>게시글구분자</th>
				<th>게시글번호</th>
				<th>사진미리보기</th>
				<th>비고</th>
			</tr>
		</thead>
		<tbody id="list"></tbody>
		<tfoot class="paging"></tfoot>
	</table>`
	$('.content-container').html(string);
	fn_photoList(1);
}

// 사진 - 검색필터 선택시 추가 메소드
function fn_photoFilterAdd() {
	$('body').on('change', 'select[name="photoSep"]', function() {
		let target = $('select[name="photoSep"]').val();
		let addTd = [$('<td id="td3">'), $('<td id="td4">'), $('<td id="td5">')];
		let selectTag = [$('#td3'), $('#td4'), $('#td5')];
		for(let i = 0; i < selectTag.length; i++) {
			selectTag[i].remove();
		}
		if(target == 100) {
			fn_photoList(1);
			return;
		}
		addTd[0].appendTo('#filterQuery > tr');
		addTd[2].appendTo('#filterQuery > tr');
		$('<select name="columnName">')
		.append($('<option value="all">').html('전체검색'))
		.append($('<option value="photo_referer_no">').html('게시글번호'))
		.append($('<option value="user_no">').html('작성자번호'))
		.appendTo('#td3');
		$('#td5').html('<input type="button" value="검색" id="searchBtn" onclick="fn_photoList(1)" />');
	});
	$('body').on('change', 'select[name="columnName"]', function() {
		$('#td4').remove();
		if($('select[name="columnName"]').val() == 'all') {
			return;
		};
		$('#td5').before($('<td id="td4">'));
		$('#td4').html('<input type="text" name="query" id="query" />');
	});
}

// 사진 - 사진 리스트 불러오기 메소드
function fn_photoList(p) {
	let photoSep = $('select[name="photoSep"]').val();
	let columnName = $('select[name="columnName"]').val();
	if(columnName == undefined ) {
		columnName = '';
	}
	let query = $('#query').val();
	if(query == undefined ) {
		query = '';
	}
	$.ajax({
		url: 'photoList.wooki',
		type: 'get',
		data: {
			page: p,
			photoSep: photoSep,
			columnName: columnName,
			query: query
		},
		dataType: 'json',
		success: function(list) {
			fn_insertPhotoList(list.list, list.paging, list.totalRecord, list.recordPerPage, list.page);
		},
		error: function() {
			alert('실패');
		}
	});
}

// 사진 - 사진 리스트 tbody, tfoot 삽입이벤트
function fn_insertPhotoList(list, paging, totalRecord, recordPerPage, page) {
	$('tbody#list').empty();
	$('tfoot.paging').empty();
	$.each(list, function(idx, photo) {
		let is_on_hide = '';
		if(photo.on_hide == 0) {
			is_on_hide = '<input type="button" value="숨기기" id="hidePhotoBtn" />';
		} else {
			is_on_hide = '<input type="button" value="보이기" id="showPhotoBtn" />';
		}
		let photoSepName = ['노하우', '질문과답변', '모임', '임시게시글'];
		let tbody = `
		<tr>
			<td>${totalRecord - (recordPerPage * (page - 1)) - idx}</td>
			<td>${photo.photo_no}</td>
			<td>${photo.user_no}</td>
			<td>${photoSepName[photo.photo_referer_sep]}</td>
			<td>${photo.photo_referer_no}</td>
			<td><img width="200px" src="resources/storage/${photo.photo_filename}" /></td>
			<td>
				<input type="hidden" name="photo_no" id="photo_no" value="${photo.photo_no}" />
				${is_on_hide}
			</td>
		</tr>`;
		$('tbody#list').append(tbody);
	});
	let tfoot = `
	<tr>
		<td colspan="7">${paging}</td>
		<input type="hidden" id="now_page" value="${page}"/>
	</tr>`;
	$('tfoot.paging').append(tfoot);
}

// 사진 - 사진 숨기기, 보이기 기능개발
function fn_photoOnHideToggle() {
	let btn = ['#showPhotoBtn', '#hidePhotoBtn'];
	for(let i = 0; i < btn.length; i++) {
		$('body').on('click', btn[i], function() {
			if(is_progress == true) {
				return;
			}
			is_progress = true;
			let photo_no = $(this).parents('tr').find('#photo_no').val();;
			$.ajax({
				url: `photoOnHideToggle/${photo_no}/${i}.wooki`,
				type: 'put',
				dataType: 'json',
				success: function(obj) {
					if(i == 0) {
						if(obj.result) {
							alert('사진 공개 성공하였습니다.')
						} else {
							alert('사진 공개 실패하였습니다.')
						}
					} else {
						if(obj.result) {
							alert('사진 숨기기 성공하였습니다.')
						} else {
							alert('사진 숨기기 실패하였습니다.')
						}
					}
					fn_photoList($('#now_page').val());
					setTimeout(function() {is_progress = false;}, 1000);
				},
				error: function() {
					setTimeout(function() {is_progress = false;}, 1000);
					alert('실패');
				}
			});
		});
	}
}