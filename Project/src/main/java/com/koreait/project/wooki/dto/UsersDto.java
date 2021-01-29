package com.koreait.project.wooki.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class UsersDto {

	private int user_no;
	private String email;
	private String password;
	private int user_separator; // 관리자:0, 트레이너:1, 일반회원:2
	private Timestamp created_at;
	private Timestamp last_login;
	private int login_count;
	private int login_attempt;   // login_attemps -> login_attempt  수정완료
	private int disable;
	private String user_reg_method;
	private String user_nickname;
	private String user_message; // user_profile -> user_message 수정완료
	private String profile_photo;
	private int birth_year;
	private int birth_month;
	private int birth_day;
	private int location1_no;
	private int location2_no;

}
